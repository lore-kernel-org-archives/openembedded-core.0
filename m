Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAm3e-00054R-6i
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:44:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2012 10:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80502716"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2012 10:35:13 -0700
Message-ID: <4F6B62D1.1020609@linux.intel.com>
Date: Thu, 22 Mar 2012 10:35:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332384365-32497-1-git-send-email-denis@denix.org>
In-Reply-To: <1332384365-32497-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] rt-tests: replace dependency on eglibc with virtual/libc
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
X-List-Received-Date: Thu, 22 Mar 2012 17:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2012 07:46 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> That is to support alternative providers of libc, such as glibc, uclibc
> or even an external binary toolchain.
> No PR bump is necessary here.
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>
> ---
>   meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index 6425027..1a91e86 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Real-Time preemption testcases"
>   HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
>   SECTION = "tests"
> -DEPENDS = "linux-libc-headers eglibc"
> +DEPENDS = "linux-libc-headers virtual/libc"
>   LICENSE = "GPLv2&  GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                       file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \

Merged this pair into OE-Core

Thanks
	Sau!


