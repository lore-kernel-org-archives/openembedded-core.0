Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3FE06FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 05:30:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2016 22:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,575,1455004800"; d="scan'208";a="958429963"
Received: from pchoo-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.131])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2016 22:30:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Maxin B. John" <maxin.john@intel.com>
Date: Wed, 04 May 2016 17:30:33 +1200
Message-ID: <1787825.IkZ0s2asgU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <20160503164557.GA28091@mbabyjoh-desk.ger.corp.intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
	<20160503164101.GA20238@jama>
	<20160503164557.GA28091@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/10] mc: upgrade to 4.8.16
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
X-List-Received-Date: Wed, 04 May 2016 05:30:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 03 May 2016 19:45:57 Maxin B. John wrote:
> On Tue, May 03, 2016 at 06:41:01PM +0200, Martin Jansa wrote:
> > On Tue, May 03, 2016 at 05:49:45PM +0300, Maxin B. John wrote:
> > > 4.8.15 -> 4.8.16
> > 
> > Can you please use -M when sending the patches, it's much easier to
> > review.
> 
> Thanks. Noticed it after sending the patch. Sorry for the inconvenience.

FYI if you use the create/-pull-request/send-pull-request scripts this is 
taken care of. I believe you can also set this in your git configuration as 
well:

git config --global diff.renames true

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

