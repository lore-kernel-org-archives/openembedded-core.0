Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3A340762A2;
	Tue,  8 Sep 2015 21:39:20 +0000 (UTC)
Received: by igxx6 with SMTP id x6so369134igx.1;
	Tue, 08 Sep 2015 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=AHzPQ+dIzyL+SCNu6zJK3WlWAWfny+VnsRWpsnMd/2g=;
	b=r8CROp50EHGS/ujadGdTvGcTUDLp2J3xUMH44IA1rLEFzmCSITdsb55/Z6PAIHFEMe
	bm+3/YLRbSb4qUBS95I02ok2quB3C2UQEfs3DS2+neaKQjSkZ06PWsFPW2hT1gQjyBJc
	Eci/SHxueK3wpw1NBtsZtv7D/ImZvsQokEbOuERekPARFdQvl9HhqysSSVuH7Eg93AXz
	dP9OEyRWgr8ok81aFIK1o+Wr9XiFeDt2pZlfuC/eqnQBylTBVvZdXFIyUtrAw3s0DivW
	ffOPvvGDeawD+Pr6IkkMdVAx0uqI1IssYq5yLbVxNM+nezvYSYldXJXnSCbPV/aDJxxy
	o2BQ==
MIME-Version: 1.0
X-Received: by 10.50.119.70 with SMTP id ks6mr31370184igb.78.1441748360656;
	Tue, 08 Sep 2015 14:39:20 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Tue, 8 Sep 2015 14:39:20 -0700 (PDT)
In-Reply-To: <20150908170942.GE2381@jama>
References: <20150908155801.GD2381@jama>
	<20150908170942.GE2381@jama>
Date: Tue, 8 Sep 2015 23:39:20 +0200
Message-ID: <CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Tue, 08 Sep 2015 21:39:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2015 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> ERROR: polkit-group-rule-datetime different signature for task do_configu=
re.sigdata between qemux86copy and qemuarm
> runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_patch',=
 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_pop=
ulate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.bb.do_=
patch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb=
.do_populate_sysroot:virtual:native']
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723c466e=
0c5c88a09a50
I missed many of these - because I am not up to date on oe-core (did
not want to loose midori for my images) - will change that soon. For
this type of error: is it correct that it is caused by allarch recipes
depending on machine/architecture specific recipes?

Andreas

