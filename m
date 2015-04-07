Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0EA60043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:52:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 07 Apr 2015 03:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="704586837"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2015 03:52:28 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EFD736A408D;
	Tue,  7 Apr 2015 03:52:05 -0700 (PDT)
Date: Tue, 7 Apr 2015 13:52:22 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150407105222.GA19725@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<552189F9.6040405@balister.org>
	<CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
	<20150406141539.GA14205@linux.intel.com>
	<CAP9ODKqL_fwFw_zD4jBBNqjYg=kgeQC5scV+0paMhkO9XOmf0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqL_fwFw_zD4jBBNqjYg=kgeQC5scV+0paMhkO9XOmf0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 10:52:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2015 at 11:28:24AM -0300, Otavio Salvador wrote:
> >>
> >> If we want to have it as a 'standalone' tool we will need to somehow
> >> package the tool set for it to use, otherwise we have a maintenance
> >> nightmare (does patch X has been applied to Parted?).
> >>
> > Can you elaborate a bit on how tool set can be packaged?
> 
> We could do a tarball like the buildtools toolchain.

I was thinking about providing wic and its dependencies as repository with rpm/deb packages.
Providing them as a tarball doesn't differ much from what we already have from my point of view.

--
Regards,
Ed

