Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3713B73F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:20:40 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so6416356qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yo5c/EmjROkFjU0tMkOyeaYHeV5UlIvgVFc3R0H+g/8=;
	b=ZZI+5u7V7OgNgo3C/y0PO03HaaIfV3GTq6ArtigbiF1ukEzqnJzNucNt/lyg42kwrp
	Psq2GN+W/W1kakK+6jMzd7hcZT0llRmdjgdfco1Wdc+q0Aolj2zQhJ2MYi3EbTWWdr/E
	TZxSgHn9wdxq4PrDF8CA/tjLSsCXS849GyJvEBwxsQqJg3leCK1ejomqzW0uKhmnzDR3
	xgUbRSCOWXACn5C7INyspV86usuqhvKEaKm4U51+Sh3726ovFb6ASm11hWeK4TadOyA2
	qFiffFupzWEqfUaduORPI2vrtVcWmv6O21k6Alq44qeqMQliHwANv+nc3agJCTm1GUeD
	7Fug==
X-Gm-Message-State: ALoCoQlVVfdNwfxAW2grbwIH/54SqUMdLrvsMLnFoyhJk2Cd/UzV9WsoVSasoh+i/Yrj07xIMRms
X-Received: by 10.55.23.16 with SMTP id i16mr33655691qkh.14.1431440442062;
	Tue, 12 May 2015 07:20:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 12 May 2015 07:20:21 -0700 (PDT)
In-Reply-To: <1431373895-32411-1-git-send-email-dmitry_eremin@mentor.com>
References: <1431373895-32411-1-git-send-email-dmitry_eremin@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 May 2015 15:20:21 +0100
Message-ID: <CAJTo0Lb-FN8QKyO5W17z6r4FoTsLF-TETgVhEWnHUDmftrG2+g@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd.bbclass: drop has_exactly_one_service setting
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
X-List-Received-Date: Tue, 12 May 2015 14:20:43 -0000
Content-Type: multipart/alternative; boundary=001a1146f4ba110ccf0515e33335

--001a1146f4ba110ccf0515e33335
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 20:51, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
wrote:

> The has_exactly_one_service variable was used in now deleted code. Drop
> this part to make code cleaner.
>

Really thought I fixed this a few months ago... obviously not!

Ross

--001a1146f4ba110ccf0515e33335
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 20:51, Dmitry Eremin-Solenikov <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dmitry_eremin@mentor.com" target=3D"_blank">dmitry_eremin@men=
tor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:435" class=3D"a3s" style=3D"overflow:hidden">The has_exactly_one_service v=
ariable was used in now deleted code. Drop<br>
this part to make code cleaner.<br></div></blockquote></div><br>Really thou=
ght I fixed this a few months ago... obviously not!</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146f4ba110ccf0515e33335--
