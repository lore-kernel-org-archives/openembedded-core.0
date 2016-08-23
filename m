Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD8CD731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7N958MH005348; Tue, 23 Aug 2016 10:05:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BAbcMQMqii1f; Tue, 23 Aug 2016 10:05:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7N956Rg005345
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Aug 2016 10:05:08 +0100
Message-ID: <1471943106.16712.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 10:05:06 +0100
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Tue, 23 Aug 2016 09:05:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-22 at 00:52 -0700, Robert Yang wrote:
> * V4
>   - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set
> vars
>     for runqemu, so all the arch info are gone. And also update
> comments
>     in qemuboot.bbclass.
>   - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
>     QB_TAP_OPT whichi is for tap mode.
>   - Print "Try 'runqemu help' on how to use it" when failed to parse
> args
>     as Nathan suggested.
>   - Fix device locking problems.
>   - Fix nativesdk-qemu-helper.
>   - Fix comments for qemurunner.py/qemutinyrunner.py

This is looking much better, thanks but we've still had some issues:

https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/870/steps/Running%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/856/steps/Running%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/870/steps/Running%20Sanity%20Tests/logs/stdio

and:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/652/steps/Running%20oe-selftest/logs/stdio

I'm also not sure what caused these, whether it was this patchset or
not:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/927/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/901/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/935

Cheers,

Richard



