Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StxUz-0003zn-Cj for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 11:03:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6P8pmpc009202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:51:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07718-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:51:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6P8pceo009196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:51:40 +0100
Message-ID: <1343206296.22222.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2012 09:51:36 +0100
In-Reply-To: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
References: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] bash: enable parallel build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 09:03:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 14:12 -0300, Otavio Salvador wrote:
> I've build it several times in a 8 core machine without problem so it
> seems safe to use parallel build now.

Sadly its not:

http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/174/steps/shell_23/logs/stdio

Cheers,

Richard

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-extended/bash/bash.inc    |    2 --
>  meta/recipes-extended/bash/bash_4.2.bb |    2 +-
>  2 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index ff9b0ce..6d7e930 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -9,8 +9,6 @@ DEPENDS = "ncurses bison-native"
>  
>  inherit autotools gettext update-alternatives
>  
> -PARALLEL_MAKE = ""
> -
>  bindir = "/bin"
>  sbindir = "/sbin"
>  
> diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
> index e96709a..a28279e 100644
> --- a/meta/recipes-extended/bash/bash_4.2.bb
> +++ b/meta/recipes-extended/bash/bash_4.2.bb
> @@ -1,6 +1,6 @@
>  require bash.inc
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>             ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \




