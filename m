Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id C1D4E6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 23:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EC4C32E138;
	Tue,  4 Jul 2017 01:56:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DpmGwSdUR2Kn; Tue,  4 Jul 2017 01:56:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 1B7692E271;
	Tue,  4 Jul 2017 01:56:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0155B1E075;
	Tue,  4 Jul 2017 01:56:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9C7B1E074;
	Tue,  4 Jul 2017 01:56:39 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  4 Jul 2017 01:56:39 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id DBAA524E7;
	Tue,  4 Jul 2017 01:56:39 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 4 Jul 2017 01:56:39 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 4 Jul 2017 01:56:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
	without PATCHTOOL = "git"
Thread-Index: AQHS5d9kOhG4vKZAUEeSdO8XWjJMgKIl83VQ///gMwCAACGcYP//4geAgAAhxPD//9/JAAAGQkHgAAcC8QADk7sl4A==
Date: Mon, 3 Jul 2017 23:56:39 +0000
Message-ID: <7d41b13be32e4d29bf1a68190793f87c@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
	<55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
	<e5fb0af1b0b3455b93562ef4ecc15f12@XBOX02.axis.com>
	<3d43fd13-b3c2-48cd-b8bf-e16ff8f7c9a8@linux.intel.com>
	<1efb5ad739604a94872885a72ec9b4b8@XBOX02.axis.com>
	<1c056ee5-a38f-b79c-1e2f-47bdf8be6fcd@linux.intel.com>
In-Reply-To: <1c056ee5-a38f-b79c-1e2f-47bdf8be6fcd@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Mon, 03 Jul 2017 23:56:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 15 juni 2017 22:44
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Burton, Ross
> <ross.burton@intel.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>; Kukkonen, Jussi
> <jussi.kukkonen@intel.com>
> Subject: Re: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
> without PATCHTOOL =3D "git"
>=20
> On 06/15/2017 06:33 PM, Peter Kjellerstedt wrote:
> > It turns out the problem is only seen if opengl is enabled in
> > DISTRO_FEATURES. However, since that is the default for poky, that
> > still does not explain why others do not see the problem
> >
> > I have included the log.do_compile file where one can see that the
> > file gdkx-with-gl-context.h is missing (that is the file that was
> > supposed to be renamed from gdkx.h by the patch). When I look in
> > tmp/work/i586-poky-linux/gtk+3/3.22.15-r0/gtk+-3.22.15/gdk/x11 I see
> > gdkx.h and gdkx-without-gl-context.h, instead of the expected
> > gdkx-with-gl-context.h and gdkx-without-gl-context.h...
>=20
> I guess Jussi needs to look at this, as he's maintaining the patches
> and the recipe.
>=20
> Alex

Ok, I have finally figured out what is going on. The problem is the=20
version of patch that is installed on the host. Support for Git style=20
patches was added to patch in version 2.7, but on the host where I=20
failed to build gtk+3, the installed version of patch is 2.6.1...

However, since this is the only patch in all of Poky and OpenEmbedded=20
that uses the Git style format, I still think the correct thing to do is=20
to apply my change. It does not change the contents of the patch, only=20
the format.

I will send an updated change with an updated commit message to clarify=20
what is going on.

//Peter


