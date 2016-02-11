Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 44C8665CB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 14:11:54 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l127so55109341iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=1gdlAl6r7sy/ToS2wspGHZeoD6au7KTiV6LyS59jJ6M=;
	b=TX0nb3HQv1PeNH09wFF3ViVBgTT3oYS5p1lB/ii3GLrX/Ee+HDev+MS3Lc7bc+8zz+
	RqV0rfCUyROyOGbq+7sZoopvfSF59pbtJDMeQSr+vMAbLgo8tdUhm0A+jUEW1vrnY7Rc
	UC1zfVqvbhnyRH9v/mnwVmc4KiGruW/M5utfppH99Xv6AHOKhu97Si32jYhxHlsRmIKK
	GlYKobWu8gehIuv8us3AwGWHEY+8UjkiKrmnorkO7wgx5+wz1OkePu2RioJpdIariLMH
	uajItLVyapI4rw9yp8uIaDgOrygYYVvl5OnUdx1NZ6Ut4z/uWm+fTjfOQecBi0vOGlTO
	YAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=1gdlAl6r7sy/ToS2wspGHZeoD6au7KTiV6LyS59jJ6M=;
	b=cZklKi2z1VdBcApxooDWfxQYPJCrxIKvBBQKr/7leuIGaOwcd5mTwueH4aX6ToDzjm
	+gRlCEUG2rf4uLwz3HSzOCJC3PMn124BZWrpIt0zvt3bfhdBCcHHtx+coR85YY3GKxbL
	fEs/FbxKGqxi3l3M29FOijtnxQt7tdewpT0YdSpczvH1nobzeIh17JnCdHnTYgr3EMcg
	68O9+a8WQzS425iHTO0if64omzzCqIOhb/sOX3GafaUfw6MwnmQiQy6URTDdD+v1AnxI
	2gX6A3FXhZmBMnSxOGqIDtOmFuPGK26EE20zCgBNwq/DCvoflb0yhGkbgX4obHfYb9gh
	NEXg==
X-Gm-Message-State: AG10YOQ4mjyMgiTvkQEq1XS/X3tzTPjqzluBtAqakj3yWVDhqCnPttMlLFVdfM36o5YCCuw9pM3vryC0Mzom19xD
X-Received: by 10.107.164.15 with SMTP id n15mr41053858ioe.148.1455199915562; 
	Thu, 11 Feb 2016 06:11:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 11 Feb 2016 06:11:36 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Feb 2016 14:11:36 +0000
Message-ID: <CAJTo0LaMycXVjZLoPMU7Te2HDpp7+YUu8GGuNznhk8D8Yje27A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Dropping Debian 7 as supported?
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
X-List-Received-Date: Thu, 11 Feb 2016 14:11:55 -0000
Content-Type: multipart/alternative; boundary=001a113776820b705f052b7f2290

--001a113776820b705f052b7f2290
Content-Type: text/plain; charset=UTF-8

Hi,

I'm proposing that we drop Debian 7 from the supported distributions list
in master, so that the 2.1 release supports Debian 8.  Debian 7 was
released in 2013, Debian 8 superceded it in April 2015 so will have been
out for a year when 2.1 is released, which also means that is when Debian 7
stops receiving security fixes. Nobody should be running Debian 7 after
April 2016!

Any objections?

Cheers,
Ross

--001a113776820b705f052b7f2290
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m proposing that we drop Debi=
an 7 from the supported distributions list in master, so that the 2.1 relea=
se supports Debian 8.=C2=A0 Debian 7 was released in 2013, Debian 8 superce=
ded it in April 2015 so will have been out for a year when 2.1 is released,=
 which also means that is when Debian 7 stops receiving security fixes. Nob=
ody should be running Debian 7 after April 2016!</div><div><br></div><div>A=
ny objections?</div><div><br></div><div>Cheers,</div><div>Ross</div></div>

--001a113776820b705f052b7f2290--
