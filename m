Return-Path: <ynezz@mengele.ibawizard.net>
Received: from mengele.ibawizard.net (ibawizard.net [82.208.49.253])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0AE6066A;
	Wed,  7 Aug 2013 12:23:21 +0000 (UTC)
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 2CDC21D36C6E; Wed,  7 Aug 2013 14:23:15 +0200 (CEST)
Date: Wed, 7 Aug 2013 14:23:15 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130807122314.GF17450@ibawizard.net>
References: <51F18346.2@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51F18346.2@windriver.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [oe] Add lua to oe-core.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2013 12:23:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Randy MacLeod <randy.macleod@windriver.com> [2013-07-25 15:57:58]:

> lua-5.2.2 is current, see: http://www.lua.org/download.html
> so we'd likely uprev and send that version.

Just FYI Lua 5.2 has quite a lot of changes to Lua 5.1[1].  So I wouldn't
consider it as an drop-in replacement for Lua 5.1. Simply said it's not
compatible out of the box.

> oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
> meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
>              --without-lua \

For example lighttpd uses Lua 5.1.

1. http://www.corsix.org/content/look-lua-52-work3

-- ynezz

