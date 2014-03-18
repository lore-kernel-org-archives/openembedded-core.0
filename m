Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EEE186F918
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:54:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2014 09:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,678,1389772800"; d="scan'208";a="501320233"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.153])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2014 09:54:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <kergoth@gmail.com>
Date: Tue, 18 Mar 2014 16:54:55 +0000
Message-ID: <2043857.2aMlfpaTVP@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CABcZAN=owvQPkgnnzaU3tCvDvtGCZZEDLLFL9RXTZM1ZqRQnAQ@mail.gmail.com>
References: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
	<CABcZANnY5ni7nShC0mXJP0kndowTeTet4qb0nCRvEe2V=1_pXQ@mail.gmail.com>
	<CABcZAN=owvQPkgnnzaU3tCvDvtGCZZEDLLFL9RXTZM1ZqRQnAQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe: turn oe into a namespace package
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
X-List-Received-Date: Tue, 18 Mar 2014 16:55:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 March 2014 09:52:23 Chris Larson wrote:
> On Tue, Mar 18, 2014 at 7:38 AM, Chris Larson <kergoth@gmail.com> wrote:
> > On Tue, Mar 18, 2014 at 6:48 AM, Paul Eggleton <
> > paul.eggleton@linux.intel.com> wrote:
> >> FWIW, this broke builds on my CentOS build machine that uses a slightly
> >> older
> >> buildtools install from 1.4. I hope we have pkgutil in our more current
> >> buildtools - if not could you please send a fix for that as well?
> > 
> > Ah, interesting, sorry about the hassle there. I'm 90% certain it's in the
> > current buildtools tarball, as I do all my build testing with a CentOS 6
> > chroot using a buildtools tarball, and didn't hit that problem, but I'll
> > double check.
> 
> Looks like it was added in
> https://github.com/openembedded/oe-core/commit/7d93288.

OK, thanks for checking; it looks like this commit is in dora as well. I'll 
update to a 1.5.x buildtools on my build server.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

