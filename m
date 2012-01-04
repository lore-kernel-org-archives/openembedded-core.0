Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiUIC-0005s4-PD for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:06:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04Gx3Jd021921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 16:59:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21648-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:58:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04Gwuqk021913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 16:58:57 GMT
Message-ID: <1325696336.20759.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:58:56 +0000
In-Reply-To: <1325696004.28005.80.camel@phil-desktop>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
	<CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
	<1325695277.28005.76.camel@phil-desktop>
	<1325695637.20759.32.camel@ted>
	<1325696004.28005.80.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 17:06:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 16:53 +0000, Phil Blundell wrote:
> On Wed, 2012-01-04 at 16:47 +0000, Richard Purdie wrote:
> > Just to note that looking for multiple versions can cause a fair bit of
> > network traffic as for http:// mirror urls it will have to wget each in
> > turn.
> 
> True, though I suppose if the fetching was to be moved into python
> (rather than an external wget) then it would just be repeated GETs over
> a single persistent connection which wouldn't be all that much overhead.
> And, even with non-persistent connections, the amount of data involved
> in establishing an extra TCP connection and sending a GET is fairly
> negligible compared to the size of the download you're going to end up
> doing.

The sstate code currently calls into the fetcher code so this would be
best as a fetcher enhancement but it complicates it as it would have the
be general code.

> >Better would be one file name and dynamic detection of the
> >compression format I guess.
> 
> Yes, or that.  It's a shame that "tar -a" doesn't have the capability to
> determine the compression method using magic numbers instead of the
> filename.

Indeed...

Cheers,

Richard



