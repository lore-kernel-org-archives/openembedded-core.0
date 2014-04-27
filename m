Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6437065E2B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:26:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0Q4mr015434; Sun, 27 Apr 2014 01:26:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QW3XgOr806Ad; Sun, 27 Apr 2014 01:26:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0Q2aA015430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 27 Apr 2014 01:26:03 +0100
Message-ID: <1398558356.16672.286.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Apr 2014 01:25:56 +0100
In-Reply-To: <1398548702-23182-1-git-send-email-raj.khem@gmail.com>
References: <1398548702-23182-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc: Add libgcc-initial to DEPENDS
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
X-List-Received-Date: Sun, 27 Apr 2014 00:26:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-04-26 at 14:45 -0700, Khem Raj wrote:
> Now Separated out libgcc-initial is there
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-initial_git.bb |    2 +-
>  meta/recipes-core/uclibc/uclibc_git.bb         |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Sorry, I'd meant to add this. Merged, thanks!

Richard

> diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
> index 3a1140e..6433229 100644
> --- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
> +++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
> @@ -2,7 +2,7 @@ SECTION = "base"
>  require uclibc.inc
>  require uclibc-git.inc
>  
> -DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial kern-tools-native"
> +DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial libgcc-initial kern-tools-native"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  
>  PACKAGES = ""
> diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
> index b4f5d9c..38a7e45 100644
> --- a/meta/recipes-core/uclibc/uclibc_git.bb
> +++ b/meta/recipes-core/uclibc/uclibc_git.bb
> @@ -11,7 +11,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>             virtual/${TARGET_PREFIX}gcc-initial \
>             virtual/${TARGET_PREFIX}libc-initial \
>             linux-libc-headers ncurses-native \
> -           kern-tools-native"
> +           libgcc-initial kern-tools-native"
>  
>  RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
>  RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> -- 
> 1.7.10.4
> 



