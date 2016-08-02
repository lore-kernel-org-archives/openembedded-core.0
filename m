Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4482C65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:10:46 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q83so223960195iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XJR2bOcG8fuEXLL1kiZQY7BfHVyFH2MjFz+msMKLQPQ=;
	b=Aekh+rZgvCJrmaJ/n5+n0kNQV2lnh7iNMS7XQ5G865wguXNNMRF7ydvATcCrKHWdcD
	JaMACbqL4B50i9vqndIKfZ/H8ezNCTinetAS/a7SFc2bbtAE0IpxYi6MI8ll5bauAdPX
	pok7wCHHug7j0IJEoOcg9oFPf37ezfdE8pehtsnvT23X4zJCdr5B6hxtF+Q9UxJHKf6U
	lxUIWmVjeOrSAsy9arXVs1wkTE0SfPJe3zBLjgZB0nl/kLq56GQbBIDXcxOiu94AFtq+
	PgyB16qyDVVdVvEoGx+61JQrZfO1N200vSY3DZHcStXZQGhE7Ev7wXnc5RCOvWZk4NM6
	NhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XJR2bOcG8fuEXLL1kiZQY7BfHVyFH2MjFz+msMKLQPQ=;
	b=cAkSSsBxfpunl/iGsh6IeOIz+n/+X8ucy6tKa9QiK+jFbGVZV023bWBrgpRY3j6528
	IqW2E4TKB6SfJRgdrWCJn3Vg582hC0VMS9kdEH3GPO3a2QacZLGaNmLxd6xgdPG2J9Ba
	pj8LUpSQ4u5d7Tb/HCNNXWohBshdEhA9+0Wd64iVR7iRtor2RcbS3ATM0z2Tq/sb+tda
	RcnWhc1sGw4/30tWpV0WJ640sGScHHpUejiGt6SwL6euFndfnEPz9eL4BvvyTyy4vm/f
	aapbY1ZRPE+r53EWoSP7Ya9PepdgdO2nhMnp6BOwHHATPn0nlYCbFf3Y1DDsN4YGNS/i
	qztA==
X-Gm-Message-State: AEkoouv2mj6h9GRjwgDNeolhB47SzlWr/pIZ3SfEk46ohQI+ctEQY2SYf7f7S8zWqxs+Eblynto/A+BWodolc1e/
X-Received: by 10.107.138.212 with SMTP id c81mr61208842ioj.148.1470168647738; 
	Tue, 02 Aug 2016 13:10:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 13:10:27 -0700 (PDT)
In-Reply-To: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 21:10:27 +0100
Message-ID: <CAJTo0LbH=c0uXTKMomU=4OE+jJKA42FbnsW9pnDsHE3afQW0Hg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Tue, 02 Aug 2016 20:10:49 -0000
Content-Type: multipart/alternative; boundary=001a113ed932023bea05391c5073

--001a113ed932023bea05391c5073
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 15:07, Maxin B. John <maxin.john@intel.com> wrote:

> Remove xtscal in preference of xinput-calibrator
>

Comparing two images build before and after this:

hanges to images/intel_corei7_64/glibc/core-image-sato-base
(installed-package-names.txt):
  pointercal was removed
  libxcalibrate0 was removed
  xtscal was removed
  xinput-calibrator was added
  bash was added
  xinput was added
  pointercal-xinput was added

We can't start requiring bash, so can you figure out what is pulling in
bash and rewrite it to be busybox-safe?

Ross

--001a113ed932023bea05391c5073
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 15:07, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":2u8" class=3D"">Remove xtscal =
in preference of xinput-calibrator<br></div></blockquote></div><br>Comparin=
g two images build before and after this:</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">hanges to im=
ages/intel_corei7_64/glibc/core-image-sato-base (installed-package-names.tx=
t):</div><div class=3D"gmail_extra">=C2=A0 pointercal was removed</div><div=
 class=3D"gmail_extra">=C2=A0 libxcalibrate0 was removed</div><div class=3D=
"gmail_extra">=C2=A0 xtscal was removed</div><div class=3D"gmail_extra">=C2=
=A0 xinput-calibrator was added</div><div class=3D"gmail_extra">=C2=A0 bash=
 was added</div><div class=3D"gmail_extra">=C2=A0 xinput was added</div><di=
v class=3D"gmail_extra">=C2=A0 pointercal-xinput was added</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">We can&#39;t start re=
quiring bash, so can you figure out what is pulling in bash and rewrite it =
to be busybox-safe?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div></div>

--001a113ed932023bea05391c5073--
