Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4457822A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 12:30:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vB7CUaQj012407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 7 Dec 2017 12:30:37 GMT
Message-ID: <1512649836.19417.76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, akuster808
	<akuster808@gmail.com>
Date: Thu, 07 Dec 2017 12:30:36 +0000
In-Reply-To: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
References: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [rocko] Go fixups
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
X-List-Received-Date: Thu, 07 Dec 2017 12:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-12-06 at 09:28 -0200, Otavio Salvador wrote:
> Hello Armin,
> 
> There was one patch which was mistakenly forgotten on rocko-next, and
> ended being merged. It ended being reworked in master and I did the
> needed backports/revert in our repo[1].
> 
> 1. https://github.com/OSSystems/oe-core/compare/rocko...rocko-next
> 
> Please consider applying those soon as rocko is currently with a
> broken Go toolchain.

Thanks for this Otavio, it was much appreciated and I've merged it.

Cheers,

Richard

