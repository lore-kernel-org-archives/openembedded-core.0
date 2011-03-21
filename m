Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1jKy-00075T-99 for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 18:56:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHsTfF026076;
	Mon, 21 Mar 2011 17:54:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26011-02; Mon, 21 Mar 2011 17:54:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHsOLT026069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2011 17:54:24 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTikTN34eB90o8rLuJq5aaMa=nTE9aDCJmCMO+Rrp@mail.gmail.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
	<AANLkTikTN34eB90o8rLuJq5aaMa=nTE9aDCJmCMO+Rrp@mail.gmail.com>
Date: Mon, 21 Mar 2011 17:53:58 +0000
Message-ID: <1300730038.30423.3967.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 00/12] Pull request - some sync bits from OE
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
X-List-Received-Date: Mon, 21 Mar 2011 17:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 09:23 -0700, Chris Larson wrote:
> On Thu, Mar 17, 2011 at 9:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> > From: Chris Larson <chris_larson@mentor.com>
> >
> > This is primarily a sync of a couple OE features, along with a few minor
> > changes to ensure those features work fine for us.  More OE sync bits will be
> > forthcoming.  These certainly need review.  In particular, I haven't gotten
> > any feedback on how the poky folk feel about this approach to IMAGE_FEATURES
> > relative to their own, so please do comment on that, if you would :)
> >
> > Pull URL: https://github.com/kergoth/oe-core
> >
> >  Branch: oe-sync
> >  Browse: https://github.com/kergoth/oe-core/commits/oe-sync
> >
> >
> > Thanks,
> >    Chris Larson <chris_larson@mentor.com>
> 
> Erm, I forgot I hadn't yet dealt with ROOTFS_PACKAGEMANAGE_BOOTSTRAP,
> in the IMAGE_FEATURES changes, don't pull this until I resolve that :)

Ok, I've pulled the first four commits for now since there were fairly
obvious fixes and not part of what you mention above, I'll wait for
another pull request for the rest.

Cheers,

Richard



