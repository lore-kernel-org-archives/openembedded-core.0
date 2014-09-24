Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3031665CB2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 13:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8ODYVTe015563; Wed, 24 Sep 2014 14:34:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WQg5ycySGA9R; Wed, 24 Sep 2014 14:34:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8ODYS92015548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 24 Sep 2014 14:34:29 +0100
Message-ID: <1411565671.4189.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 24 Sep 2014 14:34:31 +0100
In-Reply-To: <5422C59E.4090107@dresearch-fe.de>
References: <54216293.4040907@dresearch-fe.de>
	<1411478501.15825.40.camel@ted> <542188F7.3080007@dresearch-fe.de>
	<1411489011.15825.47.camel@ted> <5422C59E.4090107@dresearch-fe.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Lianhao Lu <lianhao.lu@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: hash generation/PR service problem with xuser-account and other packages
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
X-List-Received-Date: Wed, 24 Sep 2014 13:34:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-24 at 15:22 +0200, Steffen Sledz wrote:
> This patch fixes the cpufreq-tweaks (from meta-angstrom) problem too. :)
> 
> So there's still linux-firmware pending from the packages i mentioned.

Actually, I pushed a patch for that last night. It was the same debug
approach as the second case I mentioned, diff the sigs and the issue
became clear.

Cheers,

Richard



