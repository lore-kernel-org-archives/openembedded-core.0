Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrtJB-0000TG-T0
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:10:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2012 08:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180596161"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 08:59:10 -0700
Message-ID: <50082ECD.5070708@linux.intel.com>
Date: Thu, 19 Jul 2012 08:59:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342542040.git.ross.burton@intel.com>
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/3] Fixes for Web
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
X-List-Received-Date: Thu, 19 Jul 2012 16:10:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 09:22 AM, Ross Burton wrote:
> Some minor fixes for Web.
>
> The following changes since commit 219a855f99bc45fd273f62df9507be7223eff1b4:
>
>    useradd.bbclass: Fix for multilib builds (2012-07-17 10:56:26 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/web
>
> for you to fetch changes up to 245f335b9d6103daba1c90403a94a50eec80e64d:
>
>    web-webkit: don't link using g++, it's not needed anymore (2012-07-17 12:57:04 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (3):
>        web-webkit: remove unused dependencies (taken from the gecko-based recipe)
>        web-webkit: push make whitespace fix upstream
>        web-webkit: don't link using g++, it's not needed anymore
>
>   .../web/web-webkit/link-with-g++.patch             |   35 --------------------
>   meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
>   meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
>   3 files changed, 5 insertions(+), 63 deletions(-)
>   delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
>   delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch
>
> Ross Burton (3):
>    web-webkit: remove unused dependencies (taken from the gecko-based
>      recipe)
>    web-webkit: push make whitespace fix upstream
>    web-webkit: don't link using g++, it's not needed anymore
>
>   .../web/web-webkit/link-with-g++.patch             |   35 --------------------
>   meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
>   meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
>   3 files changed, 5 insertions(+), 63 deletions(-)
>   delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
>   delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch
>

Merged into OE-Core

Thanks
	Sau!


