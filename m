Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJNOj-0000Wb-K6 for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 13:13:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FB4ETa020635
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:04:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18284-04 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:04:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FB45ZX020629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:04:06 +0100
Message-ID: <1334487847.16992.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 15 Apr 2012 12:04:07 +0100
In-Reply-To: <4F8AA8C8.2080507@windriver.com>
References: <4F8AA8C8.2080507@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: meta-toolchain-sdk: unfs-server buid error
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
X-List-Received-Date: Sun, 15 Apr 2012 11:13:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-04-15 at 18:54 +0800, Robert Yang wrote:
> Hi all,
> 
> Does anyone meet the same error? I've met this from yesterday.
> 
> The host is Fedora 16 64bit,
> MACHINE = "qemuarm"
> 
> $ bitbake meta-toolchain-sdk
> 
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint 
> -I/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
> /buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/
> | autoreconf: Entering directory `.'
> | autoreconf: configure.in: not using Gettext
> | autoreconf: running: aclocal -I 
> /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
> /buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
> -I /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
> /buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
> --force --warnings=cross
> | aclocal: unknown warning category `cross'
> | autoreconf: configure.in: tracing
> | autoreconf: configure.in: not using Libtool
> | autoreconf: running: 
> /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/bin/autoconf 
> --include=/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 
> --include=/buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
> --force --warnings=cross
> | configure.in:43: error: possibly undefined macro: AC_PROG_RPCGEN
> |       If this token and others are legitimate, please use m4_pattern_allow.
> |       See the Autoconf documentation.
> | configure.in:44: error: possibly undefined macro: AC_RPCGEN_C
> | configure.in:45: error: possibly undefined macro: AC_RPCGEN_I
> | configure.in:53: error: possibly undefined macro: AC_GNULIBC
> | configure.in:65: error: possibly undefined macro: AC_XDRPROC_T
> | configure.in:85: error: possibly undefined macro: AC_AUTHDES_GETUCRED
> | configure.in:86: error: possibly undefined macro: AC_BROKEN_SETFSUID
> | configure.in:87: error: possibly undefined macro: AC_MOUNTLIST
> | configure.in:88: error: possibly undefined macro: AC_FSUSAGE
> | configure.in:91: error: possibly undefined macro: AC_BSD_SIGNALS
> | autoreconf: /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/bin/autoconf 
> failed with exit status: 1
> | ERRO
> NOTE: package unfs-server-nativesdk-2.1+2.2beta47-r1: task do_configure: Failed
> ERROR: Task 1036 
> (virtual:nativesdk:/buildarea/lyang1/poky/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb, 
> do_configure) failed with exit code '1'

This is from bug 2194. Clean unfs-server-nativesdk and the build will
work again.

Cheers,

Richard




