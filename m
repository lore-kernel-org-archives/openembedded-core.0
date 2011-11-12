Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RP1JU-0004q7-Oa
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 01:19:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 16:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,497,1315206000"; d="scan'208";a="84208668"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2011 16:12:57 -0800
Message-ID: <4EBDBA08.2090306@linux.intel.com>
Date: Fri, 11 Nov 2011 16:12:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320961001.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/3] DHCP and reduction of amount of packages installer by xinit
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
X-List-Received-Date: Sat, 12 Nov 2011 00:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2011 01:37 PM, Otavio Salvador wrote:
> The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:
>
>    populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (3):
>    dhcp: generate initial leases files for server
Need a better comment, I will update based on your email.

>    util-linux: split mcookie onto a package
>    xinit: rdepends on util-linux-mcookie to avoid brining whole
>      util-linux
>
Merged into OE-Core

Thanks
	Sau!


>   meta/recipes-connectivity/dhcp/dhcp.inc           |    9 ++++++++-
>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb      |    2 +-
>   meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
>   meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
>   meta/recipes-graphics/xorg-app/xinit_1.3.0.bb     |    4 ++--
>   5 files changed, 14 insertions(+), 6 deletions(-)
>


