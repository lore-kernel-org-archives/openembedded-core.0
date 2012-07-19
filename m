Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrtWN-0002rP-GI
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:24:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2012 09:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="195104837"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2012 09:12:42 -0700
Message-ID: <500831FA.2090706@linux.intel.com>
Date: Thu, 19 Jul 2012 09:12:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342461305.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1342461305.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] tune-ppc476.inc: support ppc476
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
X-List-Received-Date: Thu, 19 Jul 2012 16:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2012 10:58 AM, Peter Seebach wrote:
> One of the BSPs we support uses a 476-family chip, so we have a
> tuning for it in our custom toolchain layer. Sending a tuning upstream
> too because someone else might want it. Has been lightly tested with
> the oe-core toolchain; it at least allows compiles.
>
> The following changes since commit 20405bdab18b7a2b101f818e72863d289d5945e4:
>    Bruce Ashfield (1):
>          linux-yocto/3.0: perf scripting support
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/ppc476
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/ppc476
>
> Peter Seebach (1):
>    tune-ppc476.inc: Support ppc476
>
>   meta/conf/machine/include/tune-ppc476.inc |   14 ++++++++++++++
>   1 files changed, 14 insertions(+), 0 deletions(-)
>   create mode 100644 meta/conf/machine/include/tune-ppc476.inc
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



