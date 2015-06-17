Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0777C73E3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5HL3Znp014833 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:03:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5uyfyDYUozgR
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:03:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5HL3NJP014825
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:03:34 +0100
Message-ID: <1434575003.14710.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 22:03:23 +0100
In-Reply-To: <1434546648.14710.25.camel@linuxfoundation.org>
References: <1434546648.14710.25.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: Re: [PATCH] python: Add performance patches from upstream 2.7 branch
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
X-List-Received-Date: Wed, 17 Jun 2015 21:03:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-17 at 14:10 +0100, Richard Purdie wrote:
> These performance patches result in about a 25% speed up of our parsing
> speed with bitbake. They're already applied in 1.7 upstream and backported
> from 3.X so worth applying for 2.7 too.

Sadly, this was too good to be true. I'd messed up the test environment
and the 25% is Ubuntu's python verses the one from OE. Ubuntu's uses PGO
whereas ours does not which is likely where the speed comes from. The
patches in this series do give a small speedup, but its more like
0.5-1%. Shows that PGO is likely worth investigating further though.

Cheers,

Richard




