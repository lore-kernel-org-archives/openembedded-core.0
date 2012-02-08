Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuysZ-0005Gq-Om
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:11:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2012 20:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105150247"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 20:03:31 -0800
Message-ID: <4F31F413.3050004@linux.intel.com>
Date: Tue, 07 Feb 2012 20:03:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328541241.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328541241.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/2 v2] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Wed, 08 Feb 2012 04:11:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 07:16 AM, Otavio Salvador wrote:
> v2 changes:
>
>    dhcp: fix error in case rmdir tries to remove a non-empty directory
>
> The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:
>
>    libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (2):
>    dhcp: move dhcp leases files handling to postinst/postrm
>    udev: stop providing cache support by default
>
>   meta/recipes-connectivity/dhcp/dhcp.inc      |   25 ++++++++++++++++++++++++-
>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
>   meta/recipes-core/udev/udev.inc              |    2 +-
>   meta/recipes-core/udev/udev_164.bb           |    2 +-
>   4 files changed, 27 insertions(+), 4 deletions(-)
>
Merged these 2 patches into OE-core, I know you have more pending.

Thanks
	Sau!


