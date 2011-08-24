Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwIOV-00056F-RR
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:41:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2011 11:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,276,1312182000"; d="scan'208";a="43972964"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2011 11:36:55 -0700
Message-ID: <4E5544C7.8020707@linux.intel.com>
Date: Wed, 24 Aug 2011 11:36:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314210721-29941-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1314210721-29941-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] tcl: fix networking breakage
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
X-List-Received-Date: Wed, 24 Aug 2011 18:41:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2011 11:32 AM, Koen Kooi wrote:
> Without providing these site entries tcl networking doesn't work on the target.
>
> Original OE commit:
>
> commit 0c340037644f87054462f62b50cd397c162615b7
> Author: Koen Kooi<koen@openembedded.org>
> Date:   Wed May 26 13:04:18 2010 +0200
>
>      tcl: add 2 entries to arm-linux site file (possibly only glibc specific, need to check)
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> index 2eabb4d..1b4ae83 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
>       file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
>       "
>
> -PR = "r1"
> +PR = "r2"
>
>   BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>                   file://tcl-add-soname.patch"
> @@ -30,7 +30,9 @@ inherit autotools
>
>   DEPENDS_virtclass-native = ""
>
> -EXTRA_OECONF = "--enable-threads"
> +EXTRA_OECONF = "--enable-threads \
> +                tcl_cv_api_getaddrinfo=yes \
> +               "
>
Koen,

This was asked last time you submitted this, what's the reasoning for 
adding it here vs in a site files?

Sau!


>   do_configure() {
>   	gnu-configize


