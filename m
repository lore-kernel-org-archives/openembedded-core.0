Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcQhG-0004h5-8b
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:30:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2011 16:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="22147220"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2011 16:27:13 -0700
Message-ID: <4E0D0651.9000101@linux.intel.com>
Date: Thu, 30 Jun 2011 16:27:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309300395.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1309300395.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] shadow-native fix for useradd
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
X-List-Received-Date: Thu, 30 Jun 2011 23:30:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 03:36 PM, Scott Garman wrote:
> Pseudo was recently changed so that when system() calls are made
> after a chroot(), the host binaries can no longer be found, breaking
> the system("mkdir -p") approach when useradd creates home directories.
>
> Instead, use mkdir(2) to create home directories with a helper
> function to ensure parent directories get created.
>
> This is a prerequisite fix needed for my useradd.bbclass changes
> (still pending until I address some of Richard's comments from this
> morning).
>
> The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:
>
>    u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/mkdir-p-fix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/mkdir-p-fix
>
> Scott Garman (1):
>    shadow-native: fix creation of home directories
>
>   .../shadow/files/add_root_cmd_options.patch        |  125 +++++++++++++++----
>   1 files changed, 98 insertions(+), 27 deletions(-)
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


