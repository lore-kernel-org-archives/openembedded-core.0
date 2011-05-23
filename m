Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOaYa-0002Dg-TU
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 21:12:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2011 12:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,258,1304319600"; 
   d="scan'208";a="6312137"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 12:09:47 -0700
Message-ID: <4DDAB0FA.7020406@linux.intel.com>
Date: Mon, 23 May 2011 12:09:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305933509.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305933509.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Opkg and distcc fix
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
X-List-Received-Date: Mon, 23 May 2011 19:12:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2011 04:19 PM, Khem Raj wrote:
> These are remaining patches which needed rework.
>
> The following changes since commit c26dadc799cd9c7df66c3bccfc9f21146c35625a:
>
>    opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS} (2011-05-20 16:15:29 -0700)
>
> are available in the git repository at:
>    git@git.openembedded.org:openembedded-core-contrib.git kraj/misc-fixes
>    http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/misc-fixes
>
> Khem Raj (2):
>    opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
>    distcc_2.18.3.bb: Fix compilation on uclibc
>
>   meta/recipes-devtools/distcc/distcc_2.18.3.bb   |   17 ++++++++++++-----
>   meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
>   meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
>   3 files changed, 13 insertions(+), 26 deletions(-)
>   delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
>

Khem,

After all the churn, latest version has been merged.

Thank
	Sau!


