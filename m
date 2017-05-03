Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 471F571C7E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 18:58:45 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id m91so12834285qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 11:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dAgsztGT3kFno0oAvM5d5p6RyInurzdkL6aa5SVHk/Y=;
	b=ZPvH4QAza2zl2PS8B+LgiSrtx1JASqydLKm2m2sgMhFzyHCO24BribTjo7lD7MMbC/
	nElQDqzbtTBk0FcH+9NPQSJtm1c5TxCaZDowJp4M2LNcLwcOjB3swsh7ekvFrYPjHIek
	q+ATmeYxoHEsZnFfRlHfiMUtprNIhRR0NuCTGjpmaY3TmBqHLWpxP2dv5rI1Zg1DFQ8a
	TIHTGpKeX9vyXDk+uflTuTrhm7Kk3AcikiF44ttxzZmKGjC5n2S+f/+T67ph3QDRX1Gs
	XabWXyXj+Qp3uW3cklhzAPIXC20zY5cBcf0epHCvcLzpepaaCdxLiPMruJw3l3yiv/Ku
	Ggjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dAgsztGT3kFno0oAvM5d5p6RyInurzdkL6aa5SVHk/Y=;
	b=Q/ZBtV52zHMpOXqGk2ogueXslO+Ueig9h5wFCy+rYMwR3K7JjX0PyAW+o7AGkI47Qf
	IMm0bDgLXu7gmNEW9lTqzIhnbTnj/aIRl1/py8yoY5pATL3ywrPSzn2Ne/S0irp8o/yH
	M9w2In/Mnw50bmBrBjGWm/k6RVNH97pCwPXbwPOgc13zA2wZUbNU1YIxCBbim4TJxmly
	iAu4oojjrpI24m6+X4HNb63hEEgEnG3PQMmDHXy0bDpP6e/NnGMxYELq7CU99XyOuBk8
	yXaHtFpHIa4oczQghbPR3JTzG93/UMBWpOpNwnNGr3/41NPE18AltWGoUQfEgxdn0yyZ
	yLAQ==
X-Gm-Message-State: AN3rC/7Fs31Vo6RBmAxt4NHdfI70qteZ/bmwh9AyT39ohvt6w4o2fn3w
	F1GEWmwTlq/fBn9zTGVHmxCNwb5cwmMo
X-Received: by 10.200.50.49 with SMTP id x46mr6529353qta.105.1493837926968;
	Wed, 03 May 2017 11:58:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 3 May 2017 11:58:26 -0700 (PDT)
In-Reply-To: <1493836892.2405.4.camel@gmail.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 May 2017 19:58:26 +0100
Message-ID: <CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Wed, 03 May 2017 18:58:48 -0000
Content-Type: multipart/alternative; boundary=001a113577a2fd48a9054ea33ebd

--001a113577a2fd48a9054ea33ebd
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 19:41, Max Krummenacher <max.oss.09@gmail.com> wrote:

> > It was only in oe-core because of LSB; let's remove it. Current libpng
> is 1.6.x.
>
> This will break at least meta-openembedded glmark2 and glcompbench.


Then meta-oe can continue to host libpng12.

Ross

--001a113577a2fd48a9054ea33ebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2017 at 19:41, Max Krummenacher <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; It wa=
s only in oe-core because of LSB; let&#39;s remove it. Current libpng is 1.=
6.x.<br>
<br>
</span>This will break at least meta-openembedded glmark2 and glcompbench.<=
/blockquote></div><br>Then meta-oe can continue to host libpng12.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a113577a2fd48a9054ea33ebd--
