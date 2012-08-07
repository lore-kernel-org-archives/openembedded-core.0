Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyqcC-0008Rm-9q for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:42:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77KV8S6015614;
	Tue, 7 Aug 2012 21:31:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14392-05; Tue,  7 Aug 2012 21:31:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77KUwL8015608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 21:30:59 +0100
Message-ID: <1344371460.9756.297.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 21:31:00 +0100
In-Reply-To: <CAMKF1sosOY9Usa+MkWByQM51urYFUKLAqH-UE7y-J2tHfHSi=w@mail.gmail.com>
References: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
	<1343732826.9526.1.camel@ted> <20120731111002.GR3261@jama.jama.net>
	<5019580E.4070906@linux.intel.com> <1344343119.9756.248.camel@ted>
	<50213F03.1000004@linux.intel.com>
	<CAMKF1sosOY9Usa+MkWByQM51urYFUKLAqH-UE7y-J2tHfHSi=w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC] gdb-cross: add pythonnative
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 20:42:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 13:15 -0700, Khem Raj wrote:
> On Tue, Aug 7, 2012 at 9:14 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >
> >> I fixed this properly by disabling python in gdb-cross.
> 
> I think having python support would be desirable no ?

Perhaps, I didn't make a decision on that. Just inheriting pythonnative
isn't the correct way to do that, we need to make an explicit decision
and set the correct configure option so its clear what we're doing.

In the meantime I wasn't happy seeing build failures.

Cheers,

Richard



