Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 493F678245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 14:20:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 07:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="880493182"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.135])
	([10.219.128.135])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2017 07:20:04 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
References: <1498585826-15752-1-git-send-email-jose.a.lamego@linux.intel.com>
Message-ID: <def4db6d-c7d7-1765-4c5f-a1d4634bcaa9@linux.intel.com>
Date: Wed, 19 Jul 2017 09:20:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498585826-15752-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH] python*-git: Upgrade to version 2.1.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 14:20:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping. This may get in before the freeze.


On 06/27/2017 12:50 PM, Jose Lamego wrote:
> Both python-git and python3-git need to be upgraded to latest
> upstream version.
>
> Two RDEPENDS are added: "git" and "python-unittest" to python-git recipe
> and "git" to python3-git recipe.
>
> These changes were tested using qemux86 with core-image-minimal.
>
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-git.inc                           | 4 ++--
>  .../python/{python-git_2.1.3.bb => python-git_2.1.5.bb}               | 2 +-
>  .../python/{python3-git_2.1.3.bb => python3-git_2.1.5.bb}             | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/python/{python-git_2.1.3.bb => python-git_2.1.5.bb} (85%)
>  rename meta/recipes-devtools/python/{python3-git_2.1.3.bb => python3-git_2.1.5.bb} (81%)
>
> diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
> index 825e795d9..777608c 100644
> --- a/meta/recipes-devtools/python/python-git.inc
> +++ b/meta/recipes-devtools/python/python-git.inc
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
>  
>  SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
>  
> -SRC_URI[md5sum] = "6cd18008c03a767740f3bf6d89ef79bc"
> -SRC_URI[sha256sum] = "3826185b11e1fc372e7d31251e9b65e11ccb7c27f82c771d619048bdb5b66c81"
> +SRC_URI[md5sum] = "df94212b19d270a625b67b4c84ac9a41"
> +SRC_URI[sha256sum] = "5c00cbd256e2b1d039381d4f7d71fcb7ee5cc196ca10c101ff7191bd82ab5d9c"
>  
>  UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
>  UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
> diff --git a/meta/recipes-devtools/python/python-git_2.1.3.bb b/meta/recipes-devtools/python/python-git_2.1.5.bb
> similarity index 85%
> rename from meta/recipes-devtools/python/python-git_2.1.3.bb
> rename to meta/recipes-devtools/python/python-git_2.1.5.bb
> index e49dbea..779e606 100644
> --- a/meta/recipes-devtools/python/python-git_2.1.3.bb
> +++ b/meta/recipes-devtools/python/python-git_2.1.5.bb
> @@ -4,4 +4,4 @@ DEPENDS = "python-gitdb"
>  
>  inherit setuptools
>  
> -RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
> +RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin python-unittest git"
> diff --git a/meta/recipes-devtools/python/python3-git_2.1.3.bb b/meta/recipes-devtools/python/python3-git_2.1.5.bb
> similarity index 81%
> rename from meta/recipes-devtools/python/python3-git_2.1.3.bb
> rename to meta/recipes-devtools/python/python3-git_2.1.5.bb
> index 7a2d452..4ac2a0e 100644
> --- a/meta/recipes-devtools/python/python3-git_2.1.3.bb
> +++ b/meta/recipes-devtools/python/python3-git_2.1.5.bb
> @@ -4,4 +4,4 @@ DEPENDS = "python3-gitdb"
>  
>  inherit setuptools3
>  
> -RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse"
> +RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse git"

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


