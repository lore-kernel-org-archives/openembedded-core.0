Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYJ60-00063W-I9 for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:07:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7F0rWH015433;
	Wed, 7 Dec 2011 15:00:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14809-10; Wed,  7 Dec 2011 15:00:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7F0haZ015427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Dec 2011 15:00:44 GMT
Message-ID: <1323270054.30601.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 15:00:54 +0000
In-Reply-To: <3741284.XQAanrv0Ii@helios>
References: <4EDF2360.7090402@emagii.com>
	<E5CF0974-DCA6-4DAA-859C-ED40990CC11E@dominion.thruhere.net>
	<4EDF788E.60804@emagii.com> <3741284.XQAanrv0Ii@helios>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: ulf@emagii.com
Subject: Re: Possible stale tags in the download directory
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
X-List-Received-Date: Wed, 07 Dec 2011 15:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 14:37 +0000, Paul Eggleton wrote:
> On Wednesday 07 December 2011 15:30:38 Ulf Samuelsson wrote:
> > Richard says that if the *.done file is there, then the checksum is not
> > calculated.
> > Or that is at least how I interpret his comment.
> > 
> > If the check is always there, why the tag?
> 
> That's not what my reading of the bitbake source says. 
> bitbake/lib/bb/fetch2/__init__.py contains the only references to .done files 
> and all it does is make sure the done file gets "touched" whenever a fetch for 
> the associated file occurs; it does not otherwise check for its existence.

It does two things, one is an activity marker useful for seeing whether
files are in active use and the second is for the checksum calculation
which only ever happens once after download due to the file (see
verify_checksum() in that file).

Cheers,

Richard



