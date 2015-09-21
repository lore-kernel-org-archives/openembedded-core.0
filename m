Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E0CA065D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:49:18 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nKMvx0rqjz3hjGP;
	Mon, 21 Sep 2015 12:49:17 +0200 (CEST)
X-Auth-Info: 9COjeeXz8orgplNz1+DfHD11dAiliKxQ5kcfj1VS2Zo=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nKMvw6GqbzvdWS; 
	Mon, 21 Sep 2015 12:49:16 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 12:49:34 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442702597-5619-1-git-send-email-marex@denx.de>
	<1442702597-5619-6-git-send-email-marex@denx.de>
	<CAJTo0LZhfftBwPohVS7FkxerUu5TvfeXEXJAU5i6Ry8i=DUyYQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZhfftBwPohVS7FkxerUu5TvfeXEXJAU5i6Ry8i=DUyYQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201509211249.34740.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] openssl: Add nios2 configuration
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
X-List-Received-Date: Mon, 21 Sep 2015 10:49:21 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, September 21, 2015 at 12:35:08 PM, Burton, Ross wrote:
> On 19 September 2015 at 23:43, Marek Vasut <marex@denx.de> wrote:
> > +Upstream-Status: Inappropriate [configuration]
> 
> Surely you do want this patch upstream so you don't need to always patch
> openssl?  In which case Pending for "I haven't submitted yet" or Submitted
> if you have sent it upstream.

I think I have even better solution than this one.

This approach [1] is applicable to nios2 just fine, so I'll go with the
same. Can the rest of the patches here be applied, so I don't have to
repost them please ?

[1] http://patchwork.openembedded.org/patch/88641/

Best regards,
Marek Vasut

