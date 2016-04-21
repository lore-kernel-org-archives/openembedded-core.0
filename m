Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA8E605FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 07:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3L7g6gX025051; Thu, 21 Apr 2016 08:42:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iW0SkRCQR5YY; Thu, 21 Apr 2016 08:42:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3L7g1eH025046
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Apr 2016 08:42:02 +0100
Message-ID: <1461224521.31320.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 08:42:01 +0100
In-Reply-To: <57187FA8.5050804@windriver.com>
References: <57187FA8.5050804@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: About PV = "0.0+git${SRCPV}"
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
X-List-Received-Date: Thu, 21 Apr 2016 07:42:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-21 at 15:22 +0800, Robert Yang wrote:
> There are several recipes in oe-core which has:
> PV = "0.0+git${SRCPV}"
> 
> These recipes don't have a release version, so we use
> "0.0+git${SRCPV}",
> but the package manager such as opkg/rpm/smart may not upgrade them
> correctly when the recipes is upgraded since we can't make sure that
> SRCPV_new > SRCPV_old.
> 
> How about we use date for these recipes which doesn't have a release
> version? For example, if we integrate them to oe-core today, then
> PV = "20160421". And when we upgrade them in the future, we can
> change
> the PV to that day. We can change all the current version 0.0 target
> recipes to today, and add a sanity check for version 0.0.

No, this is the whole idea behind having the PR Server which injects a
revision before the hash in SRCPV. We have the same problem with other
git recipes even where there are versions since the revision can change
and we need to be able to sort the versions correctly.

Cheers,

Richard

