Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrIGW-0002AN-AW
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 01:32:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2011 16:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,353,1309762800"; 
   d="scan'208";a="5975485"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2011 16:28:16 -0700
Message-ID: <4E43140F.5030000@linux.intel.com>
Date: Wed, 10 Aug 2011 16:28:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312508225.git.lei.mei@intel.com>
In-Reply-To: <cover.1312508225.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]apr-util: disable pqsql support to avoid configure error
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
X-List-Received-Date: Wed, 10 Aug 2011 23:32:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 06:52 PM, Mei Lei wrote:
> The pqsql config script will check host path and add host paths to compiler and linker options:
>      adding "-I/usr/include/postgresql" to CPPFLAGS
>      adding "-L/usr/lib" to LDFLAGS
>
> Disable pqsql support since we didn't use this feature in other recipes.
>
> Thanks,
> Lei
>
> The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:
>    Richard Purdie (1):
>          eglibc: Fix patch merge breakage
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/apr-util
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/apr-util
>
> Mei Lei (1):
>    apr-util: disable pqsql support to avoid configure error
>
>   meta/recipes-support/apr/apr-util_1.3.12.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
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


