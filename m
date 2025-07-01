Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D56FC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:27:53 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.8096.1751369263842339831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 04:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id D8DA9E7DA
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 13:27:40 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.229]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWZ9H-0YhSeO0; Tue, 1 Jul 2025 13:27:39 +0200
Date: Tue, 01 Jul 2025 13:27:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] tcl: fix tclConfig.sh after UNPACKDIR change
To: openembedded-core@lists.openembedded.org
Message-Id: <Y5XPYS.83WPPV37IHCD2@t-online.de>
In-Reply-To: <184E1CE45E458024.6792@lists.openembedded.org>
References: <184E1CE45E458024.6792@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PlaX0l7Jw7MmJk7TAphs"
X-TOI-EXPURGATEID: 150726::1751369259-3B7FC511-DAF66CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: b6235bf9-5891-4f6c-adec-ccb8fcbef89f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 11:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219566

--=-PlaX0l7Jw7MmJk7TAphs
Content-Type: text/plain; charset=us-ascii; format=flowed

add the sed command as a new line. Editing ${WORKDIR} is still required

On Tue, Jul 1 2025 at 13:24:15 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Add a sed command that edits tclConfig.sh. This is needed so that
> tk in meta-oe is capable of reading the required header file
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb 
> b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> index 70aa9b606c..15f03b6c9e 100644
> --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> @@ -52,6 +52,7 @@ do_install() {
>  	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
>  	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
>  	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
> +	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
>  	install -d ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${libdir}
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219565): 
> <https://lists.openembedded.org/g/openembedded-core/message/219565>
> Mute This Topic: <https://lists.openembedded.org/mt/113925455/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-PlaX0l7Jw7MmJk7TAphs
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>add the sed command as a new line. Editing&nbsp;<span style="white-space: break-spaces;">${WORKDIR} is still required</span></div></div><div id="geary-quote" dir="auto"><br>On Tue, Jul 1 2025 at 13:24:15 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Add a sed command that edits tclConfig.sh. This is needed so that
tk in meta-oe is capable of reading the required header file

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..15f03b6c9e 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -52,6 +52,7 @@ do_install() {
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#219565): <a href="https://lists.openembedded.org/g/openembedded-core/message/219565">https://lists.openembedded.org/g/openembedded-core/message/219565</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/113925455/3618223">https://lists.openembedded.org/mt/113925455/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-PlaX0l7Jw7MmJk7TAphs--


