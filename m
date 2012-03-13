Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7TQt-0005Cy-56
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 16:14:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2012 08:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138089722"
Received: from unknown (HELO helios.localnet) ([10.252.123.185])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2012 08:05:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 15:05:31 +0000
Message-ID: <2142033.FIQWIVi2oI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1331650371-6055-1-git-send-email-bjst@enea.com>
References: <1331650371-6055-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Tue, 13 Mar 2012 15:14:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Bj=F6rn,

On Tuesday 13 March 2012 15:52:51 Bj=F6rn Stenberg wrote:
> pigz, which stands for parallel implementation of gzip, is a fully
> functional replacement for gzip that exploits multiple processors and=

> multiple cores to the hilt when compressing data. pigz was written by=
 Mark
> Adler, and uses the zlib and pthread libraries.
>=20
> This recipe adds pigz as an alternative provider of gzip-native. Pigz=
 is
> much faster than gzip on multi-core machines.
>=20
> Upstream-status: Pending

This needs to be moved to the inner ldflags.patch, and..

> Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>

this should be copied to there. The patch should also start with an=20
explanation of what the patch does (in this case it's trivial, but stil=
l worth=20
having in there.)

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


