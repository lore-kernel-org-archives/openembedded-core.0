Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B2CF371C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 19:29:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 11:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="7957006"
Received: from unknown (HELO lsandov1-mobl2.zpn.intel.com) ([10.219.128.134])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2017 11:29:42 -0800
Date: Tue, 21 Nov 2017 13:38:59 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20171121133859.044a4947@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <CAJ86T=XjKS1eS58m94r7BoW0d0-Ps6WqXh-CjOh68qcoLvtarg@mail.gmail.com>
References: <1511203084-3492-1-git-send-email-armccurdy@gmail.com>
	<20171120190530.2785.4319@do.openembedded.org>
	<CAJ86T=XjKS1eS58m94r7BoW0d0-Ps6WqXh-CjOh68qcoLvtarg@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Ming Liu <liu.ming50@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYi9vZS90ZXJtaW5hbC5weTogdXNlIGFuIGFic29sdXRlIHBhdGggdG8gZXhlY3V0ZSBvZS1nbm9tZS10ZXJtaW5hbC1waG9uZWhvbWUgKHJldjUp?=
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
X-List-Received-Date: Tue, 21 Nov 2017 19:29:41 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Nov 2017 11:46:40 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Nov 20, 2017 at 11:05 AM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
> > == Series Details ==
> >
> > Series: lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome (rev5)
> > Revision: 5
> > URL   : https://patchwork.openembedded.org/series/1745/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at a17f3ec910)  
> 
> This is a backport request so target branch is morty, not master.
> Isn't that detected from the subject line?

this enhancement (take the target branch from subject line) was supposed to be working since last Friday but this was not the case. I have fixed the issue and this problem should not happen any more.

> 
> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).
> >
> > ---
> > Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

