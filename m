Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 616526CDE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 12:33:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08CXqG1009011; Wed, 8 Jan 2014 12:33:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SRlr1gTdznUz; Wed,  8 Jan 2014 12:33:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08CXmIf008994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 12:33:49 GMT
Message-ID: <1389184423.6899.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 08 Jan 2014 12:33:43 +0000
In-Reply-To: <20140108115736.GX3709@jama>
References: <20140106112937.00B9650473@opal> <20140108115736.GX3709@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : make: upgrade to 4.0
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
X-List-Received-Date: Wed, 08 Jan 2014 12:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-08 at 12:57 +0100, Martin Jansa wrote:
> On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: f2b40e09e1d9767001f8fd9d5948ff2757491b2f
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=f2b40e09e1d9767001f8fd9d5948ff2757491b2f
> > 
> > Author: Robert Yang <liezhi.yang@windriver.com>
> > Date:   Fri Dec 27 21:46:10 2013 +0800
> > 
> > make: upgrade to 4.0
> > 
> > Upgrade to 4.0, remove the following patches since they have been fixed
> > by the upgrade:
> >  - expand_MAKEFLAGS.patch
> >  - intermediate-target-bugfix.patch
> >  - make-savannah-bug30612-fix_white_space.patch
> >  - make-savannah-bug30612-handling_of_archives.patch
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> 
> Fails to build here:
> 
> whole log:
> http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/182/consoleFull
> 
> important part:
> 
> | arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -DLOCALEDIR=\"/usr/share/locale\" -DLIBDIR=\"/usr/lib\" -DINCLUDEDIR=\"/usr/include\" -DHAVE_CONFIG_H -I.     -pthread -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0  -O2 -pipe -g -feliminate-unused-debug-types -c -o guile.o guile.c
> | In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/pthread-threads.h:33:0,
> |                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/threads.h:36,
> |                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/async.h:28,
> |                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0/libguile.h:37,
> |                  from guile.c:25:
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/bdw-gc.h:47:19: fatal error: gc/gc.h: No such file or directory
> |  #include <gc/gc.h>
> |                    ^
> | compilation terminated.
> | make[2]: *** [guile.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/make/4.0-r0/make-4.0'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/make/4.0-r0/make-4.0'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/make/4.0-r0/temp/log.do_compile.11565)
> NOTE: recipe make-4.0-r0: task do_compile: Failed

Looks like it needs a --without-guile in EXTRA_OECONF

Cheers,

Richard



