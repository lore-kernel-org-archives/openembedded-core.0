Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id B1F22772D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:14:30 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id e124so246692945ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NubfDwaWCa0Z0sS8zcixWGJTIN3+YP0cH8JARirtjvs=;
	b=pVf406flvFC98z4BKqXhCQHpjsYgwa7g1vzZ49vjp/qa1LYAdxdz1WdDwOLNBdaw87
	5nPrT9jAGa5oRI7GBKzuxER9UdnsRnmcFJqO7+9TxvFqhOWJY1bMKCr0F3H2TuJMvk1E
	isW07kRS+Zz7uvEKbQUU8bYsugBIhUbagYfb5xQSKjaLg3vtdfo8E15Urb17w+0mOb0v
	+KPF+43XL0d6mylOYoHnZ705WilVk0/llcUEFsiEpnQJnTBPA6UdycmQeKChjIp9BXH6
	cyBZFAJQ6JfPa5EcYRXmORZQ6F1vv6xQxm56GsuFqRcfs6TuIqwISJtzD7k0P1W2oimb
	/lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NubfDwaWCa0Z0sS8zcixWGJTIN3+YP0cH8JARirtjvs=;
	b=KHyKxxfdvi9h+caEc4T0TEDc1r2FmQ3wbUBRh4fU3OMK4544Mkwy6XN5UU5UwqQrvV
	xgcl6sRp7Yn+mi7qH3uT//A+8nTPsr+mM38VzmkaKR2g5QbGCvqzS5z0Nz2Pc0SvFnLJ
	gNn89+fRWjcJwqXy00+e2IcNj5OCL1zTV/E1Jzww2JtZyX7tkRKJL1qmZonAkiDRql6F
	YvDq4TcPELCwJpRQzzMeOKcumS9Cc77+yA2t/pcjA1nL3DdlzmPAiTxLlHU7Q3hLeglo
	PF5l11YmYnBrXgabkMC2NMlJ2PSaI+wOxh+PRODzVf12MSdXbKTIN9AnSAWcATJI6OnO
	IJFg==
X-Gm-Message-State: AE9vXwMbnP24+pqNpFSca7TQ975YqcGzqPLcrKre3KA4KwtoFCvct01S8kW8WF+FWh+jc7wobUOY0u0RwrXVhBQA
X-Received: by 10.36.124.141 with SMTP id a135mr13259485itd.25.1473329670874; 
	Thu, 08 Sep 2016 03:14:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 03:14:10 -0700 (PDT)
In-Reply-To: <20160908095633.26651-1-adrian.ratiu@ni.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 11:14:10 +0100
Message-ID: <CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: add libpcre to DEPENDS
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
X-List-Received-Date: Thu, 08 Sep 2016 10:14:33 -0000
Content-Type: multipart/alternative; boundary=001a114a967aab8385053bfc4b63

--001a114a967aab8385053bfc4b63
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 10:56, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> | ./gen-all-unicode > all-unicode.txt
> | ./gen-all-unicode: error while loading shared libraries: libpcre.so.1:
> cannot open shared object file: No such file or directory
>

Can you replicate this on demand?  For gen-all-unicode to have been built
the library must have been in the sysroot, and removed by the time it was
executed.  However, pcre is a dependency of glib which is a dependency of
pango, so I'm not sure how this happened.

Ross

--001a114a967aab8385053bfc4b63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 10:56, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ln" class=
=3D"a3s aXjCH m157093c43df990ce">| ./gen-all-unicode &gt; all-unicode.txt<b=
r>
| ./gen-all-unicode: error while loading shared libraries: libpcre.so.1: ca=
nnot open shared object file: No such file or directory<br></div></blockquo=
te></div><br>Can you replicate this on demand?=C2=A0 For gen-all-unicode to=
 have been built the library must have been in the sysroot, and removed by =
the time it was executed.=C2=A0 However, pcre is a dependency of glib which=
 is a dependency of pango, so I&#39;m not sure how this happened.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a114a967aab8385053bfc4b63--
