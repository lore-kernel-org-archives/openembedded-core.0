Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzElM-0008Nn-8C for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 21:53:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2EKpVxZ007084
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 20:51:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06965-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 20:51:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2EKpQMk007078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 20:51:26 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D7E44D4.2020701@mentor.com>
References: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
	<4D7E44D4.2020701@mentor.com>
Date: Mon, 14 Mar 2011 20:51:20 +0000
Message-ID: <1300135880.30423.571.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Make GNU_HASH failures fatal
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
X-List-Received-Date: Mon, 14 Mar 2011 20:53:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-14 at 09:39 -0700, Tom Rini wrote:
> On 03/14/2011 08:35 AM, Koen Kooi wrote:
> > Hi,
> >
> > GNU_HASH QA failures are nearly gone in .dev, but still rampant in
> > oe-core. I would like to propose making them fatal so they get fixed.
> > The most worrysome offenders currently are gcc-runtime and perl.
> 
> It's a little worse than that actually.  Nothing is fatal currently.  I 
> think we should grab warning/error
> bit I did in oe.dev and pull that in (and then talk about adding RPATH 
> to the fatal list).

I think there are "fatal" warnings in OECore in that the QA errors
trigger non-zero exit codes. Warnings don't do that and GNU_HASH is a
warning, RPATH is an error from what I remember...

Cheers,

Richard




