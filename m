Return-Path: <bruce.ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15DB76B4BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:25:31 +0000 (UTC)
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q3PUhH021534;
	Sun, 25 Aug 2013 20:25:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 25 Aug 2013 23:25:14 -0400
Message-Id: <1377487515-26654-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: linux-libc-headers: fix 3.10 build issues
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
X-List-Received-Date: Mon, 26 Aug 2013 03:25:31 -0000

Richard/Saul,

As I mentioned in my last reply to my previous series:

  [PATCH 4/7] eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion

Should be dropped, and replaced with this patch. 

It's a better idea to revert part of the kernel commit while we work on
updating applications, than it is to patch eglibc and hope that include
orders work in all cases.

If you'd like a resend of the whole series, I can do that as well. But for
now, I'm only sending this single patch.

I've already build the offending applications on two architectures and
everything looks fine. My full builds are still running, but I wanted to get
this out and into Saul's hands sooner rather than later.

Cheers,

Bruce



