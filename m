Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rzv9c-0002rC-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:13:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Feb 2012 11:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119773791"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 11:05:05 -0800
Message-ID: <4F43EAE1.3060302@linux.intel.com>
Date: Tue, 21 Feb 2012 11:05:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329188674.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1329188674.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] gcc: Exclude DATE/SRCDATE variable from do_patch dependency
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
X-List-Received-Date: Tue, 21 Feb 2012 19:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 07:09 PM, Lianhao Lu wrote:
> This patch excludes the variable DATE/SRCDATE from calculation of do_patch task
> hash value.
>
> The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:
>    Lianhao Lu (1):
>          guile: fix cross configure failure
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/gccfix
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/gccfix
>
> Lianhao Lu (1):
>    gcc: Excluding the DATE/SRCDATE from do_patch dependency.
>
>   meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!


