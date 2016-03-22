Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 862636612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:49:25 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id r187so183205014oih.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Yhi/21RYVDtBHj38VkR2VNmBE5PzAjKDwm1/OgkiK4=;
	b=v+2cdPLTDYEGAfhrvaMQ6ej5hi0hoPwbiNt8oJug4jivKb6ybFZadB4IJG62kQUIe8
	qbYE0rzzL6gUn59kGj6igBUQYQudnnF1HOHLPszWl8iInz7vPuFDudKjGh/0yIelnDgQ
	TYCBFYprTx5wsqxgN0wpWLCyhtviB+qnIR5W4n2c4EIdVD7nJfhglLRuBFyrVvOdvVvV
	ChVt97YCGpfNJ66NHDZ8PZsDydzV75RHa7IVM+jepkYXlCX5eDKvbOBh1DD/ZOmb3dP/
	oY9TUo4sozmPCcTHY/gJAFRz/6Tw2fY9sBuoJ1w9LX6ahmv59kv36kRo3lrGO2+7IQob
	YXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Yhi/21RYVDtBHj38VkR2VNmBE5PzAjKDwm1/OgkiK4=;
	b=Xf4us8VHAyypYvwZZf6OAvz6PBWYOdBIOBCIE9RU9Ky02Br+s6+vsw1NHt6TU9wAIs
	QhgTLVehBBCu6t7+MKYqgrUnmCiRXd5CRfGvBMktqxtN9rTMlwLvyqG9S4KJa6I8Th6Q
	ox8Xqi7NcLieYBUCHaFBMe5Hsgndk3S2kSMeBA39/UeFX5FpWGTL148T1y3WEz9Q9tMJ
	L2psKU2TQ0fRvLEoosUqYCOmKttP+fysDZanW59kwtiTNYbuLK7CV4wR+AzkuStEsL21
	q/Hy7We9MsR18seCi/6bWHpX8SffGwE4XklKUdUudyBYArwsx7m6uPQ2MgFzbzbCND44
	HJkQ==
X-Gm-Message-State: AD7BkJI8TK5bNHIlGM2Mki+UXomLDHsDYUq2gLTHCs0uLtOknRwiH35EySxKi1FZ2ckscrZbr4y0LSwWoutEWrfm
X-Received: by 10.157.32.112 with SMTP id n103mr3712221ota.9.1458665365792;
	Tue, 22 Mar 2016 09:49:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Tue, 22 Mar 2016 09:49:06 -0700 (PDT)
In-Reply-To: <1458665161-14132-1-git-send-email-raj.khem@gmail.com>
References: <1458665161-14132-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 16:49:06 +0000
Message-ID: <CAJTo0LYKGNi1FmpQ1rRF+Wn=5Fgy1Ruv6hqKr_69s6xy4t+9dA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Fix build with fstack-protector on musl
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
X-List-Received-Date: Tue, 22 Mar 2016 16:49:25 -0000
Content-Type: multipart/alternative; boundary=001a11379eb4f98043052ea5feb0

--001a11379eb4f98043052ea5feb0
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:

> -SRC_URI += "\
> -    file://Support-building-with-older-compilers.patch \
> -    file://AArch64-port.patch \
> -
> file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
> -    file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
> -
> file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
> -    file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
> -    file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
> +SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>

Why change the recipe to use = when the .inc sets the main tarball already?

Ross

--001a11379eb4f98043052ea5feb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 16:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":dqs" class=3D"a3s" style=
=3D"overflow:hidden">-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 file://Support-building-with-older-compilers.patch \<br>
-=C2=A0 =C2=A0 file://AArch64-port.patch \<br>
-=C2=A0 =C2=A0 file://Fix-test-case-link-failure-on-PowerPC-systems-with-Al=
tivec.patch \<br>
-=C2=A0 =C2=A0 file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \=
<br>
-=C2=A0 =C2=A0 file://0001-Invalid-dwarf-opcodes-can-cause-references-beyon=
d-th.patch \<br>
-=C2=A0 =C2=A0 file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \<br>
-=C2=A0 =C2=A0 file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \=
<br>
+SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \<b=
r></div></blockquote></div><br>Why change the recipe to use =3D when the .i=
nc sets the main tarball already?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11379eb4f98043052ea5feb0--
