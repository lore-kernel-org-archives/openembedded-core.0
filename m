Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1bzW-0002cd-QM for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 12:10:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QB1kcq011860;
	Sun, 26 Feb 2012 11:01:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09556-09; Sun, 26 Feb 2012 11:01:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QB1ass011854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 26 Feb 2012 11:01:37 GMT
Message-ID: <1330254097.13788.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Feb 2012 11:01:37 +0000
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: fcooper@ti.com
Subject: Re: [PATCHv2 0/5] Pending patches
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
X-List-Received-Date: Sun, 26 Feb 2012 11:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-02-26 at 08:48 +0100, Martin Jansa wrote:
> Patch 0003 depends on
> http://patchwork.openembedded.org/patch/22047/
> 
> 0001 wasn't changed from v1, but still does apply.
> 
> 0004/0005 is the same as I've sent as single patches to ML before.
> 
> The following changes since commit c44e51f281101c8933679f679e3d4a75a41bedf7:
> 
>   initscripts: mount and unmount cifs network filesystems (2012-02-24 23:25:33 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Eric BENARD (1):
>   gdb-cross-canadian: build gdb with python support
> 
> Martin Jansa (4):
>   bitbake.conf: use weak assignment for BB_CONSOLELOG
>   bitbake.conf: remove TARGET_ARCH from in SDKPATH
>   sstatesig: add SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS option to exclude well
>     defined recipe->dependency
>   layer.conf: add keymaps to SIGGEN_EXCLUDERECIPES_ABISAFE

Merged to master, thanks.

Richard



