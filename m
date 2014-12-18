Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C29F9726DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 00:18:30 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBI0IVEV030783 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 18:18:31 -0600
Received: from weregild ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121718183092-1242242 ;
	Wed, 17 Dec 2014 18:18:30 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <1418412840-12796-1-git-send-email-rich.tollerton@ni.com>
References: <1418412840-12796-1-git-send-email-rich.tollerton@ni.com>
User-Agent: Notmuch/0.18.1 (http://notmuchmail.org) Emacs/24.4.1
	(x86_64-unknown-linux-gnu)
Date: Wed, 17 Dec 2014 18:18:30 -0600
Message-ID: <87wq5pu7xl.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 06:18:31 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/17/2014 06:18:31 PM,
	Serialize complete at 12/17/2014 06:18:31 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-17_07:2014-12-17, 2014-12-17,
	1970-01-01 signatures=0
Subject: Re: [PATCH] font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Thu, 18 Dec 2014 00:18:33 -0000
Content-Type: text/plain

Richard Tollerton <rich.tollerton@ni.com> writes:

> PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> /usr/lib/pkgconfig is always checked as a fallback; however,
> PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config in
> the sysroot, which doesn't exist. On host distros where the font
> encoding maps are stored under a different path than OE, this will break
> font builds, because ucs2any will attempt to read the sysroot's encoding
> maps with the host paths.
>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm withdrawing this patch, because I found a better solution to the
problems I've encountered which completely obviate this approach. A
superseding patchset will be sent out shortly.


-- 
Richard Tollerton <rich.tollerton@ni.com>

