Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6B49471957
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:08:50 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q04Kr2mVVz3hjGp;
	Tue,  9 Feb 2016 14:08:48 +0100 (CET)
X-Auth-Info: XaNVJT1lwQwZ0YguFYy0DUsYNNrt7m8tFAwbn0ZqiKc=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q04Kq4QhkzvhTZ; 
	Tue,  9 Feb 2016 14:08:47 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 14:06:19 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<CAJTo0LYBm6L==cxBAJv4Dz6EKBa26YeHuzT58X2KCxMd+PwPqQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYBm6L==cxBAJv4Dz6EKBa26YeHuzT58X2KCxMd+PwPqQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201602091406.19222.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] strace: Fix build for arc, metag, nios2, or1k, tile
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
X-List-Received-Date: Tue, 09 Feb 2016 13:08:50 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 09, 2016 at 12:51:19 PM, Burton, Ross wrote:
> On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:
> > +From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00:00:00 2001
> > +From: "Dmitry V. Levin" <ldv@altlinux.org>
> > +Date: Thu, 24 Dec 2015 15:40:55 +0000
> > +Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
> > +
> > +Fix build regression introduced by commit
> > +34683e3926d8c2daa368afb805da422ee7043396.
> > +
> > +* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
> > +* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
> > +* linux/nios2/syscallent.h: Likewise.
> > +* linux/or1k/syscallent.h: Likewise.
> > +* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and
> > sys_mmap_4koff.
> > +* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
> > +* NEWS: Mention this build fix.
> > +
> > +Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> > +Upstream-Status: Backport
> 
> This needs your signed-off-by tag too.

Oops, thanks for the reminder. Let me just repost this.

Best regards,
Marek Vasut

