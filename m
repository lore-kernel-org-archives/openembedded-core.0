Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3VJG-0000eC-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 17:54:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 08:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,374,1312182000"; d="scan'208";a="16616281"
Received: from unknown (HELO [10.255.14.228]) ([10.255.14.228])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2011 08:48:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 08:48:56 -0700
In-Reply-To: <cover.1315920902.git.edwin.zhai@intel.com>
References: <cover.1315920902.git.edwin.zhai@intel.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315928936.12451.18.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] Fix hard path in opensp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 13 Sep 2011 15:54:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 21:43 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Saul,
> This is the new version to fix the hard path in opensp. After 2nd thought, I'm
> reluctant to change the search directory path handling code in nsgmls in case
> of any likely side effect to other package. I change the iputils' makefile to
> avoid "../" in the sysid path, and it really works without regression.
> 
> This is reasonable, as other package, like linuxdoc-tools-native, make a lot of
> works before calling nsgmls: prepare search directory path with "-D", introduce
> a huge perf module to handle the sgml2XXX conversion...
> 
> Pls. help to review.
> 
> Thanks,
> Edwin
> 
> The following changes since commit 52835dd30110d51a839872f198eef3b12e369850:
> 
>   avahi: only use gtk if DISTRO_FEATURES includes x11 (2011-09-07 23:44:29 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/master2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> Zhai Edwin (1):
>   opensp: Fix hard path in native nsgmls.
> 
>  meta/recipes-devtools/opensp/opensp_1.5.bb         |    4 +-
>  .../iputils/files/nsgmls-path-fix.patch            |   27 ++++++++++++++++++++
>  meta/recipes-extended/iputils/iputils_s20101006.bb |    1 +
>  3 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
> 

I tested this change against a set of multiple machine sstate builds and
it worked.  

Thanks

Acked-by: Saul Wold <sgw@linux.intel.com>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




