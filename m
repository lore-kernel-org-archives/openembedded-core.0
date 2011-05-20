Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNRWb-0001BE-KS
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 17:22:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2011 08:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,242,1304319600"; 
   d="scan'208";a="1583182"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2011 08:19:03 -0700
Message-ID: <4DD68667.3040504@linux.intel.com>
Date: Fri, 20 May 2011 08:19:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305848960.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305848960.git.raj.khem@gmail.com>
Subject: Re: [PATCHv2 0/2] opkg updates
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
X-List-Received-Date: Fri, 20 May 2011 15:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2011 04:52 PM, Khem Raj wrote:
>
> This incorporates the comments from RP
>
> The following changes since commit b0cbb0f5a98e9406a5007aa5ce5091c1be8e82db:
>
>    opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS} (2011-05-19 16:45:03 -0700)
>
> are available in the git repository at:
>    git@git.openembedded.org:openembedded-core-contrib.git kraj/opkg
>    http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/opkg
>
> Khem Raj (2):
>    opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
No pulled per RP's comment about $D vs ${D}

>    opkg-utils: Synchronise with OE
>
Pulled into oe-core

Thanks
	Sau!


>   .../opkg-utils/opkg-utils/mtime-int.patch          |   29 ++++++++++++++++++++
>   meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    7 +++-
>   meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 -------------
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
>   4 files changed, 35 insertions(+), 23 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>   delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
>



