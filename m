Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B46687D486
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:41:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t1so5915590pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8XkjAwGlhBNDks831I3vU3xpwFsHKf5hPmru+Fq5ov8=;
	b=BQOHWQ8EEvEl1a2n0fXt6kSwLO3PDwvfRv07yG38Djw5vqMGT02pgwxOcEsFE2Ze1o
	AwsUkFUtKlSBkNx6pl+N6XOh0Gw+c46Gcpno//thCXjvyKQhMU1U4Hw3+oq3QkWYgn70
	PwBWsmW3MX3zSf/t/5Z1H8N1kXwN+WBGd1sEhQJxmdlLMZ9mnSpcugT/r0GAh1pJ9fRk
	ZEr1kiGxkauCOBvvYvCMEEO7gj5XB+RQPa83hrcF7/aiXQJtTLfnSAguE7QmidBKvzbI
	8XZcF6DiE1+A5Na3xqgAy1GXJ9AMyZbvhQB8nCjuGw5K6n5+IjkZTTIyQBDJzGGY+HHE
	IKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8XkjAwGlhBNDks831I3vU3xpwFsHKf5hPmru+Fq5ov8=;
	b=PSIHX8xhwghv9NHA475Hw8uADkPT8Unlk4Jj0MzXAd64zwYo4D5ZSgoztP2hb79aDC
	C28jepikGNafNGcrMq7GXkU/EitcCrlaIVM3E+6bMK5GBuIQIavlP3YlPy2NDTiZul0T
	qhFSFaYdelDGmzK7dy8xHWeqcEwhozp458M4xhsKq82CvkOG3JvuWkM/smM4JWplAjvU
	/JLdUJ1bVUJ07Z8mgmV5QpZ4J9vtSE7QN2UWb6DyB232s7TnZbS86KObILecNsCOr9jZ
	ntnOCq2+V4yodTb68mO+o3wuzdSR4JP+1GDs/6dpzmESzdOpvMYFhiSACUcNRysvM5FW
	VWsg==
X-Gm-Message-State: APjAAAX/N6L2nOOOgy/ux73uoIVvOi7D0kyHsqFbQjb+9U7bkeHJrTsz
	EJqMvQJjBs/3/jY24IMUAp4OubTCiTI=
X-Google-Smtp-Source: APXvYqzTyfE1eLVG7l86TlEC29troc3HwuZTtGP1xqH2/GusBnE/apzykzanjF50QgjMgeP5USWT7A==
X-Received: by 2002:a63:2c14:: with SMTP id s20mr59938469pgs.182.1558384908341;
	Mon, 20 May 2019 13:41:48 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	f4sm21379068pfn.118.2019.05.20.13.41.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:41:47 -0700 (PDT)
To: Nikolai Merinov <n.merinov@inango-systems.com>,
	openembedded-core@lists.openembedded.org
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
Date: Mon, 20 May 2019 13:41:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190514150416.10902-1-n.merinov@inango-systems.com>
Subject: Re: [PATCH] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Mon, 20 May 2019 20:41:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/14/19 8:04 AM, Nikolai Merinov wrote:
> The CMake takes mandatory compiler arguments from the following variables:
> - CMAKE_SYSROOT -- path to sysroot that should be passed to compiler.
> - CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for compilers
>    that supports several targets through command line options.
>    e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
> - CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external toolchain,
>    used for compilers that support build with external toolchain.
>    e.g. "clang --gcc-toolchain ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
> - CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a compiler
>    command.
> 
> CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass mandatory
> arguments, that belongs to CC variable with other build systems, to a
> compiler.
> 
> Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided by
> CMakeLists.txt files.
> ---
>   meta/classes/cmake.bbclass | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index d3f0d70847..4da4c00a09 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,27 +27,33 @@ python() {
>           cc_list = d.getVar('CC').split()
>           if cc_list[0] == 'ccache':
>               d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
> +            cc_arg1 = ' '.join(cc_list[2:])
>           else:
>               d.setVar('OECMAKE_C_COMPILER', cc_list[0])
> +            cc_arg1 = ' '.join(cc_list[1:])
> +        if not d.getVar('OECMAKE_C_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_C_COMPILER_ARG1', cc_arg1)
>   
>       if not d.getVar('OECMAKE_CXX_COMPILER'):
>           cxx_list = d.getVar('CXX').split()
>           if cxx_list[0] == 'ccache':
>               d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
> +            cxx_arg1 = ' '.join(cxx_list[2:])
>           else:
>               d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
> +            cxx_arg1 = ' '.join(cxx_list[1:])
> +        if not d.getVar('OECMAKE_CXX_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_CXX_COMPILER_ARG1', cxx_arg1)
>   }
>   OECMAKE_AR ?= "${AR}"
>   
>   # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
> +OECMAKE_C_FLAGS ?= "${CFLAGS}"
> +OECMAKE_CXX_FLAGS ?= "${CXXFLAGS}"
>   OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
>   OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +OECMAKE_C_LINK_FLAGS ?= "${CPPFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?= "${CXXFLAGS} ${LDFLAGS}"
>   
>   OECMAKE_RPATH ?= ""
>   OECMAKE_PERLNATIVE_DIR ??= ""
> @@ -85,8 +91,11 @@ $cmake_crosscompiling
>   set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
>   set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
>   set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_C_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>   set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> +set( CMAKE_CXX_COMPILER_ARG1 "${OECMAKE_CXX_COMPILER_ARG1}" )
>   set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_ASM_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>   set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>   set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>   set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> 

these changes look ok, have you also tried building SDK and see if these 
changes are reflected in SDK as well ?

