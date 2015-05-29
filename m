Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C743B6AC36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 01:59:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4T1xL6V029634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 May 2015 18:59:22 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 18:59:21 -0700
Message-ID: <5567C7F8.1020003@windriver.com>
Date: Fri, 29 May 2015 09:59:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1432308259.git.sgw@linux.intel.com>
	<282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
In-Reply-To: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
Subject: Re: [PATCH 1/3] boost/bjam-native: Upgrade to 1.58.0
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
X-List-Received-Date: Fri, 29 May 2015 01:59:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Saul,

Got errors on qemumips:

$ MACHINE=qemumips bitbake boost

gcc.compile.c++ 
bin.v2/libs/system/build/gcc-4.3.1/release/threading-multi/error_code.o
mips-poky-linux-g++: error: unrecognized command line option '-m32'

     "mips-poky-linux-g++" "-meb" "-mabi=32" "-mhard-float" "-march=mips32r2" 
"-Wl,-O1" "-Wl,--as-needed" 
"--sysroot=/buildarea/lyang1/test_x11/tmp/sysroots/qemumips" 
-ftemplate-depth-128  -O2 -pipe -g -feliminate-unused-debug-types 
-fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pedantic 
-pthread -fPIC -m32  -DBOOST_ALL_NO_LIB=1 -DBOOST_SYSTEM_DYN_LINK=1 -DNDEBUG 
-I"." -c -o 
"bin.v2/libs/system/build/gcc-4.3.1/release/threading-multi/error_code.o" 
"libs/system/src/error_code.cpp"

...failed gcc.compile.c++ 
bin.v2/libs/system/build/gcc-4.3.1/release/threading-multi/error_code.o...
common.mkdir bin.v2/libs/date_time/build/gcc-4.3.1
common.mkdir bin.v2/libs/filesystem/build/gcc-4.3.1
common.mkdir bin.v2/libs/regex/build/gcc-4.3.1/release/link-static
gcc.compile.c++ 
bin.v2/libs/regex/build/gcc-4.3.1/release/threading-multi/c_regex_traits.o
mips-poky-linux-g++: error: unrecognized command line option '-m32'

     "mips-poky-linux-g++" "-meb" "-mabi=32" "-mhard-float" "-march=mips32r2" 
"-Wl,-O1" "-Wl,--as-needed" 
"--sysroot=/buildarea/lyang1/test_x11/tmp/sysroots/qemumips" 
-ftemplate-depth-128  -O2 -pipe -g -feliminate-unused-debug-types 
-fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pedantic 
-pthread -fPIC -m32  -DBOOST_ALL_NO_LIB=1 -DBOOST_REGEX_DYN_LINK=1 -DNDEBUG 
-I"." -c -o 
"bin.v2/libs/regex/build/gcc-4.3.1/release/threading-multi/c_regex_traits.o" 
"libs/regex/build/../src/c_regex_traits.cpp"

...failed gcc.compile.c++ 
bin.v2/libs/regex/build/gcc-4.3.1/release/threading-multi/c_regex_traits.o...
gcc.compile.c++ 
bin.v2/libs/regex/build/gcc-4.3.1/release/threading-multi/cpp_regex_traits.o
mips-poky-linux-g++: error: unrecognized command line option '-m32'

// Robert

On 05/22/2015 11:26 PM, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb}            | 0
>   meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc}     | 4 ++--
>   meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb}       | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb} (100%)
>   rename meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc} (83%)
>   rename meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb} (100%)
>
> diff --git a/meta/recipes-support/boost/bjam-native_1.57.0.bb b/meta/recipes-support/boost/bjam-native_1.58.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/bjam-native_1.57.0.bb
> rename to meta/recipes-support/boost/bjam-native_1.58.0.bb
> diff --git a/meta/recipes-support/boost/boost-1.57.0.inc b/meta/recipes-support/boost/boost-1.58.0.inc
> similarity index 83%
> rename from meta/recipes-support/boost/boost-1.57.0.inc
> rename to meta/recipes-support/boost/boost-1.58.0.inc
> index 809419d..0bae81b 100644
> --- a/meta/recipes-support/boost/boost-1.57.0.inc
> +++ b/meta/recipes-support/boost/boost-1.58.0.inc
> @@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
>
> -SRC_URI[md5sum] = "1be49befbdd9a5ce9def2983ba3e7b76"
> -SRC_URI[sha256sum] = "910c8c022a33ccec7f088bd65d4f14b466588dda94ba2124e78b8c57db264967"
> +SRC_URI[md5sum] = "b8839650e61e9c1c0a89f371dd475546"
> +SRC_URI[sha256sum] = "fdfc204fc33ec79c99b9a74944c3e54bd78be4f7f15e260c0e2700a36dc7d3e5"
>
>   S = "${WORKDIR}/${BOOST_P}"
> diff --git a/meta/recipes-support/boost/boost_1.57.0.bb b/meta/recipes-support/boost/boost_1.58.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/boost_1.57.0.bb
> rename to meta/recipes-support/boost/boost_1.58.0.bb
>

