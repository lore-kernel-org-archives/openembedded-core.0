Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05508C761AF
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 00:43:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.1310.1679791413752308518
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 17:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id 5C210C3BB;
	Sun, 26 Mar 2023 01:43:31 +0100 (CET)
Received: from [192.168.178.83] ([79.219.238.34]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgETp-1L4h5E0; Sun, 26 Mar 2023 01:43:29 +0100
Date: Sat, 25 Mar 2023 20:38:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 7/7] webkitgtk: update 2.38.5 -> 2.40.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <98D3SR.ES0FR9UCE62O2@t-online.de>
In-Reply-To: <174FBE6FF0B9B09E.25304@lists.openembedded.org>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
	<20230325004818.2784943-7-f_l_k@t-online.de>
	<CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
	<174FBE6FF0B9B09E.25304@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qBeKKpg9/gMUuYmdvukX"
X-TOI-EXPURGATEID: 150726::1679791409-9EFFACC3-DC6E8B84/0/0 CLEAN NORMAL
X-TOI-MSGID: c99a333a-be53-46a1-80e2-a89297114ed4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 00:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179108

--=-qBeKKpg9/gMUuYmdvukX
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Sa, 25. M=E4r 2023 um 19:56:00 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> webkitgtk-4 is confusing for the gtk3 variant, but named it anyway=20
> because meson reports that webkitgtk-4.0 is missing if it is not found

During the change I noticed that webkitgtk-4 (built with gtk3) also =20
stores its libs in ${libdir}/webkit2gtk-4.*. If I now rename the recipe=20
to webkitgtk-3, won't the confusion increase?


--=-qBeKKpg9/gMUuYmdvukX
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Sa, 25. M=E4r 2023 um 19:56:00 +0100=
 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite=
">webkitgtk-4 is confusing for the gtk3 variant, but named it anyway becaus=
e meson reports that webkitgtk-4.0 is missing if it is not found</blockquot=
e><div><br></div><div>During the change I noticed that webkitgtk-4 (built w=
ith gtk3) also &nbsp;stores its libs in ${libdir}/webkit2gtk-4.*. If I now =
rename the recipe to webkitgtk-3, won't the confusion increase?</div></div>
--=-qBeKKpg9/gMUuYmdvukX--


