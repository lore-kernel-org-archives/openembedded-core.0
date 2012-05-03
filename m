Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPwWM-0004Oj-IA for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 15:56:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43DksCi000832
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 14:46:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00605-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 14:46:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43Dkkit000826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 14:46:46 +0100
Message-ID: <1336052808.30113.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 14:46:48 +0100
In-Reply-To: <1336051765.30113.107.camel@ted>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net> <1336035344.30113.51.camel@ted>
	<20120503092955.GE4658@jama.jama.net> <1336051765.30113.107.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 13:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I should also note that there is a wider problem here I'm complaining
about. The glib issue is actually less of a concern.

People keep sending patches without sensible descriptions in the commit
message. I think I've made some comments on list to Saul about this to
pick on someone in particular. The last set of patches from Khem
contains one which removed pretty much the whole qemu patch set from the
git version with no explanation in the commit message.

No, its not going in and I find it a a bit of an insult that I'm being
expected to read the diffs, notice these changes and spent time replying
to the patch with a nicely worded rejection email. I might just start
replying "no".

So what I'm asking is that people think about the changes they submit
and try and help me, not use patch submission as a sounding board and
not to hope I don't spot something.

To scale this project we need to develop trust relationships with people
taking ownership of areas of the codebase. I consider Mark Hatle to
"own" most things rpm for example. To scale we need to do more of this
but trust is important. If some people don't want to do this and just
contribute things when they can which interest them, that is fine but we
are going to reach a point where we have to take longer to test and take
such changes.

Cheers,

Richard




