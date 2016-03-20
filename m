Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C5C8F60232
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Mar 2016 22:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2KMe0N4017226; Sun, 20 Mar 2016 22:40:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sALlB427Mvpo; Sun, 20 Mar 2016 22:40:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2KMebCu017272
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 20 Mar 2016 22:40:39 GMT
Message-ID: <1458513637.20442.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 20 Mar 2016 22:40:37 +0000
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/7] fixes for runqemu
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
X-List-Received-Date: Sun, 20 Mar 2016 22:40:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-03-13 at 23:52 -0700, Robert Yang wrote:
> The following changes since commit
> 9d5fa6da5ae14b26a83ec1af609d4c45944bfd44:
> 
>   cross-canadian/libgcc: fix aarch64's multilib SDK (2016-03-13
> 19:36:57 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log
> /?h=rbt/runqemu
> 
> Robert Yang (7):
>   runqemu: fix ROOTFS for vmdk
>   runqemu: simplify the checking for vm images
>   runqemu: remove ISO and RAMFS from help text
>   runqemu: add support for qcow2 and vdi
>   runqemu: simplify checking for iso and ramfs
>   runqemu-internal: cleanup unsed code
>   runqemu-internal: split the code into functions

I have a feeling one of these causes:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/
builds/426/steps/Running%20oe-selftest/logs/stdio

(the  test_qemu (oeqa.selftest.wic.Wic) failure)

Cheers,

Richard

