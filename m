Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A8474708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 12:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s93C0eAR003941; Fri, 3 Oct 2014 13:00:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JvHq2bisOMvE; Fri,  3 Oct 2014 13:00:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s93C0Ys4003938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 3 Oct 2014 13:00:35 +0100
Message-ID: <1412337667.17658.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Oct 2014 13:01:07 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
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
X-List-Received-Date: Fri, 03 Oct 2014 12:01:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As people know we're working towards the release and I thought an update
might be useful.

There was a mixup about dates and the rc1 build happened a week early.
The first real rc2 was this Tuesday. We merged a variety of fixes into
it and it did build out. Unfortunately there were some late kernel
patches that came in after it, we then also found the toolchains in the
ADT/SDK were basically DoA. We decided to skip QA on rc2 and move to rc3
immediately.

The rc3 build did throw bogus QA warnings on the build due to dmesg
'errors' after the kernel change. We've also found that whilst the SDK
is ok, ADT is still broken :(. We are putting that one through QA
though.

We've also found that builds on xfs with 64 bit inodes are corrupting
permissions in pseudo (e.g. /usr/bin/python loses its execute bits). We
have a fix for that in pseudo master and have confirmed it fixes things
on the xfs build machine. This may explain some of the pseudo
permissions issues people have intermittently reported.

So we will run an rc4 build early next week and we're looking only to
take a small number of fixes into it, hopefully that one can become the
release and we can be done before ELC-E.

Cheers,

Richard






