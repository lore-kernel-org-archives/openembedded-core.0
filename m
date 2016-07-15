Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id A27F9606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:09:11 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id b62so105045327iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/dFWSzoarc5mI8RpmUBR/YO1sQggFwIZwCyr0vPJuvo=;
	b=IQ6TmtAlNxM5fcXRMZTys2mtDdOOs0HkHGfP3BWN5nyzVOmlQhiGI7v50fuZdb2FFx
	FIL+t/mp5Ixuq460cfDqVFuJ1oAG5PQoVi+F/OREqhAF6GT4E4CjLsq980/lzt3Ismla
	uscrhmfy/OhRgNzdNR8quKhjnR6BszK+PrSvru3bSbjsEXQq8R6AUAr/SdljNJq9akQe
	Uft6qEVNfGAPQCsMcQy724QzemM+8SxRZacqW7sSdPS7KK1vF+EtHCr9e/SQ0tvapmQ0
	15B4o0coGsguK2n33tX3B9sHdyezOlOFvu68EJRqmwPSKLI+HyHG+947cQTkjQehSO7e
	JMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/dFWSzoarc5mI8RpmUBR/YO1sQggFwIZwCyr0vPJuvo=;
	b=VHYMpie49E84Wlc1Rm1ueNhyrh/JAvm+U6nQb/mgnyEZlU9a6jWvL7K0L7NG6aOELf
	eeTXUFPcTTFCESpuOfPbisAiUv1+ge90bBDh14X30q17TYUnoyY67JP/Z/0IVvMZoWSs
	3xxZf7FnnqIu4SsO3xaSU9FdNXYMyCSjwjM9omFhQDyu0PhbyUKZYLra2xadVv2Qegh+
	WhY504hdGep9xLubcM6eU3Q+CRR4+V3/fJdrGgAqv9KMHmnolvnA2xViJpVKE7gU9oxd
	MIks6rU1CEoLKesUobvGZclJtYdsCfxWYDO6U6GlyvHMJv6mnHHYImDiXIoJTgEBfXTd
	t0Rg==
X-Gm-Message-State: ALyK8tLPeTMFf0kgWZnCFpljGy6CHbiHIEq0COoRy+p9LDj+oqjsfQlO6iREHBonHlRfyQgjTHMRhx/M84DKZn+4
X-Received: by 10.107.138.212 with SMTP id c81mr20383422ioj.148.1468591752174; 
	Fri, 15 Jul 2016 07:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 15 Jul 2016 07:08:52 -0700 (PDT)
In-Reply-To: <5788EAC8.5090701@gmail.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
	<5788EAC8.5090701@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jul 2016 15:08:52 +0100
Message-ID: <CAJTo0LY8M1k=XoHYYfTXo9uvCcBgqU6C7mttOvPdeqyR1_XbZw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH 1/8] pkgconfig: Fix build with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 14:09:12 -0000
Content-Type: multipart/alternative; boundary=001a113ed932b596990537ad29d6

--001a113ed932b596990537ad29d6
Content-Type: text/plain; charset=UTF-8

On 15 July 2016 at 14:53, akuster808 <akuster808@gmail.com> wrote:

> So this is the host gcc not the one in OE?
>

Yes, the situation was host with gcc6 building krogoth.

Ross

--001a113ed932b596990537ad29d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2016 at 14:53, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":29o" class=3D"a3s a=
XjCH m155eed6296c44d99">So this is the host gcc not the one in OE?<br></div=
></blockquote></div><br>Yes, the situation was host with gcc6 building krog=
oth.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113ed932b596990537ad29d6--
