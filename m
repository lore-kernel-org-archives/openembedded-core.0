Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Swvox-0000mc-6h for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 15:52:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72DeSlf008521;
	Thu, 2 Aug 2012 14:40:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05020-06; Thu,  2 Aug 2012 14:40:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72DeJXS008511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Aug 2012 14:40:20 +0100
Message-ID: <1343914820.9756.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 14:40:20 +0100
In-Reply-To: <501A43F2.7020209@communistcode.co.uk>
References: <501A43F2.7020209@communistcode.co.uk>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Qemu refusing to build
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
X-List-Received-Date: Thu, 02 Aug 2012 13:52:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 10:10 +0100, Jack Mitchell wrote:
> I am having an issue trying to build qemu for the qemuarm machine. It's 
> just a standard core-image-minimal with a vanilla copy of poky master. 
> The error log is as follows:
> 
>     /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
>     ---------------------------------------------------------------------------
>     DEBUG: Executing python function sysroot_cleansstate
>     DEBUG: Python function sysroot_cleansstate finished
>     DEBUG: Executing shell function do_configure
>     /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/run.do_configure.1062:
>     line 86:
>     /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1/configure:
>     No such file or directory
>     ERROR: Function failed: do_configure (see
>     /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
>     for further information)
> 
> 
> That is all I get, and the build just fails. I'm not sure where to even 
> start debugging this...

Does the file:

/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1/configure

exist? Can you execute it? Does
running /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/run.do_configure.1062 give the same error? You can try and pin this down to a specific command failing, it could be something in the configure script itself that is erroring, its hard to tell from just the above.

Cheers,

Richard





