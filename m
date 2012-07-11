Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sp3Zs-0005oO-4k for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 22:32:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BKKqcI012463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 21:20:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11943-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 21:20:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BKKhQX012456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 21:20:44 +0100
Message-ID: <1342038045.11939.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 21:20:45 +0100
In-Reply-To: <CAJTo0LYQTGihjGz5iYC+L34QY4gf00urFqr92MyiHrwWyMC==A@mail.gmail.com>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
	<1342028210.11939.35.camel@ted> <20120711135455.72b90a06@wrlaptop>
	<CABcZANmXGq8kccKxaqtwG7ekBqSsEzCwmwjTHSbXo9c5VsS-Pg@mail.gmail.com>
	<CAJTo0LYQTGihjGz5iYC+L34QY4gf00urFqr92MyiHrwWyMC==A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 20:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 20:54 +0100, Burton, Ross wrote:
> On 11 July 2012 20:01, Chris Larson <clarson@kergoth.com> wrote:
> > That's one possibility. The other would be to treat _append/_prepended
> > functions as independent entities. Rather than concatenating
> > functions, it'd add them to the prefuncs/postfuncs or equivalent.
> > Without concatenation, there'd be no issues with mismatches.
> 
> I always thought it would be best to give each append/prepend chunk a
> unique name and then call them sequentially instead of gluing them
> together.

Some of them even rely on variables set in other fragments. I think I
killed the one example I saw but there still could be something
potentially relying on this :(

I agree we need to fix this. I'm tempted to have the python parser just
error on finding tab indentation.

Cheers,

Richard



