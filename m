Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPHjq-0007xz-C3
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:19:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 10:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1562404"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 10:16:14 -0700
Message-ID: <4DDD395D.9030107@linux.intel.com>
Date: Wed, 25 May 2011 10:16:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306152724.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/3] Pull request with misc fixes from O.S. Systems tree
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
X-List-Received-Date: Wed, 25 May 2011 17:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2011 05:13 AM, Otavio Salvador wrote:
> The following changes since commit 54ecf8e3992b8a01c2e5bd16720e1819b71b68bd:
>
>    packagedata: don't choke on empty PACKAGES (2011-05-20 17:41:34 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core.git master
>    https://github.com/OSSystems/oe-core/tree/master
>
> Otavio Salvador (3):
>    send-pull-request: drop sendemail checks
>    busybox: enable mdev by default
>    syslinux: rdepends on mtools
>
>   meta/recipes-core/busybox/busybox-1.18.4/defconfig |    2 +-
>   meta/recipes-core/busybox/busybox.inc              |    1 -
>   meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
>   meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    4 +++-
>   scripts/send-pull-request                          |   16 ----------------
>   5 files changed, 5 insertions(+), 20 deletions(-)
>
Pulled the changes to send-pull-request and syslinux, did not take the
mdev by default change.

Thanks
	Sau!



