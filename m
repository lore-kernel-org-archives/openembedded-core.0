Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id D541865CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 15:53:03 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id e89so13413583qgf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 07:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uwboZfkrsq4KdYhcwRvwVXpnGqSHeBELdE0ThPEHqXQ=;
	b=TxW2hn0vb09YCnHDyvkhJtoGc0doUvZy59ZO/TeIS+k6+3LRzhTbVsn9yGuSprMEVh
	iSUUrGXSRwBYSOOocP54Owac4Ad6+Zx+wO508cukuwDdpPdAPV9KIIFFBEMa9kgGXg0z
	Pz6YVy/SF13Iuo1SEzoVqZOSoO5y8zqCp1GlaLRqwm5mr73chjNOQJxaPvb8N6W5VhKH
	38T1EHhL6UKIIefw+3OYWP0GED+SBcAiMsHzZhJYcqB71Cf96vmPOE8+MtvU0librQrJ
	YiQYRJWUvbFn8gsXxUF0bt4kGX6uDAsBLPB2hNhn+oYzFhDR0J1JMQ1S+3P9bvc7jz+X
	hDsA==
X-Gm-Message-State: ALoCoQmUkGcHsbW8AN+fP0uy0Z6Btt1UdvMb/etgw70nUjrUUOzGj/9RBzOTBvwJpjQ5GOSae96t
X-Received: by 10.224.16.207 with SMTP id p15mr21924037qaa.22.1423583584155;
	Tue, 10 Feb 2015 07:53:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 07:52:43 -0800 (PST)
In-Reply-To: <a4615dc0eee370013a8948a093a730f3233d5888.1423583089.git.anibal.limon@linux.intel.com>
References: <cover.1423583089.git.anibal.limon@linux.intel.com>
	<a4615dc0eee370013a8948a093a730f3233d5888.1423583089.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 15:52:43 +0000
Message-ID: <CAJTo0LbzAFYpQ6jD4djPCdMzAMRxCZhQ2rBTTLuGeft9uPDHzQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 15:53:07 -0000
Content-Type: multipart/alternative; boundary=047d7bf16620d78fb1050ebde167

--047d7bf16620d78fb1050ebde167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Anibal,

On 10 February 2015 at 15:45, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.in=
tel.com>
wrote:

> +PACKAGECONFIG[systemd-logind] =3D
> "--enable-systemd-logind=3Dyes,--enable-systemd-logind=3Dno,dbus,dbus-lib=
"
>

This adds an explicit runtime dependency on dbus-lib if logind is enabled,
which probably isn't what you want as the xserver will add this dependency
automatically.

Ross

--047d7bf16620d78fb1050ebde167
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Anibal,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 10 February 2015 at 15:45, An=
=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@l=
inux.intel.com" target=3D"_blank">anibal.limon@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4mx" class=3D"a3s" =
style=3D"overflow:hidden">+PACKAGECONFIG[systemd-logind] =3D &quot;--enable=
-systemd-logind=3Dyes,--enable-systemd-logind=3Dno,dbus,dbus-lib&quot;</div=
></blockquote></div><br>This adds an explicit runtime dependency on dbus-li=
b if logind is enabled, which probably isn&#39;t what you want as the xserv=
er will add this dependency automatically.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bf16620d78fb1050ebde167--
