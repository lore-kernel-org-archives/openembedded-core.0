Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B74FB60684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:52:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 05:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="248225748"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.125])
	by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2017 05:52:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 14 Apr 2017 00:52:39 +1200
Message-ID: <48134727.R8oNS1AQyh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <744e147709714db5841c35720c153b19@XBOX02.axis.com>
References: <cover.1492086458.git.paul.eggleton@linux.intel.com>
	<3542d868bf888db6595c211aaea6b49a398ba509.1492086458.git.paul.eggleton@linux.intel.com>
	<744e147709714db5841c35720c153b19@XBOX02.axis.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] devtool: extract: drop erroneous	bb.event.TaskSucceeded
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
X-List-Received-Date: Thu, 13 Apr 2017 12:52:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

Oops, well spotted - have fixed the branch and sent a v2.

Thanks,
Paul

On Friday, 14 April 2017 12:35:29 AM NZST Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Paul Eggleton
> > Sent: den 13 april 2017 14:28
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 3/3] devtool: extract: drop erroneous
> > bb.event.TaskSucceeded
> 
> Correct "bb.event.TaskSucceeded" to "bb.event.TaskStarted" in the subject.
> 
> > This is a non-existent event - we already have the actual
> > bb.build.TaskSucceeded further down in the list hence why it wasn't
> > noticed earlier.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/lib/devtool/standard.py | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py
> > index c3b65fb..5ff1e23 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -530,7 +530,6 @@ def _extract_source(srctree, keep_temp, devbranch,
> > 
> > sync, d, tinfoil):
> >          tinfoil.set_event_mask(['bb.event.BuildStarted',
> >          
> >                                  'bb.event.BuildCompleted',
> > 
> > -                                'bb.event.TaskStarted',
> > 
> >                                  'logging.LogRecord',
> >                                  'bb.command.CommandCompleted',
> >                                  'bb.command.CommandFailed',
> > 
> > --
> > 2.9.3
> 
> //Peter


-- 

Paul Eggleton
Intel Open Source Technology Centre

