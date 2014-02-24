Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D78876F328
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:27:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1OGRH4t020826; Mon, 24 Feb 2014 16:27:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8SCj8fmCmQdd; Mon, 24 Feb 2014 16:27:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1OGRB3c020821
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Feb 2014 16:27:13 GMT
Message-ID: <1393259224.31769.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Feb 2014 16:27:04 +0000
In-Reply-To: <20140224160954.GI26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Mon, 24 Feb 2014 16:27:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-24 at 17:09 +0100, Martin Jansa wrote:
> On Mon, Feb 24, 2014 at 03:41:11PM +0000, Burton, Ross wrote:
> > On 24 February 2014 15:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Can we start by adding
> > > include conf/distro/include/seperatebuilddir.inc
> > > to
> > > conf/distro/defaultsetup.conf
> > > ? so that more people start using it and possibly report issues in their
> > > builds?
> > 
> > That list is opt-in and mainly covers oe-core, so this gets tested
> > every time the YP autobuilder does a world build.  We need a meta-oe
> > world build where autotools.bbclass sets B="${WORKDIR}/build": it's
> > literally just this one-line patch.
> 
> But doesn't cover oe-core built with different combinations for
> PACKAGECONFIGs, .bbappends etc, so including this file in
> defaultsetup.conf can still reveal few issues in oe-core recipes.

Patch out for testing, I'll merge it if nobody objects...

Cheers,

Richard



