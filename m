Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8F8607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:56:23 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id bi2so102910360igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JPh4OVUWZtMmTe7Uq3O2Uokxg2QQeqDAvgm5E6wElAA=;
	b=XjFWQEM+sbYp8pr/Cxe5hufVSX2h+D7CeM93778gQcWwwcPK8kmHFOu8snXfhOi8aJ
	2+XxUgLkAOcrUG9aBrkgp0BdroRL1oe8rtwl5IcOtjQ3/G5u0bnYclhT27tmiEqwYKgR
	zTfYj8PML+YghQomAQDvX7AiO3WOio32RHIOIN2EO6Lwiiz4GrB5E0qw27b5mxVosKOw
	RWhoBNBpVDA3r9N6Dg+QDrXDkSe+3wHQDdf+Wx7dEmOtEedItEPfKlakiKisY7LdVuY1
	EJjSMKzuXvc5w3PurF6fdgDnXgvH6wv41hUrMxaavU9qYCXmBtdHlgcoJZEmqBTVVhKM
	KWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JPh4OVUWZtMmTe7Uq3O2Uokxg2QQeqDAvgm5E6wElAA=;
	b=YstCbF2Pje2iK8LVeFbSe0yer4OSXHfa3JOAm0dYonK+ds+9aRYUncqdg0NaSwMiRh
	S2zv458okVGdT96OVRVeAeU8CVYITsRY1lCB6/uLH8rRF15GaetNVFuzN+DaCTw19QrY
	RmKTaCd4BG4Yj6tcTqqmUrNQxMFHYnjKUrjND1KkK6BxMZncUHIFb2xoy5LhWWP1b5af
	dLE+thFRW6/ppLwEZe608HxWzOVFFAfaSKc84cA2vInG/VuPVCWPgj8qukyYWLRJo3vr
	b2++2sCb4e0BOnodTiPP8orDIiyyl7aKp0EC2G2NrTlmERYHPzbryFu3WVLMDx5Vh93e
	Sjig==
X-Gm-Message-State: AOPr4FVYdOUAJIkTIzKS+ldS2PlG6goLGb51Fo7seGXXiT7bP652ygv9QN0gOyXM78g3ramr4UXG5PbqJnQJqVHs
X-Received: by 10.50.150.1 with SMTP id ue1mr19975565igb.52.1461689783914;
	Tue, 26 Apr 2016 09:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 09:56:04 -0700 (PDT)
In-Reply-To: <5F23E860-0BC7-4F5B-B4BD-E251F8DB0DD9@gmail.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
	<CAJTo0LZgtTN+6M_Xvwm2zQAibJR0jBXB15eU12HfUtz2ERuYKA@mail.gmail.com>
	<571EB9F9.3060602@windriver.com>
	<CAJTo0LZN4Y1vFOJJrMxsapm9LL=KT05_KV2C63fH5QkEjZw3og@mail.gmail.com>
	<CAPhnLPDJ3hfHJLRYPHQOz47A1oFrtuM_FevmvAtRpCTp5eChng@mail.gmail.com>
	<5F23E860-0BC7-4F5B-B4BD-E251F8DB0DD9@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 17:56:04 +0100
Message-ID: <CAJTo0La2F5fQdikrV6ZNHSKLfOPsNxBtLQPn9-kAf3FnEMz8xQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Tue, 26 Apr 2016 16:56:25 -0000
Content-Type: multipart/alternative; boundary=001a11c30f0a57d1050531662cce

--001a11c30f0a57d1050531662cce
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 April 2016 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:

> It may be good to send a query to concerned folks at redhat and clarify
> so we don=E2=80=99t have to make assumptions.
>

Owen just confirmed on IRC that this code is MIT.

Ross

--001a11c30f0a57d1050531662cce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 April 2016 at 17:43, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":3xm" class=3D"a3s aXjCH"=
>It may be good to send a query to concerned folks at redhat and clarify<br=
>
so we don=E2=80=99t have to make assumptions.</div></blockquote></div><br>O=
wen just confirmed on IRC that this code is MIT.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c30f0a57d1050531662cce--
