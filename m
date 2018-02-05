Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 534C7783DE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8966F20B04;
	Mon,  5 Feb 2018 22:13:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZN6gFlkCvpO3; Mon,  5 Feb 2018 22:13:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6000920862;
	Mon,  5 Feb 2018 22:13:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EAB14163284; Mon,  5 Feb 2018 17:13:00 -0500 (EST)
Date: Mon, 5 Feb 2018 17:13:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180205221300.GG2786@denix.org>
References: <20180205182112.GF2786@denix.org>
	<CAJTo0LYBFGxrHiDUK1FaJW3YB6hNZf4jiVTBgd7C2ONC9sq9XQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYBFGxrHiDUK1FaJW3YB6hNZf4jiVTBgd7C2ONC9sq9XQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: Variable key %s (%s) replaces original key %s (%s).
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
X-List-Received-Date: Mon, 05 Feb 2018 22:13:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 05, 2018 at 09:53:44PM +0000, Burton, Ross wrote:
> On 5 February 2018 at 18:21, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Am I supposed to see bunch of these warnings (3 during parsing and 20 more
> > during build):
> >
> > WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_NAME}-base
> > (${KERNEL_PACKAGE_NAME}-image) replaces original key RDEPENDS_kernel-base
> > (kernel-devicetree).
> >
> >
> > From kernel.bbclass:
> >
> > # Allow machines to override this dependency if kernel image files are
> > # not wanted in images as standard
> > RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
> >
> 
> That's your kernel recipe not liking the new multiple-name kernel classes,
> and if your problem is the same as oe-core's qemu* machines then this is
> the fix:
> 
> -RDEPENDS_kernel-base = ""
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

Ah, I see, thanks! I assume all other operations with that variable (like 
appends) would have to be changed similarly?

-- 
Denys

