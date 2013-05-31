Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7646163F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:42:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 May 2013 03:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,778,1363158000"; d="scan'208";a="346200716"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by orsmga002.jf.intel.com with ESMTP; 31 May 2013 03:42:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Fri, 31 May 2013 11:42:27 +0100
Message-ID: <3462145.IjGzaGyojb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51A87B7F.7050702@gmail.com>
References: <1369993335-21441-1-git-send-email-net147@gmail.com>
	<51A87B7F.7050702@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory: record removals with Git 2.0 and later
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
X-List-Received-Date: Fri, 31 May 2013 10:42:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 31 May 2013 20:29:19 Jonathan Liu wrote:
> On 31/05/2013 7:42 PM, Jonathan Liu wrote:
> > There is a behavior change with Git 2.0 where "git add ." will no
> > longer record removals by default unless -A (--all) is specified.
> > Change to "git add -A ." so removals are recorded with Git 2.0 and
> > later.
> > 
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> > 
> >   meta/classes/buildhistory.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hmm... looks like I interpreted the Git warning incorrectly. Maybe I
> need to look into this a bit more and perhaps change the commit message.
> 
> The following appears after a build with buildhistory enabled:
> warning: You ran 'git add' with neither '-A (--all)' or '--ignore-removal',
> whose behaviour will change in Git 2.0 with respect to paths you removed.
> Paths like 'test.txt' that are
> removed from your working tree are ignored with this version of Git.
> 
> * 'git add --ignore-removal <pathspec>', which is the current default,
>    ignores paths you removed from your working tree.
> 
> * 'git add --all <pathspec>' will let you also record the removals.
> 
> Run 'git status' to check the paths you removed from your working tree.

So it seems the change is reasonable but yes perhaps the commit message should 
change to mention that it also avoids a warning with 1.8.3.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

