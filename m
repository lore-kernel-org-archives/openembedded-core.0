Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkYDB-00025c-NH
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 12:14:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2012 03:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171573493"
Received: from unknown (HELO helios.localnet) ([10.252.120.185])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2012 03:03:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 11:03:02 +0100
Message-ID: <1946254.saFvDeFQPC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FED178F.50806@gmail.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
	<dfdd61d5d2f3c413b6b19db1b9d9371e46b32aa5.1340908084.git.paul.eggleton@linux.intel.com>
	<4FED178F.50806@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] apr: add util-linux to DEPENDS for libuuid
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
X-List-Received-Date: Fri, 29 Jun 2012 10:14:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 June 2012 19:48:47 Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 6/28/2012 11:29 AM, Paul Eggleton wrote:
> > apr will use libuuid if it is present, and thus we should require
> > that it is there so that we have a deterministic build.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> > meta/recipes-support/apr/apr_1.4.6.bb |    1 + 1 file changed, 1
> > insertion(+)
> > 
> > diff --git a/meta/recipes-support/apr/apr_1.4.6.bb
> > b/meta/recipes-support/apr/apr_1.4.6.bb index 6cd37f1..54c47fe
> > 100644 --- a/meta/recipes-support/apr/apr_1.4.6.bb +++
> > b/meta/recipes-support/apr/apr_1.4.6.bb @@ -1,6 +1,7 @@ DESCRIPTION
> > = "Apache Portable Runtime (APR) library" HOMEPAGE =
> > "http://apr.apache.org/" SECTION = "libs" +DEPENDS = "util-linux"
> 
> interesting. I wonder if there is configure option to denote this
> feature. May be its better to enable it explicitly along with this change

There's no documented option - I can force ac_cv_osuuid but that doesn't 
actually have the desired effect (i.e. it does not make it fail if uuid isn't 
actually provided).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


