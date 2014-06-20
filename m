Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2769E65F1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 10:24:13 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1WxvzR-0006Ww-2T for openembedded-core@lists.openembedded.org;
	Fri, 20 Jun 2014 12:24:13 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 12:24:13 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 12:24:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jun 2014 12:24:01 +0200
Message-ID: <lo1242$195$1@ger.gmane.org>
References: <20140610100722.GC2433@jama> <1403258272.2104.87.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1403258272.2104.87.camel@ted>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-06-02
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 10:24:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef op 20-06-14 11:57:
> I know that with some of the changes in oe-core, meta-oe is suffering a 
> little. I've been working on fixing up some of a world build of meta-oe 
> with patches including the problematic autoconf one applied.
> 
> My WIP is:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/meta-oe&id=9ece5e493b7844a7282eb883effa9d9a5b56d20e

Thanks!

>
> 
I appreciate its a huge patch and needs splitting up but there are only
> so many hours in the day.
> 
> Of note are a few sepbuild fixes in there and one for the binconfig pcre 
> issue that apache2 has, introduced by the binconfig change in OE-Core. I 
> took the opportunity to clean up the -native recipe a bit, it should be 
> closer to the main recipe and allow it to be converted to BBCLASSEXTEND 
> in due course.

Looks like we did similar things: http://patches.openembedded.org/patch/73919/

I noticed that the LAMP recipes are really, really ugly for historical
reasons. With the autotools updates in oe-core and a few years of upstream
development most hacks aren't needed anymore. Any volunteers for cleaning up
those recipes?

regards,

Koen

> 
> There are some fixes for talloc which I know has caused some headaches 
> too.
> 
> I will try and find the time to clean this up and submit it piece by 
> piece but if anyone beats me to it, great and hopefully nobody will 
> duplicate the work.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTpAvBMkyGM64RGpERApouAKCavK3jHaxDCXx8XVGAgoYniV5GFwCfSw7C
DmtUiAcJng1kxC/EBMWaY+k=
=o518
-----END PGP SIGNATURE-----


