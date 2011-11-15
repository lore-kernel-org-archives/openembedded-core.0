Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQQoU-0002Ya-6u for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:45:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFLcfK8030874;
	Tue, 15 Nov 2011 21:38:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30133-08; Tue, 15 Nov 2011 21:38:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFLcVrm030868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Nov 2011 21:38:32 GMT
Message-ID: <1321393116.26881.229.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 15 Nov 2011 21:38:36 +0000
In-Reply-To: <4EC2B797.4010503@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
	<1320761883.10843.40.camel@ted> <4EC2B797.4010503@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/12] Recipe upgrades, fixes and additions
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
X-List-Received-Date: Tue, 15 Nov 2011 21:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-15 at 11:03 -0800, Saul Wold wrote:
> On 11/08/2011 06:18 AM, Richard Purdie wrote:
> > On Mon, 2011-11-07 at 16:10 -0800, Joshua Lock wrote:
> >> All,
> >>
> >> Here's a series of patches I developed whilst trying to play around with some
> >> Clutter based software.
> >>
> >> The interesting pieces may be:
> >> Clutter 1.8 series recipes - do we want/need to keep clutter 1.6 around?
> >> Are we OK with continuing to namespace the clutter recipes by clutter
> >> version?
> >
> > Yes, I think this makes sense.
> 
> Why do we want to continue the clutter the namespace with version 
> numbers?  Was this not for a past issue with mis-matched API/ABI?
> 
> If that problem is solved, then next remove that version info.

Clutter produces libraries with a very specific namespace so you can
parallel install clutter 1.4, 1.6 and 1.8. Applications compile against
a given version of the library.

Having the major lib version as part of the package name therefore makes
sense. There aren't a lot of projects that do this but this one does and
it continues to make sense to namespace it accordingly.

Cheers,

Richard





