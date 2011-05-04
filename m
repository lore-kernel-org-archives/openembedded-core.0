Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QHdvr-0007kN-KE
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 17:24:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 May 2011 08:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,314,1301900400"; d="scan'208";a="430411985"
Received: from unknown (HELO helios.localnet) ([10.255.13.83])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2011 08:21:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: poky@yoctoproject.org
Date: Wed, 4 May 2011 16:21:25 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<a6ff3eaba2e8868cf24775725be334f3479d905c.1304520272.git.paul.eggleton@linux.intel.com>
	<4DC16BA5.1090508@mlbassoc.com>
In-Reply-To: <4DC16BA5.1090508@mlbassoc.com>
MIME-Version: 1.0
Message-Id: <201105041621.25113.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/3] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Wed, 04 May 2011 15:24:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 04 May 2011 16:07:17 Gary Thomas wrote:
> Perhaps it makes sense to always package netbase in ${MACHINE_ARCH} since
> it almost always will have machine specific data?

I'll let someone else comment on this, I don't have a hard opinion either way.
 
> Also, what about these overrides?  (There may be others, I just noticed
> these)
> ./meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:do_install_append_op
> enmn() {
> ./meta/recipes-core/netbase/netbase_4.45.bb:INITSCRIPT_PARAMS_openmn =
> "start 85 1 2 3 4 5 . stop 85 0 6 1 ."
> ./meta/recipes-core/busybox/busybox.inc:INITSCRIPT_PARAMS_${PN}-syslog_slu
> gos = "start 20 ."
> ./meta/recipes-core/netbase/netbase_4.45.bb:INITSCRIPT_PARAMS_slugos =
> "start 42 S 0 6 ."
> ./meta/recipes-core/base-files/base-files_3.0.14.bb:hostname_slugos =
> "nslu2"
> ./meta/recipes-core/base-files/base-files_3.0.14.bb:do_install_append_slug
> os() {
> ./meta/recipes-core/base-files/base-files_3.0.14.bb:CONFFILES_${PN}_slugos
> = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
> ./meta/recipes-devtools/dpkg/dpkg.inc:DPKG_INIT_POSITION_slugos = "41"

These are all distro overrides and unless I'm mistaken these are all removed 
by the second patch in the series.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


