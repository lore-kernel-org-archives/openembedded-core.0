Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D287C60053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VDLg7Q016726; Thu, 31 Mar 2016 14:21:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lDkEmYviTotL; Thu, 31 Mar 2016 14:21:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VDLaj1016722
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 31 Mar 2016 14:21:37 +0100
Message-ID: <1459430496.21672.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2016 14:21:36 +0100
In-Reply-To: <CAJ86T=U_-bZ1J08wmxsPGpNP+yH7U9WAYY0eDjtfb3tW9Lh+tA@mail.gmail.com>
References: <CAJ86T=U_-bZ1J08wmxsPGpNP+yH7U9WAYY0eDjtfb3tW9Lh+tA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Is HOSTTOOLS_WHITELIST_GPL-3.0 ever used?
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
X-List-Received-Date: Thu, 31 Mar 2016 13:21:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-30 at 18:10 -0700, Andre McCurdy wrote:
> Support for HOSTTOOLS_WHITELIST_GPL-3.0 (originally named
> GPLv3_HOSTTOOLS_WHITELIST) was first added here:
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=179e056519
> c5ad761b2d942d7196664874c155e4
> 
> The implementation in base.bbclass has been tweaked a few times since
> then, but even in the original, it looks like license checking was
> skipped for native recipes (and anything else which could be
> described
> as a "host tool"), so providing a whitelist of specific host tools
> looks redundant. The current version does the same.
> 
> Does anyone know how HOSTTOOLS_WHITELIST_GPL-3.0 is intended to be
> used or when it might be necessary?
> 
> Any objections to a patch to remove it?

Not from me...

Cheers,

Richard

