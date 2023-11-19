Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C441FC5ACB3
	for <webhook@archiver.kernel.org>; Sun, 19 Nov 2023 09:50:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.25547.1700387408153775533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Nov 2023 01:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id C97D55F23E;
	Sun, 19 Nov 2023 10:50:04 +0100 (CET)
Received: from [192.168.178.62] ([84.163.33.243]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r4eRH-1tF9rk0; Sun, 19 Nov 2023 10:50:03 +0100
Date: Sun, 19 Nov 2023 10:50:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] cups: Allow to be controlled by root and users
 in wheel
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <EC7D4S.RWT9YW4AFKKF3@t-online.de>
In-Reply-To: <1798FAA070B6A7E4.25909@lists.openembedded.org>
References: <1798FAA070B6A7E4.25909@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hga5vSveodXeZTrvbFRW"
X-TOI-EXPURGATEID: 150726::1700387403-759C19CF-979FD5F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ec81135-3847-4e8c-90a9-788af1fc8ae5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 09:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190869

--=-Hga5vSveodXeZTrvbFRW
Content-Type: text/plain; charset=us-ascii; format=flowed

Currently this patch doesnt apply. I'll send a v3 once the cups update 
is in master-next

On Sun, Nov 19 2023 at 10:00:47 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This would be the cleanest way I can think of to enable the 
> configuration of
> cups in the user interface
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-extended/cups/cups.inc | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-extended/cups/cups.inc 
> b/meta/recipes-extended/cups/cups.inc
> index fa32c38549..8fd4d20987 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -30,10 +30,7 @@ LEAD_SONAME = "libcupsdriver.so"
> 
>  CLEANBROKEN = "1"
> 
> -inherit autotools-brokensep binconfig useradd systemd pkgconfig 
> multilib_script github-releases
> -
> -USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM:${PN} = "--system lpadmin"
> +inherit autotools-brokensep binconfig systemd pkgconfig 
> multilib_script github-releases
> 
>  SYSTEMD_SERVICE:${PN} = "cups.socket cups.path cups.service 
> cups-lpd.socket"
> 
> @@ -55,7 +52,7 @@ EXTRA_OECONF = " \
>                 --enable-debug \
>                 --disable-relro \
>                 --enable-libusb \
> -               --with-system-groups=lpadmin \
> +               --with-system-groups=sys,root,wheel \
>                 --with-cups-group=lp \
>                 --with-domainsocket=/run/cups/cups.sock \
>                 --with-pkgconfpath=${libdir}/pkgconfig \
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190868): 
> <https://lists.openembedded.org/g/openembedded-core/message/190868>
> Mute This Topic: <https://lists.openembedded.org/mt/102685789/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Hga5vSveodXeZTrvbFRW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Currently this patch doesnt apply. I'll send a v3 once the cups update is in master-next</div></div><div id="geary-quote" dir="auto"><br>On Sun, Nov 19 2023 at 10:00:47 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This would be the cleanest way I can think of to enable the configuration of
cups in the user interface

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-extended/cups/cups.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fa32c38549..8fd4d20987 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,10 +30,7 @@ LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
 
-inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib_script github-releases
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system lpadmin"
+inherit autotools-brokensep binconfig systemd pkgconfig multilib_script github-releases
 
 SYSTEMD_SERVICE:${PN} = "cups.socket cups.path cups.service cups-lpd.socket"
 
@@ -55,7 +52,7 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
-               --with-system-groups=lpadmin \
+               --with-system-groups=sys,root,wheel \
                --with-cups-group=lp \
                --with-domainsocket=/run/cups/cups.sock \
                --with-pkgconfpath=${libdir}/pkgconfig \
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#190868): <a href="https://lists.openembedded.org/g/openembedded-core/message/190868">https://lists.openembedded.org/g/openembedded-core/message/190868</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102685789/3618223">https://lists.openembedded.org/mt/102685789/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Hga5vSveodXeZTrvbFRW--


