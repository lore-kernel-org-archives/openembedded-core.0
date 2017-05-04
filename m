Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 03E7877C8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 15:29:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 08:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1126444764"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2017 08:29:02 -0700
Message-ID: <1493912216.1761.40.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 04 May 2017 10:36:56 -0500
In-Reply-To: <2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
	<24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
	<2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 15:29:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-05-04 at 22:07 +1200, Paul Eggleton wrote:
> Hi Alex,
> 
> On Thursday, 4 May 2017 9:33:02 PM NZST Alexander Kanavin wrote:
> > On 05/04/2017 12:43 AM, Paul Eggleton wrote:
> > > On Thursday, 4 May 2017 1:31:52 AM NZST Patchwork wrote:
> > >> * Issue             Series sent to the wrong mailing list
> > > [test_target_mailing_list]
> > >>   Suggested fix    Send the series again to the correct mailing list (ML)
> > >>   Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/
> cgit/
> > > cgit.cgi/poky/]
> > >
> > > Leo - looks like this is another false positive.
> > 
> > Actually, no - one of the patches accidentally included a file from 
> > meta-poky. Still, could be reported better:
> > 
> > 1) Should refer to a specific patch where the issue is
> > 2) Should, if possible, refer to specific files in the patch that are 
> > causing the problem.
> 

yes, I realized that and try to make it better with:

http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/commit/?id=d1841aa2d19c6576d84c461656043d0b49ee689e

Due to the nature of the objects being used, the easiest is to provide
the patch's path, so point 2 is covered, not 1.


> Right, agreed on both counts. I guess we were trying to catch the more common 
> case of people sending entire patchsets to the wrong list.


> 
> > 3) The problem is not the wrong mailing list, the problem is that the 
> > patch should be splitted up and sent to several lists :)
> 
> The question is can an automated tool tell the difference? I guess even if it 
> can't though we can be honest about that in the message i.e. "Wrong mailing 
> list, or incorrectly split patch" or something like that.

agree on the proposed message. I change it.

> 
> > In general, why run these checks after the patches have been already 
> > posted for review? That is adding unnecessary friction. Why not have 
> > them as a git hook, that is run locally when making the commit?
> 
> The original idea was that the tests could also be run from your local machine 
> (could easily be as a git hook), and whilst it's not as easy as I might have 
> liked it is doable - however even if it were much easier, we have to be 
> realistic and acknowledge that most people still won't do it.
> 

I proposed the following script:

http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132592.html

which basically takes patches from master to current branch HEAD and
iterates on each one (not yet merged on master). Once script is run,
results are in console then developer can iterate on the series in case
of failures.


> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre



