Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qcg87-00008h-J3 for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:59:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61Ftwe7012480;
	Fri, 1 Jul 2011 16:55:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12158-07; Fri,  1 Jul 2011 16:55:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61Ftm9A012474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 16:55:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
In-Reply-To: <4E0D4EDC.5080403@intel.com>
References: <cover.1309473383.git.scott.a.garman@intel.com>
	<1db24b664bf6fb292d8a84dd6398e330305f18fd.1309473383.git.scott.a.garman@intel.com>
	<1309475425.20015.493.camel@rex>  <4E0D4EDC.5080403@intel.com>
Date: Fri, 01 Jul 2011 16:55:26 +0100
Message-ID: <1309535726.20015.525.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] useradd.bbclass: new class for managing user/group permissions
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
X-List-Received-Date: Fri, 01 Jul 2011 15:59:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 21:36 -0700, Scott Garman wrote:
> On 06/30/2011 04:10 PM, Richard Purdie wrote:
> > Hi Scott,
> >
> > This is looking good, thanks for the changes! I just have some cosmetic
> > things to tweak before it goes in.
> 
> Ok, respinning now based on your requests.
> 
> BTW, some parts of useradd.bbclass were derived from 
> update-rc.d.bbclass. So it sounds like that class could use a refresh in 
> light of the preferred style you've been showing me. I'd be happy to do 
> this as a background task over the next week if it would be useful.

It would certainly be useful to clean up things like this as and when we
notice them and have time...

Cheers,

Richard



