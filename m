Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXbTE-00035g-7Z for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 19:05:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OGsnr4025936;
	Thu, 24 May 2012 17:54:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25801-01; Thu, 24 May 2012 17:54:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OGsgmT025929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 May 2012 17:54:43 +0100
Message-ID: <1337878481.8248.154.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 17:54:41 +0100
In-Reply-To: <22FC307C-7108-4DDC-9671-23AA109E964B@dominion.thruhere.net>
References: <4FBD5E10.3070403@intel.com>
	<223B4521-59A6-42A5-9F1F-71B67C12B8E9@dominion.thruhere.net>
	<4FBE57CA.6010307@intel.com>
	<22FC307C-7108-4DDC-9671-23AA109E964B@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [yocto] RFC: Merging commits from into the main denzil branch
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
X-List-Received-Date: Thu, 24 May 2012 17:05:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 18:04 +0200, Koen Kooi wrote:
> Op 24 mei 2012, om 17:46 heeft Scott Garman het volgende geschreven:
> 
> > On 05/24/2012 04:26 AM, Koen Kooi wrote:
> >> Op 24 mei 2012, om 00:00 heeft Scott Garman het volgende geschreven:
> >> 
> >>> Hello all,
> >>> 
> >>> As most of you know, I've been pulling commits into a pair of
> >>> sgarman/denzil-next branches which are intended to eventually
> >>> become the next Denzil point-release, 1.2.1.
> >>> 
> >>> oe-core based branch:
> >>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next
> >> 
> >>> 
> >> Would it be possible to do that in the main repo? That saves people
> >> from needing to add and fetch yet another repo.
> > 
> > I can't start with the main repo, because I don't have commit access to
> > it, and until I have done some significant testing with my commits, I
> > want to preserve the ability to rebase my branch.
> > 
> > However, now that I have some autobuilder resources to do more extensive
> > testing, what I'm proposing is to get my *tested* commits moved from
> > sgarman/denzil-next into the denzil branch after review from the
> > community and a merge that Richard will do.
> > 
> > That means the denzil branch will lag my sgarman/denzil-next branch by a
> > certain amount of time, which I intend to keep down to less than a week.

What we could do is give you direct access to the denzil-next branch in
the main repository which would be a happy medium between these two
states since you could still rebase it.
 
> >>> So now to address issue #2. The goal is to incorporate community
> >>> feedback, so I'm looking to get ACKs or NAKs for these commits
> >>> before they go into the main denzil branch.
> >>> 
> >>> My proposal is to send denzil pull requests to the appropriate
> >>> mailing lists, and Richard can merge them into the main repo denzil
> >>> branches once they've received review by the community.
> >>> 
> >>> My goal is to send these pull requests about once per week, once
> >>> I've managed to get a green build out of the Yocto autobuilder for
> >>> my contrib branch.
> >>> 
> >>> What do folks think about this? Now's your opportunity to offer
> >>> feedback and influence this process.
> >> 
> >> You're missing a process for people to propose commits for the denzil
> >> branch. How about this:
> >> 
> >> If you want to propose a commit from master cherry-pick it into a
> >> local denzil branch and then send if for review to the oe-core list
> >> with the [for-denzil] subject prefix. Scott will take care of putting
> >> it in the pull requests based on the feedback the patch gets.
> > 
> > I can work with that. But keep in mind that if the request is not
> associated with a current bug marked for 1.2.1 in the Yocto bugzilla,
> I will need to see strong community support for including it (aka,
> multiple ACKs). This is needed to avoid scope creep in the
> point-release.
>
> I think you're confusing oe-core with yocto

I think some process for showing support for changes is good and the
Ack's seem as good as any other.

Cheers,

Richard



