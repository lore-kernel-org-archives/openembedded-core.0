Return-Path: <paul.eggleton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D582601D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 07:00:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 11 Dec 2015 23:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,417,1444719600"; d="scan'208";a="705990092"
Received: from chengwe1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.46])
	by orsmga003.jf.intel.com with ESMTP; 11 Dec 2015 23:00:08 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Christopher Larson <chris_larson@mentor.com>
Date: Sat, 12 Dec 2015 20:00:05 +1300
Message-ID: <12394566.O88XJFnnGT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <CABcZANnFxcyUzvJhp3tUM17m-W0ELuVozoKob23d+epzna8SMA@mail.gmail.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
	<CABcZANnFxcyUzvJhp3tUM17m-W0ELuVozoKob23d+epzna8SMA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] recipetool/devtool: send errors to stderr
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
X-List-Received-Date: Sat, 12 Dec 2015 07:00:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 11 Dec 2015 17:09:33 Christopher Larson wrote:
> On Wed, Sep 23, 2015 at 11:21 AM Christopher Larson <kergoth@gmail.com>
> 
> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> > 
> > This aligns with the behavior of bitbake proper. There is a bit of code
> > duplication between knotty and scriptutils, but that's not new -- that was
> > the
> > case before as well. We should consider moving these logger configuration
> > functions into bb.msg.
> > 
> > The following changes since commit
> > 
> > 2ad7308ee7166641eff99f3b9fe6794de143f6bc:
> >   oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread
> > 
> > start (2015-09-22 18:13:02 +0100)
> > 
> > are available in the git repository at:
> >   git://github.com/kergoth/openembedded-core scriptutils-log-improvements
> > 
> > https://github.com/kergoth/openembedded-core/tree/scriptutils-log-improvem
> > ents> 
> > Christopher Larson (3):
> >   oe.scriptutils: enable color in a more flexible way
> >   oe.scriptutils: add logger_setup_filters
> >   recipetool, devtool: set up the logging filters
> 
> Does anyone happen to know if there any objection to this? I just noticed
> this hasn't been merged yet. This makes the behavior of recipetool and
> devtool more consistent with bitbake itself by sending errors to stderr.
> Long term I'd like to see warnings go there as well, but that could be more
> controversial and is a later task, I think this should go in as is.
> Eventually we should consolidate some of the logger setup and configuration
> logic between scriptutils and bitbake as well, but that was the case with
> or without this series

I certainly don't - I did see this hadn't been merged a few weeks back, I 
should have acked it.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

