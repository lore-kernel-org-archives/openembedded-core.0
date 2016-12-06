Return-Path: <mikko.ylinen@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id DE25B719B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 09:57:30 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id p16so340244692qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=avfle1L74QhXVEhu6hhN/f8qZgl+7F3NXtQeEmXEcIM=;
	b=AFvDnp2HYS4SHDIMX8Q0zMehp+6JqjpEPBXxA/4ZTKxbXS7adigORXiy2iM88DWTGr
	yVZtmIZ9YDisZXW34Jkha9LWaC1BF3J/S62vOJfFORtm0yQk/Ci9S2Ec4SWWVmEputBp
	1D/TU6g80HAX0NiAiWRqsXDN6hcjQOIAqNlydzMBD1BlL/6/rnsII2CnsUXCfIzhO1q6
	dwr65x1aTglqQ/ENxWSX7VMUEZGd4HGr3tHXrbeY6p4TBAlFqqCtBKD0q44NY62fds/G
	UqWmweyRPIY2iFJw0u2zTLaaUVP64uacx1l1qipqENPyV4PmP5DmljQUQS21Ty2DmEzH
	Wjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=avfle1L74QhXVEhu6hhN/f8qZgl+7F3NXtQeEmXEcIM=;
	b=FOHA4wC/yDTU1IQu1lh78gEmml2h/eYjv8W2+ScwvyAnvflSWpmD1Qr5D60B6jx3Ig
	Gx0Vkw4sKswDRiuIbiudI5IuUkMtZ+LR3Skoy3bDscI9yCD+is+KSoiBiQTRALL1OmQC
	uDd2W59dekDbrQa9tZ7zv/sOnPzU3w8mW/kCYIiwFTKKbFVK5X7nSFrSjp/7O2ppT7LX
	YvPnmUSU6fiaOpg2dypK76kBe9RvXZ6nphUaFdwYFdrwkwJBQdRHOlyZ0StSoP7DY8O4
	6AtHlbELx8mwJZ1BAF4U2hhNhvtAtrbAUH2sfh4VWBfUzDIcgoO0suv0t9Q1/16tIdE+
	pCOg==
X-Gm-Message-State: AKaTC01KEVgswyL9yitwpp9qwCXKiGcJcB5DBPSEUtGtkPTZGG1RlfARRJRAIuJO3ACekDvzl3ITA7aXPNFe6Jz4
X-Received: by 10.200.37.52 with SMTP id 49mr52426272qtm.240.1481018251961;
	Tue, 06 Dec 2016 01:57:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.173.200 with HTTP; Tue, 6 Dec 2016 01:57:31 -0800 (PST)
From: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Date: Tue, 6 Dec 2016 11:57:31 +0200
Message-ID: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	meta-intel@yoctoproject.org
Subject: Re: [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Tue, 06 Dec 2016 09:57:31 -0000
Content-Type: multipart/alternative; boundary=001a1135b1ecd07fcc0542fa6eea

--001a1135b1ecd07fcc0542fa6eea
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri, Dec 2, 2016 at 9:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Update to 1.10.1 at the same time
>

This suggests the versions should be kept in sync with the gstreamer
versions:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/?id=3f51f61efe93c104ba7996f54f381c6c1a5e6546


-- Mikko

--001a1135b1ecd07fcc0542fa6eea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, Dec 2, 2016 at 9:32 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Update =
to 1.10.1 at the same time<br></blockquote><div><br></div><div>This suggest=
s the versions should be kept in sync with the gstreamer versions:</div><di=
v><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/?i=
d=3D3f51f61efe93c104ba7996f54f381c6c1a5e6546">http://git.yoctoproject.org/c=
git/cgit.cgi/meta-intel/commit/?id=3D3f51f61efe93c104ba7996f54f381c6c1a5e65=
46</a>=C2=A0</div><div><br></div><div>-- Mikko</div></div></div></div>

--001a1135b1ecd07fcc0542fa6eea--
