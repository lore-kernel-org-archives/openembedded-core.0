Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7B71C9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:28:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MASp07012877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 11:28:52 +0100
Message-ID: <1503397731.32591.80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Aug 2017 11:28:51 +0100
In-Reply-To: <CA+chaQfHU-5Jp2Q7171mcJkX8YGnFpngYG39PWeW4WhCjWp+bw@mail.gmail.com>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
	<1503397329.32591.79.camel@linuxfoundation.org>
	<CA+chaQfHU-5Jp2Q7171mcJkX8YGnFpngYG39PWeW4WhCjWp+bw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 11:28:53 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Tue, 22 Aug 2017 10:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 11:26 +0100, Martin Jansa wrote:
> I'm sorry for the issues caused by this, can you share config.log
> from that build? Maybe the native compiler on that build host doesn't
> support this option?

The one I linked to was a debian9 system, config.log says:

gcc: error: unrecognized command line option '-qversion'; did you mean '--version'?
gcc: fatal error: no input files
compilation terminated.
configure:5052: $? = 1
configure:5072: checking whether the C compiler works
configure:5094: gcc   -Wno-error=trampolines -Wno-error=expansion-to-defined   conftest.c  >&5
cc1: error: -Werror=expansion-to-defined: no option -Wexpansion-to-defined
configure:5098: $? = 1
configure:5136: result: no
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "GRUB"
| #define PACKAGE_TARNAME "grub"
| #define PACKAGE_VERSION "2.02"
| #define PACKAGE_STRING "GRUB 2.02"
| #define PACKAGE_BUGREPORT "bug-grub@gnu.org"
| #define PACKAGE_URL ""
| #define PACKAGE "grub"
| #define VERSION "2.02"
| #define GRUB_BOOT_DIR_NAME "boot"
| #define GRUB_DIR_NAME "grub"
| /* end confdefs.h.  */
| 
| int
| main (void)
| {
| 
|   ;
|   return 0;
| }
configure:5141: error: in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/x86_64-linux/grub-efi-native/2.02-r0/build':
configure:5143: error: C compiler cannot create executables
See `config.log' for more details

So yes, it doesn't understand the option.

Cheers,

Richard


