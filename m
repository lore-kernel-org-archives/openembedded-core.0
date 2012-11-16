Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TZRMP-00023F-5O for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 20:13:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TZR92-0008AW-9G for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 20:00:04 +0100
Received: from 75-94-142-70.sfo.clearwire-wmx.net
	([75-94-142-70.sfo.clearwire-wmx.net])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 20:00:04 +0100
Received: from ruslan by 75-94-142-70.sfo.clearwire-wmx.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 20:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ruslan Babayev <ruslan@babayev.com>
Date: Fri, 16 Nov 2012 18:57:41 +0000 (UTC)
Message-ID: <loom.20121116T195308-35@post.gmane.org>
References: <1349156215-16686-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1soLwgEoyR0RkYLpjsGGNi07gLsjVcZtzbR=arHuGt9wbg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 75.94.142.70 (Mozilla/5.0 (Macintosh;
	Intel Mac OS X 10_8_2) AppleWebKit/536.26.17 (KHTML, like Gecko)
	Version/6.0.2 Safari/536.26.17)
Subject: Re: [PATCH] binutils-crossdk: Fix interp size expansion
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
X-List-Received-Date: Fri, 16 Nov 2012 19:13:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj <raj.khem@...> writes:

> 
> i need to check it with 1 more case. Please hold on for applying it. I
> welcome testing
> 

I tried 'bitbake meta-toolchain' with poky danny branch.
Your patch fixes the following eror in nativesdk-eglibc-2.16-r15+svnr20393

built in linker script:11 cannot move location counter backwards
(from 0000000000401048 to 0000000000401000)
collect2: error: ld returned 1 exit status

But now I get:

..tmp/work/x86_64-nativesdk-pokysdk-linux/
nativesdk-qemu-1.2.0-r3/qemu-1.2.0/x86_64.ld:9 
cannot move location counter backwards (from 0000000060001048
 to 0000000060001000)
collect2: error: ld returned 1 exit status






