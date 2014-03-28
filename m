Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 289126B898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:31:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2SHVFnk029310; Fri, 28 Mar 2014 17:31:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F34_gRmSL8bx; Fri, 28 Mar 2014 17:31:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2SHV8l2029289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 28 Mar 2014 17:31:09 GMT
Message-ID: <1396027863.14790.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 28 Mar 2014 17:31:03 +0000
In-Reply-To: <4691bff032d8536069f808068e5b477c8f47d213.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
	<4691bff032d8536069f808068e5b477c8f47d213.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] packagegroups: Remove toolchain *-symlinks packages
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
X-List-Received-Date: Fri, 28 Mar 2014 17:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-03-28 at 17:43 +0800, Hongxu Jia wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> We are no longer producing the *-symlinks packages, so remove the dependencies
> to those items.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb | 4 ----
>  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb         | 4 ----
>  2 files changed, 8 deletions(-)

The binutils-symlinks package was removed however the gcc related ones
have not been. This patch is therefore not appropriate until that has
happened.

Cheers,

Richard

> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> index 74ed247..e21f8c1 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> @@ -12,13 +12,9 @@ RDEPENDS_packagegroup-core-buildessential = "\
>      autoconf \
>      automake \
>      binutils \
> -    binutils-symlinks \
>      cpp \
> -    cpp-symlinks \
>      gcc \
> -    gcc-symlinks \
>      g++ \
> -    g++-symlinks \
>      gettext \
>      make \
>      libstdc++ \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 8e3b917..5581d8e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -69,20 +69,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
>      autoconf \
>      automake \
>      binutils \
> -    binutils-symlinks \
>      ccache \
>      coreutils \
>      cpp \
> -    cpp-symlinks \
>      distcc \
>      eglibc-utils \
>      eglibc-gconv-ibm850 \
>      file \
>      findutils \
>      g++ \
> -    g++-symlinks \
>      gcc \
> -    gcc-symlinks \
>      intltool \
>      ldd \
>      less \
> -- 
> 1.8.1.2
> 



