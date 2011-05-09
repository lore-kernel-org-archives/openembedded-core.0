Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJSya-0008C9-IF
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:06:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 09:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="433034912"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 09:03:42 -0700
Message-ID: <4DC8105E.8020504@linux.intel.com>
Date: Mon, 09 May 2011 09:03:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304607797.git.tom_rini@mentor.com>
In-Reply-To: <cover.1304607797.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/4] Misc sync up changes
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
X-List-Received-Date: Mon, 09 May 2011 16:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2011 08:05 AM, Tom Rini wrote:
> The following series brings in a few fixups I pushed to openembedded today.
> In short, in gcc/binutils we were referencing TARGET_SYS in places where we
> had told configure to mangle things based on TARGET_PREFIX and in the
> cases where they don't match, it wasn't working.  I had also just run into
> some missing DEPENDS cases so they are included in this branch as well.
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: trini/misc-sync-up
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-sync-up
>
> Thanks,
>      Tom Rini<tom_rini@mentor.com>
> ---
>
>
> Tom Rini (4):
>    gcc-package-target: Switch to TARGET_PREFIX in symlinks
>    binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
>    sysstat.inc: Switch to inherit gettext
>    bash.inc: Add bison-native to DEPENDS
>
>   meta/recipes-devtools/binutils/binutils.inc      |   10 +++++-----
>   meta/recipes-devtools/gcc/gcc-package-target.inc |   10 +++++-----
>   meta/recipes-extended/bash/bash.inc              |    2 +-
>   meta/recipes-extended/sysstat/sysstat.inc        |    4 +---
>   meta/recipes-extended/sysstat/sysstat_9.1.5.bb   |    2 +-
>   5 files changed, 13 insertions(+), 15 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Pulled into oe-core

Thanks
	Sau!



