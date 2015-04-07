Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 84C0773C63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 19:41:31 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so89030315pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vc/9ric4bzazBifV87PslTx63Up+EdZob2MPFiTkt8E=;
	b=TXP4RWn5gU9FHBpDeCb+au9/eqxDu80R/RZrpMACdjWJ9XZpyvsguJBNDkxHPpfGup
	bqQUx0947TVQSwqw04bRIxj2YYKCJyAoRR+uHdmt2tAgUrfOnkqCfp11jrhCL5vGenkQ
	OXskz2dwJGALeWbHJ9cGPCbBRa0WoxEUcTFLXUPyEWyzyg4CEAhteAb0xPiliu8J5gtD
	xdLaO5xZXCcuwLHbUNjymyEf2Qa0VRu4IYLWMH5IOkyvf6PMfycQxq+EJGXVzPOO0H6U
	fp6R6zPNNXGG+FKayVyMLqBi1CXoljW0dfuzw1bZx8bCYFqEnm2Cu6RnrGnLh9c8LxAF
	WHpA==
X-Received: by 10.70.90.162 with SMTP id bx2mr30490891pdb.60.1428435693452;
	Tue, 07 Apr 2015 12:41:33 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:6173:5e9d:a616:6d78?
	([2601:9:500:ece:6173:5e9d:a616:6d78])
	by mx.google.com with ESMTPSA id jh2sm8782468pbb.25.2015.04.07.12.41.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Apr 2015 12:41:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428399156.14020.453.camel@linuxfoundation.org>
Date: Tue, 7 Apr 2015 12:41:30 -0700
Message-Id: <0C795E74-218B-4B1C-AC1C-70E675D0B598@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
	<89112aaf74a5e6b6e87fd335efab08fb4b89cd26.1428341478.git.raj.khem@gmail.com>
	<1428399156.14020.453.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/24] binutils: upgrade to 2.25
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
X-List-Received-Date: Tue, 07 Apr 2015 19:41:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 2:32 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> I ran an older patchset containing this against the autobuilder. We =
have
> two problems which I think are 2.25 related:
>=20
> =
http://errors.yoctoproject.org/Errors/Search/?items=3D10&query=3D56f680b60=
ab5fd396f2a65431376683ca6707127
>=20
> libunwind is failing on x86, likely due to:
>=20
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D65248
>=20
> which is only planned to be fixed in gcc5. Not sure how we can fix =
this
> one other than perhaps forcing the use of gold in this case (which =
seems
> wrong).

your fix to use gold in interim is ok. I am baking gcc5 recipes on my =
contrib branch already and its looking ok.
once gcc5 is released I will propose it for master ( may be end of May)

>=20
> We also have a uboot issue on mpc8315e-rdb which there are fixes =
around
> for, we just need someone to find them and patch it. Both failures are
> in the above error reporting link.


This will be fixed by applying
=
https://lists.yoctoproject.org/pipermail/meta-freescale/2015-February/0128=
27.html


>=20
> Cheers,
>=20
> Richard
>=20


