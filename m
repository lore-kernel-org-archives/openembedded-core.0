Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 83FC77694F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 20:36:49 +0000 (UTC)
Received: by qgj62 with SMTP id 62so123279336qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nIxuEO2M4SQ8dPYenOp9CNd6sxhyrtDJNTYh9UFTNMI=;
	b=TRDPDkn8sFm1u1/aXRn3bqMmhW5JXbluyAYlH0ZRZYivhuaWevWPYQK9x5OqGFl+XV
	PsiuAlZJDP92qFIlkrgOnwE7i4QKEG5AERzY41uV+NNrCsbkxg0YtLbDrf6WtRDiNYX9
	pZBmzb5ZbkKmphI8urQpqivuoQ8iFV79AJ3luerUsu21VgyWd0JOfIhoDvC1R77sMhVH
	jISC2ihgergEHDf3SvXCsIrDNkX7AKvWto2yQn8CXczJiN6UoMoR1EWOxL/Le4PvpH8b
	kGgqY43qaUDpsejiRfhBu1tBh3WI2cox2EWGI7BSDDBqJ2VRUHlI9yxdSbfMhS/i+sw/
	a7ug==
X-Gm-Message-State: ALoCoQktAb49KwIZRSkxY0udXklhA/wO07JmuS3CZp5fZXJaCD7B10laWBOGMK7AJYyzDFke3NsI
X-Received: by 10.140.20.77 with SMTP id 71mr17448722qgi.87.1439325410006;
	Tue, 11 Aug 2015 13:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 13:36:30 -0700 (PDT)
In-Reply-To: <CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 21:36:30 +0100
Message-ID: <CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 11 Aug 2015 20:36:51 -0000
Content-Type: multipart/alternative; boundary=001a11c12458c7cc1e051d0f0f4d

--001a11c12458c7cc1e051d0f0f4d
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:

> can we freeze this thread please.
>

Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
someone on this list asks what Poky is, 99% of the time they're trolling.
 :)

The original and unanswered question was "should oe-core continue to
maintain GPLv2 recipes where upstream has moved to GPLv3 or should those
recipes move to a standalone layer" with various implied questions:

- If the v2 recipes move to a separate layer, who own/maintains/tests it?
- Should there be v2 recipes for every recipe that has moved to v3, or only
(as is now) the "more-core" recipes (currently YP tests that
core-image-base builds without GPLv3, nothing else more complicated)
- Should meta-gplv2 only contain recipes from oe-core, or all layers?  If
other layers decide to hold both v3 and v2 recipes (not that I'm aware any
have), what makes oe-core special?

I'm torn, Richard is torn.  Neither of those are useful to forming a
decision.  Does anyone else have any *useful* feedback?

Ross

--001a11c12458c7cc1e051d0f0f4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 16:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1sw" class=3D"a3s" styl=
e=3D"overflow:hidden">can we freeze this thread please.</div></blockquote><=
div><br></div><div>Or more usefully, reboot it.=C2=A0 Philip, you&#39;re tu=
rning into Koen!=C2=A0 Alex, if someone on this list asks what Poky is, 99%=
 of the time they&#39;re trolling. =C2=A0:)</div><div><br></div><div>The or=
iginal and unanswered question was &quot;should oe-core continue to maintai=
n GPLv2 recipes where upstream has moved to GPLv3 or should those recipes m=
ove to a standalone layer&quot; with various implied questions:</div><div><=
br></div><div>- If the v2 recipes move to a separate layer, who own/maintai=
ns/tests it?</div><div>- Should there be v2 recipes for every recipe that h=
as moved to v3, or only (as is now) the &quot;more-core&quot; recipes (curr=
ently YP tests that core-image-base builds without GPLv3, nothing else more=
 complicated)</div><div>- Should meta-gplv2 only contain recipes from oe-co=
re, or all layers?=C2=A0 If other layers decide to hold both v3 and v2 reci=
pes (not that I&#39;m aware any have), what makes oe-core special?</div><di=
v><br></div><div>I&#39;m torn, Richard is torn.=C2=A0 Neither of those are =
useful to forming a decision.=C2=A0 Does anyone else have any *useful* feed=
back?</div><div><br></div><div>Ross</div></div></div></div>

--001a11c12458c7cc1e051d0f0f4d--
