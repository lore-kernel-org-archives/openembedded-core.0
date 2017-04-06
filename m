Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 13D306612D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 00:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v370TAIu003394; 
	Fri, 7 Apr 2017 01:29:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yUtM3wjvx7f5; Fri,  7 Apr 2017 01:29:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v36Ns0Dm032743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 00:54:01 +0100
Message-ID: <1491522840.17200.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 00:54:00 +0100
In-Reply-To: <cover.1491460816.git.liezhi.yang@windriver.com>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/6] fixes for runqemu
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
X-List-Received-Date: Fri, 07 Apr 2017 00:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 23:41 -0700, Robert Yang wrote:
> The following changes since commit
> 3a1cce659156ef2654a55a6e3c6922fa2dc780e4:
> 
>   glibc: fix nativesdk ldd RTLDLIST (2017-04-05 23:22:06 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/qemu
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/q
> emu
> 
> Robert Yang (6):
>   runqemu: fix 2 typos
>   runqemu: support env vars explicitly
>   runqemu: use self.rootfs to replace self.nfs_dir
>   runqemu: run without arguments
>   runqemu: use realpath for imgdir
>   runqemu: do not rely on grepping images

Something in here breaks the use of "bitbake xxx-image -c testimage":

https://autobuilder.yocto.io/builders/nightly-arm/builds/280

[basically all sanity tests failed in that build]

Cheers,

Richard

