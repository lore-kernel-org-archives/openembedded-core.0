Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UJ2n9-00077C-27
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 15:18:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2013 06:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="306103264"
Received: from unknown (HELO helios.localnet) ([10.255.13.1])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2013 07:01:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 22 Mar 2013 14:01:01 +0000
Message-ID: <1464001.3jmJKUCVgI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1861915.9vIXJyESXz@helios>
References: <1363960423-16933-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1861915.9vIXJyESXz@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: disable ACL as we do not depend on it
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
X-List-Received-Date: Fri, 22 Mar 2013 14:18:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 March 2013 13:58:35 Paul Eggleton wrote:
> On Friday 22 March 2013 14:53:43 Marcin Juszkiewicz wrote:
> > Coreutils does not depend on ACL but also does not disable it. Effect is
> > that from time to time I have a copy in sstate-cache which got built
> > 
> > with ACL and then I have problem while building images or sdk:
> > | Collected errors:
> > |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > |  for
> > |  packagegroup-core-standalone-hhvm-sdk-target: *    libacl1 (>= 2.2.51)
> > |  *
> > |  * opkg_install_cmd: Cannot install package
> > |  packagegroup-core-standalone-hhvm-sdk-target.
> > 
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > ---
> > 
> >  meta/recipes-core/coreutils/coreutils_8.14.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb
> > b/meta/recipes-core/coreutils/coreutils_8.14.bb index 04c9eb2..71c4cdf
> > 100644
> > --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> > @@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
> > 
> >  SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
> >  SRC_URI[sha256sum] =
> > 
> > "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
> > 
> > +EXTRA_OECONF = "--disable-acl"
> > 
> >  EXTRA_OECONF_class-native = "--without-gmp"
> >  
> >  # [ df mktemp base64 gets a special treatment and is not included in this
> 
> Presumably the "acl" recipe will no longer work if this is done... ?

Er, I think I had this backwards. Please ignore, sorry for the noise.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


