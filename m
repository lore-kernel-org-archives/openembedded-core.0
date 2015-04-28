Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id C2F36716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:09 +0000 (UTC)
Received: by qcbii10 with SMTP id ii10so68663928qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xf5J/J4U/eaSMw0Oav5cQJvEdBi9ClI6n1yJP17trdI=;
	b=XxLBd5WCte2HKDl3F2xzhZ169AqU/D7tFMC80Qr5LN+HLiIPs/P5vFT+RdjXE+9YTJ
	cP2ieov5qZNQpQ3IvYUJ1JOKy0gH1IJ64IJo6gh6hpIpDDjxYBk2t24QngVQ+MTd3DA9
	ZVgOVKT2bf6DgqAAzvBgSbS/NuO5ZAj8DBHbk8VNIVTDC9qeJcN9dNT5MJ1AI5YzT7Xz
	2e6+Qfx4dFA2Koq3T9Q3BNHk9flycghlno9AvD4HEsILeCOU6qzYYKLPb25kNr313G1O
	R3G3vgnHEabGOdHtQxRdwNPWILoliN6DP7ZkGXtH95w14tBME7mTa/XifvKManTTrAvl
	8WlQ==
X-Gm-Message-State: ALoCoQkzJBwHEi2BafbCk0VUUKuOTh5rG7QclFMutmUKAdPTNzECwwJi1ZPsmlc6dJ9sO/Stp0pH
X-Received: by 10.140.39.164 with SMTP id v33mr11184773qgv.80.1430221750964;
	Tue, 28 Apr 2015 04:49:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 28 Apr 2015 04:48:50 -0700 (PDT)
In-Reply-To: <92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
	<92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Apr 2015 12:48:50 +0100
Message-ID: <CAJTo0LYrLFF-qvYrA2zFZV+KgKu5cv3ZL53h0GC_km+oXvcutg@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] license.bbclass: allow copying license not in common licenses
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
X-List-Received-Date: Tue, 28 Apr 2015 11:49:11 -0000
Content-Type: multipart/alternative; boundary=001a11c14eae6ab35b0514c773aa

--001a11c14eae6ab35b0514c773aa
Content-Type: text/plain; charset=UTF-8

On 23 April 2015 at 10:38, <jackie.huang@windriver.com> wrote:

> Some package like linux-firmware has many licenses that aren't in any
> way common, and new ones will be added from time to time, in order to
> avoid adding bunch of such common license files that are only applicable
> to a specific package, NO_GENERIC_LIC is added to allow copying license
> not in common licenses, it should be used in the recipe as:
>

Why can't linux-firmware just put those licenses into a directory alongside
the recipe and do something like LICENSE_PATH += "${THISDIR}/licenses"?

Ross

--001a11c14eae6ab35b0514c773aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 April 2015 at 10:38,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.=
huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2s6" class=3D"a3=
s" style=3D"overflow:hidden">Some package like linux-firmware has many lice=
nses that aren&#39;t in any<br>
way common, and new ones will be added from time to time, in order to<br>
avoid adding bunch of such common license files that are only applicable<br=
>
to a specific package, NO_GENERIC_LIC is added to allow copying license<br>
not in common licenses, it should be used in the recipe as:<br></div></bloc=
kquote><div><br></div><div>Why can&#39;t linux-firmware just put those lice=
nses into a directory alongside the recipe and do something like LICENSE_PA=
TH +=3D &quot;${THISDIR}/licenses&quot;?</div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--001a11c14eae6ab35b0514c773aa--
