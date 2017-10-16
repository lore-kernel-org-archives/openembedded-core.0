Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C356B6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 14:19:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 07:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; d="scan'208";a="1206352559"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga001.fm.intel.com with SMTP; 16 Oct 2017 07:19:44 -0700
Date: Mon, 16 Oct 2017 09:29:31 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-Id: <20171016092931.301fab6cba2a4fabf94e05dc@linux.intel.com>
In-Reply-To: <20171012191104.GJ9221@denix.org>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012191104.GJ9221@denix.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] perl: upgrade to 5.26.1
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
X-List-Received-Date: Mon, 16 Oct 2017 14:19:44 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Oct 2017 15:11:04 -0400
Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Oct 12, 2017 at 11:35:21AM -0700, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > Highlights:
> > 
> >     * Patches rebased to 5.26.1 and just one removed
> > 
> >     * Several configs values taken from upstream script uconfig[64].sh were introduced in
> >     config.sh, avoiding pre-processor issues.
> > 
> >     * Several libraries paths now included a './' as prefix, because @INC does not
> >     include local paths.
> 
> https://wiki.gentoo.org/wiki/Project:Perl/5.26_Known_Issues

Thanks Denys. I though including the dot-slash was a OE-Core hack.

I should have read this page before starting the upgrade. For the buildtime issues, I just hit the 'Dot-In-INC-Removal' so I believe the runtime ones are there. Also, I forgot to mentioned in the commit that there were some ptest failing so pass rate is not as high as previous version. I will send a v2 with the above link and the ptest results as cover letter.

