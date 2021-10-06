Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <cef25f4b0dcb62b1e0bf782e66eaa3e46e1675f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cairo: use ${PN} in package name
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Oct 2021 18:50:48 +0100
In-Reply-To: <CO1PR10MB443438D0A26177CABAB54BCFF9B09@CO1PR10MB4434.namprd10.prod.outlook.com>
References: <20211006143606.55529-1-bkylerussell@gmail.com>
	 <df755fcfe28bc98a227c99e6cb034242f7063e8b.camel@linuxfoundation.org>
	 <CO1PR10MB443438D0A26177CABAB54BCFF9B09@CO1PR10MB4434.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Steven Walter <steven.walter@lexmark.com>, "bkylerussell@gmail.com" <bkylerussell@gmail.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Wed, 2021-10-06 at 17:15 +0000, Steven Walter wrote:
> Sorry about that, should have included this in the commit message.  I believe
> multilib is required for reproducing the issue.  I have a 32-bit ARM
> multilib.  In that case, ${PN} is lib32-cairo, and so LICENSE gets set on
> lib32-cairo-gobject, but PACKAGES contains cairo-gobject.  As a result the
> effective LICENSE of cairo-gobject is the "default" license for the recipe,
> which is GPL3, which is incorrect.  So when I said "bitbake complains that the
> license is incorrect," I have INCOMPATIBLE_LICENSE = "GPL-3.0", and bitbake
> incorrectly says that I can't use the cairo-gobject package.

Are you testing this with master? If not, which release? I know there were some
multilib issues in this area a while ago but I thought/hoped we'd fixed them.

Both PACKAGES and LICENSE:XXX should get remapped but it sounds like the
incompatible license code is evaluating something too early. That is once reason
why I'd like to check this reproduces with master first.

Cheers,

Richard

