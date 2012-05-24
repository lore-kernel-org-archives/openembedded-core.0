Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXSpT-0007ps-3R for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 09:51:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4O7fDhE021256
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:41:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20594-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:41:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4O7f3Ha021249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:41:04 +0100
Message-ID: <1337845261.8248.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 08:41:01 +0100
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 00/28] Fixes from various corners with [1.2.1] fixes
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
X-List-Received-Date: Thu, 24 May 2012 07:51:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-23 at 21:42 -0700, Saul Wold wrote:
> Richard,
> 
> I have been building and running images from the following changes
> (not the mips64 or sh4 yet).
> 
> A number of the changes below (from Robert, Nitin and Xiaofeng) are candiates
> for 1.2.1.
> 
> The package_deb.bbclass change needs more review, I believe that Joshua also
> proposed a fix, but caused other breakage, this seems to resolve the problem, 
> but I am not sure about it.
> 
> Paul's change to add checksum does add some warnings, which I assume he or
> someone will fix shortly, they seem to be from older recipes.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
> 
>   tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Andreas Oberritter (6):
>   ppp: avoid host contamination
>   libnss-mdns: fix postinst scripts
>   wpa-supplicant: fix packaging error since last commit
>   netbase: merge init script updates from upstream
>   distutils.bbclass: don't delete .pyo files
>   python: bump PR of packages after update of distutils.bbclass
> 
> Christopher Larson (3):
>   tcmode-external-csl: preferred external-csl-toolchain's gdbserver
>   Rename 'external-csl' to 'external-sourcery'
>   external-sourcery-toolchain: ignore GNU_HASH issues with its packages
> 
> Enrico Scholz (1):
>   libtool: fixed parallel build related race
> 
> Joshua Lock (7):
>   Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
>   sanity.bbclass: copy the data store and finalise before running
>     checks
>   sanity.bbclass: data.getVar(VAR, obj, exp) -> obj.getVar(VAR, exp)
>   sanity.bbclass: add newline to check_create_long_filename failure
>     message
>   sanity.bbclass: add extra information when SSTATE_CACHE unusable
>   sanity.bbclass: catch an extra exception in
>     check_create_long_filename
>   sanity.bbclass: check sanity at BuildStarted rather than ConfigParsed
> 
> Khem Raj (5):
>   qemumips64.conf: Add machine configuration for mips64(eb)
>   qemush4.conf: Add machine configuration for qemush4

I've already replied to these, they're holding for now until the kernel
and qemu pieces are sorted out and we have an idea of what we're going
to test in OE-Core.

>   gcc-4.7: Add knowledge about arm hf dynamic loader
>   eglibc: Add ARM hf dynamic linker support
>   gcc: Grok for callconvention-hard to enable hard float
> 
> Marko Lindqvist (1):
>   package_deb.bbclass: don't handle advanced dependency marker as
>     version number


This change still makes me nervous, I think we need to find something
better. I need to reply with an idea I have on this one...

> Nitin A Kamble (1):
>   eglibc: package mtrace separately
> 
> Paul Eggleton (1):
>   classes/base: add checksum file list at parse time
> 
> Robert Yang (2):
>   package_rpm.bbclass: Fix incremental rpm image generation
>   rpm 5.4.0: respect to the arch when choose the alternatives
> 
> Xiaofeng Yan (1):
>   ncurses: Avoid occasional builling failure when having parallel
>     processable task

Other than the ones I've commented on above, I've merged these. I did so
reluctantly in some cases as I think we're just working around issues
rather than fixing them properly but I'm out of bandwidth to dive into
them and help improve the fixes :(

Cheers,

Richard



