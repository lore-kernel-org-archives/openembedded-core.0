Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxhn-0004gb-U4
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:49:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 May 2012 09:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148462897"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2012 09:38:59 -0700
Message-ID: <4FBFB5A2.6020002@linux.intel.com>
Date: Fri, 25 May 2012 09:38:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337850757.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1337850757.git.jiajun.xu@intel.com>
Subject: Re: [PATCH 0/2] ltp: Upgrade LTP to 20120401
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
X-List-Received-Date: Fri, 25 May 2012 16:49:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 02:15 AM, Jiajun Xu wrote:
> Upgrade LTP to 20120401 and remove the patch for getcontext and profil,
> since LTP has fixed the build issue.
>
>
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
>
>    tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib
>
> Jiajun Xu (2):
>    ltp: Upgrade LTP to version 20120401
>    distro_tracking_fields: update information for ltp
>
>   .../conf/distro/include/distro_tracking_fields.inc |    8 +-
>   .../ltp/ltp/uclibc-getcontext.patch                |   78 --------------------
>   .../ltp/{ltp_20120104.bb =>  ltp_20120401.bb}       |    7 +-
>   3 files changed, 7 insertions(+), 86 deletions(-)
>   delete mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
>   rename meta/recipes-extended/ltp/{ltp_20120104.bb =>  ltp_20120401.bb} (95%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!


