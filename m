Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8E58073559
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:22:48 +0000 (UTC)
Received: from [99.240.204.5] (port=37218 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YNeMf-0006Wc-Sh for openembedded-core@lists.openembedded.org;
	Tue, 17 Feb 2015 04:22:46 -0500
Date: Tue, 17 Feb 2015 04:22:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1502120750130.5392@localhost>
Message-ID: <alpine.LFD.2.11.1502170421230.26768@localhost>
References: <alpine.LFD.2.11.1502120750130.5392@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: Re: ncurses-native compile error -- i'm starting to blame gcc-5.0.0
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
X-List-Received-Date: Tue, 17 Feb 2015 09:22:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  anyone have any thoughts on this question i posted recently? and,
yes, i realize fedora rawhide is not an officially supported OE
distro, but surely someone else is going to run into this problem
eventually when upgrading to gcc-5.0.0.

On Thu, 12 Feb 2015, Robert P. J. Day wrote:

>
>   (posted about this on YP list earlier but i figured i might as well
> strip this down to its essentials and use pure OE to reproduce.)
>
>   on 64-bit, fully-updated fedora rawhide system, with gcc:
>
> $ gcc --version
> gcc (GCC) 5.0.0 20150208 (Red Hat 5.0.0-0.10)
> Copyright (C) 2015 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> $
>
>   using master branch of OE, i tried to build
> qemux86/core-image-minimal and got precisely the same error i reported
> on YP list:
> =====================
> gcc  -DHAVE_CONFIG_H -I../ncurses -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses -isystem/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -D_GNU_SOURCE -DNDEBUG -I. -I../include -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/../include -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -isystem/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -D_GNU_SOURCE -O2 -pipe  --param max-inline-insns-single=1200 -fPIC -c /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/base/lib_inchstr.c -o ../obj_s/lib_inchstr.o
> In file included from /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/curses.priv.h:283:0,
>                  from ../ncurses/lib_gen.c:19:
> _20141.c:835:15: error: expected ')' before 'int'
> ../include/curses.h:1594:56: note: in definition of macro 'mouse_trafo'
>  #define mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)
>                                                         ^
> gcc  -DHAVE_CONFIG_H -I../ncurses -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses -isystem/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -D_GNU_SOURCE -DNDEBUG -I. -I../include -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/../include -I/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -isystem/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/sysroots/x86_64-linux/usr/include -D_GNU_SOURCE -O2 -pipe  --param max-inline-insns-single=1200 -fPIC -c /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/base/lib_initscr.c -o ../obj_s/lib_initscr.o
> Makefile:1682: recipe for target '../obj_s/lib_gen.o' failed
> make[1]: *** [../obj_s/lib_gen.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/build/narrowc/ncurses'
> Makefile:134: recipe for target 'libs' failed
> make: *** [libs] Error 2
> make: Leaving directory '/home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/build/narrowc'
> ERROR: oe_runmake failed
> WARNING: /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/temp/run.do_compile.19602:1 exit 1 from
>   exit 1
> ERROR: Function failed: do_compile (log file is located at /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/temp/log.do_compile.19602)
> ======================
>
>   AFAIK, the selected version of ncurses (5.9) hasn't changed in quite
> some time and i've done countless builds of qemu core-image-minimal
> images over the last few months, so i'm guessing this latest version
> of gcc is doing something strange, or it's just exposing a problem in
> the ncurses source that's been hidden all this time.
>
>   has anyone else tried the above with the latest version of gcc?
> because i can't really think what else might be to blame.
>
> rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

