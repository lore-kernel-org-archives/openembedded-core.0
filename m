Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBZL-0003dG-2k
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:28:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 10:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173274163"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 10:16:58 -0700
Message-ID: <50059E0A.20400@linux.intel.com>
Date: Tue, 17 Jul 2012 10:16:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342192478.git.ross.burton@intel.com>
In-Reply-To: <cover.1342192478.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/3] Web fixes
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
X-List-Received-Date: Tue, 17 Jul 2012 17:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 08:15 AM, Ross Burton wrote:
> Some small fixes for Web.
>
> The following changes since commit eb0cb7e8234f5d2e5623406e9660be91cf52f65e:
>
>    perf: add perl, python to DEPENDS (2012-07-12 12:52:09 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/web
>
> for you to fetch changes up to d48782c50edd6fc4018b8144050922bd439abea1:
>
>    web-webkit: don't link using g++, it's not needed anymore (2012-07-13 16:12:55 +0100)
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




