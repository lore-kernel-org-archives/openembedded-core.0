Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6972C6AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 20:24:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 13:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="1232356265"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2017 13:24:10 -0700
To: openembedded-core@lists.openembedded.org
References: <1507756660-30327-1-git-send-email-jose.a.lamego@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <144d74f1-2cc6-0e5c-7f2d-2aa3bf9fad34@linux.intel.com>
Date: Wed, 18 Oct 2017 15:24:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1507756660-30327-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH] python-scons*: upgrade to 3.0.0
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
X-List-Received-Date: Wed, 18 Oct 2017 20:24:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please disregard this update.

Scons 3.0.0 introduced a regression where SConscripts containing py2
print statements would cause syntax errors even when executing scons
with python 2.7.

This issue is already being fixed in
upstream:https://github.com/SConsProject/scons/commit/2e0de3c55f22b3eaa7767b69740b898f3d2f46bf

and other projects are aware also, serf for example:

http://svn.apache.org/viewvc?view=revision&revision=1811083


I will submit a new update commit when a fixed SCons is available.

[Patchwork-Status: Rejected]


On 10/11/2017 04:17 PM, Jose Lamego wrote:
> Both python-scons and python-scons-native need to be upgraded to latest
> upstream version.
>
> LIC_FILES_CHKSUM changed due to updated year in date, but rest of file
> remain the same.
> Following dependencies were added to enable appropriate package usage:
> python-shell, python-pprint and python-importlib.
>
> These changes were tested in qemux86 with core-image-minimal.
>
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  ...python-scons-native_2.5.1.bb => python-scons-native_3.0.0.bb} | 0
>  .../python/{python-scons_2.5.1.bb => python-scons_3.0.0.bb}      | 9 ++++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python-scons-native_2.5.1.bb => python-scons-native_3.0.0.bb} (100%)
>  rename meta/recipes-devtools/python/{python-scons_2.5.1.bb => python-scons_3.0.0.bb} (61%)
>
> diff --git a/meta/recipes-devtools/python/python-scons-native_2.5.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-scons-native_2.5.1.bb
> rename to meta/recipes-devtools/python/python-scons-native_3.0.0.bb
> diff --git a/meta/recipes-devtools/python/python-scons_2.5.1.bb b/meta/recipes-devtools/python/python-scons_3.0.0.bb
> similarity index 61%
> rename from meta/recipes-devtools/python/python-scons_2.5.1.bb
> rename to meta/recipes-devtools/python/python-scons_3.0.0.bb
> index 3f43856..be33dfa 100644
> --- a/meta/recipes-devtools/python/python-scons_2.5.1.bb
> +++ b/meta/recipes-devtools/python/python-scons_3.0.0.bb
> @@ -1,13 +1,13 @@
>  SUMMARY = "Software Construction tool (make/autotools replacement)"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a885dff6d14e4cd876d9008a09a42de"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
>  SRCNAME = "scons"
>  
>  SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>  
> -SRC_URI[md5sum] = "3eac81e5e8206304a9b4683c57665aa4"
> -SRC_URI[sha256sum] = "c8de85fc02ed1a687b1f2ac791eaa0c1707b4382a204f17d782b5b111b9fdf07"
> +SRC_URI[md5sum] = "7ca558edaaa1942fe38f3105ca2400fb"
> +SRC_URI[sha256sum] = "aa5afb33c2bbd33c311e47e912412195739e9ffb2e933534a31f85fba8f3470e"
>  
>  UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
>  
> @@ -20,4 +20,7 @@ RDEPENDS_${PN} = "\
>    python-io \
>    python-json \
>    python-subprocess \
> +  python-shell \
> +  python-pprint \
> +  python-importlib \
>    "

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


