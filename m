Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 910137885D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 10:30:22 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id v30so5353256iov.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 02:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OBqwi0ED110DccN9DGG+QrD2cA28hGT4tW60NSXTJKc=;
	b=Lp0aJ8EwLG9rMKUs5oTOmJES5fktQcKT1OXJ3KH4xmuPENWnnFtK1If+Sptlog+NEs
	73UzkP79hs8uoYvWc3hW5u6QoO3uXkD5Sz6uRPWEcDHA1wPaZRkZ6NpN2Wepj6Il7WhC
	ypbsQNSKZ5wrmfChv1VOrEhNJICw4yK0S5o/c6REmYpu3NS51k0YjQThDQqNW+bawce7
	hs6N5+h8bm4oGv+nPDfw2KOqM2P/nCCaWq3nSsDz6fR/5dPnsVidvbj4kS9ytMx5tuK9
	J92btPcZMvoWZ4SETtNfqv8Yh4KBTSYjPlwj/nhbVQfqICL2n80BMduPuy9Cq/+JUb9a
	2Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OBqwi0ED110DccN9DGG+QrD2cA28hGT4tW60NSXTJKc=;
	b=KUGB/5rEp9KKk2+R3YuYCdxNxivT0FP+L0N5YjlolCVyxh+NKzfAyyksfN5OP9NAiO
	udYps9CwCt0DaXl46xeF92oXF7YEtm83yjpazTr7pgxXm/gI9zt/UXpqJg88wJIoCAhc
	vfmMBYYCxGaemI1r903w7Ng+Cl5w6q5MynMJ3oJoR2Q0W/hModXvtDFq9JI5XGGXuvQf
	JvXG/Pt33zMLaHpm+hkwEQ3eCw+guvCGQVjgg/g7Ml9to0Efh0mOACPKtaoT0C/qLJ12
	6g0O1JEDwUPYkpPTiOOzRUMU/y9wyjm8iCKYR0AEEM473qQG//vnmBty+9fcv3HsWltX
	FKFg==
X-Gm-Message-State: AKwxytdP9re8gqxLOEiOuUlB6nfY9eipTVZ3QhUJEGSymz74Kl7yuofS
	0GVMHwncBfDLeuFIEvpC7FU52Ia3PrV/S6gLQvWung==
X-Google-Smtp-Source: ACJfBouqwC42ethO2ejmG0bvmj6Kkr+filvo+5Uxo3mPI5DyFFK89M9VJwssW5sQh8zoR/5Wrsdruy6427M/9qkO6sg=
X-Received: by 10.107.9.154 with SMTP id 26mr7417850ioj.52.1515753023820; Fri,
	12 Jan 2018 02:30:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Fri, 12 Jan 2018 02:30:03 -0800 (PST)
In-Reply-To: <CAMKF1sqDR_SYOQ0Wg4Vr=XeQDKrEwNh3g7F5-_3nURphFbo1Lw@mail.gmail.com>
References: <20180110172858.22739-1-ross.burton@intel.com>
	<20180110172858.22739-2-ross.burton@intel.com>
	<CAMKF1sqDR_SYOQ0Wg4Vr=XeQDKrEwNh3g7F5-_3nURphFbo1Lw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jan 2018 10:30:03 +0000
Message-ID: <CAJTo0LYX3QeacLQkGsLmxyYbBwL+4OSaL5r0A19K-AHX01aEGw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gettext: rationalise optional dependencies
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
X-List-Received-Date: Fri, 12 Jan 2018 10:30:22 -0000
Content-Type: multipart/alternative; boundary="001a113ea2b68d961a056291c066"

--001a113ea2b68d961a056291c066
Content-Type: text/plain; charset="UTF-8"

On 11 January 2018 at 18:55, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jan 10, 2018 at 9:28 AM, Ross Burton <ross.burton@intel.com>
> wrote:
> > gettext has optional dependencies on libxml2, glib, libcroco and
> libunistring.
> > If they're not available then gettext will use internal copies, but it
> can also
> > use system libraries.
> >
> > For gettext-native and nativesdk-gettext continue to use the internal
> copies to
> > reduce the dependencies, but for target use the system shared libraries.
> >
>
> Do we get any reduction in size ? if yes how much, not sure whats the
> defaults
> generally used by other distributions but it would nice to be using
> the default config
> options for best results.


When using the system shared libraries the gettext package is about a
megabyte smaller from memory, but obviously it has more deps (which is why
I left it as a packageconfig).

For native, circular dependencies mean we can't use system libraries anyway.

Ross

--001a113ea2b68d961a056291c066
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 January 2018 at 18:55, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Jan 10, 2018 =
at 9:28 AM, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt; wrote:<br>
&gt; gettext has optional dependencies on libxml2, glib, libcroco and libun=
istring.<br>
&gt; If they&#39;re not available then gettext will use internal copies, bu=
t it can also<br>
&gt; use system libraries.<br>
&gt;<br>
&gt; For gettext-native and nativesdk-gettext continue to use the internal =
copies to<br>
&gt; reduce the dependencies, but for target use the system shared librarie=
s.<br>
&gt;<br>
<br>
</span>Do we get any reduction in size ? if yes how much, not sure whats th=
e defaults<br>
generally used by other distributions but it would nice to be using<br>
the default config<br>
options for best results.</blockquote><div><br></div><div>When using the sy=
stem shared libraries the gettext package is about a megabyte smaller from =
memory, but obviously it has more deps (which is why I left it as a package=
config).</div><div><br></div><div>For native, circular dependencies mean we=
 can&#39;t use system libraries anyway.</div><div><br></div><div>Ross</div>=
</div></div></div>

--001a113ea2b68d961a056291c066--
