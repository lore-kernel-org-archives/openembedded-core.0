Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.83])
 by mx.groups.io with SMTP id smtpd.web10.2467.1605746143387923291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 16:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GyR0AaWx;
 spf=pass (domain: windriver.com, ip: 40.107.77.83, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB8KdJR7pyWE8azvv7iruy6XdOrlOZK4/ogcAKfW2liKnt5AEjWarJJP30qP7fWX1JE2GfJb/PpeuJcCC+l/+3t5nqCOcr2C0MZANktjp/uAC7h3OLCSu7YaUl5RK/dPGzNr2e1mWrHlw3qV81gqA+NRMCxswXma8UvBp8REQf59VhgHJkESfvG5rqI2WtWvsiFmebz6CpolLLGadWZmurYMSl2x1/R1dv70v1S660KHBLipfNXWjWrC3bDU5a9L3mNRbgknxI8ExS1i8jXicjY3LaAcmgR+9qSRehVOjBWj6ga11FlHB2iI2HWqIfC0xnQXIv+7fEgyKsAAsji62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X35O56BrNQ3mX1JepO3EeSDDwFmncuKEzIYsq0yQOL4=;
 b=cbxQXDs4D4STt3cvcZOs4NxJTrlNlEQHeJq5NeGCjySetd7bwPXcGhsx0xmRu+V86cqP+lC5f/E7AlYNGUi0jLmSDpy7PfRCA62Ba4kaV5p6zJZihcm8Lcm1/UMO75P9rgYfrdifTOdoJ8Pg9mRz3v5bdWDhyHBqXaaZpzyBWf9hn7nKGcilxUQgxA/JXBN9odJtsmZZsFpQhfpRI/REZkadKIpbjoSBEJ71AMUsxYOf89mvJ3IYYAQRbjZLwyMRgH5t348RpnDcnI0EOoezj0ESGdev7JVe1fZv/+2rPEIVYP+9jVwwd56CMw6woqW9NrlI2lNbAzAMwuI0Y4Qd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X35O56BrNQ3mX1JepO3EeSDDwFmncuKEzIYsq0yQOL4=;
 b=GyR0AaWxFDEYBiiUi7Bu3QrTs11zR1XxeRHPc2Sr93OvRgaammU++p5zOp6GeQVRJ7Y+1PxQHhzKNVMscexeUm0xgN0dE5gR8ziCBiWznvkTxRBFohDwoyGkghjSfAotz3AjFuaZqaRC2EqmTRdqfoKTSs6xnep3Y6ZccEEWgBw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 00:35:40 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105%6]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 00:35:40 +0000
