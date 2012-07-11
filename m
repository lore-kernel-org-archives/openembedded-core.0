Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoupO-0004zD-0f for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 13:11:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BB0Iit003127
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:00:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01796-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:00:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BB0BiD003121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:00:12 +0100
Message-ID: <1342004414.7934.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 12:00:14 +0100
In-Reply-To: <4FFD3FF0.6080409@communistcode.co.uk>
References: <4FFD0425.7040004@intel.com> <4FFD3FF0.6080409@communistcode.co.uk>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 11:11:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
> On 11/07/12 05:42, Scott Garman wrote:
> > Hello,
> >
> > After a review of the QA full pass test report for Yocto 1.2.1, the 
> > release team has agreed to submit this release candidate as our final 
> > release for 1.2.1. Song Liu will organize the release readiness 
> > decision, and I expect Beth Flanagan will be able to perform the 
> > official release by the end of this week.
> >
> > Unfortunately the timing of this is such that I will be out of the 
> > office for the rest of this week. Saul Wold can handle any 
> > questions/concerns in my absence.
> >
> > Thanks so much to everyone who contributed work that went into 1.2.1! 
> > We now have 35 bugfixes and a few further enhancements to denzil since 
> > 1.2 to share with our users.
> >
> > Scott
> >
>
> Are Khems eglibc patches going to make it in for this - 2.16 is playing 
> havoc with my builds at the moment and surely will with everyone else 
> when the major distros catch up.

Its too late to get those pieces into 1.2.1, they're not even in master
yet, let alone in a stable release branch.

I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in master,
then port them to the denzil branch quickly post release so they'd make
any 1.2.2 release and are available on the git branch for people using
the stable branch.

Cheers,

Richard




