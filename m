Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46BD071ADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:33:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D6XOQL007298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 07:33:25 +0100
Message-ID: <1497335604.3942.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>
Date: Tue, 13 Jun 2017 07:33:24 +0100
In-Reply-To: <CA+chaQeLNdfn5piAtuXnpEsO=z=qz=Vh-=_P10xOgBw1fZPxpg@mail.gmail.com>
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
	<0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
	<20170516215021.GO28053@denix.org>
	<d5b89969-7833-d1a7-8685-71468968b93f@gmail.com>
	<CA+chaQeLNdfn5piAtuXnpEsO=z=qz=Vh-=_P10xOgBw1fZPxpg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 07:33:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Tue, 13 Jun 2017 06:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 08:21 +0200, Martin Jansa wrote:
> Unfortunately this nice change breaks quite common scenario when
> developers have read-only mount of sstate mirror and this touch
> causes all _setscene tasks to fail, because they fail to update atime
> on symlink which points to read-only mount.
> 
> Please backport the fix for this as well ASAP:
> http://git.openembedded.org/openembedded-core/commit/meta/classes/sst
> ate.bbclass?id=b8f26c011d5ed888d85fef040bd821400d54c8fe

Done.

Cheers,

Richard

