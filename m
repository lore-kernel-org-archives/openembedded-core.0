Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC9C606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4PDuNCT000880; Wed, 25 May 2016 14:56:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EqpP38s3lA3C; Wed, 25 May 2016 14:56:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4PDuI0E000874
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 May 2016 14:56:19 +0100
Message-ID: <1464184578.9570.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
Date: Wed, 25 May 2016 14:56:18 +0100
In-Reply-To: <7091d7d0-b03c-2dfd-eee9-d160f3a944a2@windriver.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
	<9a16a18f-9178-231d-6c78-ccdc4cdf51a2@windriver.com>
	<7091d7d0-b03c-2dfd-eee9-d160f3a944a2@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Wed, 25 May 2016 13:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 09:31 -0400, Bruce Ashfield wrote:
> Hmm. Are we somehow building different SRCREVs ? I'm able to build
> the
> ppc kernel with gcc6:
> 
> yow-bashfiel-d4 [/home/bruc...dard-build]> ls -alF vmlinux
> -rwxr-xr-x 1 bruce bruce 115353128 May 25 09:12 vmlinux*
> yow-bashfiel-d4 [/home/bruc...dard-build]> pwd
> /home/bruce/poky/build/tmp/work/qemuppc-poky-linux/linux
> -yocto/4.4.11+gitAUTOINC+6ec93aaa70_628bf62756-r0/linux-qemuppc
> -standard-build
> yow-bashfiel-d4 [/home/bruc...dard-build]> ls -alF vmlinux
> -rwxr-xr-x 1 bruce bruce 115353128 May 25 09:12 vmlinux*
> yow-bashfiel-d4 [/home/bruc...dard-build]> strings vmlinux | grep
> "gcc 
> version"
> %s version %s (bruce@yow-bashfiel-d4) (gcc version 6.1.1 20160511
> (GCC) ) %s
> Linux version 4.4.11-yocto-standard (bruce@yow-bashfiel-d4) (gcc
> version 
> 6.1.1 20160511 (GCC) ) #1 PREEMPT Wed May 25 09:12:02 EDT 2016

The autobuilder failure is here:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
07/steps/BuildImages_1/logs/stdio

which shows:

4.4.11+gitAUTOINC+6ec93aaa70_df00877ef9-r0

so yes, we're not seeing the same latter revision. The next obvious
question is why, have I missed a patch?

Cheers,

Richard

