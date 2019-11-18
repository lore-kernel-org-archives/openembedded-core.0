Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1CF7F977
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47GrLg6dBWzD5;
	Mon, 18 Nov 2019 15:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574085900;
	bh=4/PpEfQb9eUtGcRaArtLszBnI82pwKahvBuHrl8P9/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5Ma7Cei5CcoRDKubPCmSQiC9jpYhocCCbal4KXWUCDRX5xop1qJx9cdyx4mInN20
	oe9cso0+c5h5lmPkATeAvGvrG5rfiRYhqLzX0VN4MHUWnO6wkuHqhZPGL22E93+LGd
	tdDthztwb6ZW/l3pn4VsZRYYy/61AtcS9R1P4Hr+VcPnfSb2b/cdQvIP3Nx2SDTpLk
	NYDSOGZ5wGaRP5WhKOPpvjFPL1xMPafO8B5xr4Nnf1wVtHSXylGQhbrQvL4LXtUl9W
	pdktR6ZB2H/5ZmiIfBXfUOwxwDe7tB5ufkwS1L89LlLMbujs7hqWcvxbzY+Ox98BbI
	o5/2+uURLfsLWvyJ0AKBXNlRc+zwX/W88btgYp0BcCJlT4xeinIBCM/sA155WLYE/R
	v0HNVzj9aUjAZIKFSNZzoeuaC3J1A6LOOAH2klkLZk5jkluuWEeQEtXD4tYvW/MhH3
	5ebLFhLbjH7lTYBFJqorGqmkh8JWzfxBbyJbTDj0zxm/C5d/DsZ1pfMLu8uL/zEJq3
	23Ty63/8Y+S9oWLn2Hx37pWCvvZsauQyyiv1/aKjewTjho8hnZ2fxiJN/bwRkALU7H
	RAFIVtFCBlpY2BvHMVzaw1CpGrVPgUVHgJy7BICw5XnxxSujpG10yqIH8rI/S1iBpk
	849D04G3SXYogajLS0P4LRgE=
Date: Mon, 18 Nov 2019 16:04:56 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191118140456.GA11960@localhost>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
	<20191114125101.GB13971@localhost>
	<67857156-6a64-13bf-d2cb-226d96a4031f@intel.com>
MIME-Version: 1.0
In-Reply-To: <67857156-6a64-13bf-d2cb-226d96a4031f@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Mon, 18 Nov 2019 14:05:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 14, 2019 at 01:16:44PM +0000, Ross Burton wrote:
> On 14/11/2019 12:51, Adrian Bunk wrote:
> > On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
> > > On 13/11/2019 08:19, Adrian Bunk wrote:
> > > > +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
> > > > +CVE_CHECK_WHITELIST += "CVE-2019-6470"
> > > 
> > > Can you be a bit more explicit about why this is whitelisted?
> > 
> > Something like
> >    BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
> >    dhcpd is already recent enough.
> 
> Right.

v2 sent.

> Ross

cu
Adrian

