Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UE8-0004eR-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:05:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2012 08:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120607548"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2012 08:56:27 -0700
Message-ID: <4F5F6E2B.1030504@linux.intel.com>
Date: Tue, 13 Mar 2012 08:56:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331045739-5723-1-git-send-email-mac@mcrowe.com>
In-Reply-To: <1331045739-5723-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH] valgrind: Support compilation without X11
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
X-List-Received-Date: Tue, 13 Mar 2012 16:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 06:55 AM, Mike Crowe wrote:
> Only depend on X libraries if the distribution has X support.
>
> Signed-off-by: Mike Crowe<mac@mcrowe.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index 9c53262..d7c7b24 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>                       file://include/pub_tool_basics.h;beginline=1;endline=29;md5=0ef036a7ddce4cdc738d65d63b3e8153 \
>                       file://include/valgrind.h;beginline=1;endline=56;md5=aee56014c1dd64260a59fd4df38752f6 \
>                       file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
> -DEPENDS = "virtual/libx11"
> -PR = "r3"
> +
> +X11DEPENDS = "virtual/libx11"
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> +PR = "r4"
>
>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>   	   file://fix_issue_caused_by_ccache.patch \

Merged into OE-Core

Thanks
	Sau!


