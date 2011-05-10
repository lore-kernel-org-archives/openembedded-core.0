Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJrA2-0007VJ-8C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:55:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 10:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; 
   d="scan'208";a="430366"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 10:53:07 -0700
Message-ID: <4DC97B82.80805@linux.intel.com>
Date: Tue, 10 May 2011 10:53:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304965560.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1304965560.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com, poky@yoctoproject.org,
	saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 10 May 2011 17:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 11:34 AM, Bruce Ashfield wrote:
> Saul/Richard,
>
> The first two patches are a split and resend of the machine
> movement patch:
>
> [
>     linux-yocto: move non-core machines to meta-yocto
>
>     The machine configuration of the non-core (non-qemu) machines
>     has moved to meta-yocto. Moving the branch mappings, compatibility
>     and SRCREVs of these machines to meta-yocto should also be
>     done.
>
>    Anyone using meta-yocto to build these machines will see no impact
>    from this change.
> ]
>
> Patch #3 is a sanity check that shows a problem that Tom managed
> to hit, and cause us some significant debug time. If for some
> reason (we still don't have a root cause) the kernel repo is cloned
> without tags and/or meta data, we can now detect it and throw an
> informative error message rather than generating meta data and
> building "something".
>
> cc: Darren Hart<dvhart@linux.intel.com>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: zedd/kernel
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Thanks,
>      Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>
>
> Bruce Ashfield (3):
>    linux-yocto: remove non-core (qemu) machine compatibility
>    linux-yocto: move non-core machines to meta-yocto
>    linux-yocto: error if meta data not present
>
>   meta-yocto/conf/layer.conf                         |    3 ++-
>   .../linux/linux-yocto-stable_git.bbappend          |   12 ++++++++++++
>   .../recipes-kernel/linux/linux-yocto_git.bbappend  |   12 ++++++++++++
>   meta/classes/kernel-yocto.bbclass                  |    5 ++++-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---------
>   meta/recipes-kernel/linux/linux-yocto_git.bb       |   15 ++++-----------
>   7 files changed, 36 insertions(+), 23 deletions(-)
>   create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>   create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into oe-core and poky master

Thanks
	Sau!


