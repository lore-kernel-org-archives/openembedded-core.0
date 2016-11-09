Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B686719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 12:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA9CUA4w032764; Wed, 9 Nov 2016 12:30:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DrgmHN0Hr9mM; Wed,  9 Nov 2016 12:30:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA9CU7V1032761
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 9 Nov 2016 12:30:08 GMT
Message-ID: <1478694607.23123.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Armin
	Kuster <akuster808@gmail.com>
Date: Wed, 09 Nov 2016 12:30:07 +0000
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: krogoth 2.1.2 status
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
X-List-Received-Date: Wed, 09 Nov 2016 12:30:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I ran a krogoth 2.1.2 build. It did have some issues:

* one runtime sanity test had a timeout issue
* some urls are stale (perpetual problem)
* musl runtime testing fails (never tested on krogoth previously)
* no-x11 runtime testing had a failure (never tested on krogoth
previously)

I suspect we can call this good enough to put into QA but there were
enough 'failures' I wanted to send this out in case someone objects.

Part of the problem here is we apply our current autobuilder test setup
to the older releases as well. I'm aware there may be better ways to do
this but I don't know anyone with time to work on that, we have other
more pressing problems.

Cheers,

Richard


