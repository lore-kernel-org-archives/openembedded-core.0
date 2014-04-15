Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 99380609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 18:45:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3FIjEIn007191; Tue, 15 Apr 2014 19:45:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fx2QrvDr8xho; Tue, 15 Apr 2014 19:45:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3FIj7xq007177
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 15 Apr 2014 19:45:11 +0100
Message-ID: <1397587501.15843.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Apr 2014 19:45:01 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Tue, 15 Apr 2014 18:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Changes in the last week
========================

The past week has been turbulent. It seemed we were on track early last
week, then we found some problems. The -rc3 build suffered some build
failures, particularly a sysroot issue with perf. There were also some
BSP issues with beaglebone as well as some QA challenges.

Were able to pull together all the needed fixes quickly and in the end
we built out an -rc4 early, dropping -rc3 since there were too many
known issues. We have now branched although I've not started merging 1.7
patches as yet and hope to hold off for a short while yet.

The biggest problem right now is that beagebone doesn't boot depending
on the directory depth the kernel is built within. We don't understand
why.

I had some issues with email this week. We think of it as instantaneous
but a load of mine disappeared onto the secondary MX and I didn't get it
until after -rc4 was built. This is why some patches didn't get dealt
with so my apologies for that, the timing was particularly unfortunate.

I don't believe we have a reason to stop 1.6 at this point, particularly
if we can document the beaglebone issue. The -rc4 QA report is due soon
and will drive the release decisions.

I've not had much time to spend on 1.7 planning at this point but I'm
hoping to get to that next.

Cheers,

Richard



