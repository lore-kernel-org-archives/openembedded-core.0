Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75D3C728AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t079Oi1e019731; Wed, 7 Jan 2015 09:24:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U9iYDh9W2QE8; Wed,  7 Jan 2015 09:24:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t079OWDT019714
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Jan 2015 09:24:43 GMT
Message-ID: <1420622709.25779.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Jan 2015 09:25:09 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: yocto <yocto@yoctoproject.org>
Subject: Bug reporting and good bug reports
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
X-List-Received-Date: Wed, 07 Jan 2015 09:25:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I was informed on irc yesterday that bug reports are hard and that
debugging via irc is easier. I think I need to remind people why good
bug reports are important and how they do actually help immensely.

I do actually believe that not everything has to have bug report. If you
mention an issue, someone says "hey, I know how to fix that" and sends a
patch out, a bug report is wasted overhead IMO. I know some programme
managers who disagree strongly with me and would suggest *every* bugfix
commit should have a defect tracking item. We're not going there I
understand the idea, its not practical.

That said, if its not immediately clear what the problem is, it should
become a bug report. Why?

Firstly, the random selection of people on irc at the time probably
aren't the right people to fix it. Telling those people to read 48 hours
of irc log for the details is disrespectful of their time.

It also happens that the first people referred to a bug may not be the
person who actually can fix it. If someone else needs to come to a bug,
having a summary of the issue, the salient facts and the current status
is immensley useful for handover.

As a case in point, I tried to debug a qt4 build failure yesterday for
which there is no bug report. I lost hours building the wrong things,
experimenting to try and find the reproducer steps and generally chasing
my tail, losing the autobuilder log of the failure, the name of the qt4
recipe that was failing (which task was it again?) and so on.

I do now have a set of reproducer steps, its quite simple:

MACHINE=imx53qsb bitbake virtual/kernel
MACHINE=imx53qsb bitbake virtual/kernel -c clean
MACHINE=imx53qsb bitbake qt4-x11-free

I also have a patch. Where should I share them? How do I ensure everyone
with an interest in this defect actually gets the patch? Sure I can
create email and send to the people who I think need to know. The
bugzilla lets interested parties add themselves to bugs though.

I should also note that QA actually go through bugs in the bugzilla,
including closed ones, looking for test cases. We're not great at this
yet but it does happen. If there is a well documented test case like
that above, we might write an automated QA test for it. Having it
documented is therefore a good thing.

I do appreciate writing a bug report is hard, especially if you don't
know where the problem is, or how to reproduce it exactly. It takes time
and effort. You can however document what you know and discussion can
happen in a common place to figure out how to reproduce it. I do except
the submitters to fully understand the bug, if they did they'd probably
write a patch instead.

So fair warning, I am going to start ignoring things on irc and ask for
bug numbers in future, assuming something isn't a 5 minute fix with an
immediate patch. I will back and encourage anyone else doing this too.

Cheers,

Richard



