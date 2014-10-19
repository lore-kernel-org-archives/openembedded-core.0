Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4A14365C77
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 22:31:16 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLbRS2wdtz3hjPg;
	Mon, 20 Oct 2014 00:31:16 +0200 (CEST)
X-Auth-Info: +P+QOWNAdGoetnplVe/AhLogW1w3NVLQfoTrJHn6ds4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jLbRR4jPLzvdWV; 
	Mon, 20 Oct 2014 00:31:15 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Oct 2014 00:31:09 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
	<CAMKF1so0A-vVEswvF290RAXZFab=F+Cw=NP2nRTYVBFm77c4qA@mail.gmail.com>
In-Reply-To: <CAMKF1so0A-vVEswvF290RAXZFab=F+Cw=NP2nRTYVBFm77c4qA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201410200031.09908.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Sun, 19 Oct 2014 22:31:24 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, October 19, 2014 at 11:29:15 PM, Khem Raj wrote:
> On Sunday, October 19, 2014, Marek Vasut <marex@denx.de> wrote:
> > Pull the uImage image format generation from kernel.bbclass into
> > a separate kernel-uimage.bbclass. The recipes which now need to
> > generate an uImage will have to inherit kernel-uimage instead of
> > kernel class.
> 
> Does it trigger a doc change as well ?

How can I tell please? Where exactly do I look please ? The 'kernel' keyword
is rather vague, so git grep spits a lot of results.

Best regards,
Marek Vasut

