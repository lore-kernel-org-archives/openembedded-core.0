Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9846B1FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:17:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NBTONZ012061; Fri, 23 Aug 2013 12:29:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uAMwMC5Kb_iK; Fri, 23 Aug 2013 12:29:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NBTGLQ012057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 23 Aug 2013 12:29:18 +0100
Message-ID: <1377256631.6762.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Fri, 23 Aug 2013 12:17:11 +0100
In-Reply-To: <1377181123.13664.11.camel@phil-desktop.brightsign>
References: <1377180295.6762.19.camel@ted>
	<1377181123.13664.11.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 11:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 15:18 +0100, Phil Blundell wrote:
> On Thu, 2013-08-22 at 15:04 +0100, Richard Purdie wrote:
> > With that in mind, I think some kind of HTML support in OE-Core is
> > important going forward. Equally, I dislike having things there which we
> > cannot test. I know some people have looked into this and it appears
> > midori is the best option for something with a small number of
> > additional dependencies. I therefore currently think this is something
> > we should make a decision to include since it gives us significantly
> > better coverage of things like webkit which are a already in the core
> > yet totally untested at present.
> 
> WebKit itself comes with a bunch of test wrappers (and tests!) for
> different platforms and if the aim of the exercise is to test webkit
> then it seems like maybe we should just be installing and using those.
> Midori would be fine for testing the parts of webkit that it uses, but
> obviously it doesn't exercise anything other than the Gtk port which
> still leaves you with a bit of a hole in your coverage.

I think ultimately we need both, a real world user of webkit and also a
webkit-ptest type package too. They both let us test different things,
one probably more quickly than the other, with the other being more
complete.

Cheers,

Richard


