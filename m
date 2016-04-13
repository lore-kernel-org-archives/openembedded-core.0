Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5D1160017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DB5H9k003336; Wed, 13 Apr 2016 12:05:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7nPTAsZ2fXcq; Wed, 13 Apr 2016 12:05:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DB5FAC003326
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Apr 2016 12:05:17 +0100
Message-ID: <1460545515.9308.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Wed, 13 Apr 2016 12:05:15 +0100
In-Reply-To: <4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Wed, 13 Apr 2016 11:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I am pretty frustrated with this thread. The reasons are perhaps not
immediately obvious though.

The issue is that there are only a limited number of people who
actually dive in and try and fix some of the underlying "core
architecture" bugs. There is what I believe to be a pretty good patch
here which does fix real world issues which have been reported into the
bugzilla (its related to at least two bug reports). As such it has been
seen as a bugfix. Its now clear it does have some side effects which
weren't envisaged, some causing issues for a small number of meta-oe
recipes, the others breaking a companies internal code.

Otavio wants it deferred to 2.2, Peter wants it abandoned entirely.

If I revert this, Peter is then happy and has zero incentive to do
anything further. The pressure is still on the reopened bugs to try and
fix this somehow and falls back to the usual suspects. There is a real
world usability problem there.

In a single isolated case, fine, we'd figure a way through this. I
think I'm so frustrated as we see this all the time. Making a change to
the core architecture is hard and gets ever harder, then we wonder why
we don't have contributors. Part of this is having so many different
workflows and corner cases.

I have pushed very hard to have more test cases, then its easier to
determine if a patch causes regressions. Again though, few people are
contributing to them outside the usual suspects.

I'm therefore starting to think the correct answer to this thread is
simply this:

The patch doesn't break any of the current regression tests. If you
have use cases like this you care about, you really should make sure we
have test coverage for them, else you run the risk of exactly the
problem we have here.

I haven't honestly decided what to do but this latter conclusion is
very tempting from where I'm sitting...

Cheers,

Richard


