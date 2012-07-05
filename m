Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqHN-00053s-03
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:55:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2012 10:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167454620"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:44:43 -0700
Message-ID: <4FF5D28B.9000900@linux.intel.com>
Date: Thu, 05 Jul 2012 10:44:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341257063.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341257063.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Update oprofile to know about OE root home directory
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
X-List-Received-Date: Thu, 05 Jul 2012 17:55:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 12:25 PM, Mark Hatle wrote:
> The root home directory is /home/root and not /root, adjust oprofile to match.
>
> The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:
>
>    package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/oprofile
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/oprofile
>
> Mark Hatle (1):
>    oprofile: Change /root to /home/root
>
>   meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
>   .../oprofile/oprofile/oprofile-root.patch          |  108 ++++++++++++++++++++
>   2 files changed, 110 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
>

Merged into OE-Core

Thanks
	Sau!


