Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIiIy-0003dO-Vk
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:20:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 08:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141360463"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2012 08:11:34 -0700
Message-ID: <4F884226.2030803@linux.intel.com>
Date: Fri, 13 Apr 2012 08:11:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334265557.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1334265557.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2] Two small fixes, pseudo and rpm
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
X-List-Received-Date: Fri, 13 Apr 2012 15:20:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 02:21 PM, Mark Hatle wrote:
> pseudo was adding in an rpath, prevent that
>
> rpm-native was not resolving dependencies that looked like possible
> filename properly.
>
>
> The following changes since commit 71e95c744eaa4dda1b3237db2e13f666f121c92b:
>
>    package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:24:55 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fixes
>
> Mark Hatle (2):
>    pseudo: Tell pseudo to avoid specifying an RPATH
>    rpm: Ensure that we check both providename and filepaths
>
>   meta/recipes-devtools/pseudo/pseudo.inc            |    8 ++--
>   meta/recipes-devtools/pseudo/pseudo_1.3.bb         |    2 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
>   meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |   36 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>   5 files changed, 44 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
>
Merged into OE-Core

Thanks
	Sau!


