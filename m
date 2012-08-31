Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7Tto-0004f6-7t
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:16:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2012 09:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,347,1344236400"; d="scan'208";a="216360425"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2012 09:04:15 -0700
Message-ID: <5040E07F.2050604@linux.intel.com>
Date: Fri, 31 Aug 2012 09:04:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1346236551.git.kai.kang@windriver.com>
In-Reply-To: <cover.1346236551.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Patches for dependency issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 16:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 03:39 AM, Kang Kai wrote:
> The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>
>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/deps
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/deps
>
> Kang Kai (2):
>    Add dependency libidn to 3 packages
RP Commented on this one

>    ltp: add dependency libaio
>
Merged this to OE-Core

Thanks
	Sau!


>   .../ghostscript/ghostscript_9.05.bb                |    4 ++--
>   meta/recipes-extended/ltp/ltp_20120614.bb          |    4 ++--
>   meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 ++--
>   meta/recipes-extended/wget/wget.inc                |    4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
>


