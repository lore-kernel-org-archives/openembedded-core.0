Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QenyZ-00043f-Pk for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:46:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CgnJP027911
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:42:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27474-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 13:42:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67Cghxe027905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:42:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309894692-15230-4-git-send-email-aalonso@secretlab.ca>
References: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
	<1309894692-15230-4-git-send-email-aalonso@secretlab.ca>
Date: Thu, 07 Jul 2011 13:42:07 +0100
Message-ID: <1310042527.20015.827.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/4] tclibc-glibc: add weak assigment to TARGET_OS
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
X-List-Received-Date: Thu, 07 Jul 2011 12:46:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:38 -0500, Adrian Alonso wrote:
> * Add weak assigment to TARGET_OS variable so it can be
>   overrided to match external toolchain tripplets.
> * Toolchain prefix is expanded from
>   TARGET_SYS = TARGET_ARCH + TARGET_VENDOR + TARGET_OS
> 
> Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
> ---
>  meta/conf/distro/include/tclibc-glibc.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index 5e7afc1..997fc11 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -2,7 +2,7 @@
>  # glibc specific configuration
>  #
>  
> -TARGET_OS = "linux"
> +TARGET_OS ?= "linux"
>  TARGET_OS_arm = "linux-gnueabi"
>  TARGET_OS_armeb = "linux-gnueabi"
>  TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"

I've merged the first three patches, thanks. This one makes me nervous
as TARGET_OS has traditionally been a problematic variable and ?= hasn't
always done what you'd expect. This therefore needs a bit more testing
and investigation before we can merge it as I think there could be
problems exposed...

Cheers,

Richard



