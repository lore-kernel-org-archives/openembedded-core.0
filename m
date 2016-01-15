Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4834D731C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:07:59 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3phPWg1tpHz3hj9k;
	Fri, 15 Jan 2016 02:07:59 +0100 (CET)
X-Auth-Info: BOtkbLLsRvlwT+6VeDmSHeEVjUyPIF2bXp6bEdVeFvc=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3phPWf70kSzvdWV; 
	Fri, 15 Jan 2016 02:07:58 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 15 Jan 2016 02:07:58 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601142241.39038.marex@denx.de>
	<CAP9ODKocSQ0D4wRo-XpD9kYJ-V5hPSoWY+Yg2zFhv_Lp=vhjKw@mail.gmail.com>
In-Reply-To: <CAP9ODKocSQ0D4wRo-XpD9kYJ-V5hPSoWY+Yg2zFhv_Lp=vhjKw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601150207.58412.marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Fri, 15 Jan 2016 01:08:00 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 15, 2016 at 12:42:18 AM, Otavio Salvador wrote:
> On Thu, Jan 14, 2016 at 7:41 PM, Marek Vasut <marex@denx.de> wrote:
> > On Thursday, January 14, 2016 at 10:37:16 PM, Otavio Salvador wrote:
> >> On Thu, Jan 14, 2016 at 7:15 PM, Marek Vasut <marex@denx.de> wrote:
> >> ...
> >> 
> >> > Taking a look at u-boot.inc and uboot-config.bbclass makes me wonder
> >> > how all that could work at all. It's either a stackpile of legacy
> >> > cruft or just poor design.
> >> 
> >> I think it is a mix of both.
> >> 
> >> How would you address this in a clean way?
> > 
> > I would have one U-Boot build per package. Debian doesn't do it that way
> > tho, so their rationale might be something to consider here too.
> 
> This is what we do in uboot-config class, isn't it?

The class lacks documentation and is written in rather obscure way, so I am
not sure about how the result is packaged, sorry.

> Without going deep on the minor details, could you describe how you
> think it should be done?

Can you be more specific about this "it" ? What do you refer to ?

Best regards,
Marek Vasut

