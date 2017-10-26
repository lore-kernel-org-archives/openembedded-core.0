Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id C181A71D79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 08:01:32 +0000 (UTC)
Received: from Collabora
	(dynamic-2a00-1028-838e-0812-98d9-0b2b-4878-92e4.ipv6.broadband.iol.cz
	[IPv6:2a00:1028:838e:812:98d9:b2b:4878:92e4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: aragua)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E09B2606AE;
	Thu, 26 Oct 2017 09:01:33 +0100 (BST)
Message-ID: <1509004888.7066.5.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: Denys Dmytriyenko <denis@denix.org>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Thu, 26 Oct 2017 10:01:28 +0200
In-Reply-To: <20171017225943.GN9221@denix.org>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
	<CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
	<1508228478.12731.1.camel@collabora.co.uk>
	<CAP9ODKobM2qGirCLFrM-sNV=-LgbHWMFCGba_U2Wq4ckY8L7+A@mail.gmail.com>
	<20171017225943.GN9221@denix.org>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 26 Oct 2017 08:01:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-10-17 at 18:59 -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 17, 2017 at 08:31:10AM -0200, Otavio Salvador wrote:
> > Em 17 de out de 2017 6:21 AM, "Fabien Lahoudere" <
> > fabien.lahoudere@collabora.co.uk> escreveu:
> > 
> > On Mon, 2017-10-16 at 21:34 +0100, Burton, Ross wrote:
> > 
> > On 16 October 2017 at 18:30, Otavio Salvador <otavio.salvador@ossystems.
> > com.br> wrote:
> > 
> > 
> > > +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
> > 
> > \
> > > +          file://fix-missing-header.patch \
> > 
> > Those should be documented on commit log
> > 
> > 
> > 
> > Agreed.  The missing header one should say what platform causes it to be a
> > problem (in case it never gets upstreamed and someone tests it again on
> > just glibc).  And is the pitch patch sufficiently broken that we need to
> > backport it?
> > 
> > 
> > Without the pitch patch, all applications generating YUV420 will not be
> > displayed correctly. For example "gstlaunch1.0 testvideosrc ! waylandsink"
> > fail.
> > I can keep this patch in a bbappend if you don't want it. Just tell me.
> > 
> > 
> > Please keep the patch. It fixes a issue and it is not BSP specific, so it
> > belongs to core. Just explain it on commit log.
> 
> I don't have a very strong objection here, but it sounds like a corner case 
> for one of the formats. Plus what's the difference between "fail" and "not 
> displayed correctly"?
> 

"fail" means not display correctly but the issue can also lead to a weston crash.

> 
> > For the header patch, I will improve commit message.
> > 
> > I see there is an OVERRIDE libc-musl, should I use this patch in
> > SRC_URI_libc-musl?
> > 
> > 
> > No, just mention it on commit log...
> > 
> > 
> > 
> > Ross
> > 
> > -- 
> > 
> > Fabien
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
-- 
Fabien

