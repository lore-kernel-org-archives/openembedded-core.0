Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsIn-0007tw-Pb
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:02:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2012 13:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146938173"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2012 13:52:17 -0700
Message-ID: <4F9B0701.2070003@linux.intel.com>
Date: Fri, 27 Apr 2012 13:52:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335398393.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335398393.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/2] Misc Bugfixes
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
X-List-Received-Date: Fri, 27 Apr 2012 21:02:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2012 05:00 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/bugfixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes
>
> Nitin A Kamble (2):
>    libproxy: fix compilations with gcc 4.7
>    quilt: fix perl path in target perl scripts
>
>   meta/recipes-devtools/quilt/quilt_0.51.bb          |   16 ++++++++++-
>   .../libproxy/libproxy_fix_for_gcc4.7.patch         |   30 ++++++++++++++++++++
>   meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
>   3 files changed, 47 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
>

Merged into OE-Core

Thanks
	Sau!


