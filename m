Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgFxq-0004sD-5l for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 15:28:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5EEIZX018362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2012 14:14:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17999-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2012 14:14:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5EE9to018356
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2012 14:14:10 GMT
Message-ID: <1354716839.25268.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Dec 2012 14:13:59 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Switch to PR server model for PR bumps - 1 week
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 14:28:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've made it clear we want and need to switch to the PR service for
handling PR bumps. I'd now like to put a deadline in place for doing
this, namely that I'm going to stop requiring PR bumps in patches as of
1 week's time. The TSC did discuss this and our conclusion was that we
need to switch early in this release cycle to give time for any issues
to get resolved. Now is a good time to do this as I think we're ready.

There were a number of open bugs related to the PR service[1]. We've
looked through them and they are now resolved with the exception of one
related to the incremental git PV issue for which we have a plan in
place and patches ready.

We've taken on board feedback about documentation and the following wiki
page has been setup which details the current situation:

https://wiki.yoctoproject.org/wiki/PR_Service

I appreciate this is going to be a disruptive change for some but I
believe it is in the best interests of the project longer term and that
we will have a better system as an end result of this. If people do run
into problems, please send email or file bugs. I'm trying to ensure
there are some people with time available to look into these issues as a
priority so we can make a smooth transition.

Cheers,

Richard

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3310



