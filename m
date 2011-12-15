Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbH5S-0001Cv-Gj
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:35:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2011 11:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96647422"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 11:28:16 -0800
Message-ID: <4EEA4A4F.4090102@linux.intel.com>
Date: Thu, 15 Dec 2011 11:28:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323913192.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323913192.git.nitin.a.kamble@intel.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/1] mkdosfs populated image creation fix version:2
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
X-List-Received-Date: Thu, 15 Dec 2011 19:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2011 05:47 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This has enhanced the commit for fixing mkdosfs. We noticed some
> issues with the generated image with the earlier sent-out commit.
> This version 2 commit has improved the the mkdosfs further. Now
> the outstanding issues in the image are fixable by dosfsck.
>    More details are in the patch documentation.
>
> Thanks,
> Nitin
>
> The following changes since commit 9d136b2db8f906c562cbdb23a9b238f0e237074b:
>
>    gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:25 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/bugfix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfix
>
> Nitin A Kamble (1):
>    dosfstools: fix populated image creation with dirs
>
>   .../dosfstools/fix_populated_dosfs_creation.patch  |  489 ++++++++++++++++++++
>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    5 +-
>   2 files changed, 492 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
>
Merged into OE-Core

Thanks
	Sau!


