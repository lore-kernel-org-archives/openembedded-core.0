Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B85E678220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B768208BA;
	Mon, 12 Jun 2017 15:32:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3aMxWw3V_7tC; Mon, 12 Jun 2017 15:32:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A67E207AF;
	Mon, 12 Jun 2017 15:32:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ED1F51624F4; Mon, 12 Jun 2017 11:32:10 -0400 (EDT)
Date: Mon, 12 Jun 2017 11:32:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170612153210.GT28053@denix.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<20170611184701.GQ28053@denix.org>
	<1497248565.30163.223.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1497248565.30163.223.camel@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Mon, 12 Jun 2017 15:32:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2017 at 08:22:45AM +0200, Patrick Ohly wrote:
> On Sun, 2017-06-11 at 14:47 -0400, Denys Dmytriyenko wrote:
> > On Fri, Jun 09, 2017 at 03:04:02PM +0200, Patrick Ohly wrote:
> > > As discussed in the "[Openembedded-architecture] Yocto Compatible 2.0
> > > + signature changes" mail thread, changes in a .bbappend cannot be
> > > done unconditionally. Making _append and _remove depend on overrides
> > > which get set based on DISTRO_FEATURES is one way of achieving this.
> > 
> > Just wanted to confirm that this feature is going to be optional, right?
> 
> To achieve "Yocto Compatible 2.0" status, something like this will be
> needed. But not everyone needs (or wants) that, so those who don't are
> free to not use it, and it is off by default.

Thanks for clarification.

-- 
Denys

