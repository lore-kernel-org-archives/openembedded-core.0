Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SwtY9-0005by-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 13:26:42 +0200
Received: from rrcs-24-227-210-218.sw.biz.rr.com ([24.227.210.218]:36248
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SwtMu-0004jQ-CQ; Thu, 02 Aug 2012 07:15:04 -0400
Date: Thu, 2 Aug 2012 06:15:00 -0500 (CDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.DEB.2.02.1208020605550.2542@oneiric>
Message-ID: <alpine.DEB.2.02.1208020613210.2627@oneiric>
References: <alpine.DEB.2.02.1208011831540.5168@oneiric>
	<CAEsOVNfHoY3gbwJoVCUfS61LeN_idZpNMtU3aOmZLVs7=BDQmA@mail.gmail.com>
	<alpine.DEB.2.02.1208011855500.26345@oneiric>
	<CABcZANkSy37E3DFWH6n53sbG-7nPzOzBBfPp2JOqRzhyPS=erQ@mail.gmail.com>
	<alpine.DEB.2.02.1208012004070.4406@oneiric>
	<CABcZANmZ=A+BJSTvnhHHaChzn=4t9yXKJmHhO4xistaOga5Gdw@mail.gmail.com>
	<alpine.DEB.2.02.1208020605550.2542@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: using an external (arm) toolchain - just checking i did this properly
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
X-List-Received-Date: Thu, 02 Aug 2012 11:26:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 2 Aug 2012, Robert P. J. Day wrote:

>
>   here's a summary of the eglibc config error i'm having trying to
> bake a core-image-minimal for qemuarm on a fully-updated 64-bit ubuntu
> 12.04 system using code sourcery's arm toolchain..
>
>   here's what i've added to the top of my local.conf:
>
> TCMODE = "external-sourcery"
> EXTERNAL_TOOLCHAIN = "/home/rpjday/CodeSourcery/Sourcery_G++_Lite"
> NO32LIBS = "0"
>
> when i run "bitbake core-image-minimal", the configure of eglibc
> fails, and i've attached the config.log file, of which this would
> appear to be the salient bit:
>
> ... snip ...
> In file included from
> /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include-fixed/syslimits.h:7,
>                  from
> /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include-fixed/limits.h:11,
>                  from conftest.c:10:
> /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include-fixed/limits.h:122:61:
> error: limits.h: No such file or directory
> configure:3102: $? = 1
> configure: failed program was:
> | /* confdefs.h */
> | #define PACKAGE_NAME "GNU C Library"
> | #define PACKAGE_TARNAME "glibc"
> | #define PACKAGE_VERSION "(see version.h)"
> | #define PACKAGE_STRING "GNU C Library (see version.h)"
> | #define PACKAGE_BUGREPORT "http://sourceware.org/bugzilla/"
> | #define PACKAGE_URL "http://www.gnu.org/software/glibc/"
> | /* end confdefs.h.  */
> | #ifdef __STDC__
> | # include <limits.h>
> | #else
> | # include <assert.h>
> | #endif
> |                    Syntax error
>
>   that same error, unsurprisingly, occurs more than once.  i'm using a
> fully up-to-date (git pulled) oe-core and bitbake.  i'm going to
> wander off and find some coffee before digging into this, so i'm open
> to advice.

  oh, wait, this looks like it might be informative:

http://www.mail-archive.com/meta-ti@yoctoproject.org/msg00391.html

i will investigate further.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


