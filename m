Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USUIH-0008BL-GD
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:29:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2013 08:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="319714116"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2013 08:11:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Apr 2013 16:11:19 +0100
Message-ID: <1698802.8DrKko4pUN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <A4E33256-746E-4C88-AA56-D56ACB80CB8D@gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<A4E33256-746E-4C88-AA56-D56ACB80CB8D@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 15:29:15 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 17 April 2013 07:57:13 Khem Raj wrote:
> On Apr 17, 2013, at 1:28 AM, Paul Eggleton <paul.eggleton@linux.intel=
.com>=20
wrote:
> > On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
> >> On Apr 16, 2013, at 11:28 PM, Andreas M=FCller
> >> <schnitzeltony@googlemail.com>
> >>=20
> >> wrote:
> >>> sorry again me with another issue. I updated all layers from mast=
er
> >>> few hours ago and built from scratch. On first boot with systemd
> >>> postinst never finishes. I see only:
> >>>=20
> >>> [**  } A start job is running for Run pending postinsts
> >>>=20
> >>> and ** are moving around.
> >>>=20
> >>> Does anybody else face this one?
> >>=20
> >> ran into same issue. I disabled post installs to run on boot
> >=20
> > Could you guys please try to debug this and find out what is hangin=
g here,
> > because with core-image-minimal and systemd I don't see this proble=
m, the
> > run- postinsts script finishes as expected.
>=20
> does minimal image have rpm post installs ?

So at this point it would really help if someone could:

a) Tell me exactly what I need to do to reproduce the issue

or

b) Debug the issue and tell me where the script is failing

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


