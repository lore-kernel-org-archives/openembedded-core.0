Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QE7Uv-0000dA-Sx for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 00:09:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM79a3001441;
	Sun, 24 Apr 2011 23:07:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00849-10; Sun, 24 Apr 2011 23:07:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM6ruZ001399
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 24 Apr 2011 23:06:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1fb84f7adb3291debd163d273be1555bb77b5447.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<1fb84f7adb3291debd163d273be1555bb77b5447.1303539961.git.sgw@linux.intel.com>
Date: Sun, 24 Apr 2011 22:46:52 +0100
Message-ID: <1303681612.5518.375.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 35/37] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Sun, 24 Apr 2011 22:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-22 at 23:29 -0700, Saul Wold wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/tasks/task-base.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
> index 599fa4b..af49153 100644
> --- a/meta/recipes-core/tasks/task-base.bb
> +++ b/meta/recipes-core/tasks/task-base.bb
> @@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi = "\
>      acpid \
>      libacpi "
>  
> +# Distro can override apm provider
> +DISTRO_APM ?= "apm"
> +
>  RDEPENDS_task-base-apm = "\
> -    apm \
> +    ${DISTRO_APM} \
>      apmd"

I think I replied about this one previously and Martin suggested we use
a different VIRTUAL* name for the variable. I'd appreciate doing that as
DISTRO* is an overloaded namespace. Can someone repsin the patch
please? :)

Cheers,

Richard



