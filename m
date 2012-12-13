Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tj8VV-0007U4-9v for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 14:07:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBDCqev7000839;
	Thu, 13 Dec 2012 12:52:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32719-04; Thu, 13 Dec 2012 12:52:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBDCqWel000832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 13 Dec 2012 12:52:33 GMT
Message-ID: <1355403151.32519.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 13 Dec 2012 12:52:31 +0000
In-Reply-To: <alpine.DEB.2.02.1212121438400.13564@oneiric>
References: <alpine.DEB.2.02.1212121438400.13564@oneiric>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: which fetch protocols are actually in any use these days?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 13:07:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-12 at 14:42 -0500, Robert P. J. Day wrote:
> while the bitbake fetcher code supports a number of protocols, which
> ones are *actually* in serious use these days?  while the fetcher code
> handles protocols like osc:// and p4://, is anyone actually using
> those?
> 
>  i'm writing a tutorial on fetching and i just don't want to spend any
> time on protocols no one's going to care about.  thanks.

Few care about those two, at least looking for the patches we receive to
those fetchers. p4 may have some users, I suspect osc has none since I
know why it was added and that it isn't used by that user group.

Having said that I don't see a pressing need to remove them either as
they still work, at least in theory.

Cheers,

Richard



