Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF7960FE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:48:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IH32TB014383; Wed, 18 Sep 2013 18:03:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lTjx4ErPe7hT; Wed, 18 Sep 2013 18:03:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IH2u9S014378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 18 Sep 2013 18:02:58 +0100
Message-ID: <1379522909.18603.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 17:48:29 +0100
In-Reply-To: <CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
	<CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 16:48:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-18 at 17:35 +0100, Paul Barker wrote:
> My time for this is fairly limited, but felt it was important that
> someone maintain it as it's a critical dependency for a lot of us.

We all suffer from time problems so I appreciate someone stepping up
there, it was certainly a gap.

> As I understand things the Yocto Project is currently in a
> stabilisation cycle. So my plan was to wait until 1.5 is released and
> then look at moving oe-core to opkg-0.2.0, adding PACKAGECONFIG
> options (I've got a signed package feed I'd like my target to be able
> to verify, this needs opkg to be built with --enable-gpg) and whatever
> else needs doing. For now the experimental recipes are available from
> https://bitbucket.org/opkg/meta-opkg.

PACKAGECONFIG sounds great but is 1.6 material, yes.

> As a side question - is there a specific maintainer for opkg-utils?
> I'd like to discuss whether two separate repositories is a good idea
> or whether we'd benefit from merging this into the opkg repo.

I can probably speak for it. It was created out of necessity, we had the
situation where patches were piling up against ipkg-utils and since that
was dead, we created a new repository we could merge changes into rather
than having piles of patches.

There are some pretty horrific things in there and it probably needs a
good clean  out, we only use a small part of it. If we have an actively
maintained place for the in opkg, I'd be ok with that. Equally having
them separate does better force sane API decisions (flag days where both
need to change at the same time would be bad for example). If you wanted
commit access to opkg-utils that could probably be arranged if that
helps?

Cheers,

Richard






