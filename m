Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USP5I-0004N0-FG
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:55:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Apr 2013 02:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="287338155"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by azsmga001.ch.intel.com with ESMTP; 17 Apr 2013 02:37:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 17 Apr 2013 10:37:50 +0100
Message-ID: <3344072.3yQMCnL6TJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Apr 2013 09:55:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 17 April 2013 11:03:30 Andreas M=FCller wrote:
> On Wed, Apr 17, 2013 at 10:28 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
> >> On Apr 16, 2013, at 11:28 PM, Andreas M=FCller
> >> <schnitzeltony@googlemail.com>
> >>=20
> >> wrote:
> >> > sorry again me with another issue. I updated all layers from mas=
ter
> >> > few hours ago and built from scratch. On first boot with systemd=

> >> > postinst never finishes. I see only:
> >> >=20
> >> > [**  } A start job is running for Run pending postinsts
> >> >=20
> >> > and ** are moving around.
> >> >=20
> >> > Does anybody else face this one?
> >>=20
> >> ran into same issue. I disabled post installs to run on boot
> >=20
> > Could you guys please try to debug this and find out what is hangin=
g here,
> > because with core-image-minimal and systemd I don't see this proble=
m, the
> > run- postinsts script finishes as expected.
>=20
> are you using opkg as I do?

I wasn't, however I was under the impression Khem was also using rpm. N=
ow I am=20
using opkg, and what I can see is that run-postinsts does take some tim=
e on=20
boot but it does appear to eventually finish and I don't get any error=20=

indicating it failed; systemctl doesn't appear to list run-postinsts (a=
lthough=20
I don't know whether it should or not.)

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


