Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id E18A56EFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:06:54 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so5347080yhl.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=o2bOGJJLiy97uP40q0KQM0F+RKxxqj/2zmNyov+naRo=;
	b=fkHc4++mueF77wgrMyMPrGMozWcVipe875IiUd0uG17U3kzFe0vNxSBf//BdhNn+9Q
	113t677lHTp1BVUv8rE24K99dilroWjObhcm7STahWxRv0/uOwbzSPYCVf7ZAt7vhiwO
	xA2AVZgST8Lsr/O6QkpapvusMmn4McOkqnt02D96nhAdshuOrVpEKqvzvjj9QsVwZpM5
	pNX0ooX0P76c+mj4KLas4AocQFWpvs3my6ez9hI+4D8I4bBcmuynLLub6a7OMkG/E+QM
	Xpr30GBw1gLZIN7WupyrW0t9qUZ2Eb7STev4bDH/HjqwjK7IH+A6gLnPfbmIUVkFMKfV
	3D9g==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr31389451yhk.2.1393254415276;
	Mon, 24 Feb 2014 07:06:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 24 Feb 2014 07:06:55 -0800 (PST)
In-Reply-To: <1393253881.31769.6.camel@ted>
References: <1393253881.31769.6.camel@ted>
Date: Mon, 24 Feb 2014 12:06:55 -0300
X-Google-Sender-Auth: g4R5QEJjHOj3CuLue32UgkAT1eA
Message-ID: <CAP9ODKpho5Pgp2=mmtho-UaZwPY6vFwKDNPiFudM_CDoW_njuQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Mon, 24 Feb 2014 15:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Mon, Feb 24, 2014 at 11:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> For a while poky and others have been using the seperatebuilddir.inc
> file. This makes ${S} != ${B} and means that ${B} can be wiped when
> configuration changes.
>
> This helps deal with the fact that autotools and friends are not
> particular good at rebuilding things that change. The recent libcheck
> upgrade which broke bluez4 builds is but one example of the kind of
> problem we can hit. Sadly bluez4 doesn't work for S!=B so it didn't
> protect against that issue but it does protect other packages.
>
> I'd really love to switch the default in autotools.bbclass to make this
> the default and then have broken packages opt out of it.
>
> I can deal with OE-Core and make sure the metadata there is updated, my
> bigger worry is what this would do to other layers.
>
> The options I can see are therefore basically:
>
> a) We change the default in autotools.bbclass and fix things that break

+1

I think it is better to fix this sooner than later. This indeed helps
improve the build stability so I think this is better to default to
the better options; adding an extra class for it is the wrong way in
my point of view and we'll "support" the wrong use of it. I think the
exceptions are better covered if we keep it explicit in a var and easy
to spot in a git grep.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

