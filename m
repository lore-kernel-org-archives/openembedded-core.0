Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SlckG-00035A-0V for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 11:16:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6295Z5Y029690
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 10:05:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28787-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 10:05:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6295PT1029684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 10:05:26 +0100
Message-ID: <1341219932.23146.187.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 10:05:32 +0100
In-Reply-To: <alpine.DEB.2.02.1206300618250.14118@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
	<alpine.DEB.2.02.1206300618250.14118@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Mon, 02 Jul 2012 09:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-30 at 06:20 -0400, Robert P. J. Day wrote:
> On Sat, 30 Jun 2012, Martin Jansa wrote:
> 
> > http://git.openembedded.org/meta-openembedded/commit/?id=040f75eca217c79fed7b881589d9bb36358cffe1
> > http://git.openembedded.org/openembedded-core/commit/?id=d122343362669c683acc4af295971a62cbc823fc
> >
> > so can be dropped from bitbake.conf too AFAIK
> 
>   actually, there are still a number of lines that refer to that
> variable:
> 
> $ grep -rw PRIORITY *
> meta/conf/bitbake.conf:PRIORITY = "optional"
> meta/conf/documentation.conf:PRIORITY[doc] = "Importance of package, default values are 'optional' or 'needed'."
> meta/classes/package_deb.bbclass:        fields.append(["Priority: %s\n", ['PRIORITY']])
> meta/classes/package_ipk.bbclass:		fields.append(["Priority: %s\n", ['PRIORITY']])
> meta/classes/oelint.bbclass:	# Test for valid PRIORITY
> meta/classes/oelint.bbclass:	s = testVar("PRIORITY")
> meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended" % s)
> meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended, better use '%s'" % (s, newprio))
> meta/classes/oelint.bbclass:			bb.note("PRIORITY '%s' is not recommended" % s)
> meta/classes/oelint.bbclass:			bb.error("PRIORITY should only use lower case")
> $
> 
>   if i can assume that all of that can be removed, i can do that as a
> single patch, again unless someone else wants to handle it if there
> are subtleties involved.

I think this one is best left alone as the code stands. We did remove
the variable from standard usage, it doesn't obsolete the above code
which someone could in theory still use from say a distro configuration
perspective.

The line in documentation.conf look wrong though, I think "needed"
should be "required".

Cheers,

Richard





