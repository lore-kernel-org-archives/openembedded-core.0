Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF8C6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 14:48:07 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id n6so12595981qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fI4cGHZAn6xdKUC1cvMJU+C+MLBt4K/qrUtI+3NMyJE=;
	b=iOXRhCpJ58f5Ylec6KlTP7EFehTzC/3qQF7ZwcESN/tJ37vUEgxOXhJZT5v8rM8ggi
	L9Up8P1QQI+OY2XZBv2XJgMqfBh44GadoES4OjS+ILjorGacTuEQ5wJ2jebH+fZmEthP
	zRBqUPjAfvsI2QHxiousY5o71N8Aps0BphVKf4+FwvpD3kBX28zAWsX093c+NbE/OmIa
	43xk8WkZfwQLtlapp6BE7dBnAPzj8IvaGrPq/d76y09+ZMwc70R9xv+9gzDgkEePAqWt
	Tb1iSnZoZniEgAlzVoqByA64fWtgvx/kXFF7bwXKl+8d51AkQdXDAPqNcy2KVTwbeK2/
	sOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fI4cGHZAn6xdKUC1cvMJU+C+MLBt4K/qrUtI+3NMyJE=;
	b=DiUuypP6uYRTpuGmAymPp+24PEjk0jPTtO9hMaS4ydgte+1uf//prnGIQg/WOlKU6z
	IbTDTVq4fOUIc6RV/uOA6Ez3tM2ZnJKy377MwURD9M2PHs0jmWRon8O+B6wNAdnh+SKe
	95BWSmPHL4FHhh9D7yC73MH26NNcL578eMfZZma/VEPi7DiurO0f3jj5Djs24zp6E0uA
	L5s17tx5YFNFnt6aA9hNIy4RD4xoHBJ77+/38BGNvCGfAzR6fw4UZUxEC7sH1L5Kr4d9
	OG2rbOk/TG20lH1wsZiiGAMaDWcgkY+dErVfPb23ipJhWwRkbo0gO8f7tnsTwdfQ2tus
	uLvQ==
X-Gm-Message-State: AKaTC03hzWYBhECHglOGVPK/5pH32ME27taA2yLuqU8mDuU3dtWo7z3GvROaXUhJlPhdkSmXzjCZNitsoKCpTxMl
X-Received: by 10.237.37.77 with SMTP id w13mr13251920qtc.197.1479826088383;
	Tue, 22 Nov 2016 06:48:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 06:47:47 -0800 (PST)
In-Reply-To: <eb38d44adc6f103f898ee7a8859d7ef046df4402.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
	<eb38d44adc6f103f898ee7a8859d7ef046df4402.1479203195.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 14:47:47 +0000
Message-ID: <CAJTo0LaJZkpg_z6uSz3oMAH-bE7x6-hth94okNG+2GzsGy913w@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 09/11] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 22 Nov 2016 14:48:07 -0000
Content-Type: multipart/alternative; boundary=001a114108ea5413000541e4dc4e

--001a114108ea5413000541e4dc4e
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 09:52, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

> wic has a new flag for setting a fixed parition size --fixed-size. Add
> tests that verify if partition is indeed sized properly and that errors
> are signaled when there is not enough space to fit partition data.


Just failed on the AB:

FAIL: test_fixed_size (oeqa.selftest.wic.Wic)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py",
line 418, in test_fixed_size
    self.assertEqual(0, res.status)
AssertionError: 0 != 127

Might be useful to print res.output in the failure. :)

Ross

--001a114108ea5413000541e4dc4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 09:52, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzecki@rn=
dity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"gmail-i=
l">wic</span> has a new flag for setting a <span class=3D"gmail-il">fixed</=
span> parition size --<span class=3D"gmail-il">fixed</span>-size. Add<br>
tests that verify if partition is indeed sized properly and that errors<br>
are signaled when there is not enough space to fit partition data.</blockqu=
ote></div><br>Just failed on the AB:</div><div class=3D"gmail_extra"><br></=
div>FAIL: test_fixed_size (oeqa.selftest.wic.Wic)<br>----------------------=
------------------------------------------------<br>Traceback (most recent =
call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py&quot;, line 41=
8, in test_fixed_size<br>=C2=A0 =C2=A0 self.assertEqual(0, res.status)<br>A=
ssertionError: 0 !=3D 127<div><br></div><div>Might be useful to print res.o=
utput in the failure. :)</div><div><br></div><div>Ross</div></div>

--001a114108ea5413000541e4dc4e--
