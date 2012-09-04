Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8uY3-0003Fd-UW
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 16:56:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 07:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217916391"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2012 07:43:51 -0700
Message-ID: <504613A6.7040701@linux.intel.com>
Date: Tue, 04 Sep 2012 07:43:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1346304324.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346304324.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] uclibc and eglibc update
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
X-List-Received-Date: Tue, 04 Sep 2012 14:56:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 10:27 PM, Khem Raj wrote:
>
> get some bugfixes for eglibc
> Move uclibc git recipes to latest git
> create patch for updating mount.h needed
> for systemd to work
>
> Fix elfutils build on uclibc
>
> The following changes since commit 5bc4c0593997b046300a8f5b3f63c278aeb31d68:
>
>    gail: remove (2012-08-29 14:14:13 -0700)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
>
> Khem Raj (3):
>    uclibc-git: Move to tip of master and sync mount.h
>    eglibc: Bring in the fix for glibc bug #14459, #14195
>    elfutils: Fix build on uclibc
>
>   .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ---------------
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
>   meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>   .../uclibc/uclibc-git/mount.h-update.patch         |   83 ++++++++++++++++++++
>   meta/recipes-core/uclibc/uclibc_git.bb             |    2 -
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +-
>   6 files changed, 91 insertions(+), 73 deletions(-)
>   delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
>
Merged into OE-Core

Thanks
	Sau!



