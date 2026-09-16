Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC4EC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:18:58 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16175.1789568330251403536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=pLQgYfgN;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id A373F1BE6C;
	Wed, 16 Sep 2026 16:18:19 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.21]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6qSo-1hdWsK0; Wed, 16 Sep 2026 16:18:18 +0200
Date: Wed, 16 Sep 2026 16:18:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
To: antonin.godard@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DQNGLT.MSCW812FXGFF1@t-online.de>
In-Reply-To: <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
	<DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-TTLRs532zhxJqQeTjV+d"
X-TOI-EXPURGATEID: 150726::1789568298-597F99F9-CAB5D7F8/0/0 CLEAN NORMAL
X-TOI-MSGID: edf72fd4-f57d-453a-a71c-9adff25820e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789568299; i=f_l_k@t-online.de;
	bh=U93+Ym6kZq5WVYA0qjhOqwuOnycX5TTGlURzzIMW5Qs=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=pLQgYfgNlBXbFvDzQX9c4G+98SUPsUMnJl3TQGMHZ9XPs10x1Sj2DnlccPK6yfjo6
	 RMQRvLLungZvvWrc6EGO2uEcPJOVND+sgSY4Z4ABjVuLpv8tGur6Ix9Lim3pwLp48H
	 1qZMD/6P2s1j/m3uxFkG3ZTV9dvp2ud8+uW5+chAokO4vEnxHUPzeOD9Q31Lk9ZEfk
	 XpNgrazXwZy0qOXIOGPfnwQQd3iktB1++CWOIN5lDXujjkOhBXfwowYUnkq/Qq1jnJ
	 igDJL3o7NY5NL7F31dbTRqjE4ZHMGzAeFFgA41AHlqbFqDDg9qnfutc+7TJKQqWy+j
	 wocjwJX4buLNA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245978

--=-TTLRs532zhxJqQeTjV+d
Content-Type: text/plain; charset=us-ascii; format=flowed

For some reason the unity file doesn't get installed in my gtk4-src 
package so I didn' hit this issue.
Maybe this should be done in meson.bbclass if more projects use this 
mechanism?

On Wed, Sep 16 2026 at 13:43:25 +02:00:00, Antonin Godard via 
lists.openembedded.org 
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> I think your patch triggers the following error:
> 
> ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File 
> /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in 
> package gtk4-src contains reference to TMPDIR [buildpaths]
> ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File 
> /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in 
> package gtk4-src contains a reference to the build host HOME 
> directory. If upstream hardcodes a directory path that matches your 
> home, you can set OEQA_BUILDPATHS_SKIP = "/srv/pokybuild" in the 
> recipe. [buildpaths]




--=-TTLRs532zhxJqQeTjV+d
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>For some reason the unity file doesn't get installed in my gtk4-src package so I didn' hit this issue.</div><div>Maybe this should be done in meson.bbclass if more projects use this mechanism?</div><div><br></div>On Wed, Sep 16 2026 at 13:43:25 +02:00:00, Antonin Godard via lists.openembedded.org &lt;antonin.godard=bootlin.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I think your patch triggers the following error:

ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contains reference to TMPDIR [buildpaths]
ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contains a reference to the build host HOME directory. If upstream hardcodes a directory path that matches your home, you can set OEQA_BUILDPATHS_SKIP = "/srv/pokybuild" in the recipe. [buildpaths]</div></blockquote><div><br></div><div><br></div></div>
--=-TTLRs532zhxJqQeTjV+d--


