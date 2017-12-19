Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB157841C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:44:09 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id t196so13618280iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k4adPwaR8pJ4pcLx3PRQm7cqtsZZMut1kLHzJDsbg7s=;
	b=aChQv7AyWMoED4yIyTPROZZWvU6dlRemN4ZJsh+OxIMyYGka1qFznDwspUVDa3SrPR
	2cdmZc/N3rcVsOROlO0aFK0U8YdT84oFOcHS/z0epKy+vXSqS4EaHWkPx9VpCFv8o+zh
	lT0qGCrskM9kEsPsjdeTYHxtYzRlgM9JnaEh8WVVkiBKFYJ1ya+eNGTwEpY0y4JApyGR
	z6SMQxiWePDK83XYF4brhxmk6VyTZ/T/6fGSQdWUFs7Hc24JTptLh7NbE6Z8iWgdUhb5
	lqd8CyuqEqQEdT0SdoIoR/KTbfKb5FOohfGIIePYNnHKGcpOPjK7+xmHQFHjVbqpSdGx
	YLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k4adPwaR8pJ4pcLx3PRQm7cqtsZZMut1kLHzJDsbg7s=;
	b=fH6nqZMfvBDckzGEsmQ7q6/RYudX+K+R79rs7QrvpJkS3dUlNRmVqM5Tda6SUeMMpS
	uNqxfWn9p02h3j3/8SI9/6QDHq0Q0x+pVoJIR7zsF1z0prH0YIQHih1VEkk9AB5fKhJZ
	d9FoMGC4nSzWd2kJqTVFZKK7sWuaOy+Xvlx/J4JznEQ4WoOt1T0Ro8+0qve1G+waCZbW
	Z27bKrRu0UtpDkrogwPeKu4bH1U1mdiMYmn7XbuYSDrIJSxpSaCymYeKdocuEVn/wWnC
	Jqh+sTbJqiKYB2xVUUXq+FpNtVg6sPI9uYaSlPGnLhZ/m0zeQarv8cpJz4j9FxocEFix
	EHLw==
X-Gm-Message-State: AKGB3mLyfPpq9Gzo5lVlD5aYK4lTJ0FrDcvEPYht6NbKDnSyTsHD+rQy
	ydi9CzgLdKN/Qijf+nMtbbdbXwUkbjfUfAR5vqV1yA==
X-Google-Smtp-Source: ACJfBouGm0kbKweoDSXumd+w51B+xFAJbxN/HA/hJbks1evUb1Fh2QEqmuma7X1cOu/Edwa2G7atmUr7cQRdRoUIG7U=
X-Received: by 10.107.137.15 with SMTP id l15mr3898684iod.52.1513691051209;
	Tue, 19 Dec 2017 05:44:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Tue, 19 Dec 2017 05:43:50 -0800 (PST)
In-Reply-To: <CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
	<2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
	<CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
	<32cbea3c-5275-cd8e-e7ef-7654e1e94bfa@linux.intel.com>
	<CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Dec 2017 13:43:50 +0000
Message-ID: <CAJTo0LZ0e2iX84X_cOKxi9ziu9EgapG9_4MOKkPBEhKE=teCzg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 13:44:10 -0000
Content-Type: multipart/alternative; boundary="001a113ed3a66863e10560b1a978"

--001a113ed3a66863e10560b1a978
Content-Type: text/plain; charset="UTF-8"

On 19 December 2017 at 13:23, Derek Straka <derek@asterius.io> wrote:

> Cool.  Works for me.  Thanks.
>

There's an epic patch on the list which I'm reviewing right now that
drastically changes how the core Python library is packaged.  If you'd like
to have a look, the almost-final (my bandaid fixes need to be squashed) is
at poky-contrib:ross/py.

Ross

--001a113ed3a66863e10560b1a978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 December 2017 at 13:23, Derek Straka <span dir=3D"lt=
r">&lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asteriu=
s.io</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Cool.=C2=A0 Works for me.=C2=A0 Tha=
nks.<br></blockquote><div><br></div><div>There&#39;s an epic patch on the l=
ist which I&#39;m reviewing right now that drastically changes how the core=
 Python library is packaged.=C2=A0 If you&#39;d like to have a look, the al=
most-final (my bandaid fixes need to be squashed) is at poky-contrib:ross/p=
y.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ed3a66863e10560b1a978--
