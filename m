Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 789586017E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 13:44:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3JDiKQj024116; Sat, 19 Apr 2014 14:44:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id My7u-n2JoJmQ; Sat, 19 Apr 2014 14:44:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3JDiCxx024108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 19 Apr 2014 14:44:13 +0100
Message-ID: <1397915046.15843.207.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 19 Apr 2014 14:44:06 +0100
In-Reply-To: <CAP9ODKrJaQTkDeDgcvTBu9=dRLwLJo=d9mVxvOgx+PAw5iSLyw@mail.gmail.com>
References: <1397487085-8924-1-git-send-email-valentin.popa@intel.com>
	<534DF255.9010506@windriver.com>
	<CAP9ODKrJaQTkDeDgcvTBu9=dRLwLJo=d9mVxvOgx+PAw5iSLyw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH_V3] mesa: double check for eglplatform.h
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
X-List-Received-Date: Sat, 19 Apr 2014 13:44:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-18 at 20:38 -0300, Otavio Salvador wrote:
> So WHAT is holding a bugfix for a regression to be merged? I am very
> disappointed with the maintenance in the Dora branch.
> 
> 1. a change has been added without testing other layers hosted in YP.
> 2. it has been merged without being ran in YP AB.
> 3. I reported the issue in the same day it has been merged
> 4. it has been 10 days and this has not yet been reverted/fixed.
> 
> So CAN THIS BE MERGED PLEASE?

WHY HAVE YOU NOT REPLIED TO BUG 6098? I ASKED YOU SOMETHING THERE 9
WHOLE DAYS AGO? IT IS A HIGH!!!! ITS BEEN OPEN 17 DAYS!!!!

I happen to know you've been travelling/busy and likely haven't had
time. Fair enough, it happens.

I have also been travelling, any spare cycles were directed to the 1.6
release and the beaglebone problem which was threatening to disrupt it.
Right now its a 4 day holiday weekend in the UK. I should be out trying
to relax, instead I'm horribly jetlagged and even better, reading all
caps emails from you.

This is to say nothing of being a bit distracted after dropping an 80kg
stone hearth on the end of one of my fingers a couple of weeks ago,
fracturing it, then reacting badly to some antibiotics to add to the
fun.

As it happens I merged the fix this morning before I read this, it was
already in the queue. I'd planned to do so sooner but hadn't got around
to it. Several of those days were looking into the regression and
figuring out a way which fixed it, and fixed the other bug report the
problem was solving.

In answer to your questions:

Its not policy to test every layer with a change in OE-Core. We do our
best to make sure things don't break. Not every change gets run through
the autobuilder. We do run things through the AB before a release
though. 1.5.2 has not been released yet and this issue will get resolved
before that happens.

I do wish we've been able to act sooner, equally most of the people
involved have various pressures on their time. We do our best.

Cheers,

Richard



