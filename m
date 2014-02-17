Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C0EB76E71A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:54:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1HLs3gE000879; Mon, 17 Feb 2014 21:54:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8yj1EZgfM1st; Mon, 17 Feb 2014 21:54:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1HLrxCk000876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 17 Feb 2014 21:54:01 GMT
Message-ID: <1392674033.14081.175.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2014 21:53:53 +0000
In-Reply-To: <08134b74807c2647df869b226024213082332899.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
	<08134b74807c2647df869b226024213082332899.1392665521.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] icu: Disable the default LDFLAGSICUDT for target compile
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
X-List-Received-Date: Mon, 17 Feb 2014 21:54:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-17 at 11:34 -0800, Khem Raj wrote:

What appears to be missing here is an explanation of why we're doing
this? Its not in the patch header either...

Cheers,

Richard


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |   28 ++++++++++++++++++++
>  meta/recipes-support/icu/icu_51.2.bb               |    3 +++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
> 
> diff --git a/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
> new file mode 100644
> index 0000000..2968d57
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
> @@ -0,0 +1,28 @@
> +From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 15 Feb 2014 21:06:42 +0000
> +Subject: [PATCH] Disable LDFLAGSICUDT for Linux
> +
> +Upstream-Status: Inappropriate [ OE Configuration ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + source/config/mh-linux |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/mh-linux b/config/mh-linux
> +index 366f0cc..2689aab 100644
> +--- a/config/mh-linux
> ++++ b/config/mh-linux
> +@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
> + LD_RPATH_PRE = -Wl,-rpath,
> + 
> + ## These are the library specific LDFLAGS
> +-LDFLAGSICUDT=-nodefaultlibs -nostdlib
> ++# LDFLAGSICUDT=-nodefaultlibs -nostdlib
> + 
> + ## Compiler switch to embed a library name
> + # The initial tab in the next line is to prevent icu-config from reading it.
> +-- 
> +1.7.10.4
> +
> diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
> index aabe07b..2d1fd42 100644
> --- a/meta/recipes-support/icu/icu_51.2.bb
> +++ b/meta/recipes-support/icu/icu_51.2.bb
> @@ -9,5 +9,8 @@ SRC_URI = "${BASE_SRC_URI} \
>             file://add_buffer_length_check_to_UTF_16_or_32_detector.patch \
>            "
>  
> +SRC_URI_append_class-target = "\
> +           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> +          "
>  SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
>  SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"



