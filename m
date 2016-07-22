Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 86B956FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MFtVsi013605; Fri, 22 Jul 2016 16:55:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ugjjo5nbJE-S; Fri, 22 Jul 2016 16:55:31 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MFtUkp013602
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Jul 2016 16:55:31 +0100
Message-ID: <1469202930.23580.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2016 16:55:30 +0100
In-Reply-To: <CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
References: <1469197543.23580.65.camel@linuxfoundation.org>
	<CAMKF1srw4bVtAHrq6uOVU__WueXjoNwKRsvxLNLudt_zFyzrzQ@mail.gmail.com>
	<CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
	<CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add mechanism to extend siteinfo information from BSP layer
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
X-List-Received-Date: Fri, 22 Jul 2016 15:55:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-22 at 08:47 -0700, Khem Raj wrote:
> Whats the motivation here. This looks like a backdoor for bsps. To
> user it will make inconsistent behaviour. Even now its quite hard to
> root cause errors due to siteinfo

Right now if you have some new target, your only option is to either
patch OE-Core, or copy the class into your new BSP. This is
particularly problematic if you're working on hardware that isn't
supported by core OE or that is in active development.

Having hooks to allow you to write a new BSP without having to make
changes to the core would seem to be a good thing.

I'm not expecting users to regularly use this, just those writing more
exotic BSPs or doing baremetal work for example.

I can sympathise with the problem as I've run into it several times now
myself. We can't really demand that every time this happens, people
send a patch for OE-Core (although if something is commonly used we'd
obviously then encourage it).

Cheers,

Richard


