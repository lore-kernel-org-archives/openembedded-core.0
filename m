Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW8w6-0003A5-Rm for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 16:52:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1Fjpiq016971;
	Thu, 1 Dec 2011 15:45:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15777-08; Thu,  1 Dec 2011 15:45:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1FjgEE016965
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 15:45:43 GMT
Message-ID: <1322754351.17484.138.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Dec 2011 15:45:51 +0000
In-Reply-To: <EA746CBB-C2AC-4DD2-83AB-880B4E2F96F9@dominion.thruhere.net>
References: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
	<1322675553.17484.20.camel@ted>
	<F9E3D91B-529C-4E90-BF2F-DEB5E372BECE@dominion.thruhere.net>
	<1322744495.17484.125.camel@ted>
	<EA746CBB-C2AC-4DD2-83AB-880B4E2F96F9@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Thu, 01 Dec 2011 15:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 15:58 +0100, Koen Kooi wrote:
> Op 1 dec. 2011, om 14:01 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-11-30 at 19:15 +0100, Koen Kooi wrote:
> >> Op 30 nov. 2011, om 18:52 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Wed, 2011-11-30 at 14:40 +0100, Koen Kooi wrote:
> >>>> Upstream has grown cmake support which would allow us to dump the OE
> >>>> autotools hack, but the cmakefile doesn't install the .pc file either
> >>>> and breaks with zlib-native
> >>>> 
> >>>> Also remove unused site config file
> >>> 
> >>> How did you determine this was unused?
> >> 
> >> By removing it and rebuilding zlib(-native) and zlib dependant apps.
> >> In case it does turn out to be needed we should switch to cmake. I'm
> >> OK with having a OE hack for autotools, but a broken OE hack....
> > 
> > I don't think you understand what that site_config file triggers. It
> > triggers code in siteconfig.bbclass which saves the *results* of the
> > zlib configure for use in speeding up subsequent configure tasks.
> > 
> > Does that change the need to remove it?
> 
> I honestly don't know, I've never dealt with that part of siteconfig.
> If the file is needed I'll gladly respin the patch.

That file does make sense so please do :)

Cheers,

Richard



