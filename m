Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiOxk-0000bI-2D for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 12:24:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BHW7o017773;
	Wed, 4 Jan 2012 11:17:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16060-08; Wed,  4 Jan 2012 11:17:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BHNnB017766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 11:17:24 GMT
Message-ID: <1325675843.3555.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 11:17:23 +0000
In-Reply-To: <2101328.0yZ7sRDDBg@helios>
References: <cover.1325079532.git.paul.eggleton@linux.intel.com>
	<4F039524.4030306@linux.intel.com> <2101328.0yZ7sRDDBg@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 0/1] Locale package installation
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
X-List-Received-Date: Wed, 04 Jan 2012 11:24:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 00:50 +0000, Paul Eggleton wrote:
> On Tuesday 03 January 2012 15:54:12 Saul Wold wrote:
> > On 12/28/2011 05:43 AM, Paul Eggleton wrote:
> > > Implement locale package installation as we had in OE-Classic; please
> > > review. In particular I'm not sure of the naming of
> > > rootfs_check_package_exists() (since it resolves the package to a
> > > filename in the case of RPM). Note that because of the default value of
> > > IMAGE_LINGUAS this patch will result in images growing slightly.
> >
> > Merged into OE-Core
> 
> Er, this was actually an RFC patch and I was hoping to get some more review 
> and comments especially as it came during the holidays...
> 
> It may be too late to stop it going in but if anyone has any comments/issues 
> please raise them now and we can look at further patches if necessary.

To be honest, I'm not happy with the current rootfs/package code as
there are way too many differences between the backends and too much
duplicated code. Its heading towards being an unmaintainable mess.

Your patch starts to unwind some of that so as far as I'm concerned that
is a good thing. I'd not realised it was an RFC when it was presented as
part of the consolidated pull but I think its a good thing to have in.
I'd really like to see more patches like that one.

Cheers,

Richard



