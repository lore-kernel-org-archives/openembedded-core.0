Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3015773217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NN6tOR019531; Fri, 24 Jul 2015 00:06:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NOlcxj5eWCGo; Fri, 24 Jul 2015 00:06:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NN6f3h019526
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Jul 2015 00:06:52 +0100
Message-ID: <1437692801.821.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 24 Jul 2015 00:06:41 +0100
In-Reply-To: <55B171F3.4010009@mlbassoc.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
	<55B16CF0.80405@mlbassoc.com>
	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>
	<55B171F3.4010009@mlbassoc.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Thu, 23 Jul 2015 23:07:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-23 at 17:00 -0600, Gary Thomas wrote:
> It's an old host (Fedora 13) that I am unable to upgrade, but it still
> works quite well.  I get around most of the Yocto/bitbake worries by
> using a Yocto-built meta-toolchain to fill in the blanks (correct make,
> python2, etc), but python3 is not part of the meta-toolchain :-(

You could likely build a customised meta-toolchain which did contain
python3 though?

Cheers,

Richard


