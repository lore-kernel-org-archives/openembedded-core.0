Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480CAC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 13:18:30 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.12475.1676899102992899581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 05:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 8332220C40;
	Mon, 20 Feb 2023 14:18:20 +0100 (CET)
Received: from [192.168.178.83] ([79.219.230.185]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pU63e-3723ay0; Mon, 20 Feb 2023 14:18:18 +0100
Date: Mon, 20 Feb 2023 14:18:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <DMRDQR.LKNQ1TQKFJVE2@t-online.de>
In-Reply-To: <19896460-7a11-629a-2483-634db3530d56@windriver.com>
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
	<CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
	<44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
	<CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
	<19896460-7a11-629a-2483-634db3530d56@windriver.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yQjmbLaPa9bqHYZdK2Ho"
X-TOI-EXPURGATEID: 150726::1676899099-7FFF80AF-A7E92C4D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8bcb3b83-c5be-4e89-929b-b5a21a09fcd7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177403

--=-yQjmbLaPa9bqHYZdK2Ho
Content-Type: text/plain; charset=us-ascii; format=flowed

I guess this commit will fix the issue for libportal, because we would 
then be able to remove the gtk+3 and gtk4 dependency as both are now 
optional.

<https://github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab28f5666338bd>

Am Mo, 20. Feb 2023 um 16:36:53 +0800 schrieb "Yu, Mingli" 
<mingli.yu@eng.windriver.com>:
> Ping.
> 
> Thanks,
> 
> On 1/9/23 17:10, Alexander Kanavin wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the 
>> sender and know the content is safe.
>> 
>> On Mon, 9 Jan 2023 at 10:02, Yu, Mingli <mingli.yu@windriver.com 
>> <mailto:mingli.yu@windriver.com>> wrote:
>>> Sorry for noise!
>>> 
>>> Originally, the patch is used to fix the yocto compliance issue. The
>>> libportal depends on gtk4 and there is a line 
>>> "REQUIRED_DISTRO_FEATURES
>>> = "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory 
>>> for
>>> libportal, how to solve the below yocto compliance issue?  Any 
>>> hints?
>>> 
>>> 
>>> ERROR: Nothing PROVIDES 'gtk4' (but
>>> /build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
>>> DEPENDS on or otherwise requires it)
>>> gtk4 was skipped: missing required distro feature 'opengl' (not in
>>> DISTRO_FEATURES)
>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>> providers.
>>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>> 'libportal', 'gtk4']
>>> 
>>> 
>>> [1]
>>> <https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55>
>> 
>> Thanks for clarifying. Meanwhile there was a discussion in a 
>> different
>> thread about this, so the patch is fine.
>> 
>> Alex
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177396): 
> <https://lists.openembedded.org/g/openembedded-core/message/177396>
> Mute This Topic: <https://lists.openembedded.org/mt/96090762/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-yQjmbLaPa9bqHYZdK2Ho
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I guess this commit will fix the issue for libportal, because we would then be able to remove the gtk+3 and gtk4 dependency as both are now optional.&nbsp;</div><div><br></div><div><a href="https://github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab28f5666338bd">https://github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab28f5666338bd</a></div></div><div id="geary-quote" dir="auto"><br>Am Mo, 20. Feb 2023 um 16:36:53 +0800 schrieb "Yu, Mingli" &lt;mingli.yu@eng.windriver.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Ping.

Thanks,

On 1/9/23 17:10, Alexander Kanavin wrote:
<blockquote>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 9 Jan 2023 at 10:02, Yu, Mingli &lt;<a href="mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:
<blockquote>Sorry for noise!

Originally, the patch is used to fix the yocto compliance issue. The
libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES
= "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for
libportal, how to solve the below yocto compliance issue?  Any hints?


ERROR: Nothing PROVIDES 'gtk4' (but
/build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'libportal', 'gtk4']


[1]
<a href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55">https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55</a>
</blockquote>
Thanks for clarifying. Meanwhile there was a discussion in a different
thread about this, so the patch is fine.

Alex
</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#177396): <a href="https://lists.openembedded.org/g/openembedded-core/message/177396">https://lists.openembedded.org/g/openembedded-core/message/177396</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96090762/3618223">https://lists.openembedded.org/mt/96090762/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-yQjmbLaPa9bqHYZdK2Ho--


