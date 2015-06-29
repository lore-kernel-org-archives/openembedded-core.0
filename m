Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id F387572D64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:44:00 +0000 (UTC)
Received: by qkei195 with SMTP id i195so54378266qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aJSoKJ/aXLt3vcC9fZkGqejKue4KWw/MPC1kV92ndXU=;
	b=eoXU5UhY5ran6OOwLdGiwtT8H27uL3d2xch5HW9QrEax1OnAF41Y+WIy96eXTKZncS
	Q+YfGILz8bX8Qu1OCI6hR4ZIw89lXXGEBn4FPPjiPhIMalbpVeNkfTYHfQLzplo8QOeL
	UkXCv2SlTWge+ib6ycAge7qea3UFcEP/iMNmm5oTbolA0DrwqqiMgLDHPhr9D1sBPNSM
	0Gg1ruwA6oSX/+synm62px1pM1Jtf+pyc7eF+O7Lont9nY9nQJ1vXerHYNXEuz1cwXHc
	B3vJUD+PpL0Rgymt6nF2V8MK6Xy8zI2MQLU66sen8eE9Auy0kT4w985m7tWxv2gWyknZ
	nJlQ==
X-Gm-Message-State: ALoCoQmPJ9nt2TTNuuKzHCknprUo4lWj+L/5PVY5gn6QJJTvxBFdd7H84SWci8QWRXBOH7DHTkMJ
X-Received: by 10.140.43.100 with SMTP id d91mr18536052qga.77.1435578241672;
	Mon, 29 Jun 2015 04:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 04:43:42 -0700 (PDT)
In-Reply-To: <5590FD9F.9090204@jp.fujitsu.com>
References: <558D07C7.5000203@jp.fujitsu.com>
	<CAJTo0LYdeaZMRkEMmd+k4Qy91aMC1fYSRcQGBBfzgqKXt79pqw@mail.gmail.com>
	<5590FD9F.9090204@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 12:43:42 +0100
Message-ID: <CAJTo0LYGb84kOe9hdRxfedEwwq4vgvt9CXMPynQVUpK4KvV_Qw@mail.gmail.com>
To: "fan.xin" <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wpa-supplicant: Fix CVE-2015-4142
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jun 2015 11:44:01 -0000
Content-Type: multipart/alternative; boundary=001a113a989c24a4710519a69b75

--001a113a989c24a4710519a69b75
Content-Type: text/plain; charset=UTF-8

On 29 June 2015 at 09:11, fan.xin <fan.xin@jp.fujitsu.com> wrote:

> Upstream-Status: Backport
>

This and signed-off-by In the patch header, not the commit message.

Ross

--001a113a989c24a4710519a69b75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 09:11, fan.xin <span dir=3D"ltr">&lt;<a href=3D"mailto:f=
an.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xh" class=3D"a3s" =
style=3D"overflow:hidden">Upstream-Status: Backport<br></div></blockquote><=
/div><br>This and signed-off-by In the patch header, not the commit message=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113a989c24a4710519a69b75--
