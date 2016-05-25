Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CECC060721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 06:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P6xQTS010177; Wed, 25 May 2016 07:59:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cKeCS2Ynowkj; Wed, 25 May 2016 07:59:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P6xN0I010174
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 May 2016 07:59:24 +0100
Message-ID: <1464159563.9570.90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2016 07:59:23 +0100
In-Reply-To: <57454A49.7030700@mlbassoc.com>
References: <57453968.9080600@mlbassoc.com>
	<60AB59B2-92D3-426A-8EB8-9FC717EC087E@gmail.com>
	<57454A49.7030700@mlbassoc.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sip.bbclass?
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
X-List-Received-Date: Wed, 25 May 2016 06:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 08:46 +0200, Gary Thomas wrote:
> On 2016-05-25 08:13, Khem Raj wrote:
> > 
> > > On May 25, 2016, at 8:34 AM, Gary Thomas <gary@mlbassoc.com>
> > > wrote:
> > > 
> > > I was just wondering why sip.bbclass is in OE-core (at least
> > > the Poky version master:c7e614c438706) when nothing uses it?
> > 
> > OE-core can have components which are commonly used in OE
> > infrastructure, especially bindings
> > may be checking all layers in layerindex would better answer your
> > question
> 
> My impression was [perhaps erroneously] that for an object to be
> in OE-core, it had to be _needed_ by some other object in OE-core.
> Many recipes have been migrated out when there was no longer a
> use for them, so why not .bbclass files as well?  Most other
> layers that need .bbclass files that aren't in OE-core just have
> their own classes...

Nothing in OE-Core uses extrenalsrc directly but we'd still want
something like that in the core so I don't think the rule is absolute.
What we wouldn't want to see is multiple layers maintaining different
and potentially incompatible versions of a class file.

That said, I think there are a few that we probably could clean up.

Cheers,

Richard


