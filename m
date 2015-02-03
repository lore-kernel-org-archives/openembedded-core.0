Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BCE46601DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 09:45:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 01:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,511,1418112000"; d="scan'208";a="521770756"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.17.39])
	by orsmga003.jf.intel.com with ESMTP; 03 Feb 2015 01:38:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Tue, 03 Feb 2015 09:45:37 +0000
Message-ID: <24121782.0qj60PRY4z@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <20150202205429.GC3394@windriver.com>
References: <1422662905-3598-1-git-send-email-paul.gortmaker@windriver.com>
	<5253630.c2vWHxRG0u@peggleto-mobl5.ger.corp.intel.com>
	<20150202205429.GC3394@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtools: add a bb for git-manpages
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
X-List-Received-Date: Tue, 03 Feb 2015 09:45:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 February 2015 15:54:30 Paul Gortmaker wrote:
> [Re: [OE-core] [PATCH] devtools: add a bb for git-manpages] On 02/02/2015 
(Mon 17:04) Paul Eggleton wrote:
> > On Friday 30 January 2015 19:08:25 Paul Gortmaker wrote:
> > > These could be created from scratch from git itself, but it
> > > requires asciidoc, xsltproc, python bits and too much other
> > > baggage.  Since the git folks issue a tarball with the manpages
> > > for each release, it is simpler to just go get that.
> > 
> > I'm just wondering, would it be simpler to just do this as part of the git
> > recipe itself and have the manpages go into git-doc? Then you would get
> > the documentation automatically if you had git in your image and doc-pkgs
> > in IMAGE_FEATURES, plus we wouldn't have to remember to upgrade this every
> > time we upgraded the git recipe.
> 
> I'm sure we can do that if desired.  It is probably worth mentioning
> that I had this standalone recipe off in a layer for a while, and after
> discussions on how to deal with coreutils and the mess it creats with
> the openly hostile to cross-compile "help2man" that the idea of a
> separate bb for manpages appeared acceptable.  So, based on that, I
> figured it was time to post my git-manpages bb.

I just think if upstream ships pre-generated docs in lock-step with its code 
releases, we might as well fetch and package them up as part of the normal 
recipe and save ourselves some maintenance.
 
> This brings me back to coreutils -- should we source prebuilt manpages
> within the main recipe there too, or do a coreutils-manpages.bb  ?

The same applies there too I would think.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

