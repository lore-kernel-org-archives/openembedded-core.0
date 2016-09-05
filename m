Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C71B7720B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 11:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85B2CYK002374; Mon, 5 Sep 2016 12:02:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FGa4azrPVp2m; Mon,  5 Sep 2016 12:02:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85B2YH0002398
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Sep 2016 12:02:35 +0100
Message-ID: <1473073354.20226.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Date: Mon, 05 Sep 2016 12:02:34 +0100
In-Reply-To: <00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 11:02:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-09-05 at 00:33 +0200, Marek Vasut wrote:
> On 09/05/2016 12:23 AM, Marek Vasut wrote:
> > On 09/05/2016 12:11 AM, Richard Purdie wrote:
> > > On Sun, 2016-09-04 at 23:49 +0200, Marek Vasut wrote:
> > > > On 09/04/2016 11:28 PM, Richard Purdie wrote:
> > > > > On Sun, 2016-09-04 at 18:21 +0200, Marek Vasut wrote:
> > > > Yes, except when new version of U-Boot comes out and we want to
> > > > perform
> > > > update of the u-boot{,mkimage,fw-utils} recipes, with this
> > > > current
> > > > patch
> > > > as is, we'd only have to rename these recipes and change the
> > > > version
> > > > in
> > > > u-boot-common.inc . With your proposal, we'd have to not only
> > > > rename
> > > > the
> > > > recipes and tweak u-boot-common.inc, but also edit their
> > > > content and
> > > > change the "require u-boot-common_20yy.mm.inc" bit, which adds
> > > > some
> > > > toil.
> > > Unless its:
> > > 
> > > require u-boot-common_${PV}.inc
> > > 
> > > since it should be able to extract PV from the filename...
> > Ah right, thanks :)
> > 
> > I'll rebuild/retest and send a V2 .
> > 
> I was a bit hasty, the u-boot.inc includes u-boot-common.inc without
> having PV set. Any idea how to deal with that ?

Just put includes in the versioned files rather than from u-boot.inc?

Cheers,

Richard


