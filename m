Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E260B77214
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u888eDpI023554; Thu, 8 Sep 2016 09:40:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id duloj994myfU; Thu,  8 Sep 2016 09:40:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u888eASU023533
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 8 Sep 2016 09:40:12 +0100
Message-ID: <1473324010.20226.147.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Wang Xin
	<wangxin2015.fnst@cn.fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Thu, 08 Sep 2016 09:40:10 +0100
In-Reply-To: <5f29e025-2aff-fdc4-c4fd-c9b17abd20e2@windriver.com>
References: <1472291503-1650-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<5f29e025-2aff-fdc4-c4fd-c9b17abd20e2@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH] qemu: 2.6.0 -> 2.6.1
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
X-List-Received-Date: Thu, 08 Sep 2016 08:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-07 at 23:32 -0400, Randy MacLeod wrote:
> On 2016-08-27 05:51 AM, Wang Xin wrote:
> > 
> > Upgrade qemu from 2.6.0 to 2.6.1.
> Not merged yet even in master-next.
> Hmmm, 2.7.0 is also available as of Sept 2nd.
> 
> It's too late for oe-core-2.2 - right?
> 
> 
> The Changelog is interesting:
> 
> http://wiki.qemu.org/ChangeLog/2.7
> 
> and here are a couple of shorter summaries from (ugh) Phoronix :
> 
> https://www.phoronix.com/scan.php?page=news_item&px=QEMU-2.7-Released
> http://www.phoronix.com/scan.php?page=news_item&px=QEMU-2.7-RC0
> 
> Shiny! :)

Most interestingly, it says:

PowerPC
* Many TCG fixes. 

and given the qemuppc openssh problems we're having that looks very
very tempting. We'll test a 2.7.0 upgrade (Robert already confirmed it
seems to help in local testing) and I may take this into M3 if it
solves issues we're seeing.

Cheers,

Richard


