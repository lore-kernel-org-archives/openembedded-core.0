Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Si1Zv-0006RC-8e
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 12:59:03 +0200
Received: from [192.168.0.46] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 0B10C601C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 11:48:10 +0100 (BST)
Message-ID: <4FE44DB0.7020703@communistcode.co.uk>
Date: Fri, 22 Jun 2012 11:49:20 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE44C1C.2050301@communistcode.co.uk>
In-Reply-To: <4FE44C1C.2050301@communistcode.co.uk>
Subject: Re: libpcre build failure - using host system libs?
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
X-List-Received-Date: Fri, 22 Jun 2012 10:59:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/12 11:42, Jack Mitchell wrote:
> Ok, so it seems today isn't my day. Along with the sgml-common I have 
> now come across another issue:
>
>     [jack@archHP ~]$ cat
>     /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/temp/log.do_compile.21828
>     DEBUG: Executing shell function do_compile
>     ERROR: Function failed: do_compile (see
>     /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/temp/log.do_compile.21828
>     for further information)
>     NOTE: make CC_FOR_BUILD=gcc  CFLAGS_FOR_BUILD=-DLINK_SIZE=2
>     -I/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/pcre-8.30/include
>     LINK_FOR_BUILD=gcc
>     -L/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/pcre-8.30/lib
>     make  all-am
>     make[1]: Entering directory
>     `/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/pcre-8.30'
>     ./x86_64-linux-libtool  --tag=CXX   --mode=link g++
>     -isystem/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/include
>     -O2 -pipe -version-info 0:0:0
>     -L/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -L/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     -Wl,-rpath-link,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -Wl,-rpath-link,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     -Wl,-rpath,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -Wl,-rpath,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     -Wl,-O1 -o libpcrecpp.la -rpath
>     /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     pcrecpp.lo pcre_scanner.lo pcre_stringpiece.lo libpcre.la
>     x86_64-linux-libtool: link: g++  -fPIC -DPIC -shared -nostdlib
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../../../lib/crti.o
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/crtbeginS.o
>     .libs/pcrecpp.o .libs/pcre_scanner.o .libs/pcre_stringpiece.o  
>     -Wl,-rpath
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/pcre-8.30/.libs
>     -Wl,-rpath
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -L/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -L/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     ./.libs/libpcre.so -L/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0
>     -L/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../../../lib
>     -L/lib/../lib -L/usr/lib/../lib
>     -L/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../.. -lstdc++
>     -lm -lc -lgcc_s
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/crtendS.o
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../../../lib/crtn.o
>     -O2 -Wl,-rpath-link
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -Wl,-rpath-link
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     -Wl,-rpath
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/lib
>     -Wl,-rpath
>     -Wl,/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/lib
>     -Wl,-O1   -Wl,-soname -Wl,libpcrecpp.so.0 -o .libs/libpcrecpp.so.0.0.0
>     g++: error:
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../../../lib/crti.o: No
>     such file or directory
>     g++: error:
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/crtbeginS.o: No such
>     file or directory
>     g++: error: /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/crtendS.o:
>     No such file or directory
>     g++: error:
>     /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.0/../../../../lib/crtn.o: No
>     such file or directory
>     make[1]: *** [libpcrecpp.la] Error 1
>     make[1]: Leaving directory
>     `/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/libpcre-native-8.30-r2/pcre-8.30'
>     make: *** [all] Error 2
>     ERROR: oe_runmake failed
>
>
>
> This seems to me like it is looking in my host distribution for the 
> require files and therefore can't find them? For starters I think I 
> know why it can't find them as my host uses GCC 4.7.1.
>
> So, first off is it meant to be using host system files, and second 
> why has it not picked up my new GCC version?
>
> Regards,
> -- 
>
>    Jack Mitchell (jack@embed.me.uk)
>    Embedded Systems Engineer
>    http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Ok, so it looks as if it isn't meant to be using host system files as 
this function shows:

do_compile () {
   # stop libtool from trying to link with host libraries - fix from #33
   # this resolve build problem on amd64 - #1015
   if [ -e ${S}/${HOST_SYS}-libtool ] ; then
     sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
   else
     ln -sf ${S}/libtool ${S}/${HOST_SYS}-libtool
     sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
   fi

   # The generation of dftables can lead to timestamp problems with ccache
   # because the generated config.h seems newer.  It is sufficient to 
ensure that the
   # attempt to build dftables inside make will actually work 
(foo_FOR_BUILD is
   # only used for this).
   oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 
-I${S}/include" LINK_FOR_BUILD="${BUILD_CC} -L${S}/lib"
}

So it's something that has been tried to fix but maybe I've just hit a 
corner case. My machine is 64bit.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