Subject: Re: [OE-core] [PATCH V2] vulkan-samples: fix do_compile failure
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1647D99B9B8E3CA1.27572@lists.openembedded.org>
Message-ID: <e1840377-1439-a538-bd83-e5c219d4be17@windriver.com>
Date: Thu, 19 Nov 2020 08:35:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1647D99B9B8E3CA1.27572@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0080.apcprd04.prod.outlook.com
 (2603:1096:202:15::24) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR04CA0080.apcprd04.prod.outlook.com (2603:1096:202:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 00:35:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6dfdf69-8a33-4064-ebe5-08d88c230a7f
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45748DBC046F5049EE540FEC82E00@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lY8RkdeHvZUujSthK1UTJZCVhwa8HS0uM0C8pawMhlnR7JbeIjh00j81j95nJq2FvOWc8bIfqRTGG6B5hBeS2UvYI6ElxWKkWQJgItNOMQHx8JCa4GFvZr/v0oxmbASzfAX7jz60zZ9ZVYcFB1Q3IKdtJ1z4BtVftEsZj87IEe81fFhBtx2TEqgJaBZOYJZ76g6F9tFFtemjn0QjOTo/6PgOCm/h/FTz+Mp3SYETPOl3Kb2ioy2nQdz5Z09wrfd93Eid7Bmse21awGXy4u4nuAXuuBU3k6NYUwl5Bz0QbYfgDom4V1s8OS297TO9NrvDMMmvUoro0xwqdEDV0s/vC+zTMDHxIaL+4UCksnhHaQPh5LOhgfUy3f/o51mKVOpkHSHOYeE3l6v3GZB7mcyhSA8IEJ07/pDddjNQ6dqHkxZIK970RRgwninQrFcINusdV3wiIF1n4wfkbIPXX15ybOFtuXeV5VI1SymfQaZh9HE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(30864003)(44832011)(478600001)(966005)(36756003)(33964004)(5660300002)(16526019)(8936002)(186003)(8676002)(6666004)(53546011)(86362001)(6916009)(956004)(31696002)(6706004)(26005)(2616005)(316002)(52116002)(166002)(16576012)(6486002)(31686004)(2906002)(83380400001)(66946007)(66476007)(66556008)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bro/v9KXy2A8mKjLTsVfW+5ehcukJJ0XvVSCtzVKI9k8g3xAR9Bilurt9zbYM6ZZXai/8nefeI1mm0vcoPEqH0GomrtmLOc0pe8uiDeyXWyAVbYtcIqIqbQZR/El+3VwB5dAlDI1p/d4bUjrvOcmqqzyb74P+60Gj4abUsepwG0ivokdqNUZHd2n4+w2eJF1EFPX2gezz/jResD3b2v19hERSd58ayBx1tE/lUfQT1P0YvulsPmFuHuGT2zK1eieVSrPMW+4vMegOSJEwPecC4un9TqfNKoNmEkl1Cw0Ppc/5lSc+HygB+EbPyAcz/mmkQTroz1zrbNEhswkEqYwGn3K5RArdrC/LUwIwAjKyqqUD7TLbOMgwWADbUcOEfYupRJiD62i7I6e4FxT80lSGPPXgfVxU9hAdxPxIz+YCmhfEkY+lK+Gpx2H6QyDY1h5IKqfczsB/db2SekZriHDMhnv9mY/JppDjGzTF1SuNEUHGOMhot2eO0Ezpfp9n96dGvz6ZB+/d7+DsLBg2lO1ltstjHV5LlpJ/u+hxKPsJbrmrCn1RBd66hU91HDpehajBrdH8Dm1FBPPNbfodd+Xze0M//OlgkSCIB/ElhesC0f26CzI6LAT1NDB5u0yHPiiei8WiN7Wr7+kNIyrjIeRfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dfdf69-8a33-4064-ebe5-08d88c230a7f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 00:35:40.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3NMFKhpY588tqI+SZheml180jud0fUqn3AVOYbzmtzS+zFQiZSMA1Dj8Dxfq/7II90psn2OOCrV0ydondJtNgGJwoVD3mcPO392gybGgyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: multipart/alternative;
 boundary="------------22B454AB6FFEF16A2861D4A7"
Content-Language: en-US

--------------22B454AB6FFEF16A2861D4A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 16/11/20 9:43 am, Changqing Li wrote:
> fix error:
> | framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
> | /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
>
> some arch don't have built-in atomic, so need to link it
> explicitly
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...inst-libatomic-if-no-built-in-atomic.patch | 117 ++++++++++++++++++
>   .../vulkan/vulkan-samples_git.bb              |   2 +
>   2 files changed, 119 insertions(+)
>   create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
> new file mode 100644
> index 0000000000..6c0fb60868
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
> @@ -0,0 +1,117 @@
> +From e20a5d13935a41a856e8f71c49f2cc9d81b1d92c Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Fri, 13 Nov 2020 17:07:00 +0800
> +Subject: [PATCH] support link against libatomic if no built-in atomic exist
> +
> +fix error:
> +| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
> +| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
> +
> +Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/212]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + CMakeLists.txt                  |  1 +
> + bldsys/cmake/check_atomic.cmake | 62 +++++++++++++++++++++++++++++++++
> + framework/CMakeLists.txt        |  4 +++
> + 3 files changed, 67 insertions(+)
> + create mode 100644 bldsys/cmake/check_atomic.cmake
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e72e829..466f51d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -42,6 +42,7 @@ endmacro(vulkan_samples_pch)
> + include(utils)
> + include(global_options)
> + include(sample_helper)
> ++include(check_atomic)
> +
> + # Add third party libraries
> + add_subdirectory(third_party)
> +diff --git a/bldsys/cmake/check_atomic.cmake b/bldsys/cmake/check_atomic.cmake
> +new file mode 100644
> +index 0000000..6b47a7a
> +--- /dev/null
> ++++ b/bldsys/cmake/check_atomic.cmake
> +@@ -0,0 +1,62 @@
> ++# check weither need to link atomic library explicitly
> ++INCLUDE(CheckCXXSourceCompiles)
> ++INCLUDE(CheckLibraryExists)
> ++
> ++if(NOT DEFINED VULKAN_COMPILER_IS_GCC_COMPATIBLE)
> ++  if(CMAKE_COMPILER_IS_GNUCXX)
> ++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)
> ++  elseif( MSVC )
> ++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE OFF)
> ++  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" )
> ++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)
> ++  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Intel" )
> ++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)
> ++  endif()
> ++endif()
> ++
> ++# Sometimes linking against libatomic is required for atomic ops, if
> ++# the platform doesn't support lock-free atomics.
> ++
> ++function(check_working_cxx_atomics varname)
> ++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
> ++  set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -std=c++11")
> ++  CHECK_CXX_SOURCE_COMPILES("
> ++#include <atomic>
> ++std::atomic<int> x;
> ++std::atomic<short> y;
> ++std::atomic<char> z;
> ++int main() {
> ++  ++z;
> ++  ++y;
> ++  return ++x;
> ++}
> ++" ${varname})
> ++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
> ++endfunction(check_working_cxx_atomics)
> ++
> ++function(check_working_cxx_atomics64 varname)
> ++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
> ++  set(CMAKE_REQUIRED_FLAGS "-std=c++11 ${CMAKE_REQUIRED_FLAGS}")
> ++  CHECK_CXX_SOURCE_COMPILES("
> ++#include <atomic>
> ++#include <cstdint>
> ++std::atomic<uint64_t> x (0);
> ++int main() {
> ++  uint64_t i = x.load(std::memory_order_relaxed);
> ++  (void)i;
> ++  return 0;
> ++}
> ++" ${varname})
> ++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
> ++endfunction(check_working_cxx_atomics64)
> ++
> ++set(NEED_LINK_ATOMIC  OFF CACHE BOOL "weither need to link against atomic library")
> ++if(VULKAN_COMPILER_IS_GCC_COMPATIBLE)
> ++    # check if non-64-bit atomics work without the library.
> ++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
> ++    # check 64-bit atomics work without the library.
> ++    check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITHOUT_LIB)
> ++    if (NOT HAVE_CXX_ATOMICS_WITHOUT_LIB OR NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB)
> ++        set(NEED_LINK_ATOMIC  ON CACHE BOOL "weither need to link to atomic library" FORCE)
> ++    endif()
> ++endif()
> +diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
> +index bf26786..322526e 100644
> +--- a/framework/CMakeLists.txt
> ++++ b/framework/CMakeLists.txt
> +@@ -412,6 +412,10 @@ target_link_libraries(${PROJECT_NAME}
> +     ctpl
> +     docopt)
> +
> ++if(${NEED_LINK_ATOMIC})
> ++    target_link_libraries(${PROJECT_NAME} atomic)
> ++endif()
> ++
> + # Link platform specific libraries
> + if(ANDROID)
> +     target_link_libraries(${PROJECT_NAME} log android native_app_glue)
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> index 241a313a7b..980557a3b9 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
>   
>   SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
>              file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
> +           file://0001-support-link-against-libatomic-if-no-built-in-atomic.patch \
>              "
> +
>   UPSTREAM_CHECK_COMMITS = "1"
>   SRCREV = "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
>   
>
> 
>

--------------22B454AB6FFEF16A2861D4A7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 16/11/20 9:43 am, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1647D99B9B8E3CA1.27572@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">fix error:
| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base&lt;unsigned long long&gt;::load(std::memory_order) const':
| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'

some arch don't have built-in atomic, so need to link it
explicitly

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...inst-libatomic-if-no-built-in-atomic.patch | 117 ++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |   2 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
new file mode 100644
index 0000000000..6c0fb60868
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
@@ -0,0 +1,117 @@
+From e20a5d13935a41a856e8f71c49f2cc9d81b1d92c Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Fri, 13 Nov 2020 17:07:00 +0800
+Subject: [PATCH] support link against libatomic if no built-in atomic exist
+
+fix error:
+| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base&lt;unsigned long long&gt;::load(std::memory_order) const':
+| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/Vulkan-Samples/pull/212">https://github.com/KhronosGroup/Vulkan-Samples/pull/212</a>]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ CMakeLists.txt                  |  1 +
+ bldsys/cmake/check_atomic.cmake | 62 +++++++++++++++++++++++++++++++++
+ framework/CMakeLists.txt        |  4 +++
+ 3 files changed, 67 insertions(+)
+ create mode 100644 bldsys/cmake/check_atomic.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e72e829..466f51d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -42,6 +42,7 @@ endmacro(vulkan_samples_pch)
+ include(utils)
+ include(global_options)
+ include(sample_helper)
++include(check_atomic)
+ 
+ # Add third party libraries
+ add_subdirectory(third_party)
+diff --git a/bldsys/cmake/check_atomic.cmake b/bldsys/cmake/check_atomic.cmake
+new file mode 100644
+index 0000000..6b47a7a
+--- /dev/null
++++ b/bldsys/cmake/check_atomic.cmake
+@@ -0,0 +1,62 @@
++# check weither need to link atomic library explicitly
++INCLUDE(CheckCXXSourceCompiles)
++INCLUDE(CheckLibraryExists)
++
++if(NOT DEFINED VULKAN_COMPILER_IS_GCC_COMPATIBLE)
++  if(CMAKE_COMPILER_IS_GNUCXX)
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
++  elseif( MSVC )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE OFF)
++  elseif( &quot;${CMAKE_CXX_COMPILER_ID}&quot; MATCHES &quot;Clang&quot; )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
++  elseif( &quot;${CMAKE_CXX_COMPILER_ID}&quot; MATCHES &quot;Intel&quot; )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
++  endif()
++endif()
++
++# Sometimes linking against libatomic is required for atomic ops, if
++# the platform doesn't support lock-free atomics.
++
++function(check_working_cxx_atomics varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS &quot;${CMAKE_REQUIRED_FLAGS} -std=c++11&quot;)
++  CHECK_CXX_SOURCE_COMPILES(&quot;
++#include &lt;atomic&gt;
++std::atomic&lt;int&gt; x;
++std::atomic&lt;short&gt; y;
++std::atomic&lt;char&gt; z;
++int main() {
++  ++z;
++  ++y;
++  return ++x;
++}
++&quot; ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics)
++
++function(check_working_cxx_atomics64 varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS &quot;-std=c++11 ${CMAKE_REQUIRED_FLAGS}&quot;)
++  CHECK_CXX_SOURCE_COMPILES(&quot;
++#include &lt;atomic&gt;
++#include &lt;cstdint&gt;
++std::atomic&lt;uint64_t&gt; x (0);
++int main() {
++  uint64_t i = x.load(std::memory_order_relaxed);
++  (void)i;
++  return 0;
++}
++&quot; ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics64)
++
++set(NEED_LINK_ATOMIC  OFF CACHE BOOL &quot;weither need to link against atomic library&quot;)
++if(VULKAN_COMPILER_IS_GCC_COMPATIBLE)
++    # check if non-64-bit atomics work without the library.
++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
++    # check 64-bit atomics work without the library.
++    check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITHOUT_LIB)
++    if (NOT HAVE_CXX_ATOMICS_WITHOUT_LIB OR NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB)
++        set(NEED_LINK_ATOMIC  ON CACHE BOOL &quot;weither need to link to atomic library&quot; FORCE)
++    endif()
++endif()
+diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
+index bf26786..322526e 100644
+--- a/framework/CMakeLists.txt
++++ b/framework/CMakeLists.txt
+@@ -412,6 +412,10 @@ target_link_libraries(${PROJECT_NAME}
+     ctpl
+     docopt)
+ 
++if(${NEED_LINK_ATOMIC})
++    target_link_libraries(${PROJECT_NAME} atomic)
++endif()
++
+ # Link platform specific libraries
+ if(ANDROID)
+     target_link_libraries(${PROJECT_NAME} log android native_app_glue)
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 241a313a7b..980557a3b9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a">&quot;file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a&quot;</a>
 
 SRC_URI = &quot;gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            <a class="moz-txt-link-freetext" href="file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch">file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-support-link-against-libatomic-if-no-built-in-atomic.patch">file://0001-support-link-against-libatomic-if-no-built-in-atomic.patch</a> \
            &quot;
+
 UPSTREAM_CHECK_COMMITS = &quot;1&quot;
 SRCREV = &quot;f52361d3cd6ac8c30fc3365a464b4e220c32cfd6&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------22B454AB6FFEF16A2861D4A7--
