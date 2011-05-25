Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPHp9-00088M-Fv
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:24:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 May 2011 10:21:43 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2011 10:21:43 -0700
Message-ID: <4DDD3AA7.8010204@linux.intel.com>
Date: Wed, 25 May 2011 10:21:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306264437.git.raj.khem@gmail.com>
In-Reply-To: <cover.1306264437.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Fixes for eglibc parallel build and elfutils on uclibc
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
X-List-Received-Date: Wed, 25 May 2011 17:24:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2011 12:18 PM, Khem Raj wrote:
> This patchset addresses the issue Saul ran into with do_install on eglibc
> second patch is to get elfutils compile partially for uclibc, the reason is that
> it also provides libelf which is needed by other packages such as gcc 4.5
> to build. So either we add a new recipe for just providing libelf and add
> magic to chose which one to use or we make elfutils to not build everything
> but only elfutils when doing it for uclibc. I chose the second aproach
>
>
> The following changes since commit d33ada10fdcc830f11dc47bd55f529157d1d280b:
>
>    elfutils_0.148.bb: Fix compilation on uclibc (2011-05-24 12:06:30 -0700)
>
> are available in the git repository at:
>    git@git.openembedded.org:openembedded-core-contrib.git kraj/misc-fixes
>    http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/misc-fixes
>
> Khem Raj (2):
>    elfutils_0.148.bb: Fix compilation on uclibc
>    eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
>
>   meta/recipes-core/eglibc/eglibc.inc                |    6 ++
>   .../elfutils/elfutils-0.148/uclibc-support.patch   |   91 ++++++++++++++++++++
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   15 +++-
>   3 files changed, 109 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch
>
Fixed version merged into OE-Core

Thanks
	Sau!



