Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSupW-0001Tb-Vl
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:12:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2011 10:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="78888231"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 10:05:55 -0800
Message-ID: <4ECBE482.3080807@linux.intel.com>
Date: Tue, 22 Nov 2011 10:05:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321509543.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1321509543.git.jiajun.xu@intel.com>
Subject: Re: [PATCH 0/2] sanitytest: Fix 2 bugs on non-rpm or non-procps installed image
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
X-List-Received-Date: Tue, 22 Nov 2011 18:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2011 10:05 PM, Jiajun Xu wrote:
> Current sanitytest will report failure on non-rpm or non-procps installed image.
> Add check for busybox/procps and use different option for different ps command.
> Remove rpm/zypper tests if image is not based on rpm.
>
> The following changes since commit da8425174529f10e16cde21fbea7f804284c38ae:
>
>    alsa-lib: add nativesdk BBCLASSEXTEND (2011-11-15 12:22:58 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib
>
> Jiajun Xu (2):
>    sanitytest: use different option for command ps from busybox and
>      procps
>    sanitytest: remove rpm/zypper tests if PACKAGE_CLASSES does not set
>      package_rpm
>
>   meta/classes/imagetest-qemu.bbclass           |   25 +++++++++++++++++++++-
>   scripts/qemuimage-tests/tools/connman_test.sh |   28 +++++++++++++++++++++---
>   2 files changed, 48 insertions(+), 5 deletions(-)
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


