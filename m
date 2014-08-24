Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0656660169
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 15:33:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2014 08:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,390,1406617200"; d="scan'208";a="589178462"
Received: from rrhewawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.41])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2014 08:33:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 16:33:39 +0100
Message-ID: <1911375.NGZ7NJg80z@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <1408783244.5457.10.camel@ted>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<8761hkpmx0.fsf@weregild.amer.corp.natinst.com>
	<1408783244.5457.10.camel@ted>
MIME-Version: 1.0
Subject: Re: Patch message guidelines and internal/corporate fields
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
X-List-Received-Date: Sun, 24 Aug 2014 15:33:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 23 August 2014 09:40:44 Richard Purdie wrote:
> On Fri, 2014-08-22 at 10:24 -0500, Richard Tollerton wrote:
> > Randy MacLeod <randy.macleod@windriver.com> writes:
> > > Wind River patches used to include a "CQID" tag but we've changed
> > > our process to avoid needing such internal tags. If National
> > > Instruments can do so as well, that'd be best.
> > > 
> > > I did check my oe-core email list history and this seems like the
> > > first patch from NI that has the tags included so I thought
> > > I'd reply and see if we can get the tags dropped.
> > 
> > IIRC, we pinged Phil a few months ago on this topic, and he thought
> > internal tags were OK. I think Wind River might have been cited as an
> > example.
> > 
> > I see that
> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines hasn't
> > been updated with this requirement. Should it be? Will that require TSC
> > approval?
> 
> I don't have a strong preference on this to be honest. I can imagine
> cases where its useful to have some kind of tracking of issues into the
> final commits.
> 
> Obviously it would be better if everyone can understand what the numbers
> mean, equally, it seems pointless to force people to strip them when
> they might be useful to people contributing to the project.
> 
> If they are used as a substitute for a good commit message, that
> wouldn't be acceptable. Also, if they were taking over the commit
> messages, that would able be unacceptable. So if we can keep them to a
> small part of the commit, I'm prepared to let them pass but it can't be
> at the expense of good commit messages.
> 
> I don't believe we need a TSC decision, that would only be needed if
> there were strong disagreements we were unable to resolve and I don't
> think we're quite there yet :) I'll let others comment though and see
> where we're at.

FWIW I agree with all of the above - if they make contributors' lives easier 
then I don't see a good reason to disallow their usage given we're only 
talking about one line at the end of a proper commit message.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

