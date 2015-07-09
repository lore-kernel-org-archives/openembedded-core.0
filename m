Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C227C60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 08:12:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2015 01:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="758921540"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.21.252])
	([10.252.21.252])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 01:11:32 -0700
Message-ID: <1436429491.23019.21.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 09 Jul 2015 11:11:31 +0300
In-Reply-To: <1436428717.9778.33.camel@linuxfoundation.org>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
	<1436428717.9778.33.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Thu, 09 Jul 2015 08:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 08:58 +0100, Richard Purdie wrote:
> On Mon, 2015-07-06 at 18:14 +0300, Tanu Kaskinen wrote:
> > These patches update speex to 1.2rc2 and speexdsp to 1.2rc3. speexdsp
> > was previously included in speex, but now it's in a separate source
> > tree, so a new recipe is needed.
> > 
> > The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:
> > 
> >   tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)
> > 
> > are available in the git repository at:
> > 
> >   git://git.openembedded.org/openembedded-core-contrib tanuk/speex
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/speex
> 
> I included these patches on the autobuilder in master-next and saw:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/385/steps/BuildImages_1/logs/stdio
> 
> and also what looks like a another separate but related issue:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/builds/107/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/387/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/383/steps/BuildImages_2/logs/stdio
> 
> Could you take a look and see if we can figure out the issue there
> please?

Yes, I'll investigate.

-- 
Tanu


