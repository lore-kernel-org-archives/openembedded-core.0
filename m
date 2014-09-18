Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDB371482
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8IDUCdQ018956; Thu, 18 Sep 2014 14:30:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HBMRnBOh0i2D; Thu, 18 Sep 2014 14:30:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8IDU8ZI018953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Sep 2014 14:30:10 +0100
Message-ID: <1411047011.4736.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Date: Thu, 18 Sep 2014 14:30:11 +0100
In-Reply-To: <1411031735-14721-1-git-send-email-marex@denx.de>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Thu, 18 Sep 2014 13:30:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:
> Introduce and use nativesdk-packagegroup-python , which contains all
> necessary python components for the native SDK. Make use of this
> package group in buildtools-tarball.bb immediatelly.

Specifically, isn't this the list of packages needed to run bitbake and
its associated utils? "python" isn't therefore a particularly good
description of this package?

Cheers,

Richard

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb       | 28 +----------------
>  .../python/nativesdk-packagegroup-python.bb        | 36 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 27 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/nativesdk-packagegroup-python.bb
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 62e1e0b..7d20238 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -8,33 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
>  TOOLCHAIN_TARGET_TASK ?= ""
>  
>  TOOLCHAIN_HOST_TASK ?= "\
> -    nativesdk-python-core \
> -    nativesdk-python-textutils \
> -    nativesdk-python-sqlite3 \
> -    nativesdk-python-pickle \
> -    nativesdk-python-logging \
> -    nativesdk-python-elementtree \
> -    nativesdk-python-curses \
> -    nativesdk-python-compile \
> -    nativesdk-python-compiler \
> -    nativesdk-python-fcntl \
> -    nativesdk-python-shell \
> -    nativesdk-python-misc \
> -    nativesdk-python-multiprocessing \
> -    nativesdk-python-subprocess \
> -    nativesdk-python-xmlrpc \
> -    nativesdk-python-netclient \
> -    nativesdk-python-netserver \
> -    nativesdk-python-distutils \
> -    nativesdk-python-unixadmin \
> -    nativesdk-python-compression \
> -    nativesdk-python-json \
> -    nativesdk-python-unittest \
> -    nativesdk-python-mmap \
> -    nativesdk-python-difflib \
> -    nativesdk-python-pprint \
> -    nativesdk-python-git \
> -    nativesdk-python-pkgutil \
> +    nativesdk-packagegroup-python \
>      nativesdk-ncurses-terminfo-base \
>      nativesdk-chrpath \
>      nativesdk-tar \
> diff --git a/meta/recipes-devtools/python/nativesdk-packagegroup-python.bb b/meta/recipes-devtools/python/nativesdk-packagegroup-python.bb
> new file mode 100644
> index 0000000..fdc1006
> --- /dev/null
> +++ b/meta/recipes-devtools/python/nativesdk-packagegroup-python.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "NativeSDK Python package group"
> +DESCRIPTION = "NativeSDK Python package group"
> +PR = "r0"
> +LICENSE = "MIT"
> +
> +inherit packagegroup
> +
> +RDEPENDS_${PN} = "				\
> +	nativesdk-python-core			\
> +	nativesdk-python-textutils		\
> +	nativesdk-python-sqlite3		\
> +	nativesdk-python-pickle			\
> +	nativesdk-python-logging		\
> +	nativesdk-python-elementtree		\
> +	nativesdk-python-curses			\
> +	nativesdk-python-compile		\
> +	nativesdk-python-compiler		\
> +	nativesdk-python-fcntl			\
> +	nativesdk-python-shell			\
> +	nativesdk-python-misc			\
> +	nativesdk-python-multiprocessing	\
> +	nativesdk-python-subprocess		\
> +	nativesdk-python-xmlrpc			\
> +	nativesdk-python-netclient		\
> +	nativesdk-python-netserver		\
> +	nativesdk-python-distutils		\
> +	nativesdk-python-unixadmin		\
> +	nativesdk-python-compression		\
> +	nativesdk-python-json			\
> +	nativesdk-python-unittest		\
> +	nativesdk-python-mmap			\
> +	nativesdk-python-difflib		\
> +	nativesdk-python-pprint			\
> +	nativesdk-python-git			\
> +	nativesdk-python-pkgutil		\
> +    "



