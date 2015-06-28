Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 259DD60132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 18:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SI83iK001464; Sun, 28 Jun 2015 19:08:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oSiglJ8SX71f; Sun, 28 Jun 2015 19:08:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SI7k93001461
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 28 Jun 2015 19:07:58 +0100
Message-ID: <1435514866.7287.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sun, 28 Jun 2015 19:07:46 +0100
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] perl 5.20.0 -> 5.22.0 and fix test cases
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
X-List-Received-Date: Sun, 28 Jun 2015 18:08:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 23:26 -0700, Robert Yang wrote:
> * Upgrade perl 5.20.0 -> 5.22.0
> * Tested on qemux86, qemuarm, qemuarm64, qemuppc, qemumips, qemux86-64.
> * Fix for test cases, the test result:
>   Failed 9 tests out of 2269, 99.60% okay.                                        

This series seems to cause:

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/367/steps/BuildImages/logs/stdio

on non-gplv3 builds.

Cheers,

Richard


