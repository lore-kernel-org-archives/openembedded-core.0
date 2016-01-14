Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id C0A0C731E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 22:13:43 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3phKfZ5sVtz3hjZY;
	Thu, 14 Jan 2016 23:13:42 +0100 (CET)
X-Auth-Info: d1C20AmufwaWn1tUqEpLzlafROuelifU2qyWaVrtOM0=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3phKfZ3ngfzvdWV; 
	Thu, 14 Jan 2016 23:13:42 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 14 Jan 2016 22:41:38 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601142215.19475.marex@denx.de>
	<CAP9ODKptS3b30mw8ZDZ1Pd2gLsN+wj8aJxxz+X4xWAr7qiAZCw@mail.gmail.com>
In-Reply-To: <CAP9ODKptS3b30mw8ZDZ1Pd2gLsN+wj8aJxxz+X4xWAr7qiAZCw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601142241.39038.marex@denx.de>
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
X-List-Received-Date: Thu, 14 Jan 2016 22:13:44 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 14, 2016 at 10:37:16 PM, Otavio Salvador wrote:
> On Thu, Jan 14, 2016 at 7:15 PM, Marek Vasut <marex@denx.de> wrote:
> ...
> 
> > Taking a look at u-boot.inc and uboot-config.bbclass makes me wonder how
> > all that could work at all. It's either a stackpile of legacy cruft or
> > just poor design.
> 
> I think it is a mix of both.
> 
> How would you address this in a clean way?

I would have one U-Boot build per package. Debian doesn't do it that way tho,
so their rationale might be something to consider here too.

I would also have exactly one variable to for a machine and it would be the
name of the config _WITHOUT_ any _config or _defconfig or _whatever suffix.

Best regards,
Marek Vasut

