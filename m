Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F54D12D43
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 15:21:13 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.37869.1731252067120474145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 07:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 85A6530A;
	Sun, 10 Nov 2024 16:21:04 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.121]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tA9kL-2W1bVo0; Sun, 10 Nov 2024 16:21:01 +0100
Date: Sun, 10 Nov 2024 16:23:16 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Markus Volk <f_l_k@t-online.de>
Cc: alex.kanavin@gmail.com, "Alexander Kanavin via lists.openembedded.org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <SQQQMS.OQC2MWOKNELB1@t-online.de>
In-Reply-To: <1806A2E5B9CEF1AC.19665@lists.openembedded.org>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
	<CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
	<1806A2E5B9CEF1AC.19665@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dbtAJNnZ5KR7yRKXC5dP"
X-TOI-EXPURGATEID: 150726::1731252061-257F85D1-915B40D3/0/0 CLEAN NORMAL
X-TOI-MSGID: d399cdf9-72f4-49c1-81f7-ea3b7fe790cc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 15:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206925

--=-dbtAJNnZ5KR7yRKXC5dP
Content-Type: text/plain; charset=us-ascii; format=flowed

According to meson documentation:

  --auto-features {enabled,disabled,auto}
                                        Override value of all 'auto' 
features
                                        (default: auto).

On Sun, Nov 10 2024 at 03:52:26 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Sun, Nov 10 2024 at 03:40:42 PM +01:00:00, Alexander Kanavin via 
> lists.openembedded.org 
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>> It would help to explain what the option does precisely.
> 
> As far as I understand it, it is a general way for meson to prevent 
> the addition of features just because the required source has been 
> found. Each feature must then be explicitly enabled.
> 
> I checked if the setting is effective by creating sysupdate. If 
> auto-features=enabled, it was enough to add util-linux to the 
> PACKAGECONFIG[sysuser] depends field and fdisk support was built 
> without having to explicitly set -Dfdisk=enabled. With 
> '--auto-features=disabled' the latter was required.


--=-dbtAJNnZ5KR7yRKXC5dP
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>According to meson documentation:<=
/div><div><br></div><div>&nbsp; --auto-features {enabled,disabled,auto}</di=
v><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ove=
rride value of all 'auto' features</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (default: auto).</div></div><div id=3D"g=
eary-quote" dir=3D"auto"><br>On Sun, Nov 10 2024 at 03:52:26 PM +01:00:00, =
Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"cite"><=
div id=3D"geary-body" dir=3D"auto">On Sun, Nov 10 2024 at 03:40:42 PM +01:0=
0:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=3Dgmail=
.com@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div di=
r=3D"auto">It would help to explain what the option does precisely.&nbsp;</=
div><div dir=3D"auto"></div></blockquote><div><br></div><div><div>As far as=
 I understand it, it is a general way for meson to prevent the addition of =
features just because the required source has been found. Each feature must=
 then be explicitly enabled.</div><div><br></div><div>I checked if the sett=
ing is effective by creating sysupdate. If auto-features=3Denabled, it was =
enough to add util-linux to the PACKAGECONFIG[sysuser] depends field and fd=
isk support was built without having to explicitly set -Dfdisk=3Denabled. W=
ith '--auto-features=3Ddisabled' the latter was required.</div></div></div>
</blockquote></div>
--=-dbtAJNnZ5KR7yRKXC5dP--


