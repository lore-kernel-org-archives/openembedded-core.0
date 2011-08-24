Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4RG-0004ZJ-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 05:47:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2011 20:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41577482"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 20:42:51 -0700
Message-ID: <4E54733B.2000809@linux.intel.com>
Date: Tue, 23 Aug 2011 20:42:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313921149.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1313921149.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] bitbake meta-toolchain with gcc 4.5.1 failed
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
X-List-Received-Date: Wed, 24 Aug 2011 03:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2011 03:08 AM, Robert Yang wrote:
> * Steps to reproduce the error:
> 1) Add the following lines to conf/local.conf:
>
> SDKGCCVERSION="4.5.1"
> GCCVERSION="4.5.1"
>
> 2) bitbake meta-toolchain
>
> The we will notice the error that sed can't find the directory:
>
> ${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}-${PR}
>
> we had changed the name of S from gcc-${PV} to gcc-${PV}-${PR}, but didn't
> update meta/recipes-devtools/gcc/gcc-common.inc, so fix S in gcc-common.inc
> would make it work.
>
> The following changes since commit edd8e1e8b974eb3f0f9f66c2207aadf43612350b:
>
>    documentation/adt-manual/adt-command.xml: general edits. (2011-08-20 17:52:00 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/gcc_451
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gcc_451
>
> Robert Yang (1):
>    bitbake meta-toolchain with gcc 4.5.1 failed
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

Merged into OE-Core

Thanks
	Sau!


