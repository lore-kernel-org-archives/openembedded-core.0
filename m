Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 93E3965ED7;
	Fri, 20 Jun 2014 09:58:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5K9w3UB027589; Fri, 20 Jun 2014 10:58:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O5w6kCvo3iQf; Fri, 20 Jun 2014 10:58:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5K9vxu1027581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 20 Jun 2014 10:58:00 +0100
Message-ID: <1403258272.2104.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org, Martin Jansa
	<martin.jansa@gmail.com>
Date: Fri, 20 Jun 2014 10:57:52 +0100
In-Reply-To: <20140610100722.GC2433@jama>
References: <20140610100722.GC2433@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Fri, 20 Jun 2014 09:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I know that with some of the changes in oe-core, meta-oe is suffering a
little. I've been working on fixing up some of a world build of meta-oe
with patches including the problematic autoconf one applied.

My WIP is:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/meta-oe&id=9ece5e493b7844a7282eb883effa9d9a5b56d20e

I appreciate its a huge patch and needs splitting up but there are only
so many hours in the day.

Of note are a few sepbuild fixes in there and one for the binconfig pcre
issue that apache2 has, introduced by the binconfig change in OE-Core. I
took the opportunity to clean up the -native recipe a bit, it should be
closer to the main recipe and allow it to be converted to BBCLASSEXTEND
in due course.

There are some fixes for talloc which I know has caused some headaches
too.

I will try and find the time to clean this up and submit it piece by
piece but if anyone beats me to it, great and hopefully nobody will
duplicate the work.

Cheers,

Richard







