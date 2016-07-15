Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 421FC6E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:16:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g202so6476180pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=mb5wddqxNXYZ1VBAMFgD7ICzNhz4lBaO38wWLWYpWsk=;
	b=1ISFEXAQbG3Z+NGojUMmsJYxvcsSAn0jjnk/DdCeFnTtJ69IDD5uAXVS3GeP5eIpCL
	bH2E5kz2TWbg5pAO1AWcr35/XfdDKNu1AyX6wG7mu6cUGTecvzIedEL8kdVyQMYdX9gh
	qmouhoKUKVgT8bK0+HGEki0ExGle62uyzf79b8i9WZScmWWb+LMAzr4OLmxjKwJxxrkv
	T9/IpX+TbdZ9GuMwqA5BjBnYEJ6Y/RYjXorrW5tazIaVfS6VdQFRmcuTxU58n8fGXVCa
	S8F7Q7zaQzqbSKK/fF8sUlyxH54rHbehcZdX1Q1amUXVfJG51zQtL5jGviQrDAAwIx2e
	UZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mb5wddqxNXYZ1VBAMFgD7ICzNhz4lBaO38wWLWYpWsk=;
	b=eYGIHfyYdbE2I6rzBlL5MBt0Ypwt7OoCQwaRm07jqNukguXxEUecL7HHSJdZ7OjlFZ
	nF8Hpwp/wHHVJkOZIcwsAB9t5mtZqB4y6n6kD9lPcPunIpRtflbiqNjnrAmlhWMGqdna
	MXskrzclTYU5cYGFnPPJHLARpghy/R6fmOsfXUYIXGTaDLWRbRORgXF8i6ltLgL7gSLm
	XHCvANIKJDoONMqT0X/mQcekdCyH4cN8sruid0dKshN4dejTIU4HJojuDelGwB02+D2T
	wHgPcypivenZ5rhX1fblITVUPDlxXWg9G3QL/5VB9IwKNGN5ww5nGJM2cVjLPc20isGF
	57Jw==
X-Gm-Message-State: ALyK8tKHroBwkdCg718k5E+QY4hWS0N+YiJTWUj35t5d9EZ9C3xHnmNF3fYrZiL3yTc3uA==
X-Received: by 10.98.95.5 with SMTP id t5mr21936604pfb.103.1468592187315;
	Fri, 15 Jul 2016 07:16:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	k78sm3150165pfa.78.2016.07.15.07.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 07:16:26 -0700 (PDT)
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788F039.60603@gmail.com>
Date: Fri, 15 Jul 2016 07:16:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: Re: [krogoth][PATCH 0/8] Fixes for gcc-6 (Fedora-24)
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
X-List-Received-Date: Fri, 15 Jul 2016 14:16:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/14/2016 06:49 PM, Tim Orling wrote:
> [YOCTO #9897]
> 
> Fedora-24 only has gcc-6.1.1.

thanks,

pulled into staging.

- armin
> 
> This has caused a number of failures in -native recipes and gcc-cross.
> 
> This series either cherry-picks commits from master or applies known good patches from upstream.
> 
> Fixes broken build for:
>  - pkgconfig-native
>  - elfutils-native
>  - rpm-native
>  - binutils-native
>  - glib-2.0-native
>  - docbook-utils-native (actually openjade-native was the culprit)
>  - gcc-cross (gcc-cross-arm build tested for beaglebone)
> 
> Other problems may be lurking and only a world build on Fedora-24 AB will tell for sure.
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> 
> 
> The following changes since commit 98c57bb512ea6790db8604fcf0b88c81651d2ab4:
> 
>   build-appliance-image: Update to krogoth head revision (2016-07-06 17:28:04 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib timo/krogoth-9897
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/krogoth-9897
> 
> Dan McGregor (1):
>   binutils: disable werror on native build
> 
> Daniel McGregor (1):
>   openjade-native: work around bug exposed by GCC 6
> 
> Khem Raj (3):
>   elfutils-0.148: Fix build with gcc6
>   rpm: Fix build with gcc6
>   glib-2.0: Ignore useless warning found with gcc-6
> 
> Tim Orling (3):
>   pkgconfig: Fix build with gcc-6
>   elfutils: Fix build for gcc-6
>   gcc-5.3: fix build for gcc-6
> 
>  .../0001-Do-not-ignore-return-value-of-write.patch |  42 +++
>  .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |  42 +++
>  .../ignore-format-nonliteral-warning.patch         |  39 ++
>  meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |   7 +-
>  meta/recipes-devtools/binutils/binutils_2.26.bb    |   3 +-
>  .../elfutils/elfutils-0.148/gcc6.patch             |  23 ++
>  ...missing-brackets-around-if-statement-body.patch | 419 +++++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   1 +
>  meta/recipes-devtools/elfutils/elfutils_0.164.bb   |   1 +
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
>  .../gcc-5.3/0060-fix-build-when-using-gcc6.patch   | 157 ++++++++
>  .../openjade/openjade-native_1.3.2.bb              |   1 +
>  ...te-suppress-string-format-literal-warning.patch |  34 ++
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   1 +
>  meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |  54 +++
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   3 +-
>  16 files changed, 824 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0060-fix-build-when-using-gcc6.patch
>  create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
> 

