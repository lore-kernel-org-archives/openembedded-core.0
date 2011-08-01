Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qnssl-0002X7-9V for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:50:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DjqCG007563
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:45:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07336-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:45:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Djl0X007557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:45:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 14:45:33 +0100
Message-ID: <1312206333.2344.456.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Commits to master in my absence
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
X-List-Received-Date: Mon, 01 Aug 2011 13:50:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm a little frustrated to see what happened when I was away from a
couple of days. I thought we'd agreed we'd queue up patches in a branch
and then I'd take care of things when I got back.

I appreciate a serious bug was then found and a fix was committed
against what I thought was agreed. This then opened the gates and more
patches were merged with decreasing severity and in the end something
got added which is just plain broken :(.

The problematic patch is:

http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=e23f9ce928353c9da2b9c4bfa9a1a125a7d160f2

and I've commented in emails elsewhere against the various attempts to
further "fix" this.

I *really* need people to step up and start thinking about quality and
the long term impact of changes rather than just X fixes bug Y which I'm
hitting right now. This is particularly true if anyone wants to step
into the position of doing final commit merging. You *have* to take the
time to fully understand and review the changes you're adding and
consider the big picture.

I'm really hoping that I can find people who I can share the final
review/commit responsibility with but until people stop presenting me
patches which I have to reject we're not going to get the point where
they can work in that role :(.

This is particularly frustrating since I've seen people push patches
they know to be lacking in quality just because they were running low on
time and hoped they might get away with it.

Cheers,

Richard (a bit disappointed)



