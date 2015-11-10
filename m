Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7883465CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:10:37 +0000 (UTC)
Received: by qgec40 with SMTP id c40so112663733qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jJrjDobVVd31Icac2Nzc4VFpUIsyogQcmak7LI68saQ=;
	b=HVSzA+sJlL4ddr0EoGwTq9K9c77wC0or2v5SKiajhhz2jQ9+Gss3pn1Sv/sS03rrjJ
	KD5c/kmlLnHUeThLqzYWlRlh1+z0FuCB+atWYDzHXif+N5jWOV5vRKmNz5/7qUnoK19u
	t7ZK7epg8JxBvRnykeHegPdx2agE46PiCYzGuMCRCNiSSd7ca6Q13vNKYKH1oKS8nsYv
	5UQVH863uJuzg/Ez5ReJaOYonV0GO1WmZZJ5TG+9247HFyxwrB9AUsOFU+xugHoz8LYg
	UB0CrabSVlZ/YH7WHKCluk00XxkJ1bq907Inf2CP5pPYFI6V0oKd78kzmx+f3bonNoC7
	bqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jJrjDobVVd31Icac2Nzc4VFpUIsyogQcmak7LI68saQ=;
	b=B7ubH31VkpJMqWUwLcL696q9nLc+8Na7HOq9/z6fE+3cSVESG4IOId+vrkBdTvL9ov
	3btpznmHpJvyZr1eXS0c1uhIrY/8Ed3vl2+IwvUC408rdFjgO2oBacb+tUwxxrjmnIL2
	yP9RgXF9aASDow7MIqR3g5AmY87tBL2c5l50SsoPnI6pRYTviusVOBDMWQVYZR1CbzSn
	6+9yBqhmjllObF079Kv/Bx9Cko+JcooE2W7H/W0LaanOHv7kPgjB5BqLPVlhIsQdudTf
	dl5Iq3osTKIK4gx+OKPUo9qS/fT1bSznFJomH/PhIKHEhsKKRO8GH8tGSxGWTxAPpuPM
	Kq8Q==
X-Gm-Message-State: ALoCoQmK00x8Bwmd4K3OeIYCUYoXwz1g1E7EGY23m/WhdaCSCIFO+w/U+POmn2FmvW5QhGjWVr5W
X-Received: by 10.140.16.21 with SMTP id 21mr4785856qga.87.1447168237085; Tue,
	10 Nov 2015 07:10:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 07:10:17 -0800 (PST)
In-Reply-To: <564207E6.9090409@linux.intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 15:10:17 +0000
Message-ID: <CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:10:37 -0000
Content-Type: multipart/alternative; boundary=001a11c051d4b3d4100524311c00

--001a11c051d4b3d4100524311c00
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 15:06, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> I should clarify: there might be Vala software out there that someone
> would want to run in an embedded context. And that software might require
> Vala bindings for libraries that are in oe-core. If we don't provide those
> bindings, then either the layer that adds vala recipe also has to patch all
> of our oe-core recipes, or (worse!) the person who needs something
> vala-based also has to ad-hoc-patch the dependency recipes of that.
>

One solution for no vala in oe-core would be for all vala-supporting
recipes in oe-core to have a PACKAGECONFIG[vala], so if someone does want
Vala then they just need to add meta-vala (for example) to their layers and
enable the PACKAGECONFIGs where they want it enabled.  There's plenty of
prior art for this behaviour in oe-core already.

Ross

--001a11c051d4b3d4100524311c00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 15:06, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":67c" class=3D"a3s" style=3D"overflow:hidden">I should cla=
rify: there might be Vala software out there that someone would want to run=
 in an embedded context. And that software might require Vala bindings for =
libraries that are in oe-core. If we don&#39;t provide those bindings, then=
 either the layer that adds vala recipe also has to patch all of our oe-cor=
e recipes, or (worse!) the person who needs something vala-based also has t=
o ad-hoc-patch the dependency recipes of that.<br></div></blockquote></div>=
<br>One solution for no vala in oe-core would be for all vala-supporting re=
cipes in oe-core to have a PACKAGECONFIG[vala], so if someone does want Val=
a then they just need to add meta-vala (for example) to their layers and en=
able the PACKAGECONFIGs where they want it enabled.=C2=A0 There&#39;s plent=
y of prior art for this behaviour in oe-core already.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c051d4b3d4100524311c00--
