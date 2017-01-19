Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 51F41605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 346D120B66;
	Thu, 19 Jan 2017 17:45:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eFZjRTRqTuVx; Thu, 19 Jan 2017 17:45:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09F452099C;
	Thu, 19 Jan 2017 17:45:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9E0D9162324; Thu, 19 Jan 2017 12:45:40 -0500 (EST)
Date: Thu, 19 Jan 2017 12:45:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170119174540.GY15833@denix.org>
References: <20170119165803.22583-1-raltherr@google.com>
	<20170119173700.GX15833@denix.org>
	<CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 17:45:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2017 at 05:40:15PM +0000, Burton, Ross wrote:
> On 19 January 2017 at 17:37, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Sometimes it's useful to load ramdisk in a specific location. Your patch
> > unconditionally removes this support, which is not a desired change. I have
> > a patch queued up to do it conditionally, which I'll try to submit shortly.
> >
> 
> Would that be the same as Nathan's "kernel-fitimage.bbclass: Allow unset
> load/entry addresses for ramdisks"?

Yeah, that one too, missed it... Been sitting there since October?

-- 
Denys

