Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAUut-0005Zy-5Q for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 00:26:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LNHCSQ007526
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 23:17:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07350-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 23:17:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LNH3wC007520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 23:17:04 GMT
Message-ID: <1332371826.9740.222.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 23:17:06 +0000
In-Reply-To: <alpine.DEB.2.02.1203211859490.15915@oneiric>
References: <alpine.DEB.2.02.1203211859490.15915@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: one more curiosity about oe-buildenv-internal: what's with BBEXTRA?
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
X-List-Received-Date: Wed, 21 Mar 2012 23:26:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 19:02 -0400, Robert P. J. Day wrote:
> apparently, given the following in oe-buildenv-internal:
> 
> BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> 
> you can use BBEXTRA to use a different bitbake directory than the
> default.  is this a debugging aid?  are normal users meant to know
> about this?  i don't see any mention of it anywhere.  in fact, from
> the top level of oe-core:
> 
> $ grep -r BBEXTRA *
> scripts/oe-buildenv-internal:BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> $

I was responsible for this one a long time ago and it was simply a
development aid. I was probably its main user although I haven't used it
in a while. We don't have multiple versions of bitbake being used
heavily anymore, thankfully.

Cheers,

Richard



