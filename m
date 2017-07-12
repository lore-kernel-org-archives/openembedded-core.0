Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 08869781CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:22:09 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id m84so16240336ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hZrLHkCwtgNBCGsyf1H7FzUMRt+2Pc5vDjj+Lh3mtvU=;
	b=cOPsTu5ZEjs/Xnv+75RZxZFrJ3auldkF2khd3dHdjgabN/PIcnQii03ncs5ZeA5MNV
	XTpnppOBUMlDXjY46Kk4si6FlNzt6VBiiqf6PZoyjOZrGr2b0lfrpayIzFHT45pi9aua
	b6e8TEerBGqM8Tuu1SxvzlSkL/MKJYlv/bYXKhxktIVBYg5jGgapkz3IUfJTcV6bhu6v
	0lZdPVkN4MxORuBMWcuWVemKdi4X+cOcwaB5wqZ5tyS3kYqqxFgqkRSqB4wTforrdPX0
	CbDzea3ohOfJeJFE/zjiESKSzoL2RtOj5xqwyx0MKCp8lvqSt1eMEyS9Ag0RrGgTmJUT
	pKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hZrLHkCwtgNBCGsyf1H7FzUMRt+2Pc5vDjj+Lh3mtvU=;
	b=ASOH2RRYKYF5t0aTzSSUlasFTHd9ttRT8hjl+GM1RwuUf+5d/HUWIMKAj2n5y/fWqX
	nTRAPHuJNQgKX/tpq6H8ubGwgHBojT6Y6HT/kOwPnK5Q5kST6ppJUzbqn+cXRhVograZ
	/jBkUgg3Q2+TT2QDazYSU4M/xhsUjyJRL2czz+j8SFiESccA3RSPZTck4yUfc+4ipiIE
	H82DBgGxdbhfKkw6D/QYPo9+cgfEWmMWp/tiHhVQH10Y7YYcVSuXzKDULLmPGBvT2y0O
	kRPWpFdnhMLth/gnM2VglXKYj6t0EYDnVbU9+t8z4WEovqC/8SMOV831AdSKwu9hvXDT
	mxDA==
X-Gm-Message-State: AIVw113JiZS6Vdz62b//PQvJPX1F7Nd/ykjsNreoTdDRVakkeFNW/8PR
	SWt7a6dRQpxSnA+IPeUSr+dCh/9fsRnT
X-Received: by 10.107.178.13 with SMTP id b13mr5790007iof.148.1499876531072;
	Wed, 12 Jul 2017 09:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 09:21:50 -0700 (PDT)
In-Reply-To: <f854a4976bca8e4259cbe83e7d43365fa36d5da7.1499825744.git.dengke.du@windriver.com>
References: <cover.1499825744.git.dengke.du@windriver.com>
	<f854a4976bca8e4259cbe83e7d43365fa36d5da7.1499825744.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 17:21:50 +0100
Message-ID: <CAJTo0LZ5m_GioPzYbyhA1bgPM8sGT-+HVVzVzjPjOaPN6_SkMw@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dropbear: reduce local pending patches
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
X-List-Received-Date: Wed, 12 Jul 2017 16:22:13 -0000
Content-Type: multipart/alternative; boundary="001a114c9fc6d784dc055421377d"

--001a114c9fc6d784dc055421377d
Content-Type: text/plain; charset="UTF-8"

On 12 July 2017 at 03:21, Dengke Du <dengke.du@windriver.com> wrote:

> -Upstream-Status: Pending
> +Upstream-Status: Pending [ The dropbear upstream master branch already
> +contains this, this patch will be droped when meet next release ]
>

If the same fix is upstream, then this can be Backport surely?

Ross

--001a114c9fc6d784dc055421377d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2017 at 03:21, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto=
:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":145" class=3D"=
a3s aXjCH m15d349b8097d77d6">-Upstream-Status: Pending<br>
+Upstream-Status: Pending [ The <span class=3D"il">dropbear</span> upstream=
 master branch already<br>
+contains this, this patch will be droped when meet next release ]<br></div=
></blockquote></div><br>If the same fix is upstream, then this can be Backp=
ort surely?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a114c9fc6d784dc055421377d--
