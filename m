Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ssr7S-0002iA-4H for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 10:02:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M7p1BY026633
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 08:51:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19932-06 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 08:50:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M7oiYG026627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 08:50:47 +0100
Message-ID: <1342943447.21788.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 08:50:47 +0100
In-Reply-To: <alpine.DEB.2.02.1207211747410.15197@oneiric>
References: <alpine.DEB.2.02.1207211747410.15197@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: "bitbake -v core-image-minimal" for qemuarm hangs on building qemu
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
X-List-Received-Date: Sun, 22 Jul 2012 08:02:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-21 at 17:56 -0400, Robert P. J. Day wrote:
> sadly, i must run off for socializing so i can't debug for a few
> hours but, from scratch, i tried to build a core-image-minimal for
> qemuarm on my 64-bit, fully-updated ubuntu 12.04 system, and for the
> second straight time, it's hung at:
> 
> NOTE: package qemu-native-0.15.1-r9: task do_populate_sysroot: Succeeded
> NOTE: Running noexec task 1194 of 1561 (ID: 71, virtual:native:/home/rpjday/oe/oe-core/meta/recipes-devtools/qemu/qemu_0.15.1.bb, do_build)
> 
> (hang)
> 
>   i've configured for 4 threads and that level of parallel make.  this
> has always worked before.  i have a fully git-pulled oe-core and
> bitbake.
> 
>   "top" shows a couple git processes running, but i've configured
> local.conf to allow fetching from the network so i'm not sure what
> it's after, if that's the issue.
> 
>   i'm sure it's something annoyingly simple.  back in a while.

Have you the full log (see tmp/cooker.log*)? The above says what ran but
not what is currently running. If you hit ctrl+c, you should see which
task was hanging. Was it gthumb?

Cheers,

Richard



