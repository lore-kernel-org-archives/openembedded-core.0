Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SaVmz-0000Lm-DN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 19:37:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 10:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150496632"
Received: from unknown (HELO helios.localnet) ([10.255.12.84])
	by azsmga001.ch.intel.com with ESMTP; 01 Jun 2012 10:26:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 01 Jun 2012 18:26:49 +0100
Message-ID: <2745436.irnIgCHkKU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CALbNGRR3QYjbSywG93Rv+-ocfSThijVAtMwK0orSDQvZGrjr5w@mail.gmail.com>
References: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
	<2064973.GX7QB0lz6B@helios>
	<CALbNGRR3QYjbSywG93Rv+-ocfSThijVAtMwK0orSDQvZGrjr5w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2 2/2] buildhistory.bbclass: add pkg_pre/postinst/rm contents
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 17:37:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 01 June 2012 19:24:45 Andreas M=FCller wrote:
> On Fri, Jun 1, 2012 at 6:54 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > I'd still like to rework this to use separate files. What if a line=
 in the
> > postinst script includes an =3D (which is not unlikely)?
>=20
> Yes after first usage (it is not possible on all my machines due to
> pythongit version) and taking a look into the parsing scripts I now
> understand your concern. It might cause non predictable results. Wors=
t
> case if there is a oe varaible name used in scripts. One question:
> when outputting into separate files: isn't there a simple way to
> attach the raw git diff output for these (maybe as option) in the
> results of buildhistory-diff? Then we would have all information
> together under one hood.

Definitely - if it doesn't already work once we've reworked it we can p=
oke the=20
code in lib/oe/buildhistory_analysis.py to just report the diff of the =
blobs=20
(we already do this for other classes of files, some of the image ones =
IIRC).

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


