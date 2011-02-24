Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Psd4Y-0006l1-NR for openembedded-core@lists.openembedded.org;
	Thu, 24 Feb 2011 16:25:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1OFBEmL029498
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:11:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29334-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:11:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1OFB8bl029492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:11:09 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <597E8E15-FDC9-4CE7-A81F-78D436E362E4@dominion.thruhere.net>
References: <597E8E15-FDC9-4CE7-A81F-78D436E362E4@dominion.thruhere.net>
Date: Thu, 24 Feb 2011 15:11:06 +0000
Message-ID: <1298560266.26736.167.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake error when network is unreachable
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 15:25:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-02-24 at 10:27 +0100, Koen Kooi wrote:
> Due to a misconfiguration in my proxy setup bitbake failed to fetch
> some things. It took me a while to figure out that the proxy setup was
> broken, because the error bitbake gave me was:
> 
> 'FetchError' object has no attribute 'startswith'
> 
> Is this a fetch2 integration problem?

I suspect:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=91c0b3a2e6d006224d8d2b661ca7528e9d036f1b

which would at least make the error clearer...

Yes, I know I need to get that back to bitbake upstream but note we're
talking about fixes found in the past 24 hours and I've only just seen
an all green build from the autobuilder after hearing rumours about
build failures from recent changes.

Cheers,

Richard

PS: Could we fix this list's addresses, it has the same problem the tsc
list had.



