Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 58DB065E12
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 11:46:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s39Bj0b1028394; Wed, 9 Apr 2014 12:46:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hDaafY5YSVL3; Wed,  9 Apr 2014 12:46:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s39Bk8VK028403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Apr 2014 12:46:10 +0100
Message-ID: <1397043963.24597.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Apr 2014 12:46:03 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: yocto <yocto@yoctoproject.org>
Subject: The point of Release Candidates
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
X-List-Received-Date: Wed, 09 Apr 2014 11:46:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It seems people don't understand what the point of a Release Candidate
is, or the timelines we work to. The fact this is coming as a surprise
to people is seriously upsetting to me as we've done this for long
enough now that people should know the drill.

A release candidate is what is says, a possible candidate to be
released. We merge things, it goes to QA, it gets tested and then we
decide go/no go.

I appreciate this time around, RC1 was a trial run due to the kernel
issues. We did the best would could there having decided to go for 3.14.

RC3 was meant to happen last night. In theory, patches should have been
submitted by Sunday for it giving me Monday/Tuesday to review, merge,
test and sort things out.

I delayed RC3 by 24 hours since:

a) yocto-bsp tooling was broken. It fell off the radar and was a 
   release blocker
b) the RC2 QA report wasn't out

I'm now finding that:

a) The QA teams either don't have or can't boot beaglebone. 
b) The beaglebone README still isn't available. I took patches on the 
   understanding this would be available. The QA team who do have 
   hardware are trying to test something which isn't documented so this 
   is hindering a). Are they testing the right thing? Who knows.
c) We have a number of edgerouter bugs. Why are these appearing now?
d) There are cyptodev patches in various states of flux. The turnaround 
   on patches there isn't what I'd expect at rc3 if people want them in.
   Basically, they're not going in now due to that.
e) The patch quality is to be blunt, dire. Patches coming in at this 
   point need to be well thought out and tested. Instead, some people 
   are panicking and appear to be throwing any old thing in and then 
   worry about bug fixing it later.

At this point, its looking like we may have to go to rc4 as bugs with
two of the reference BSPs is a serious issue. I don't think people
realise how much of a mess we're heading into here as even to make rc4,
I need the fixes near enough yesterday.

I'm actually taking this pretty personally. I do what I can for the
project to pull things together. I do try and cut people slack where
possible to make things happen. In return, it appears people are just
taking advantage of this. I may well start getting a lot stricter with
deadlines, cutoffs and so on which I can guarantee that people are not
going to enjoy.

Richard



