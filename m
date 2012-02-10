Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvszI-000602-N0
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:06:17 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2012 07:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108720635"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 07:58:09 -0800
Message-ID: <4F353E91.4010904@linux.intel.com>
Date: Fri, 10 Feb 2012 07:58:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328845545.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1328845545.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Ensure gcc family recipes having same sstate hash
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
X-List-Received-Date: Fri, 10 Feb 2012 16:06:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 07:47 PM, Lianhao Lu wrote:
> Ensure the gcc family recipes having the same sstate hash for do_patch task,
> because they share the same source directory.
>
> The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
>    Christopher Larson (1):
>          tcmode-default: add preference for gdb/gdbserver
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/gccfix
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/gccfix
>
> Lianhao Lu (1):
>    gcc: Ensure same sstate hashes for shared soruce directory
>
>   meta/recipes-devtools/gcc/gcc-common.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!


