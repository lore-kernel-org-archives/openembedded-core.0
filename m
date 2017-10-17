Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7717821B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 22:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19D2D20A3B;
	Tue, 17 Oct 2017 22:59:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eIQMMpHGXlxB; Tue, 17 Oct 2017 22:59:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE3B2204B1;
	Tue, 17 Oct 2017 22:59:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7956B162706; Tue, 17 Oct 2017 18:59:43 -0400 (EDT)
Date: Tue, 17 Oct 2017 18:59:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20171017225943.GN9221@denix.org>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
	<CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
	<1508228478.12731.1.camel@collabora.co.uk>
	<CAP9ODKobM2qGirCLFrM-sNV=-LgbHWMFCGba_U2Wq4ckY8L7+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKobM2qGirCLFrM-sNV=-LgbHWMFCGba_U2Wq4ckY8L7+A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 17 Oct 2017 22:59:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 08:31:10AM -0200, Otavio Salvador wrote:
> Em 17 de out de 2017 6:21 AM, "Fabien Lahoudere" <
> fabien.lahoudere@collabora.co.uk> escreveu:
> 
> On Mon, 2017-10-16 at 21:34 +0100, Burton, Ross wrote:
> 
> On 16 October 2017 at 18:30, Otavio Salvador <otavio.salvador@ossystems.
> com.br> wrote:
> 
> 
> > +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> \
> > +          file://fix-missing-header.patch \
> 
> Those should be documented on commit log
> 
> 
> 
> Agreed.  The missing header one should say what platform causes it to be a
> problem (in case it never gets upstreamed and someone tests it again on
> just glibc).  And is the pitch patch sufficiently broken that we need to
> backport it?
> 
> 
> Without the pitch patch, all applications generating YUV420 will not be
> displayed correctly. For example "gstlaunch1.0 testvideosrc ! waylandsink"
> fail.
> I can keep this patch in a bbappend if you don't want it. Just tell me.
> 
> 
> Please keep the patch. It fixes a issue and it is not BSP specific, so it
> belongs to core. Just explain it on commit log.

I don't have a very strong objection here, but it sounds like a corner case 
for one of the formats. Plus what's the difference between "fail" and "not 
displayed correctly"?


> For the header patch, I will improve commit message.
> 
> I see there is an OVERRIDE libc-musl, should I use this patch in
> SRC_URI_libc-musl?
> 
> 
> No, just mention it on commit log...
> 
> 
> 
> Ross
> 
> -- 
> 
> Fabien
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


