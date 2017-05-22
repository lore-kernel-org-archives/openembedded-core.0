Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E950677E86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D9DB20BAA;
	Mon, 22 May 2017 21:33:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Vy5mTx3R4FvE; Mon, 22 May 2017 21:33:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5BBF6204E0;
	Mon, 22 May 2017 21:33:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E63F01624C9; Mon, 22 May 2017 17:33:43 -0400 (EDT)
Date: Mon, 22 May 2017 17:33:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170522213343.GZ28053@denix.org>
References: <1494367136-21140-1-git-send-email-denis@denix.org>
	<20170516214906.GN28053@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170516214906.GN28053@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] tcmode-default: use SDK_SYS suffix instead of SDK_ARCH for binutils-crosssdk
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
X-List-Received-Date: Mon, 22 May 2017 21:33:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping again.

On Tue, May 16, 2017 at 05:49:06PM -0400, Denys Dmytriyenko wrote:
> Ping
> 
> On Tue, May 09, 2017 at 05:58:56PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Commit d2eccccb70e809d482c493922f23aef4409cfd82 has changed suffixes for
> > all -crosssdk packages from SDK_ARCH to SDK_SYS, but missed one line with
> > binutils-crosssdk. This change fixes that omission.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > index 3db16e8..bdc70cf 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -48,7 +48,7 @@ PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> >  PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> >  PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
> >  PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> > -PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${BINUVERSION}"
> > +PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
> >  PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
> >  PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
> >  PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> > -- 
> > 2.7.4
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

