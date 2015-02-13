Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6D7733F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:10:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 13 Feb 2015 02:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,570,1418112000"; d="scan'208";a="454136889"
Received: from jaloughr-mobl5.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.120])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Feb 2015 01:55:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 13 Feb 2015 10:10:13 +0000
Message-ID: <11486297.dKnYkC7eTZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.5-101.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <cover.1423705692.git.Chong.Lu@windriver.com>
References: <cover.1423705692.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 0/2] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Fri, 13 Feb 2015 10:10:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 February 2015 09:50:21 Chong Lu wrote:
> Change since V4:
> Change commit log for two variables.
> 
> The following changes since commit 35c9fa0588ed8e88b541a6c80cc1517324616cea:
> 
>   maintainers: Update for non-maintained recipes (2015-01-20 21:39:41 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib chonglu/layerindex
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/layerindex
> 
> Chong Lu (2):
>   bitbake.conf: Add two variables for layer index
>   bitbake-layers: add a ability to query layer dependencies from layer index

Thanks for fixing nearly all of the issues from v3 - I've tested it and it 
works pretty well. However, there is one that is still not addressed:

> > * I think the new subcommand would make more sense if it were switched
> > around so that it was fetching by default (and renamed as appropriate).
> > Perhaps "layerindex-fetch" (with -n to avoid fetching and just report what
> > it would fetch).

FWIW I'm happy if we still have a "layerindex-show-deps" that is just an alias 
for "layerindex-fetch -n", so it's really about the naming.

Additionally I'd really rather we did not hardcode the branch names - there's 
an API call available to get these in the layer index and we should use it. I 
also think we could improve the formatting of the output to make it a bit 
easier for the user to understand.

I know you'll be out of office for the next few weeks - perhaps I could address 
these issues while you're out and send a new series if you have no objections.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

