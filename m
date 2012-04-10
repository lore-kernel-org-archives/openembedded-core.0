Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHaNY-0001JV-J2 for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:41:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACVh2f026657
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:31:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26433-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:31:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACVXe0026647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:31:34 +0100
Message-ID: <1334061093.6861.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 13:31:33 +0100
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL [v2] 00/14] Updated with more Fixes
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
X-List-Received-Date: Tue, 10 Apr 2012 12:41:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 00:26 -0700, Saul Wold wrote:
> Richard,
> 
> Here is a second larger collection of patches from 
> the team.
> 
> This set address at least 10 of the 1.2 bugs.
> 
> Sau!
> 
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
> 
>   runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrei Gherzan (1):
>   package.bbclass: needs_ldconfig from linux_so is needed in global
>     namespace
> 
> Darren Hart (4):
>   create-pull-request: Assume remote branch from local branch
>   grub-efi: Include GPT partition EXT FS support
>   syslinux: Update distro-tracking fields
>   hello-mod: Move hello-mod from meta to meta-skeleton
> 
> Joshua Lock (1):
>   mesa-common: package gl.pc in libgl-dev
> 
> Lianhao Lu (1):
>   adt-installer: Fixed ppc kernel naming.
> 
> Martin Jansa (1):
>   gdb: add --with-libexpat-prefix
> 
> Robert Yang (2):
>   git 1.7.7: remove perl.mak before compile
>   meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
> 
> Saul Wold (1):
>   at: Fix origin location of install pam.conf from from ${P} -> ${BP}
> 
> Scott Garman (1):
>   shadow-native: disable logging to syslog
> 
> Xiaofeng Yan (1):
>   opkg: Add the condition for the content of arch.conf when enable
>     multilib
> 
> Zhai Edwin (1):
>   qemu: Fix gl failure from 64b target on 32b host

Merged to master apart from the package.bbclass change which I have a
question on in a different thread. I also wondered if the opkg change
could be improved but that is 1.3 material.

Cheers,

Richard



