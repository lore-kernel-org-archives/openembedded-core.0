Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2D61B71B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 14:38:47 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id bSNveu5pF8e42bSNwe9lLA; Tue, 16 Jan 2018 14:38:48 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=do719Wo4 c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=Y3l6bNPAv4Ko0DjRkhAA:9
	a=CjuIK1q_8ugA:10 a=GC7UIPh-UKEA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1ebSNv-0001XN-I3; Tue, 16 Jan 2018 14:38:43 +0000
Date: Tue, 16 Jan 2018 14:38:43 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180116143843.a44qqplp2cayzwvh@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
	<20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
	<CAJTo0LYFZqkc_KMXKjNmX4M3z0UjAjGpRLNingKsmXf7yBUmHQ@mail.gmail.com>
	<CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfPYVwUYW95bLX8uOq/wPeRQnFC7zyBAIV5Jm2QpXBiy6RBtngPXw5F86W9PL7jyVC3f8RxaB6kzbMX6rgYXtwqQtC2z8/xna7uo1Xb8cNlVlRIt9i9Sa
	bNAyxD+lPuzPZBbAHqhpLpOwtQHDbUyBawk=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 14:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 16 January 2018 at 13:58:13 +0000, Burton, Ross wrote:
> I've got a local patch that does this in the glib recipe:
> 
> USE_NLS_class-target = "yes"
> USE_NLS_class-nativesdk = "yes"
> 
> Can you verify this fixes the problem for you?

That appears to fix do_configure, and I can compile glib-2.0 successfully. I
haven't tried actually using it though.

Thanks.

Mike.

