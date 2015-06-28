Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26B1E600B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 10:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SAEtVA022747; Sun, 28 Jun 2015 11:14:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5TgnNgIO0qLH; Sun, 28 Jun 2015 11:14:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SAEeVL022684
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 28 Jun 2015 11:14:51 +0100
Message-ID: <1435486480.10583.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "joshua.lock" <joshua.lock@collabora.co.uk>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 28 Jun 2015 11:14:40 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: fido status
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
X-List-Received-Date: Sun, 28 Jun 2015 10:15:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just wanted to let people know what is going on with Fido.

Joshua has had a branch in testing for a while. The autobuilder gave
mixed feedback for it. Partly, there was a problem since we'd introduced
a new autobuilder (Fedora 22) and this introduced some problems with
subversion-native and gcc5. Partly there were also networking issues on
the autobuilders related to runqemu.

Thanks to some help from Michael, we've tracked down and sorted the
networking issue (we hope!). I therefore took the decision to merge
Joshua's fido-next branch myself, now, with the addition of the
subversion fixes to the fido branch.

I've triggered another build which is underway at the moment and I'm
confident the result should be reasonable. What I am expecting is
failures for oe-selftest and for nightly-aarm64 and nightly-mips64.
There are fixes just merged into master which resolve issues in all
three areas, I'm hoping we can queue up a fido-next with those in and
get fido building green quickly. Those issues are less of an issue given
we know what the issues are and they are testing issues, not 'real'
bugs.

Cheers,

Richard




