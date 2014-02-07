Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 14D136E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 17:22:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s17HMfRk021206; Fri, 7 Feb 2014 17:22:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xYa76JyCNzZb; Fri,  7 Feb 2014 17:22:41 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s17HMYea021196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 7 Feb 2014 17:22:35 GMT
Message-ID: <1391793748.32614.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 07 Feb 2014 17:22:28 +0000
In-Reply-To: <cover.1391791450.git.sgw@linux.intel.com>
References: <cover.1391791450.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Consolidated Pull 00/21] Various Patches & some updates
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
X-List-Received-Date: Fri, 07 Feb 2014 17:22:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-02-07 at 08:55 -0800, Saul Wold wrote:
> This patch set has been through the Autobuilder, the current failures
> related to the kernel update as we had a clean master build prior to this.

I'm not 100% convinced exactly which patches in the test build called
which failures.

> The following changes since commit cda502815c6acf789e1a0db7a7a1a7015b4ef71d:
> 
>   build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81583cc34c2ff555 (2014-02-06 15:36:47 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Alexandre Belloni (1):
>   matchbox-keyboard: daemonize launch

I'd keep meaning to ask someone about this, I'm not 100% sure its the
right thing to do or if there is another underlying issue which should
be fixed instead.

> Bruce Ashfield (1):
>   kernel: stop using -exec rm for deleting files

Did this trigger some of those failures?

> Chen Qi (1):
>   initscripts: add initscripts-functions-dev package

This is horrid, we need to fix the root problems, not hack around it.

> Chong Lu (2):
>   acl: enable ptest support
>   attr: enable ptest support
> 
> Cristian Iorga (2):
>   sbc: upgrade to 1.2
>   bluez5: upgrade to 5.14
> 
> Fathi Boudra (1):
>   systemtap: add aarch64 support
> 
> Jason Plum (1):
>   meta/oe/lib/path.py - check mount points, not device

This will kill performance. I'd like to understand which paths can get
split over mounts. I suspect the end result is we'd not support such
split mounts. Or we need two functions, one which is mount safe and one
which is not.

> Kai Kang (1):
>   eglibc-dbg: provides libc6-dbg

No, see Phil's comments.

> Khem Raj (1):
>   ossp-uuid: Use alternative source mirror
> 
> Koen Kooi (3):
>   systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
>   openssh: package sshd PAM config inside openssh-sshd package
>   openssh: drag in required PAM modules.
> 
> Martin Jansa (1):
>   package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
>     shlib providers

See Martin's comment, we need to fix this one in a better way.

> Paul Eggleton (1):
>   classes/populate_sdk_base: remove nostamp from do_populate_sdk
> 
> Randy MacLeod (1):
>   jpeg and directfb: cosmetic, fix perms for patches
> 
> Saul Wold (1):
>   rootfs_deb: Fix whitespace issue
> 
> Stefan Stanacar (3):
>   testimage: add ability to export tests
>   lib/oeqa: add module for running tests outside of the build system
>   oeqa/utils: targetbuild: don't use bb.fetch anymore

Cheers,

Richard


