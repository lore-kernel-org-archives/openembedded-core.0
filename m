Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C97C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:55:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9965.1706828104793030273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qc0dxiPg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87B7940004;
	Thu,  1 Feb 2024 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706828102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eUTLu6apcj36hQUbKVNqf4jlIjMuN2qIIDVA3OQaGrA=;
	b=Qc0dxiPgCUMBdQfHubgYWAtyOl/jz3qlV+8qomqt9FhR9v4riOaki+SuR96lw0S7VBidS/
	CraeZZKax66MAXyEhQ3l8iAWuod5ALpEcnUIkEuAs9CU9y1hbMwneZw/m02W758NnZkaZM
	dWKhuzoIztLSZ+J5+kT10xCTiIctw4XpwwaMSlFk5qgL6WaXBhmUXF3mKm8hOvpEmPhMhl
	6TtKXuX88bY3SuHzcuwmK5w8iw8FVH+CfVrPh7sWdo3BWhSmPJSWF+d7nj3s9J/W/CQepk
	q+rbMd3kEdxY1XQcoiFjdray3FbyUru41b+msjyDj9k2jtmEdIDm68Qh5hybVA==
Date: Thu, 1 Feb 2024 23:55:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mc: upgrade 4.8.30 -> 4.8.31
Message-ID: <2024020122550235222d5a@mail.local>
References: <1706765861-12895-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1706765861-12895-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 22:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194762

On 01/02/2024 13:37:41+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> - Core
>   * Minimal version of GLib is 2.32.0.
> 
> - VFS
>   * fish: drop support of native FISH server and protocol. Rename VFS to shell (#4232)

Error: 
 Problem: package packagegroup-self-hosted-1.0-r0.core2_64 from oe-repo requires packagegroup-self-hosted-host-tools, but none of the providers can be installed
  - conflicting requests
  - nothing provides mc-fish needed by packagegroup-self-hosted-host-tools-1.0-r0.core2_64 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

>   * extfs;
>     * uc1541 extfs: update up to 3.6 version (#4511)
>     * s3+: port to Python3 (#4324)
>   * Support for LZO/LZOP compression format (#4509)
> 
> - Misc
>   * Skins: add color for non-printable characters in editor (#4433)
> 
> - Fixes
>   * FTBFS on FreeBSD with ext2fs attribute support (#4493)
>   * Broken stickchars (-a) mode (#4498)
>   * Wrong timestamp after resuming of file copy operation (#4499)
>   * Editor: wrong deletion of marked column (#3761)
>   * Diff viewer: segfault when display of line numbers is enabled (#4500)
>   * Tar VFS: broken handling of hard links (#4494)
>   * Sftp VFS: failure establishing SSH session due hashed host names in ~/.ssh/known_hosts (#4506)
>   * Shell VFS: incorrect file names with cyrillic or diacritic symbols (#4507)
>   * mc.ext.ini: incorrect description of of how multiple sections and keys with same names are processed (#4497)
>   * mc.ext.ini: unescaped backslash \ is treated as invalid escape sequence in glib-2.77.3 and glib-2.79 (#4502)
>   * mc.ext.ini: file "Makefile.zip" is handled as Makefile not as zip-arhive (#4419)
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} (97%)
> 
> diff --git a/meta/recipes-extended/mc/mc_4.8.30.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
> similarity index 97%
> rename from meta/recipes-extended/mc/mc_4.8.30.bb
> rename to meta/recipes-extended/mc/mc_4.8.31.bb
> index 258ac38e15..b6e5a1f98c 100644
> --- a/meta/recipes-extended/mc/mc_4.8.30.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.31.bb
> @@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
>  SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
>             file://nomandate.patch \
>             "
> -SRC_URI[sha256sum] = "38171f22f889e3030ec9055463d3ecd7843984ab24e6497d8294d1c441a7ddb4"
> +SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
>  
>  inherit autotools gettext pkgconfig
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194571): https://lists.openembedded.org/g/openembedded-core/message/194571
> Mute This Topic: https://lists.openembedded.org/mt/104091623/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

