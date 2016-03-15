Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC626FF80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 13:32:51 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id vf5so87431627igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aZqfi1x9cKXM0ha50dgFkycZzpv5VTQsdIwi66Q5Dj4=;
	b=mqqKw39JeOc7L7B/ufspsRyScfctuVDSiM/1QEzruglL8EPBTv5c0/au1X7+8S06wh
	oJZPOp9OU4nBNLes0C3B85VixmRwxxDhrOoaGY7dVj7vuU8xgHwJvKusfNMpVxWIIbpA
	xkhKrvoNiWlkh+DEkDTNCPTCpYH4N6xJRJ6aNV7uVL9rb62SKYyyiM7bGnGP1aGQvPUf
	5MoNOc48+8DxmlWcb2+5qlAhDXhQjF+ri3kSogG7FSZ2Fa674xout2OXstuwnwsrIHLH
	uRDbJ9Kun7TrsU8zKcGkabomkTwvVq1gsaIBF/8KayygAaM1YBeEDoIKaFBo0oW4jBGY
	eg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aZqfi1x9cKXM0ha50dgFkycZzpv5VTQsdIwi66Q5Dj4=;
	b=YYzatTMmLBo+wDma6GKw1xr4UeXDeVbEQaZ/gI5srE9jUhBRNSrD9VcvnAOmooWKwC
	FkNBPf2XBUPUWQjqQ+nm+vjTsNNqOB140Rn9uqdkNehfX2xwavFaMQeZccBKyFymLc5O
	us5pnt8lF/+AiDceMZNBiNFbbvFF/PotGV/+eZUISmxl1KrwhutMwUJORlise3OSD9lB
	lvynoNUqxLUwCFT2nCcTDKFDKu81K5icpyGsKVMrZrDd6c6dXavCQEyBrOs/LVha7+vx
	I5NXqFVsToy7I50EliVV89QEk5ZR4+6fnW0jpg0gwDxDwnQ8N4ZE58t8uJ1JYEl68Yl4
	iZag==
X-Gm-Message-State: AD7BkJLTzUBHuZQ2typczYgNhBuZbwk3WaBdL0raJKtogXAtCg3AMO0yyW6hlAbiu7+2+W+tbSZR+/yvOrJEh/qT
X-Received: by 10.50.126.8 with SMTP id mu8mr22680281igb.52.1458048772674;
	Tue, 15 Mar 2016 06:32:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 15 Mar 2016 06:32:33 -0700 (PDT)
In-Reply-To: <1457996977-24572-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1457996977-24572-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Mar 2016 13:32:33 +0000
Message-ID: <CAJTo0La-tCOJsXY29+VL0wD_G9vK-2XSzGoA-SsYF4kgYs0N_g@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eudev: split eudev-hwdb from eudev
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
X-List-Received-Date: Tue, 15 Mar 2016 13:32:53 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf29343d052e166f16

--047d7b1635bf29343d052e166f16
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 23:09, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> +        ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb
> --update \
> +            --root $D
>

udevadm is at ${bindir} with eudev, which means this script delays until
first boot.  I've fixed locally, and will file a bug about how hard it is
to tell when a postinst is delayed due to errors...

Ross

--047d7b1635bf29343d052e166f16
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 23:09, Alejandro Hernandez <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandr=
o.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div id=3D":1np" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${@qemu_run_binary(d, &#39;$D&#39;, &#39;${base_bindir=
}/udevadm&#39;)} <span class=3D"il">hwdb</span> --update \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --root $D<br></div></blockquote>=
</div><br>udevadm is at ${bindir} with eudev, which means this script delay=
s until first boot.=C2=A0 I&#39;ve fixed locally, and will file a bug about=
 how hard it is to tell when a postinst is delayed due to errors...</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--047d7b1635bf29343d052e166f16--
