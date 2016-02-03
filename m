Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 70B127733A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:37:59 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id rs20so12383666igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SoAbffuOCSYlHaWApOYqZJ74ExcwM51/LVAnIMuC3Nk=;
	b=Cwi9/GwZhc+lGhOVuTynU8JK+ugkL/DAcELyfi6+98R5cAoXIpXywLcqjQrSYJlTk7
	snYoEoPyjLfiYH7/RPGy5Gt8GRAghVh8ae/IX7CL4cby9dqctzjnTQhmhDlJW88cQNFI
	iI1lHOHJP8EFBvOlTghGcpslHvCbwQgBjrPz2AOpTGsypMKztVhgpwrwbeC7O9EgzLVG
	GmXsdbQ1T85MjHSvMMGro6vtAgvtiWvUqJg9BSrTqNbN2iC5qwr95/jSaM1Fbp2auGr4
	bAKUdqsG01fthPukraH30f1e+PFWi4AS3uOmtAQJp6jW4y3EL4Wv4GvGQdHxJjfUZ+Cz
	fTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SoAbffuOCSYlHaWApOYqZJ74ExcwM51/LVAnIMuC3Nk=;
	b=dTnsAK3dxC65JTXNt/DyhlPKZn3yThunvO5m1YE9flgweYRaUhpcu0E5Ee+dK7X57x
	pJ1OhWXmsLGQwvw98qGMbyv0pNMn57j0ThZOr0ujeUqNvmFXv688+JaH+sRBFVAoG6no
	2y7tf9zzPEOBJ/G++z8QSVE1HtMzpYCoo07dqGHQgbPSySKBLZGzVFEaBYnbxRsLpapg
	Jk9cTPYr0lgWOX2cCGiHYz3thei/lLbvJzRTufFX4amwYFE1+4sd7RqRekp/wl3Myrrk
	URZq2EfjE+QS4XZahcX87GB80fpezA63GoO8vskwBScGatoyMAEtQEkm27cOPi61Xbyn
	csqw==
X-Gm-Message-State: AG10YOTTBrECcjLTy10blFzZi57hbYSdID7swnnQGIADsxoGWD1UuEYcg82UcofSrzjwMk/PLvb7Xojy4a/lYEIt
X-Received: by 10.50.41.38 with SMTP id c6mr229229igl.64.1454531879834; Wed,
	03 Feb 2016 12:37:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 12:37:40 -0800 (PST)
In-Reply-To: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 20:37:40 +0000
Message-ID: <CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Wed, 03 Feb 2016 20:38:02 -0000
Content-Type: multipart/alternative; boundary=089e0117689f0340aa052ae398d8

--089e0117689f0340aa052ae398d8
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 19:07, Ricardo Neri <
ricardo.neri-calderon@linux.intel.com> wrote:

> udev-cache uses find and xargs, which are provided by findutils. It also
> uses gzip, which is provided by gzip. These utilities need to be present
> when udev-cache runs. Thus, add them as RDEPENDSs.
>

This is only true when you're not using busybox, which provides find and
xargs itself.


> +RDEPENDS_${PN} += "gzip findutils"
>

The dependencies should be on the udev-cache package, surely.

Ross

--089e0117689f0340aa052ae398d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 19:07, Ricardo Neri <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ricardo.neri-calderon@linux.intel.com" target=3D"_blank">ricardo.ner=
i-calderon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":6tr" class=3D"a3s" style=3D"overflow:hidden">udev-cache=
 uses find and xargs, which are provided by findutils. It also<br>
uses gzip, which is provided by gzip. These utilities need to be present<br=
>
when udev-cache runs. Thus, add them as RDEPENDSs.<br></div></blockquote><d=
iv><br></div><div>This is only true when you&#39;re not using busybox, whic=
h provides find and xargs itself.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":6tr" class=3D"a3s" style=3D"overflow:hidden">+RDE=
PENDS_${PN} +=3D &quot;gzip findutils&quot;<br></div></blockquote></div><br=
></div><div class=3D"gmail_extra">The dependencies should be on the udev-ca=
che package, surely.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--089e0117689f0340aa052ae398d8--
