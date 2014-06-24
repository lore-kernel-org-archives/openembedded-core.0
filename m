Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id 351E465E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 06:01:44 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 24 Jun 2014 08:01:43 +0200
Date: Tue, 24 Jun 2014 08:01:30 +0200
From: Anders Darander <anders@chargestorm.se>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20140624060130.GA22071@ad.chargestorm.se>
Mail-Followup-To: Kang Kai <Kai.Kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<89ff3aaad229d018851347dcda7d8c0e7cea6429.1403490121.git.kai.kang@windriver.com>
	<20140623114436.GA16414@ad.chargestorm.se>
	<53A8D92F.3010304@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53A8D92F.3010304@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] iptables: update init script and bb file
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
X-List-Received-Date: Tue, 24 Jun 2014 06:01:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Kang Kai <Kai.Kang@windriver.com> [140624 03:49]:

> On 2014=E5=B9=B406=E6=9C=8823=E6=97=A5 19:44, Anders Darander wrote:
> > * Kai Kang <kai.kang@windriver.com> [140623 04:34]:
> >> Update path of command iptables in init script that we put it in
> >> /usr/sbin rather than /sbin. Then update bb file to install init scrip=
t,
> >> configure and rules files.
> > These new files aren't that big, but could you anyway package at least
> > the rules files into a separate package? Using an RRECOMMENDS would be
> > fine, as I can easily add a BAD_RECOMMENDATION for that package.

> Of course.

> And as I replied in last main, do you think that an empty rule is=20
> better? A little concern is for iptables newbies.

Well, I'd be at lest a little bit happier to have the ipv6 rules file
obey the ipv6 distro feature, see below.

Besides, most users of OE-Core won't have any benefit of a pre-generated
iptable rules file. Remember, we're building embedded devices that have
everything but a standard setup.

If you want a static firewall configuration supplied by oe-core, can't
we package it in a separate package anyway?

> > It might be that I don't need/want both of iptables and ip6tables
> > installed; or even that I don't want either of those installed by
> > default.

> iptables and ip6tables are not split into separated packages, so I put=20
> them together. And package iptbales is not installed by default indeed.

No, but at least we're not building IPv6 support into the package if
ipv6 is not set in DISTRO_FEATURES. At the very least, the ip6tables
rule file should obey that DISTRO_FEATUR also.

Cheers,
Anders

--=20
Naeser's Law:
	You can make it foolproof, but you can't make it damnfoolproof.

