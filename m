Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwQc-0005CE-HZ
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:10:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Oct 2012 12:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="229390019"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2012 12:57:29 -0700
Message-ID: <50805F29.9070806@linux.intel.com>
Date: Thu, 18 Oct 2012 12:57:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348655454.31293.97.camel@phil-desktop>
In-Reply-To: <1348655454.31293.97.camel@phil-desktop>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] gettext: Remove spurious-looking dependencies on libxml2-native
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
X-List-Received-Date: Thu, 18 Oct 2012 20:10:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 03:30 AM, Phil Blundell wrote:
> These were added in aae5021101224344a2b1a3af5becf74291fbbfe5, ostensibly to resolve
> some sort of "host contamination" issue.  However, that commit contains no information
> about what contamination was being observed or how the dependencies help.
>
> gettext-native is being configured --with-included-libxml so it shouldn't be using
> libxml2 from either the host or the sysroot, in which case the dependency would seem
> to be useless.  Using the included copy of libxml2 is in any case preferable to adding
> a dependency on libxml2-native because the latter brings quite a large stack of other
> dependencies with it.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index a159405..96859aa 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,9 +5,9 @@ SECTION = "libs"
>   LICENSE = "GPLv3+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -PR = "r17"
> -DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
> -DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
> +PR = "r18"
> +DEPENDS = "gettext-native virtual/libiconv ncurses expat"
> +DEPENDS_virtclass-native = "gettext-minimal-native"
>   PROVIDES = "virtual/libintl virtual/gettext"
>   PROVIDES_virtclass-native = "virtual/gettext-native"
>   RCONFLICTS_${PN} = "proxy-libintl"
>
Merged into OE-Core

Thanks
	Sau!



