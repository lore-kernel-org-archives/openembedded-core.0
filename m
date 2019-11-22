Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id E1F5C7FBA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 23:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B77AD40BF2;
	Fri, 22 Nov 2019 23:38:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uSzMOjk55glS; Fri, 22 Nov 2019 23:38:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 981ED40BCC;
	Fri, 22 Nov 2019 23:38:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5681117431F; Fri, 22 Nov 2019 18:38:10 -0500 (EST)
Date: Fri, 22 Nov 2019 18:38:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191122233810.GO4735@denix.org>
References: <1573778407-13250-1-git-send-email-denis@denix.org>
	<CALbNGRQFFrkNuv8---ck=16VLaN09_9G+=r1Ppb-yAerQYEbEw@mail.gmail.com>
	<6396b0dfd5c33ac1633eecd3a2f6d519d87438df.camel@linuxfoundation.org>
	<20191122231639.GN4735@denix.org>
MIME-Version: 1.0
In-Reply-To: <20191122231639.GN4735@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES, rename
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
X-List-Received-Date: Fri, 22 Nov 2019 23:38:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 22, 2019 at 06:16:39PM -0500, Denys Dmytriyenko wrote:
> On Fri, Nov 22, 2019 at 11:10:14PM +0000, Richard Purdie wrote:
> > On Fri, 2019-11-22 at 23:58 +0100, Andreas Müller wrote:
> > > Whatever this patch does renaming does nothing but causing me lots of
> > > useles (rebasing) efforts. To me ist is simlpy the worst patch of
> > > this
> > > year and thanks for blocking me with this. I am really really
> > > upset!!!!!!!
> > 
> > FWIW you can probably unblock yourself by adding a local copy of the
> > compatibility bbclass with the warning removed. That will then let you
> > fix the fallout at a time of your choosing.
> 
> I thought warning would be relatively harmless... Why would it be blocking?
> Do you want this to be a notice instead?
> 
> 
> > I was in two minds about the change to be honest but nobody commented
> > in review and I get really tired of a reputation for saying "no" to
> > "everything". What probably swung the balance is the ways you can work
> > around the change at least temporarily.
> 
> I was also surprised by relative silence in review. Plus, it was in 
> master-next for over a week and nobody complained either...

And to be fair, this is almost right after the release, so is the best time 
for such invasive changes - I did wait and held off submitting it for several 
months to not disrupt the release process!
So such overreaction is rather unwarranted...

-- 
Denys

