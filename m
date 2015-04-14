Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9E3E6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:18:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2015 12:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,577,1422950400"; d="scan'208";a="695224547"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.22.135])
	([10.252.22.135])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2015 12:18:35 -0700
Message-ID: <1429039113.7001.6.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Apr 2015 22:18:33 +0300
In-Reply-To: <17C7BB5A-DD92-44F5-A463-F36F9A45522E@gmail.com>
References: <552D4D85.9010104@linux.intel.com>
	<17C7BB5A-DD92-44F5-A463-F36F9A45522E@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Should disabling features in glibc also disable the corresponding headers?
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
X-List-Received-Date: Tue, 14 Apr 2015 19:18:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-14 at 13:40 -0400, Khem Raj wrote:
> > On Apr 14, 2015, at 1:25 PM, Tanu Kaskinen <tanu.kaskinen@linux.intel.com> wrote:
> > 
> > Hello,
> > 
> > oe-core's version of glibc allows configuring out some libc
> features. Currently, if a feature is disabled in glibc, glibc still
> installs the header for that feature. This means that applications
> using glibc can't rely on checking just the header presence in their
> configure scripts, they also need to check whether the function
> implementation is present. Is there some good reason why glibc works
> that way, or should glibc be fixed so that disabling a feature
> disables the header too?
> > 
> > At least alsa-lib requires patching[1] for this reason, and I
> wouldn't be surprised if there were many other similar cases in other
> packages.
> > 
> > [1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
> > 
> 
> checking for functions is the right thing. And it would fail to link
> if you passed configure check.

Thanks for the quick reply. Could you elaborate why checking for
functions is the right thing? If that's the right thing, then I should
send that alsa-lib patch to upstream, and I want to be able to explain
why the patch is not a workaround for oe-core's glibc brokenness.

-- 
Tanu


