Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHkwg-0007Sh-Cw
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 00:53:26 +0200
Received: by pzk36 with SMTP id 36so741480pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 15:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=R89azK6Bh8us5Nb8heGJk8C1jpL2wiuejK7YoBkulTo=;
	b=L2mXEJ7Xboo74cAA4C1wOa2uB8sBDNS/+kHKDaW9BXa+AE45ZuPsEZr593DZPwL14p
	O4oxShuN51jh2URkybuLNj7QJup4MRpZ6nEvH9Ou0JcICz8KXC6QPpVElhTD7L/fQHhP
	ysaHqpuy+chD9jFiBQslN98Fc7IU1W7yDGmVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UZOt4a8ZzNzkrUdKpQ/kpUmZg7Posn37xN2yyOvR+LdTjNDqIA1J6Mq9fFaRaU8/XI
	uobl0CiUHmbiA0zfNgCvTIT+SXu7ltPIZWi2wuLR1hUV2sIpLHUu5RWkyQD0OtRcUrV3
	aBf/F29yBWC3xvLP6Qy/5pCwV5ZxdVwxJ5O+8=
Received: by 10.68.15.134 with SMTP id x6mr2164727pbc.308.1304549444823;
	Wed, 04 May 2011 15:50:44 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y5sm1005813pbq.57.2011.05.04.15.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 15:50:43 -0700 (PDT)
Date: Wed, 4 May 2011 15:50:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20110504225008.GA9750@sakrah.homelinux.org>
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
	<B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
	<BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
	<4DB9E439.5020009@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DB9E439.5020009@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc 2.13 upgrade
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
X-List-Received-Date: Wed, 04 May 2011 22:53:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/04/11 15:03), Saul Wold wrote:
> On 04/27/2011 01:13 PM, Khem Raj wrote:
> >On Wed, Apr 27, 2011 at 9:44 AM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
> >>Why not move those srcrevs into the recipe? IIRC these ones aren't affected by RPs concerns
> >
> >I am ok doing that but here
> >http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001536.html
> >
> >it seems we still need to investigate it before we start moving
> >SRCREVs to recipes.
> >
> We are days away from having this implemented (early next week is
> the plan right now). Once you see the big pull that moves SRCREVs,
> then you can go ahead with your upgrade.

The SRCREV move happened today. I have updated the eglibc patch
accordingly and pushed it to contrib branch here. I have earlier
tested it on all arches this time I tested only on arm and it still
works fine. So please try it out in your configurations and let me know
if anything is needed.

branch is here

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.13

Thanks

-Khem


