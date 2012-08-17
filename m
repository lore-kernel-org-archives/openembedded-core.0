Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2TqQ-0000Hg-Kl
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:12:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 14:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182368835"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 14:00:26 -0700
Message-ID: <502EB0E8.8060902@linux.intel.com>
Date: Fri, 17 Aug 2012 14:00:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344752146.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344752146.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] runqemu ramfs support
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
X-List-Received-Date: Fri, 17 Aug 2012 21:12:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 01:20 PM, Scott Garman wrote:
> Added support for booting ramfs-based images (e.g, poky-tiny) which
> do not have block device support.
>
> This fixes [YOCTO #2612].
>
> Scott
>
> The following changes since commit 5290e82ecef08b5e573d7442627276d7b42c6b93:
>
>    foomatic: fix perl path for target (2012-08-08 10:05:52 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib sgarman/runqemu-ramfs-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-ramfs-oe
>
> Scott Garman (1):
>    runqemu: support booting ramfs-based images
>
>   scripts/runqemu          |    6 ++++++
>   scripts/runqemu-internal |    5 +++++
>   2 files changed, 11 insertions(+)
>
Merged into OE-Core

Thanks
	Sau!



