Return-Path: <walters@verbum.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5216F6041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:00:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 35601216A6;
	Tue, 18 Jun 2013 11:00:22 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute4.internal (MEProxy); Tue, 18 Jun 2013 11:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=CtAcBbhsZsjA6ZYFsu3wlV
	UDcTs=; b=gX9wWqYHoseDWkjFdH++kq4MZe4EaoP5NRK0KMVWzCNAcjEahaxjfO
	zSFtZu3Np6wMlrATEU0ItMItXuSuA+YqDIFwFwRs55p67FmMSqT3ORt5WZpoD15m
	VwqfP7jlcHkYDhihKoTiEEc+BKQ3Ym5DXm5+pQiY5PxtpBCQpuxf0=
X-Sasl-enc: dnYuyWJ2O/g1L7r5EzxrQnHrThirE0Q2wraoDTrvRo6A 1371567622
Received: from [10.193.22.97] (unknown [66.187.233.207])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7B8CD6802B0;
	Tue, 18 Jun 2013 11:00:22 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
Date: Tue, 18 Jun 2013 11:00:21 -0400
Message-ID: <1371567621.3466.16.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-1.el6) 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 15:00:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 15:56 +0100, Burton, Ross wrote:

> I also remember discussion with Colin Walters about ostree, which at
> one point only removed from $libdir itself (my "libdir" argument) but
> now removes all .la files.  Colin, the commit that changed the la
> killing to recurse didn't have a rationale - can you clarify this?  If
> ostree can get away with removing all, them maybe we don't need the
> "libdir" option at all.

The relevant data I have on hand are:

https://bugzilla.gnome.org/show_bug.cgi?id=654013
https://git.gnome.org/browse/jhbuild/commit/?id=965c8d5ceda9d1c5d6021ef2c534e0a7f68ca976

I think the executive summary is that libltdl knows how to load .so
files directly (at least currently), so there's no reason to have even
${libdir}/modulename/plugins/foo.la.




