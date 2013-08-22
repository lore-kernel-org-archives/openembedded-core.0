Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E11A560842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:05:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MEGwph007933 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:16:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X4YwfU9qRSrA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:16:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MEGuwr007913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:16:57 +0100
Message-ID: <1377180295.6762.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 15:04:55 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 14:05:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've slowly been shaking out the definition of OE-Core and as part of
that we removed web and web-gtk which were the only browsers in there
and were admittedly a bit limited/broken.

There is no doubt that web technology has an increasingly important role
in the future and in embedded devices (e.g. kiosk type devices, digital
signs and so on).

With that in mind, I think some kind of HTML support in OE-Core is
important going forward. Equally, I dislike having things there which we
cannot test. I know some people have looked into this and it appears
midori is the best option for something with a small number of
additional dependencies. I therefore currently think this is something
we should make a decision to include since it gives us significantly
better coverage of things like webkit which are a already in the core
yet totally untested at present.

I'm open to opinions, equally we do need to make a decision on this soon
since we're nearly at the feature freeze point. Thoughts?

Cheers,

Richard




