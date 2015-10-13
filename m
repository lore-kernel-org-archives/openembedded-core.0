Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F14E75A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:26:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9DLQ3MK017718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Oct 2015 14:26:03 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 14:26:03 -0700
Date: Tue, 13 Oct 2015 16:26:02 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151013162602.2af8876f@seebs-worktop>
In-Reply-To: <CAMKF1sou00wtaW=5R4srchBMEswv4NZEJXfqT-rpoyV61p94xg@mail.gmail.com>
References: <20151013140016.32f79928@seebs-worktop>
	<CAMKF1sou00wtaW=5R4srchBMEswv4NZEJXfqT-rpoyV61p94xg@mail.gmail.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc: 0041-handle-target-sysroot-multilib.patch maybe doesn't work for n32?
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
X-List-Received-Date: Tue, 13 Oct 2015 21:26:05 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2015 14:16:53 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> also look at 0013-64-bit-multilib-hack.patch
> this should not even look at bitness directories. I wonder why thats happening.

I don't know. I know that we didn't have this problem in the 4.9 era, but I
think that our toolchain had 64-bit-multilib.patch back then, but didn't have
the newer handle-target-sysroot-multilib. I haven't tried building without
them yet to see how different it is (or isn't). It may also be a 5.2 change.
Wheeeeeee.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

