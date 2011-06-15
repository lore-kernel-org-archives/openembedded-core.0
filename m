Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWmZz-0008Ka-Fh for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 11:40:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9adqS024947;
	Wed, 15 Jun 2011 10:36:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24800-04; Wed, 15 Jun 2011 10:36:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9aWm2024941
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 15 Jun 2011 10:36:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308110508.git.bruce.ashfield@windriver.com>
References: <cover.1308110508.git.bruce.ashfield@windriver.com>
Date: Wed, 15 Jun 2011 10:36:31 +0100
Message-ID: <1308130591.15712.371.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update meta branch SRCREV
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
X-List-Received-Date: Wed, 15 Jun 2011 09:40:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 00:05 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> The patch really says it all, so I'm repeating it here:
> 
> [    
>   Updating the meta SRCREV to fix a bad commit which resulted in the
>   tree being dirty after checkpoint, and hence a failure during the
>   patch phase. The meta commits never modify code outside the 'meta'
>   directory tree, a rule that was broken with this bad commit.
> 
>   Without this fix, you may see an error like:
> 
>   | [INFO] doing kernel configme
>   | [INFO] Finding user(s) of branch "yocto/standard/fsl-mpc8315e-rdb"
>   | [INFO] Branch meta-temp used by fsl-mpc8315e-rdb-standard.scc
>   | [INFO] collecting configs in ./meta/meta-series
>   | [INFO] checking out yocto/standard/fsl-mpc8315e-rdb
>   | error: Your local changes to the following files would be overwritten by checkout:
>   | 	arch/powerpc/boot/dts/mpc8315erdb.dts
>   | Please, commit your changes or stash them before you can switch branches.
>   | Aborting
>   | [ERROR] Checkout of yocto/standard/fsl-mpc8315e-rdb failed
>   | Error running the meta series for collecting config data
>   | config of meta-temp (fsl-mpc8315e-rdb-standard.scc) failed
> ]
> 
> The linux-yocto tree was fixed a few days ago, and the dust has settled
> enough (I hope) on the recipe renames that this can now go out.
> 
> The following changes since commit 7aa7673459376aff911cef820c9417c998d1aa96:
>   Bruce Ashfield (1):
>         meta-yocto/linux-yocto: update to match the renamed linux-yocto recipes
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto: update meta branch SRCREV

Merged to master, thanks.

Richard



