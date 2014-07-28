Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D31E0701E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 09:26:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6S9PgJt029449; Mon, 28 Jul 2014 10:25:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kCOjND-WNtL9; Mon, 28 Jul 2014 10:25:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6S9OfWF026390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 28 Jul 2014 10:24:43 +0100
Message-ID: <1406539481.13346.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Jul 2014 10:24:41 +0100
In-Reply-To: <3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
References: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
	<FE5CD361-F77F-4383-B608-E216734EDB6E@dominion.thruhere.net>
	<1B858668EC6A94408DCA5225FDFA85AABCAC0413@ALA-MBA.corp.ad.wrs.com>
	<3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: remove non PN based -dev packages
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
X-List-Received-Date: Mon, 28 Jul 2014 09:26:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-28 at 10:51 +0200, Koen Kooi wrote:
> Op 28 jul. 2014, om 08:49 heeft Huang, Jie (Jackie) <Jackie.Huang@windriver.com> het volgende geschreven:
> >> -----Original Message-----
> >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >> Sent: Monday, July 28, 2014 2:30 PM
> >> To: Huang, Jie (Jackie)
> >> Cc: OE-core; Richard Purdie
> >> Subject: Re: [OE-core] [PATCH] alsa-lib: remove non PN based -dev packages
> >> 
> >> 
> >> Op 25 jul. 2014, om 12:05 heeft jackie.huang@windriver.com het volgende geschreven:
> >> 
> >>> From: Jackie Huang <jackie.huang@windriver.com>
> >>> 
> >>> All dev related items should be packaged in the core PN-dev package
> >>> not in seperate packages.
> >> 
> >> What's the upgrade path here for image and users that have 'alsa-dev' installed? Looks like there are
> > 
> > My patch is removing 'alsa-dev' and all related files goes into '${PN}-dev' (PN=alsa-lib here), so users need to install
> > alsa-lib-dev instead of alsa-dev.
> 
> *sigh* So you have no upgrade path for situations where 'alsa-dev' is already installed or listed in a packagegroup or image. Worse, you don't even understand the problem :/
> 
> > 
> >> now 2 conflicting packages, 'alsa-dev' in the feeds and 'alsa-lib-dev' on OE, without and
> > 
> > Only 'alsa-lib-dev' now with my patch, so no conflicts.
> 
> Hahahahahaha you are really funny.

I appreciate there is a problem here and we need to fix that. There is
also an education issue, people who don't know much about it don't
appreciate the struggles of someone maintaining package feeds.

Perhaps someone could write a short section for the docs about the
issues here? In future when this kind of problem comes up, we can then
at least point at the manual section to explain it.

Currently, most docs come from the "same old people", I'm partly writing
this to remind people that others can submit them and that they can help
massively in educating people.

They don't even need to be proper patches against the docs, just write a
few paragraphs, send it Scott Rifenbark's way and he can usually do
something with it. He tends to reword things so the manual has a
consistent tone and style anyway so it needn't be word perfect either,
its the content that matters (and that is the part Scott cannot do).

Cheers,

Richard


