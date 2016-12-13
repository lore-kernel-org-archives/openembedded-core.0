Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E29C371E13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:33:00 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n21so121732597qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KXST6tyunlfjgQk/EJgN4Laop/tVaUjdcbhdv12jPtY=;
	b=nfhXwjQRztY95rNva0bGKsEoX4c4uAUT8YPa6XYQt6UpgWBoqohsNXjCstx3ke6etu
	HjDdZysBHYHMNiE2SZQty5NWfkqaC4PNynHm/Wbj9tNr+2hS+7aYs+JNIF5UQ3psvS6a
	fZV1VxQ6C/zZRUX5BmN4eVUwgvXQbNoj8ARYePDCJ4aBJSgjfHGYw8T79mYtkF5z3mGy
	/20BNw4qGxJIg6sNXaFsv1HJ/2jR0rV/0OiP7M+G/h0KOxp6Di2JMa/0i1AgAVV+Oro5
	94z5AGeVgIKM92bFQ0Ui9yhbjmrfEySBa4q4z2EdT0qZWVWZnSM+V83MNkyv1RfJELOZ
	mTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KXST6tyunlfjgQk/EJgN4Laop/tVaUjdcbhdv12jPtY=;
	b=FgbRRpZeCSCWcBXLwzfe/fYeKO9gUdddzZOt/tOgwluQTKIbjTr1tPYejPX/6Ht4NV
	eOoYRQS4Qb0/LJU2aW87kaX9y+KdvgM8kQ5dQI0SM3hUHTfaPWP0z07rJV7uQfMJuj2z
	diMBAIHMh7GCt2yaNhZVDkJDxMAWi/sXmm4G+GthgNFgUKwWuky/ZE0ZTKT0axYT6Kfo
	w2uhrABqq/yRdezEvUAV+mj1Olm59RrBnd349XitpIKDYkf2wwbZpXD7ffvCbu/dgtBo
	8IoT1O3SDTrWh2r/Ds842TesknMju+7UjrcUCF20tb5C4YpofcBL8gID47bubXJx7LRI
	06JA==
X-Gm-Message-State: AKaTC00O/kLNTbKiKwfCCcSWtGUqwtyXMjBFjwsKEGF5+UAUbw/3zxzaAkkviBNOedJlbFwGvj8JygYNBqsEdq3f
X-Received: by 10.55.5.145 with SMTP id 139mr84819151qkf.77.1481646781851;
	Tue, 13 Dec 2016 08:33:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 08:32:41 -0800 (PST)
In-Reply-To: <CAJTo0LZ1cj5Nm+iSO5aaHRMgf1Syhx6wQ3R2OaBe99A-SKX5Yg@mail.gmail.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LZ1cj5Nm+iSO5aaHRMgf1Syhx6wQ3R2OaBe99A-SKX5Yg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 16:32:41 +0000
Message-ID: <CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 13 Dec 2016 16:33:01 -0000
Content-Type: multipart/alternative; boundary=001a114c8f841d879505438cc66f

--001a114c8f841d879505438cc66f
Content-Type: text/plain; charset=UTF-8

On 13 December 2016 at 16:17, Burton, Ross <ross.burton@intel.com> wrote:

> It took over a minute to load a few tests.  Do you have any idea why the
> discovery is so slow?
>

Oh, it's because oeselftest does bitbake calls isn't it.

Good news: you don't need to use oeSelfTest at all, the discovery works
fine with standard unittest.TestCase objects.

Patch incoming. :)

Ross

--001a114c8f841d879505438cc66f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 16:17, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">It took over a minute to load a few tests.=C2=A0 Do you have any idea w=
hy the discovery is so slow?</div></blockquote><div><br></div><div>Oh, it&#=
39;s because oeselftest does bitbake calls isn&#39;t it.</div><div><br></di=
v><div>Good news: you don&#39;t need to use oeSelfTest at all, the discover=
y works fine with standard unittest.TestCase objects.</div><div><br></div><=
div>Patch incoming. :)</div><div><br></div><div>Ross</div><div>=C2=A0</div>=
</div><br></div></div>

--001a114c8f841d879505438cc66f--
