Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1US1M1-0006yZ-W4 for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 10:35:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3G8HlHg020603; Tue, 16 Apr 2013 09:17:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JF4E8p-JXFce; Tue, 16 Apr 2013 09:17:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3G8HgZK020593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 09:17:43 +0100
Message-ID: <1366100234.8670.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Tue, 16 Apr 2013 09:17:14 +0100
In-Reply-To: <516D0783.8040608@communistcode.co.uk>
References: <4914614.5LoTVAGS7p@yiqingliang-pc>
	<516D0783.8040608@communistcode.co.uk>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc compile error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 08:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 09:10 +0100, Jack Mitchell wrote:
> On 16/04/13 05:38, Yi Qingliang wrote:
> > hello, i'm using archlinux, the gcc is 4.8.0.
> >
> > when compiling gcc 4.7.2 in oe, I got the error:
> >
> > | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> > r19/gcc-4.7.2/libgcc/libgcc2.c: In function '__absvdi2':
> > | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> > r19/gcc-4.7.2/libgcc/libgcc2.c:273:1: internal compiler error: Segmentation
> > fault
> >
> >
> >
> 
> Hi,
> 
> Many people have run into this problem so far (myself included) and I 
> have been told it is the fault of the ArchLinux GCC. Now, I noticed the 
> ArchLinux devs pushed a new build of GCC out yesterday, have you tried 
> upgrading to that yet and giving it another go?
> 
> If not, my solution was to move to GCC 4.8 using the patches posted to 
> oe-core/oe-dev.

We're a bit stuck on this one since the host gcc is segfaulting. This is
very clearly something the host gcc should not do and there is little we
can do to fix it. The gcc 4.8 codebase doesn't trigger the fault, only
the earlier ones like 4.7.

There is an open bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4248

Cheers,

Richard




