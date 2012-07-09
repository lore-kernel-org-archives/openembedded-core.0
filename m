Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHMa-0005Tz-C1
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:03:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 09:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175118599"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:51:56 -0700
Message-ID: <4FFB0C2C.2080003@linux.intel.com>
Date: Mon, 09 Jul 2012 09:51:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341365770.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1341365770.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] *** SUBJECT HERE *** (huh?)
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
X-List-Received-Date: Mon, 09 Jul 2012 17:03:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 06:37 PM, Peter Seebach wrote:
> Robert Yang identified a crash with chroot in long directories,
> which was a logic bug in the allocate-and-copy logic when
> expanding paths inside a base path. Fixed in upstream pseudo,
> along with a couple of other minor tweaks, since the crash is
> blocking other work we should probably update.
>
> The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:
>    Lianhao Lu (1):
>          task-core-tools-debug: Added openssh-sftp-server.
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/pseudo
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo
>
> Peter Seebach (1):
>    pseudo: Update to 1.3.1 (fixing chroot crash)
>
>   meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 ++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.3.bb   |    8 --------
>   meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
>   3 files changed, 11 insertions(+), 11 deletions(-)
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


