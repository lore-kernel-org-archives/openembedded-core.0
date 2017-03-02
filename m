Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 269497302A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 08:46:34 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1cjMNY-00013z-Dg for openembedded-core@lists.openembedded.org;
	Thu, 02 Mar 2017 09:46:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 2 Mar 2017 09:46:23 +0100
Message-ID: <o98m4o$7ao$1@blaine.gmane.org>
References: <20170301195550.GE3290@jama>
	<CALbNGRTO37A-tbDj93nuNi0vu6h3fJg7Wg6P6N8asz45e8H9bg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
In-Reply-To: <CALbNGRTO37A-tbDj93nuNi0vu6h3fJg7Wg6P6N8asz45e8H9bg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2017-03-01
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
X-List-Received-Date: Thu, 02 Mar 2017 08:46:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 02-03-17 om 00:14 schreef Andreas Müller:
> On Wed, Mar 1, 2017 at 8:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>     * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base
> Before Martin blacklists gparted for dependency :)
> 
> 1. Autobuilder error log says:
> 
> | ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined
> reference to 'uuid_generate'
> | collect2: error: ld returned 1 exit status
> | Makefile:1422: recipe for target 'fs-resize' failed
> | make: *** [fs-resize] Error 1
> | make: Leaving directory
> '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/parted/3.2-r1/build/tests'
> | ERROR: Function failed: do_compile_ptest_base (log file is located
> at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/parted/3.2-r1/temp/log.do_compile_ptest_base.7114)
> 
> 2. grepping in gparted's source
> [superandy@very-old-builder parted-3.2]$ grep -r uuid_generate
> configure.ac:AC_CHECK_LIB([uuid], [uuid_generate], [UUID_LIBS="-luuid"],
> <...>
> 
> I think adding ossp-uuid to DEPENDS will do. 

Util-linux is the preferred provider for libuuid (it moved from e2fsprogs to
util-linux a few years ago).

regards,

Koen



