Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvdDH-0000Oj-Fc
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:43:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 15:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41113745"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2011 15:38:26 -0700
Message-ID: <4E52DA62.2010205@linux.intel.com>
Date: Mon, 22 Aug 2011 15:38:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313484812.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313484812.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] multilib related fixed for opkg backend
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
X-List-Received-Date: Mon, 22 Aug 2011 22:43:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2011 01:56 AM, Lianhao Lu wrote:
> This patch fixed the bug #1345 to allow the opkg backend installing both
> normal pacakges and multilib packages into the same rootfs.
>
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
>    Zhai Edwin (1):
>          distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade.
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1345
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1345
>
> Lianhao Lu (1):
>    package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS
>
>   meta/classes/package.bbclass     |   13 ++-----------
>   meta/classes/package_ipk.bbclass |   30 ++++++++----------------------
>   meta/classes/utils.bbclass       |   24 +++++++++++++++++++-----
>   3 files changed, 29 insertions(+), 38 deletions(-)
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


