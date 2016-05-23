Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E02E60767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 18:09:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4NI99ga029599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 May 2016 11:09:09 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 11:09:09 -0700
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 1593E280127; Mon,
	23 May 2016 14:09:09 -0400 (EDT)
Date: Mon, 23 May 2016 14:09:09 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Olof Johansson <olof.johansson@axis.com>
Message-ID: <20160523180908.GE27984@windriver.com>
References: <1463788963-31316-1-git-send-email-paul.gortmaker@windriver.com>
	<20160521101858.GP21318@axis.com>
MIME-Version: 1.0
In-Reply-To: <20160521101858.GP21318@axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: revert upstream commit causing havoc with ls output
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
X-List-Received-Date: Mon, 23 May 2016 18:09:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] coreutils: revert upstream commit causing havoc with ls output] On 21/05/2016 (Sat 12:18) Olof Johansson wrote:

> On 16-05-20 20:02 -0400, Paul Gortmaker wrote:
> > Several large distros are voting with their feet and actively
> > reverting the change, as per what can be seen above for Debian.
> 
> To me, it sounds like you're saying that the Debian maintainer is
> actively taking a stand against upstream, but the changelog makes
> it sound more like a temporary thing.

I did write "... it doesn't appear that the coreutils folks are going
to change the default back to the old way..."

> 
> From the changelog entry:
> > * Disable default ls quoting for now to get the rest of 8.25
> >   into testing. (Closes: #813164)
> 
> Could you add something in the commit message to make this
> clearer?

I suppose I can resend with "..coreutils folks are _ever_ going to..."
if you think that extra word clarifies things in the OE log I wrote.

The log of the actual patch is as-is from Debian, aside from me adding
the Upstream-Status, the http source and my SOB line.  Is that the log
you were hoping to have added to/clarified?

Paul.
--

> 
> -- 
> olofjn

