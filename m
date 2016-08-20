Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B2205736B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 20:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7KK9eqs021349; Sat, 20 Aug 2016 21:09:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KWl6uH0vDcxx; Sat, 20 Aug 2016 21:09:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7KK9cJB021345
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 20 Aug 2016 21:09:39 +0100
Message-ID: <1471723778.16712.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2016 21:09:38 +0100
In-Reply-To: <cover.1471589537.git.liezhi.yang@windriver.com>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V3 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Sat, 20 Aug 2016 20:09:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-18 at 23:55 -0700, Robert Yang wrote:
> * V3 
>   - Move the qemu boot settings out of tune files (e.g., arch
> -x86.inc)
>     to avoid mixing BSP settings with the tunings as Mark suggested.
> and
>     put them to <machine>.conf or <qemuboot>.inc file.

I tried pulling this into master-next and testing on the autobuilder.
It seems there is a problem with the networking and device
locking/allocation:

https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/8
55/steps/Running%20Sanity%20Tests/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds
/531

[and many others]

Also a problem with runqemu-internal being removed:

https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/bu
ilds/886/steps/BuildImages/logs/stdio

Cheers,

Richard

