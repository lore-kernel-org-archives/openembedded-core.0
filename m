Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rnwua-0004TJ-S2
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:40:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 10:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100502060"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 10:32:56 -0800
Message-ID: <4F1861D8.2020606@linux.intel.com>
Date: Thu, 19 Jan 2012 10:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326826646.git.josh@linux.intel.com>
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/5] Busybox syslog tweaks
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
X-List-Received-Date: Thu, 19 Jan 2012 18:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 10:59 AM, Joshua Lock wrote:
> The RFC version of this series didn't receive any C's..
>
> This set of changes makes some minor changes to the configuration of busybox's
> syslog.
>
> The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:
>
>    package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/syslog
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/syslog
>
> Joshua Lock (5):
>    busybox: drop MARKINT option from init script and syslog-startup.conf
>    busybox: remove incorrect comments from syslog-startup.conf
>    busybox: enable log level configuration in syslog-startup.conf and
>      script
>    busybox: change syslog default to log to a file
>    busybox: enable dropping of duplicates in syslog, off by default
>
>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>   meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
>   meta/recipes-core/busybox/files/syslog             |    9 ++++++---
>   .../recipes-core/busybox/files/syslog-startup.conf |    9 +++++----
>   4 files changed, 13 insertions(+), 9 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


