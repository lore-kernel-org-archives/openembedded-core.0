Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE12360034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:16:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Mar 2015 15:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,425,1422950400"; d="scan'208";a="700706269"
Received: from swold-mobl.amr.corp.intel.com ([10.219.16.68])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2015 15:16:51 -0700
Message-ID: <5509F951.5030700@linux.intel.com>
Date: Wed, 18 Mar 2015 16:16:49 -0600
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1426714935-3348-1-git-send-email-alejandro.hernandez@linux.intel.com>
In-Reply-To: <1426714935-3348-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH] python-pexpect: Adds python-pexpect recipe
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
X-List-Received-Date: Wed, 18 Mar 2015 22:16:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2015 03:42 PM, Alejandro Hernandez wrote:
> Creates a recipe for the pexpect module and adds it to buildtools, since it is needed by
> some of the automated runtime test code.
>
This should really be 2 patches on that adds the new recipe and a second 
to add it to build tools.

Also I guess you got the python-pexpect recipe from meta-python, so 
please give credit to that layer.

Sau!


> [YOCTO #7279]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   meta/recipes-core/meta/buildtools-tarball.bb       |  1 +
>   meta/recipes-devtools/python/python-pexpect_3.3.bb | 23 ++++++++++++++++++++++
>   2 files changed, 24 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python-pexpect_3.3.bb
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 302510c..6d4c8c8 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -12,6 +12,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>       nativesdk-python-modules \
>       nativesdk-python-misc \
>       nativesdk-python-git \
> +    nativesdk-python-pexpect \
>       nativesdk-ncurses-terminfo-base \
>       nativesdk-chrpath \
>       nativesdk-tar \
> diff --git a/meta/recipes-devtools/python/python-pexpect_3.3.bb b/meta/recipes-devtools/python/python-pexpect_3.3.bb
> new file mode 100644
> index 0000000..cd80aeb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-pexpect_3.3.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "A Pure Python Expect like Module for Python"
> +HOMEPAGE = "http://pexpect.readthedocs.org/"
> +SECTION = "devel/python"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c25d9a0770ba69a9965acc894e9f3644"
> +
> +SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.gz"
> +SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
> +SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
> +
> +S = "${WORKDIR}/pexpect-${PV}"
> +
> +inherit distutils
> +
> +RDEPENDS_${PN} = "\
> +    python-core \
> +    python-io \
> +    python-terminal \
> +    python-resource \
> +    python-fcntl \
> +"
> +
> +BBCLASSEXTEND = "nativesdk"
>

