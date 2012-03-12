Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Cff-0003xS-Bs
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:20:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117023286"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:11:50 -0700
Message-ID: <4F5E6696.7050502@linux.intel.com>
Date: Mon, 12 Mar 2012 14:11:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330956344.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1330956344.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] Allow rotate log across filesystems
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
X-List-Received-Date: Mon, 12 Mar 2012 21:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2012 06:17 AM, Robert Yang wrote:
> This patch is based on oe-core, and the pull request is on poky-contrib
>
> The testing summary:
> 1) Add the olddir to logrotate.conf, and the olddir should have a
>     different mount point of the current log directory.
>
> 2) Run "logrotate -f /path/to/logrotate.conf" to force rotate,
>     the old log should be rotated to the olddir which is on another
>     mount point.
>
> //Robert
>
> The following changes since commit a439d32dd843d10a9f65cc858b02422fac7deb50:
>
>    soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE (2012-03-04 05:41:11 -0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/logrotate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/logrotate
>
> Robert Yang (1):
>    logrotate 3.7.9: Allow rotate log across filesystems
>
>   .../allow-across-different-filesystems.patch       |  154 ++++++++++++++++++++
>   meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    5 +-
>   2 files changed, 157 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
>
Merged into OE-Core

Thanks
	Sau!


