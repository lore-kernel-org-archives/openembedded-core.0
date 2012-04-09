Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHMzb-0003Pu-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 00:23:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2012 15:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151637521"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2012 15:14:06 -0700
Message-ID: <4F835F2D.7010304@linux.intel.com>
Date: Mon, 09 Apr 2012 15:14:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333993801.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1333993801.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] hello-mod: Remove hello-mod example external kernel module recipe
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
X-List-Received-Date: Mon, 09 Apr 2012 22:23:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 10:53 AM, Darren Hart wrote:
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core hello-mod
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=hello-mod
>
> Darren Hart (1):
>    hello-mod: Remove hello-mod example external kernel module recipe
>
>   meta/recipes-kernel/hello-mod/files/COPYING    |  340 ------------------------
>   meta/recipes-kernel/hello-mod/files/Makefile   |   14 -
>   meta/recipes-kernel/hello-mod/files/hello.c    |   33 ---
>   meta/recipes-kernel/hello-mod/hello-mod_0.1.bb |   15 -
>   4 files changed, 0 insertions(+), 402 deletions(-)
>   delete mode 100644 meta/recipes-kernel/hello-mod/files/COPYING
>   delete mode 100644 meta/recipes-kernel/hello-mod/files/Makefile
>   delete mode 100644 meta/recipes-kernel/hello-mod/files/hello.c
>   delete mode 100644 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
>

Can you do this as a move (git mv) instead of as a delete and re-create? 
  meta-skeleton is part of OE-Core if I have my git foo correct.

Thanks

Sau!


