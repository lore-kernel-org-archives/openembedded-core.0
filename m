Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B03D76B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81Kdchr013692; Tue, 1 Sep 2015 21:39:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8nYF6NIlqzao; Tue,  1 Sep 2015 21:39:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81KdMWC013686
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 21:39:33 +0100
Message-ID: <1441139962.24871.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, "joshua.lock"
	<joshua.lock@collabora.co.uk>
Date: Tue, 01 Sep 2015 21:39:22 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Fido and dizzy collaboration?
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
X-List-Received-Date: Tue, 01 Sep 2015 20:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Armin, Joshua,

I've just been looking at the patches queued for the dizzy/fido
branches. In fact I ended up merging them before I realised there are
some issues.

The problem is there are dizzy patches which aren't in fido, which
breaks our policies. Could the two of you work to resolve that and give
me fido branch to pull which resolved it please?

I didn't take the dizzy patch related to S = ${WORKDIR} since that
looked more like a change appropriate to master only. The bitbake
patches also need handling on the bitbake list if we really do want to
backport them to 1.26 and 1.24.

Cheers,

Richard


