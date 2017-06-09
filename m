Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id CC271782CE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 22:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DAEF420C0A;
	Fri,  9 Jun 2017 22:52:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oSB5OY3Ud3D4; Fri,  9 Jun 2017 22:52:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4748207BD;
	Fri,  9 Jun 2017 22:52:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 459C51624E9; Fri,  9 Jun 2017 18:52:26 -0400 (EDT)
Date: Fri, 9 Jun 2017 18:52:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20170609225226.GN28053@denix.org>
References: <1497033695-138298-1-git-send-email-denis@denix.org>
	<CABcZANmLwHK_ub07QaRtqybdXfRp78hS9hsH6DED4BgvJkYtJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANmLwHK_ub07QaRtqybdXfRp78hS9hsH6DED4BgvJkYtJA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-config: check UBOOT_CONFIG variable, not flags, for error conditions
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
X-List-Received-Date: Fri, 09 Jun 2017 22:52:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 09, 2017 at 03:42:28PM -0700, Christopher Larson wrote:
> On Fri, Jun 9, 2017 at 11:41 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > +    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
> >
> > -    if not ubootmachine and not ubootconfigflags:
> > +    if not ubootmachine and len(ubootconfig) == 0:
> >
> 
> There’s no need for len() here, just `if not ubootmachine and not
> ubootconfig:` should do, since a string is falsy when it’s empty.

Thanks, Chris,

I was just using the same syntax that was already there:

-    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
     if len(ubootconfig) > 0:
-    elif len(ubootconfig) == 0:
-       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')

I can submit v2, if it would make more sense.

-- 
Denys

