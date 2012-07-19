Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrtFo-00068G-5Q
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:07:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 08:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174323515"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 08:55:35 -0700
Message-ID: <50082DF7.2090106@linux.intel.com>
Date: Thu, 19 Jul 2012 08:55:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342593440.git.raj.khem@gmail.com>
In-Reply-To: <cover.1342593440.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] more eglibc 2.16 fixes
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
X-List-Received-Date: Thu, 19 Jul 2012 16:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 11:39 PM, Khem Raj wrote:
> This patchset is a followup to eglibc update
> It cleans up the use of 'proto' in SRC_URI of
> svn recipes
>
> Fixes eglibc 2.16 build on ppc e500v1 and e500v2 cores
>
> The following changes since commit 2bd0aaf98c5d586638d82f5f22c1c24122a889a3:
>
>    toolchain-scripts: Sync the SDK/ADT values to the build system (2012-07-17 18:02:10 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.16
>
> Khem Raj (2):
>    eglibc: Fix build for e500 cores
Merged into OE-Core

>    recipes: Change 'proto' to 'protocol' in SRC_URI
>
These were already fixed.

Thanks
	Sau!


>   .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
>   .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
>   .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
>   meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
>   5 files changed, 36 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
>



