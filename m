Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ED1F557FA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:41:04 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16073.1776678057250728950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wEl7f-0006zg-7Y; Mon, 20 Apr 2026 11:40:55 +0200
Message-ID: <25b4ca00-a528-473b-9451-e3696ecc4a35@pengutronix.de>
Date: Mon, 20 Apr 2026 11:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] barebox: upgrade 2026.03.1 -> 2026.04.0
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
References: <18A7DC2A7C609741.1451107@lists.openembedded.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <18A7DC2A7C609741.1451107@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235560

Hi,

On 4/19/26 10:30 PM, Ahmad Fatoum wrote:
> Main highlight of this release is the new devboot mechanism, which
> allows overriding any combination of kernel, device tree and
> initramfs in an existing boot flow with network-hosted files,
> simplifying iterative development:
> 
>   https://www.barebox.org/doc/latest/user/devboot.html
> 
> This release also restores compatibility with new TF-A versions acting
> as SCMI clock provider, after TF-A v2.14 broke the SCMI v2.0 clock
> protocol used by earlier barebox (and Linux <= v6.6).

I see now that this barely missed the M3 freeze.
barebox releases are monthly, but we were intending to provide long term
support for v2026.04.0, so it would be great if this could make it in.

The majority of new commits in this release are bugfixes[1] and even the
highlighted feature resolves a boot-time breakage for barebox when
compiled as EFI app.

[1]: https://github.com/barebox/barebox/compare/v2026.03.0...v2026.04.0

Thanks!
Ahmad

> 
> Release notes: https://lore.kernel.org/barebox/aeI471ZfStpltaM6@pengutronix.de
> Migration guide: https://barebox.org/doc/latest/migration-guides/migration-2026.04.0.html
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
> index 9f615a82d48f..f736ca68e02f 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION = "bootloaders"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>  
> -PV = "2026.03.1"
> +PV = "2026.04.0"
>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] = "9e4b23720016bb934dc5ea36d4c33886a8a295445d290b99993d0b32caab6469"
> +SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235526): https://lists.openembedded.org/g/openembedded-core/message/235526
> Mute This Topic: https://lists.openembedded.org/mt/118909793/4830399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a.fatoum@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


