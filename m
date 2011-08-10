Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrIGo-0002Br-UI
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 01:33:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2011 16:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,353,1309762800"; 
   d="scan'208";a="5975555"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2011 16:28:34 -0700
Message-ID: <4E431422.2020004@linux.intel.com>
Date: Wed, 10 Aug 2011 16:28:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311836896.git.lei.mei@intel.com>
In-Reply-To: <cover.1311836896.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]python-native: Fix a compiler finding issue
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
X-List-Received-Date: Wed, 10 Aug 2011 23:33:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 12:20 AM, Mei Lei wrote:
> Hi,
>      This patch will fix an compiler finding issue.
>      The CC variable, its value sometimes like "x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. This will confuse python when finding the compiler name, wrong compiler name "qemux86-64" were found rather than the "x86_64-poky-linux-gcc".
>      When I fixing python-pycairo multilib dir issue, above issue appeared and block the compile process. Please review it.
>
> Thanks
> Lei
>
> The following changes since commit 819f18f8bc000f13b644edc194d2a12b4ea5fecf:
>    Richard Purdie (1):
>          Move architecture specific TARGET_OS mangling into tune files
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/python-pycairo
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/python-pycairo
>
> Mei Lei (1):
>    python-native: Fix a compiler finding issue
>
>   .../python/python-native/unixccompiler.patch       |   20 ++++++++++++++++++++
>   .../recipes-devtools/python/python-native_2.6.6.bb |    3 ++-
>   2 files changed, 22 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python-native/unixccompiler.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged to OE-Core

Thanks
	Sau!


