Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QU37u-0002Lx-55 for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 22:43:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KeWMa023379
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:40:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23045-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2011 21:40:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KeSeD023372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:40:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Date: Tue, 07 Jun 2011 21:40:23 +0100
Message-ID: <1307479223.15712.61.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/20] 05-June-2011
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
X-List-Received-Date: Tue, 07 Jun 2011 20:43:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
> This pulls together a set of changes from the later
> part of last week, these have been built. I have updated
> Nitin's comment about the License change (which was adding
> years).
> 
> This also includes Scott's User Addition code.
> 
> I did not pull Bruce's change due to a known build issue
> with x86-64, I am expecting an update from him.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 2a52f806f3789f717219651b97dc64fec3881f7f:
> 
>   qmake_base.bbclass: fix lrelease/lupdate binary names (2011-06-02 18:26:19 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Khem Raj (2):
>   allarch.bbclass: Define BASE_PACKAGE_ARCH = "all"
>   util-linux_2.19.1.bb: Fix compliation on uclibc
> 
> Martin Jansa (1):
>   base.bbclass: add cleansstate task between clean and cleanall
> 
> Nitin A Kamble (3):
>   m4: upgrade from 1.4.15 to 1.4.16
>   autoconf: upgrade from 2.65 to 2.68
>   bison: upgrade from 2.4.3 to 2.5
> 
> Otavio Salvador (4):
>   gnutls: use INC_PR on 2.12.5 version recipe
>   gnutls: add p11tool into gnutls-bin
>   package.bbclass: add support to split Qt translation files
>   xf86-driver-common.inc: remove .la files to avoid unpackaged warning
> 
> Phil Blundell (1):
>   gcc-package-cross: also install the symlinks in libexec with target
>     prefix
> 
> Saul Wold (2):
>   bitbake.conf: Create staticlibs pacakge for static libraries
>   tzcode: Update to 2011g
> 
> Scott Garman (7):
>   shadow: recipe and patch cleanup
>   shadow: add a -native recipe with customized utilities
>   base-passwd: populate the target sysroot with passwd/group/login.defs
>   useradd.bbclass: new class for managing user/group permissions
>   useradd-example: example recipe for using inherit useradd
>   bitbake.conf: set PSEUDO_PASSWD within FAKEROOTENV
>   package_rpm.bbclass: make RPM use on-disk permissions

I merged these except in the two cases where feedback was given or in
the case of the useradd* commits from Scott as I need more time to
review those.

Cheers,

Richard



