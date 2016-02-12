Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4346C731C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:18:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 12 Feb 2016 14:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,437,1449561600"; d="scan'208";a="651471285"
Received: from dmcerlea-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.13.227])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2016 14:18:40 -0800
Message-ID: <1455315518.3546.39.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 22:18:38 +0000
In-Reply-To: <1455244878-7901-2-git-send-email-akuster808@gmail.com>
References: <1455244878-7901-1-git-send-email-akuster808@gmail.com>
	<1455244878-7901-2-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH] libpcre: Security fixes and package update.
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
X-List-Received-Date: Fri, 12 Feb 2016 22:18:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-02-11 at 18:41 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> this is related to [Yocto # 9008]

Thanks, queued in joshuagl/fido next with the addition of the below
comment to the commit message:

"Jethro and master don't require this patch as they have newer libpcre
which contains these fixes."

Regards,

Joshua

> 
> 8.38:
> The following security fixes are included:
> CVE-2015-3210 pcre: heap buffer overflow in
> pcre_compile2()  compile_regex()
> CVE-2015-3217 pcre: stack overflow in match()
> CVE-2015-5073 CVE-2015-8388 pcre: Buffer overflow caused by certain
> patterns with an unmatched closing parenthesis
> CVE-2015-8380 pcre: Heap-based buffer overflow in pcre_exec
> CVE-2015-8381 pcre: Heap Overflow in compile_regex()
> CVE-2015-8383 pcre: Buffer overflow caused by repeated conditional
> group
> CVE-2015-8384 pcre: Buffer overflow caused by recursive back
> reference by name within certain group
> CVE-2015-8385 pcre: Buffer overflow caused by forward reference by
> name to certain group
> CVE-2015-8386 pcre: Buffer overflow caused by lookbehind assertion
> CVE-2015-8387 pcre: Integer overflow in subroutine calls
> CVE-2015-8389 pcre: Infinite recursion in JIT compiler when
> processing certain patterns
> CVE-2015-8390 pcre: Reading from uninitialized memory when processing
> certain patterns
> CVE-2015-8392 pcre: Buffer overflow caused by certain patterns with
> duplicated named groups
> CVE-2015-8393 pcre: Information leak when running pcgrep -q on
> crafted binary
> CVE-2015-8394 pcre: Integer overflow caused by missing check for
> certain conditions
> CVE-2015-8395 pcre: Buffer overflow caused by certain references
> CVE-2016-1283 pcre: Heap buffer overflow in pcre_compile2 causes DoS
> 
> 8.37:
> The following security fixes are included:
> CVE-2014-8964 pcre: incorrect handling of zero-repeat assertion
> conditions
> CVE-2015-2325 pcre: heap buffer overflow in compile_branch()
> CVE-2015-2326 pcre: heap buffer overflow in pcre_compile2()
> 
> LICENSE file changed do to Copyright date updates.
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} |
> 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/libpcre/{libpcre_8.36.bb =>
> libpcre_8.38.bb} (91%)
> 
> diff --git a/meta/recipes-support/libpcre/libpcre_8.36.bb
> b/meta/recipes-support/libpcre/libpcre_8.38.bb
> similarity index 91%
> rename from meta/recipes-support/libpcre/libpcre_8.36.bb
> rename to meta/recipes-support/libpcre/libpcre_8.38.bb
> index a4b7f6d..6ef5d70 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.36.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
> @@ -6,16 +6,15 @@ SUMMARY = "Perl Compatible Regular Expressions"
>  HOMEPAGE = "http://www.pcre.org"
>  SECTION = "devel"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM =
> "file://LICENCE;md5=ded617e975f28e15952dc68b84a7ac1a"
> +LIC_FILES_CHKSUM =
> "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-
> ${PV}.tar.bz2 \
>             file://pcre-cross.patch \
>             file://fix-pcre-name-collision.patch \
>             file://run-ptest \
>             file://Makefile \
>  "
> -
> -SRC_URI[md5sum] = "b767bc9af0c20bc9c1fe403b0d41ad97"
> -SRC_URI[sha256sum] =
> "ef833457de0c40e82f573e34528f43a751ff20257ad0e86d272ed5637eb845bb"
> +SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
> +SRC_URI[sha256sum] =
> "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
>  
>  S = "${WORKDIR}/pcre-${PV}"
>  
> -- 
> 2.3.5
> 

