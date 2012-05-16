Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUcAZ-0000Xx-3q
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 13:13:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 04:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141226257"
Received: from unknown (HELO [10.237.104.52]) ([10.237.104.52])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 04:02:58 -0700
Message-ID: <4FB38961.2000702@linux.intel.com>
Date: Wed, 16 May 2012 14:02:57 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
In-Reply-To: <a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Wed, 16 May 2012 11:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2012 01:10 PM, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Ncurses failure non-gplv3 build by race issue. So disable parallel \
> make when building this package.
>
This is not the best approach as you disable PARALLEL_MAKE for both 
non-gplv3 and gplv3 versions.  Further, we want to get rid of 
PARALLLEL_MAKE setting as much as possible, so this patch is not helping 
that.

Did you try running on a large many core machine?  It might help if you 
have some other builds going also to stress the machine.

Sau!

> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index ae99e2c..b115e46 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -29,6 +29,8 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>   # natives don't generally look in base_libdir
>   base_libdir_virtclass-native = "${libdir}"
>
> +PARALLEL_MAKE = ""
> +
>   # Helper function for do_configure to allow multiple configurations
>   # $1 the directory to run configure in
>   # $@ the arguments to pass to configure


