Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA72ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 19:05:59 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.3456.1662491153735816153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 12:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id 7DD426800;
	Tue,  6 Sep 2022 21:05:51 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.37.201]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oVdtL-1hCa5A0; Tue, 6 Sep 2022 21:05:48 +0200
Date: Tue, 06 Sep 2022 21:05:42 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] libsdl2: update 2.0.22 -> 2.24.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <IDYSHR.R6UPN4AFU7HG2@t-online.de>
In-Reply-To: <17124046E1F6F804.11662@lists.openembedded.org>
References: <20220906074315.195684-1-f_l_k@t-online.de>
	<YxcaoKV6sz+dCbGL@mail.local>
	<17124046E1F6F804.11662@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-I3azxWdD+P/wr7aDiOp2"
X-TOI-EXPURGATEID: 150726::1662491148-0144C2AD-BD512585/0/0 CLEAN NORMAL
X-TOI-MSGID: 92386818-3db4-410d-81c9-02591b855217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 19:05:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170365

--=-I3azxWdD+P/wr7aDiOp2
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 6. Sep 2022 um 12:57:56 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> meta-mingw prohibits opengl and gles2 for libsdl2.

I was wondering why GL can't be built for mingw. I don't have a Windows 
machine here to do tests on and I've never used the mingw toolchain, so 
I don't know if GL support for nativesdk-libsdl2 would be useful.

Just in case ... I found out that the only reason for the inability to 
build opengl, gles2 or vulkan is the fact that mesa is pulled in. 
virtual/egl, virtual/gbm and virtual/egl are set as rdepends in the 
PACKAGECONFIG of the libsdl2 recipe. Once these entries are removed, 
nativesdk-libsdl2 can be built with support for GL.


--=-I3azxWdD+P/wr7aDiOp2
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 6. Sep 2022 um 12:57:56 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite">meta-mingw prohibits opengl and gles2 for libsdl2.</blockquote><div><br></div><div><div>I was wondering why GL can't be built for mingw. I don't have a Windows machine here to do tests on and I've never used the mingw toolchain, so I don't know if GL support for nativesdk-libsdl2 would be useful.&nbsp;</div><div><br></div><div>Just in case ... I found out that the only reason for the inability to build opengl, gles2 or vulkan is the fact that mesa is pulled in. virtual/egl, virtual/gbm and virtual/egl are set as rdepends in the PACKAGECONFIG of the libsdl2 recipe. Once these entries are removed, nativesdk-libsdl2 can be built with support for GL.</div></div></div>
--=-I3azxWdD+P/wr7aDiOp2--


