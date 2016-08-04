Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26B7E75C60;
	Thu,  4 Aug 2016 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74L4Yac005602; Thu, 4 Aug 2016 22:04:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KwVbdUD4KGpp; Thu,  4 Aug 2016 22:04:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74L4S5K005599
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Aug 2016 22:04:29 +0100
Message-ID: <1470344668.8166.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Maxin B. John"
	<maxin.john@intel.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2016 22:04:28 +0100
In-Reply-To: <CA+chaQfEmQ9jAMZB6CTDw3m_6tqQ_AyNCffRjtjz_qrtuz+8Gw@mail.gmail.com>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195648.2D3B95017B@opal.openembedded.org>
	<CA+chaQfEmQ9jAMZB6CTDw3m_6tqQ_AyNCffRjtjz_qrtuz+8Gw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 10/10: packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Thu, 04 Aug 2016 21:04:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-04 at 22:10 +0200, Martin Jansa wrote:
> NAK pointercal-xinput is useless without xinput-calibrator.
> 
> Just remove pointercal and let x11-common pull xinput-calibrator with
> pointercal-xinupt by RRECOMMENDS.

FWIW the pointercal commits in -next didn't make it into master
deliberately as we know they need some tweaks. One did get in by
accident, I've reverted it so things continue to build until they're
ready.

Cheers,

Richard

