Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qk16V-0004AL-HT for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 23:48:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LKhWap005691
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 21:43:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04336-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 21:43:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LKhNFh005661
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 21:43:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2876A4.8060305@mentor.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<fc7ecf3f3b90f6949e790f18eeea908d069282d5.1311234475.git.sgw@linux.intel.com>
	<CAMKF1spf5Q2-fFL6=dGEjG+2Xrovujf9EXV70R5eZ4A9NDZUcw@mail.gmail.com>
	<4E2876A4.8060305@mentor.com>
Date: Thu, 21 Jul 2011 21:43:20 +0100
Message-ID: <1311281000.2344.83.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 14/20] Make intltool use perlnative instead of perl on host
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
X-List-Received-Date: Thu, 21 Jul 2011 21:48:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 11:57 -0700, Tom Rini wrote:
> On 07/21/2011 11:47 AM, Khem Raj wrote:
> > On Thu, Jul 21, 2011 at 12:53 AM, Saul Wold <sgw@linux.intel.com> wrote:
> >>
> >> -inherit autotools pkgconfig
> >> +inherit autotools pkgconfig perlnative
> >>
> >>  export PERL_virtclass-native = "/usr/bin/env perl"
> > 
> > is the above line still needed
> 
> It's actively wrong now and needs to be /usr/bin/env nativeperl (which
> is a wrapper script to get to perl-native/perl).

Patch please :)

Cheers,

Richard




