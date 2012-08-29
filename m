Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6jly-0007sD-Tc
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 17:01:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2012 07:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,334,1344236400"; d="scan'208";a="139305402"
Received: from unknown (HELO helios.localnet) ([10.252.121.163])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2012 07:49:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Aug 2012 15:49:21 +0100
Message-ID: <3316200.yvxTASJk5k@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
	<1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 15:01:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 August 2012 16:47:10 Koen Kooi wrote:
> Op 29 aug. 2012, om 16:24 heeft Ross Burton <ross.burton@intel.com> het 
volgende geschreven:
> > Lots of code (such a GLib) expects this to exist and link to the current
> > timezone data.
> > 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> > meta/recipes-extended/tzdata/tzdata_2012d.bb |    3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb
> > b/meta/recipes-extended/tzdata/tzdata_2012d.bb index 31e1266..9741101
> > 100644
> > --- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
> > +++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
> > @@ -5,7 +5,7 @@ LICENSE = "PD"
> > LIC_FILES_CHKSUM =
> > "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
> > DEPENDS = "tzcode-native"
> > 
> > -PR = "r1"
> > +PR = "r2"
> > 
> > inherit allarch
> > 
> > @@ -49,6 +49,7 @@ do_install () {
> > 
> >         # Install default timezone
> >         install -d ${D}${sysconfdir}
> >         echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> > 
> > +        ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE}
> > ${D}${sysconfdir}/localtime
>
> Awesome! I've been campaigning for the symlink solution for a while now.
> Good thing that split-/usr nonsense is over now.

How do you get that from this patch?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


