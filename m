Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7C323719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:00:17 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id i202so87865797ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TB1FsXx7bS8RhJPYrZ0gKXkGRRkJG44ciU3/Q3Eq29Y=;
	b=EkaMkD3I3+kzxiHxnP4VfhI7NOuykamcs8m9CTcTk9VnFSl7I4JSxiDvOiW0sq5w31
	cKrlxBGMC0sIBO9NPR1DtOoRQjHlZMcXGcDKUi3592cmR9R8B6CwOjNR9p2bADRl55+c
	Etgg51prEeDhxQNcGjAu/4te4sGhOh3b37LHJ+Fl6+xOALtyKGdrMIvX2FdRRzhU6FnX
	AvSeApXbR8nCzn9WUJkYVSP/sSui6W/SSZ8UlQkYbGBvL8LY0d54uHk9FrxrWt72f8Av
	2x8rxZIB7Qu/S9cRmBFw7Id7pqRCmbhaHcHQM4S2c+xVvt/ro0a6SWv4bSoREVwvIWHj
	acIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TB1FsXx7bS8RhJPYrZ0gKXkGRRkJG44ciU3/Q3Eq29Y=;
	b=BWraumCSSIDZTsGc1acsX/wnmMimNRIR1bMMZXpeBkX13XJ/lXK6lrwZLthZXfX1Bh
	/naeAXkV5azdpis+c6O6exyl7EvLRwsYMYP82P2EPpLsNHu2QYOhvM9OeHxioAYZfKOk
	r+CG6RjBrVsJKsL35K9NJascWQGW79WRg6ALHcatBG5JUZBNFhZcXaavqlG1atu2OLpp
	hf77lRK7WJyEBtS48pawzYV+o9xMfyXoc6hMFrmiLxRsYtWIkKuPnXhehFXYH2wniuMU
	6i38lTL2YH84ObzOEtOI9aR3bYwqqQuruuT/o7tZGT3FRfyTiXlnaQY1FONu878J+JLv
	vfRw==
X-Gm-Message-State: AA6/9Rlk3vGMR6ZlFA/TjgYVR+iZoK12Hz4Ar0zhaCxK6jA8dz0T7Kp+4mcMQemGpNrKmz21qn0TKgsM12uCLlk6
X-Received: by 10.107.138.15 with SMTP id m15mr7164932iod.127.1476370818409;
	Thu, 13 Oct 2016 08:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 13 Oct 2016 07:59:58 -0700 (PDT)
In-Reply-To: <57FF9CD8.9040305@windriver.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
	<57FF9CD8.9040305@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Oct 2016 15:59:58 +0100
Message-ID: <CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Thu, 13 Oct 2016 15:00:20 -0000
Content-Type: multipart/alternative; boundary=001a113feb3c305543053ec05eae

--001a113feb3c305543053ec05eae
Content-Type: text/plain; charset=UTF-8

On 13 October 2016 at 15:40, Kang Kai <Kai.Kang@windriver.com> wrote:

> gcc checks tsan and lsan support in source file gcc/libsanitizer/configure.tgt,
> it seems only support x86_64. Then tsan and lsan related packages will be
> empty for other target.
> For qemuarm project, add in local.conf:
>
> IMAGE_INSTALL_append = " libtsan"
>

If libtsan is x86-64 only, why not only add it for x86-64 images?  The
package not existing on machines it can't be built for is more obvious than
existing but being empty.

Ross

--001a113feb3c305543053ec05eae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2016 at 15:40, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" t=
ext=3D"#000000">gcc checks tsan and lsan support in source file
    gcc/libsanitizer/configure.<wbr>tgt, it seems only support x86_64. Then
    tsan and lsan related packages will be empty for other target.<br>
    For qemuarm project, add in local.conf:<br>
    <br>
    IMAGE_INSTALL_append =3D &quot; libtsan&quot;</div></blockquote></div><=
br>If libtsan is x86-64 only, why not only add it for x86-64 images?=C2=A0 =
The package not existing on machines it can&#39;t be built for is more obvi=
ous than existing but being empty.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3c305543053ec05eae--
