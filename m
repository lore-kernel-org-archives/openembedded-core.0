Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0383A77E66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 01:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE66020A42;
	Tue, 17 Oct 2017 01:29:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u-rv58KmNE01; Tue, 17 Oct 2017 01:29:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADA6D2087C;
	Tue, 17 Oct 2017 01:29:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2BDC6162700; Mon, 16 Oct 2017 21:29:51 -0400 (EDT)
Date: Mon, 16 Oct 2017 21:29:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171017012951.GZ9221@denix.org>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
	<CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Tue, 17 Oct 2017 01:29:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 16, 2017 at 09:34:04PM +0100, Burton, Ross wrote:
> On 16 October 2017 at 18:30, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
> 
> >
> > > +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> > \
> > > +          file://fix-missing-header.patch \
> >
> > Those should be documented on commit log
> >
> >
> Agreed.  The missing header one should say what platform causes it to be a
> problem (in case it never gets upstreamed and someone tests it again on
> just glibc).  


> And is the pitch patch sufficiently broken that we need to backport it?

My point exactly - doesn't seem to be a very broad problem...

