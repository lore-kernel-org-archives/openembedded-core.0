Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUM1Y-0007ZF-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 18:54:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jun 2011 09:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,339,1304319600"; d="scan'208";a="15644335"
Received: from unknown (HELO [10.255.13.55]) ([10.255.13.55])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2011 09:51:13 -0700
Message-ID: <4DEFA881.50400@linux.intel.com>
Date: Wed, 08 Jun 2011 09:51:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307331820.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1307331820.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/4] Recipe upgrades: openssh, grep, tar
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
X-List-Received-Date: Wed, 08 Jun 2011 16:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2011 09:49 PM, Scott Garman wrote:
> Good day,
>
> Here are some straightforward recipe upgrades for openssh, grep,
> and tar.
>
> Build tested on all five qemu MACHINEs we support. Runtime tested on
> qemuarm.
>
> The following changes since commit 6b5d323b6c8960a0999dbafa0422fe127fd0fa97:
>
>    event: don't catch systemexit from handler execution (2011-06-02 23:58:05 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades
>
> Scott Garman (4):
>    openssh: upgrade to v5.8p2
>    grep: upgrade to v2.8
>    tar: upgrade to v1.26
>    distro-tracking: update openssh, tar, and grep
>
>   .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
>   .../openssh/{openssh-5.6p1 =>  openssh-5.8p2}/init  |    0
>   .../{openssh-5.6p1 =>  openssh-5.8p2}/nostrip.patch |    0
>   .../{openssh-5.6p1 =>  openssh-5.8p2}/ssh_config    |    0
>   .../{openssh-5.6p1 =>  openssh-5.8p2}/sshd_config   |    0
>   .../openssh/{openssh_5.6p1.bb =>  openssh_5.8p2.bb} |    9 ++++---
>   .../grep/{grep_2.7.bb =>  grep_2.8.bb}              |    7 +++--
>   ...tive_1.25.bb =>  tar-replacement-native_1.26.bb} |    0
>   meta/recipes-extended/tar/tar.inc                  |    1 +
>   meta/recipes-extended/tar/tar_1.25.bb              |    9 -------
>   meta/recipes-extended/tar/tar_1.26.bb              |    9 +++++++
>   11 files changed, 32 insertions(+), 29 deletions(-)
>   rename meta/recipes-connectivity/openssh/{openssh-5.6p1 =>  openssh-5.8p2}/init (100%)
>   rename meta/recipes-connectivity/openssh/{openssh-5.6p1 =>  openssh-5.8p2}/nostrip.patch (100%)
>   rename meta/recipes-connectivity/openssh/{openssh-5.6p1 =>  openssh-5.8p2}/ssh_config (100%)
>   rename meta/recipes-connectivity/openssh/{openssh-5.6p1 =>  openssh-5.8p2}/sshd_config (100%)
>   rename meta/recipes-connectivity/openssh/{openssh_5.6p1.bb =>  openssh_5.8p2.bb} (93%)
>   rename meta/recipes-extended/grep/{grep_2.7.bb =>  grep_2.8.bb} (84%)
>   rename meta/recipes-extended/tar/{tar-replacement-native_1.25.bb =>  tar-replacement-native_1.26.bb} (100%)
>   delete mode 100644 meta/recipes-extended/tar/tar_1.25.bb
>   create mode 100644 meta/recipes-extended/tar/tar_1.26.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Pulled into oe-core

Thanks
	Sau!


