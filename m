Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8J5n-0007lv-Ni
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 23:52:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2011 14:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,446,1312182000"; d="scan'208";a="67675799"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2011 14:46:38 -0700
Message-ID: <4E80F2BE.7090202@linux.intel.com>
Date: Mon, 26 Sep 2011 14:46:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316419662.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1316419662.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] fix to bug 1086
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
X-List-Received-Date: Mon, 26 Sep 2011 21:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2011 01:08 AM, Dexuan Cui wrote:
> The following changes since commit 843f9af47ffccb7ffdf3039c560bc3e4c88175a2:
>
>    sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD (2011-09-18 15:58:58 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/bug-1086
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug-1086
>
> Dexuan Cui (1):
>    deb packages support: switch from /var/dpkg to /var/lib/dpkg
>
>   meta/classes/package_deb.bbclass                   |   10 +++++-----
>   meta/classes/populate_sdk_deb.bbclass              |    4 ++--
>   meta/classes/rootfs_deb.bbclass                    |   20 ++++++++++----------
>   meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
>   meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
>   meta/recipes-devtools/apt/files/apt.conf           |    4 ++--
>   .../dpkg/run-postinsts/run-postinsts               |    2 +-
>   .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
>   meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
>   .../update-alternatives-dpkg.inc                   |    6 +++---
>   10 files changed, 27 insertions(+), 27 deletions(-)
>

Merged to OE-Core

Thanks
	Sau!


