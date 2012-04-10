Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHd7e-0006US-9b
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:36:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 08:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127352254"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:27:27 -0700
Message-ID: <4F84515F.2070703@linux.intel.com>
Date: Tue, 10 Apr 2012 08:27:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333699326.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1333699326.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] Fix gl failure when 64b target on 32b host, Edwin, Apr6, 2012
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
X-List-Received-Date: Tue, 10 Apr 2012 15:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2012 01:04 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
> This patch fix gl failure when 64b target on 32b host. Pls. help to review.
> Thanks,
> Edwin
>
> The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/fix2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
>
> Zhai Edwin (1):
>    qemu: Fix gl failure from 64b target on 32b host
>
>   .../qemu/qemu-0.15.1/opengl-args-copy-fix.patch    |   66 ++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    1 +
>   2 files changed, 67 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch
>


Merged into OE-Core

Thanks
	Sau!


