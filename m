Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SyNhq-0007jk-4Q
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:50:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Aug 2012 06:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="193747613"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2012 06:39:03 -0700
Message-ID: <501FC96A.8000400@intel.com>
Date: Mon, 06 Aug 2012 16:40:58 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
In-Reply-To: <20120806074542.A63C0203FD8@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Mon, 06 Aug 2012 13:50:50 -0000
Content-Type: multipart/alternative;
	boundary="------------080404090202070106030001"

--------------080404090202070106030001
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I may be recipe configuration, however, here are my steps:

 >bitbake u-boot -c cleanall
 >bitbake u-boot -c fetch
 >bitbake -c devshell u-boot

in the new shell

 >make coreboot-x86 (without _config)

The output I got is as follows:

Configuring for coreboot-x86 - Board: coreboot, Options: 
SYS_TEXT_BASE=0xFC0000
make
/bin/bash: i386-linux-gcc: command not found
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
make[1]: Entering directory 
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
Generating include/autoconf.mk
/bin/bash: line 3: i386-linux-gcc: command not found
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
Generating include/autoconf.mk.dep
/bin/bash: line 3: i386-linux-gcc: command not found
make[1]: Leaving directory 
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'
/bin/bash: i386-linux-gcc: command not found
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
make[1]: Entering directory 
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
/bin/bash: i386-linux-ld: command not found
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
/bin/bash: i386-linux-gcc: command not found
basename: missing operand
Try `basename --help' for more information.
i386-linux-gcc -DDO_DEPS_ONLY \
         -g  -Os   -ffunction-sections -fvisibility=hidden -D__KERNEL__ 
-I/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git/include 
-fno-builtin -ffreestanding -nostdinc -isystem  -pipe 
-fno-strict-aliasing -Wstrict-prototypes -mregparm=3 
-fomit-frame-pointer -ffreestanding -fno-toplevel-reorder 
-fno-stack-protector  -fno-dwarf2-cfi-asm -DREALMODE_BASE=0x7c0 
-DCONFIG_X86 -D__I386__ -march=i386 -Werror -Wall -Wstrict-prototypes 
-fno-stack-protector      \
         -o lib/asm-offsets.s lib/asm-offsets.c -c -S
/bin/bash: i386-linux-gcc: command not found
make[1]: *** [lib/asm-offsets.s] Error 127
make[1]: Leaving directory 
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'
make: *** [coreboot-x86] Error 2

However this is the same out as when I do

 >make coreboot-x86_config
 >make all

This happens only when I'm trying to build inside the devshell, which 
lead me to believe that maybe the environment is not set completely,  
until at do_compile.

radu


On 08/06/2012 10:45 AM, Wolfgang Denk wrote:
> Dear Radu,
>
> In message <501F63FF.1070401@intel.com> you wrote:
>>> Actually a plain
>>>
>>> 	make NAME
>>>
>>> does the same as "make NAME_config && make all".
>>>
>>> You might also consider running "./MAKEALL NAME" instead, which
>>> aut-adjusts to te number of available cores on the build host, so you
>>> get somewhat reduced build times.
>> I've tried to build this way but got into some errors and did not
>> pursued further in debugging them. However, because UBOOT_MACHINE is
> Could you please tell me exactly what these errors were?  Log files
> etc. highly appreciated...
>
> Best regards,
>
> Wolfgang Denk
>


--------------080404090202070106030001
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I may be recipe configuration, however, here are my steps:<br>
    <br>
    <small><font face="Droid Sans Mono">&gt;bitbake u-boot -c cleanall<br>
        &gt;bitbake u-boot -c fetch<br>
        &gt;bitbake -c devshell u-boot</font></small><br>
    <br>
    in the new shell<br>
    <br>
    <small><font face="Droid Sans Mono">&gt;make coreboot-x86 </font></small>(without
    <small><font face="Droid Sans Mono">_config</font></small>)<br>
    <br>
    The output I got is as follows:<br>
    <br>
    <small><font face="Droid Sans Mono">Configuring for coreboot-x86 -
        Board: coreboot, Options: SYS_TEXT_BASE=0xFC0000<br>
        make<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        make[1]: Entering directory
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        Generating include/autoconf.mk<br>
        /bin/bash: line 3: i386-linux-gcc: command not found<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        Generating include/autoconf.mk.dep<br>
        /bin/bash: line 3: i386-linux-gcc: command not found<br>
        make[1]: Leaving directory
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        make[1]: Entering directory
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        /bin/bash: i386-linux-ld: command not found<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        basename: missing operand<br>
        Try `basename --help' for more information.<br>
        i386-linux-gcc -DDO_DEPS_ONLY \<br>
                -g  -Os   -ffunction-sections -fvisibility=hidden
        -D__KERNEL__
        -I/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git/include
        -fno-builtin -ffreestanding -nostdinc -isystem  -pipe 
        -fno-strict-aliasing -Wstrict-prototypes -mregparm=3
        -fomit-frame-pointer -ffreestanding -fno-toplevel-reorder
        -fno-stack-protector  -fno-dwarf2-cfi-asm -DREALMODE_BASE=0x7c0
        -DCONFIG_X86 -D__I386__ -march=i386 -Werror -Wall
        -Wstrict-prototypes -fno-stack-protector      \<br>
                -o lib/asm-offsets.s lib/asm-offsets.c -c -S<br>
        /bin/bash: i386-linux-gcc: command not found<br>
        make[1]: *** [lib/asm-offsets.s] Error 127<br>
        make[1]: Leaving directory
`/home/radu/Documents/Development/yocto/build/tmp/work/qemux86-poky-linux/u-boot-2012.07-r0/git'<br>
        make: *** [coreboot-x86] Error 2<br>
      </font></small><br>
    However this is the same out as when I do<br>
    <br>
    <small><font face="Droid Sans Mono">&gt;make coreboot-x86_config<br>
        &gt;make all<br>
      </font></small><br>
    This happens only when I'm trying to build inside the devshell,
    which lead me to believe that maybe the environment is not set
    completely,  until at do_compile.<br>
    <br>
    radu<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 08/06/2012 10:45 AM, Wolfgang Denk
      wrote:<br>
    </div>
    <blockquote cite="mid:20120806074542.A63C0203FD8@gemini.denx.de"
      type="cite">
      <pre wrap="">Dear Radu,

In message <a class="moz-txt-link-rfc2396E" href="mailto:501F63FF.1070401@intel.com">&lt;501F63FF.1070401@intel.com&gt;</a> you wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">
</pre>
        <blockquote type="cite">
          <pre wrap="">Actually a plain

	make NAME

does the same as "make NAME_config &amp;&amp; make all".

You might also consider running "./MAKEALL NAME" instead, which
aut-adjusts to te number of available cores on the build host, so you
get somewhat reduced build times.
</pre>
        </blockquote>
        <pre wrap="">
I've tried to build this way but got into some errors and did not 
pursued further in debugging them. However, because UBOOT_MACHINE is 
</pre>
      </blockquote>
      <pre wrap="">
Could you please tell me exactly what these errors were?  Log files
etc. highly appreciated...

Best regards,

Wolfgang Denk

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080404090202070106030001--
