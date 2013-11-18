Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD236D227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:10:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIBARCt026934; Mon, 18 Nov 2013 11:10:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id biR-nlRril29; Mon, 18 Nov 2013 11:10:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIBALn7026930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 11:10:23 GMT
Message-ID: <1384773018.6460.202.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 11:10:18 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 11:10:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have an issue in the dora branch at the moment. When I merged in the
set of bug fixes post release, I added:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=dora&id=0bd63125c3b44a656e44f2a76cc5f832c9db4bbd

which wasn't entirely intentional. It changes the behaviour of
FILESOVERRIDES. The bug there is real with "arm" overrides being
preferred to "armv7a" for example and other strange/incorrect ordering.
It was in fact impossible to override certain things which people needed
to in some circumstances and defeated the purpose of OVERRIDES.

I don't doubt this change is correct in master, the question is whether
it should be in dora. The issue is that some layers don't work correctly
before/after the change and we now have a bit of a confused situation.

Our options are either:

a) Revert the change in the branch. Anyone who adapted to the correct
behaviour on the branch would need to revert those changes

b) Keep this change in there and adapt layers to fix any incorrect
behaviour.

I'm open to either option but I think this needs discussion before we do
anything. I'd appreciate other people's views, particularly those of
layer maintainers.

Cheers,

Richard



