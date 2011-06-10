Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QV2y8-0000As-Mv
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:45:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2011 07:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,347,1304319600"; d="scan'208";a="14809099"
Received: from unknown (HELO helios.localnet) ([10.255.13.133])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2011 07:42:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Jun 2011 15:42:12 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1307623890.git.paul.eggleton@linux.intel.com>
	<e894a1bec293052c213e828c8071d833a5631131.1307623890.git.paul.eggleton@linux.intel.com>
	<24914D5A-4024-4F09-BC83-E99C443D90E9@dominion.thruhere.net>
In-Reply-To: <24914D5A-4024-4F09-BC83-E99C443D90E9@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106101542.13818.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] iproute2: update to 2.6.38
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
X-List-Received-Date: Fri, 10 Jun 2011 14:45:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 10 June 2011 15:19:00 Koen Kooi wrote:
> When building I get this:
>=20
> WARNING: the following files were installed but not shipped in any packag=
e:
> WARNING:   /lib/tc/m_xt.so
> WARNING:   /lib/tc/m_ipt.so
>=20
> I don't know anything about iproute2, so I can't say if it's bad or good =
to
> leave these out :)

=46rom some searching I think we may want those if we want "tc" to be able =
to=20
handle xtables/iptables; however one packager I found chose to install=20
m_ipt.so as a symlink to m_xt.so. This needs a little further research.

Thanks for pointing this out, I should really have seen it myself.

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


