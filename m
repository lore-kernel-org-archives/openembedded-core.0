Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLynM-00059A-QN for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 16:29:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEQJ3p020272;
	Mon, 16 May 2011 15:26:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20015-05; Mon, 16 May 2011 15:26:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEQB01020266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 May 2011 15:26:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7ff23718bcda1a8b46a60373eb12463e0b7745d7.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
	<7ff23718bcda1a8b46a60373eb12463e0b7745d7.1305422996.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 15:26:10 +0100
Message-ID: <1305555970.3424.80.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 14/15] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Mon, 16 May 2011 14:29:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> THis fixes following issue:
> 
> NOTE: Runtime target 'glibc-utilsglibc-utils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-utilsglibc-utils']
> NOTE: Runtime target 'task-core-nfs-server' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['task-core-nfs-server', 'glibc-utilsglibc-utils']
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-core/tasks/task-core-nfs.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/tasks/task-core-nfs.bb
> index d5d8291..087f4f0 100644
> --- a/meta/recipes-core/tasks/task-core-nfs.bb
> +++ b/meta/recipes-core/tasks/task-core-nfs.bb
> @@ -20,7 +20,7 @@ RDEPENDS_task-core-nfs-server = "\
>      nfs-utils"
>  
>  # rpcinfo can be useful but only with glibc images
> -GLIBC_DEPENDENCIES = "glibc-utils"
> +GLIBC_DEPENDENCIES = " glibc-utils"
>  
>  RRECOMMENDS_task-core-nfs-server_append_linux = "${GLIBC_DEPENDENCIES}"
>  RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi = "${GLIBC_DEPENDENCIES}"

This is the wrong place to be adding the space. The space issue is
coming from the _append in the lines below and the space should
therefore be added there to make it clear why its there.

Cheers,

Richard



