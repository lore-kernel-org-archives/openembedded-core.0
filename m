Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SqXU5-00067C-F0
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 00:40:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2012 15:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122790076"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2012 15:28:54 -0700
Message-ID: <1342391327.2338.123.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 15 Jul 2012 17:28:47 -0500
In-Reply-To: <CAK18fxFZ-FdNbtc7-qMWDV4AAxUFdKJRmQDNrKkqDPQ6BL0ipQ@mail.gmail.com>
References: <CAK18fxFZ-FdNbtc7-qMWDV4AAxUFdKJRmQDNrKkqDPQ6BL0ipQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Subject: Re: Perf fail on mips
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
X-List-Received-Date: Sun, 15 Jul 2012 22:40:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-15 at 23:19 +0300, Andrei Gherzan wrote:
> Any fast ideas on this? 

There was a recent fix added to the 3.0 kernel for this problem:

    cef17a1 perf: add sgidefs.h to for mips builds

The above should have been picked up as a result of this commit:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=89008d4fedb253184d9e651243cd98fe8c29d52f

Maybe updating your sources will fix it...

Tom

> qemu mips / core-image-sato-sdk / master
> 
> 
> CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-perl.o
> 
> CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/perl/Perf-Trace-Util/Context.o
> 
> CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-python.o
> In file included
> from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:8:0,
>                  from util/scripting-engines/trace-event-python.c:22:
> /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20: error: "_ABIN32" is not defined [-Werror=undef]
> In file included
> from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyport.h:4:0,
> 
>  from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:58,
>                  from util/scripting-engines/trace-event-python.c:22:
> /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20: error: "_ABIN32" is not defined [-Werror=undef]
> cc1: all warnings being treated as errors
> 
> CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Util/Context.o
> make: ***
> [/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-python.o] Error 1
> make: *** Waiting for unfinished jobs....
> In file included
> from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:8:0,
>                  from scripts/python/Perf-Trace-Util/Context.c:22:
> /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20: error: "_ABIN32" is not defined [-Werror=undef]
> In file included
> from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyport.h:4:0,
> 
>  from /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:58,
>                  from scripts/python/Perf-Trace-Util/Context.c:22:
> /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20: error: "_ABIN32" is not defined [-Werror=undef]
> cc1: all warnings being treated as errors
> make: ***
> [/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Util/Context.o] Error 1
> make: Leaving directory
> `/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/src/kernel/tools/perf'
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile
> (see /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/temp/log.do_compile.6311 for further information)
> 
> 
> ag
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




