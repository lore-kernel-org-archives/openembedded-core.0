Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06288719C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 03:46:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Oct 2016 20:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,470,1473145200"; d="scan'208";a="1068292504"
Received: from klee32-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.241])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2016 20:46:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Mon, 10 Oct 2016 16:46:21 +1300
Message-ID: <2222395.xxSluGCKIM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <9e324da6-f2e6-67e5-749d-c4b946644186@gmail.com>
References: <5531053.vz3bUekSfr@peggleto-mobl.ger.corp.intel.com>
	<9e324da6-f2e6-67e5-749d-c4b946644186@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Commit messages
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
X-List-Received-Date: Mon, 10 Oct 2016 03:46:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

On Sun, 09 Oct 2016 20:29:39 akuster808 wrote:
> On 10/09/2016 05:35 PM, Paul Eggleton wrote:
> > I've been going through the commits in preparation for our release notes,
> > and unfortunately what I'm seeing is that the number of empty or
> > incomplete commit messages has noticeably increased over previous
> > releases. Commit messages are vitally important to providing a readable
> > history, not just in support of preparing release notes, but also if
> > you're trying to track down a regression or any other reason you might
> > want to go back and find out what has been done and most importantly
> > *why*.
> 
> Also helps in determining if a commit needs to be backported to stable
> branches.

Indeed.
 
> > Here are our commit message guidelines, which have been in place for some
> > 
> > time:
> >    http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > 
> > I know everyone's busy, but please take 5 minutes to read these if you
> > haven't recently and try to keep them in mind when writing commit
> > messages. No commit is too trivial for a complete commit message.
> 
> Agreed. We also need more folks reviewing incoming patches to help
> spread the load.

That is indeed true.

> The other options is to should start rejecting commits that do comply to
> the guidelines.

Actually I forgot to mention one thing in my email - it's been a long time 
coming, but we should soon have a set of tests automatically run on incoming 
patches, which would immediately flag these kinds of basic things up before a 
human needs to look at the patch. More to come on that soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

