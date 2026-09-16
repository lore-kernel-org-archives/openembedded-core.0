Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0A3C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:06:00 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10653.1789549552863113987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=HwDdRZhO;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout11.t-online.de (Postfix) with SMTP id 7ACDB1C052;
	Wed, 16 Sep 2026 11:05:50 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.21]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6laI-1GBO8e0; Wed, 16 Sep 2026 11:05:42 +0200
Date: Wed, 16 Sep 2026 11:05:36 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 3/3] adwaita-icon-theme: upgrade 50.0 -> 51.0
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, Ross Burton
	<ross.burton@arm.com>
Message-Id: <C99GLT.GR8BI2T2HG851@t-online.de>
In-Reply-To: <321582c9e3e2e99229b5a74bd3d244bdc1e0b270.camel@linuxfoundation.org>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
	<20260916055325.3396270-3-f_l_k@t-online.de>
	<321582c9e3e2e99229b5a74bd3d244bdc1e0b270.camel@linuxfoundation.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MZi++xVuYpbuwympK0H8"
X-TOI-EXPURGATEID: 150726::1789549542-80FF69B4-328E8BDD/0/0 CLEAN NORMAL
X-TOI-MSGID: 564776a6-5adf-420c-9ce5-4eeb496a0d46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789549550; i=f_l_k@t-online.de;
	bh=FbXV9tqHieqSlo2kNmG+pj1qNo8G6YVNb6yiF4F0IgA=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=HwDdRZhOZb/Prap59I2psLl/1zhKJHt4CQqQAYzklEseTkhmRWccB6AgMiCcW3BdC
	 o0F+qDjSn1xQpiVyKH5FBnmECNVucVqwVqZCE9CxX4ypmVF6eDZTE7e5u/68q5aFaq
	 E22ZQj3WM9tziXZEOpUjni57M041BwZlFXBJnsQ/DIiPodvNWafbpzidLAaKw3Lpwe
	 zsZc+wzw9MGm3yQaOWcPqDZQGmRhCutHvDLItjUSeHWN6by1cB0JK0VEX8a22XyGEY
	 68vtnujHqHtzEMgtz9SHb+N0XDtcqvNno2XnJdMoDHHWGOQAc/FoLDNxeetjPdRGv8
	 WRsZC5PCbfW4Q==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245943

--=-MZi++xVuYpbuwympK0H8
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I created the GNOME-51 recipes to verify the basic functionality and=20
test it in a runtime environment.
The only really annoying issue I've noticed so far is a segfault in=20
gnome-keyring-51, which I've already
been able to fix locally. I don=FFt want to cause any confusion, and if=20
the general consensus is that the
GNOME update should only be added after the release, I=FFm fine with=20
that. However, if glib-2.0, gtk4
and libadwaita do make it into the release, I would personally consider=20
that a benefit.


--=-MZi++xVuYpbuwympK0H8
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>Hi Richard,</div><div><br></d=
iv><div>I created the GNOME-51 recipes to verify the basic functionality an=
d test it in a runtime environment.&nbsp;</div><div>The only really annoyin=
g issue I've noticed so far is a segfault in gnome-keyring-51, which I've a=
lready</div><div>been able to fix locally. I don=FFt want to cause any conf=
usion, and if the general consensus is that the</div><div>GNOME update shou=
ld only be added after the release, I=FFm fine with that. However, if glib-=
2.0, gtk4</div><div>and libadwaita do make it into the release, I would per=
sonally consider that a benefit.</div></div></div>
--=-MZi++xVuYpbuwympK0H8--


