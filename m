Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 024FB6AC3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:12:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jun 2015 01:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="720146568"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2015 01:12:04 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E74956A4005;
	Tue, 30 Jun 2015 01:11:24 -0700 (PDT)
Date: Tue, 30 Jun 2015 11:11:23 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20150630081122.GA13937@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
	<1435605033-11509-5-git-send-email-ed.bartosh@linux.intel.com>
	<CABcZANk_vhTvj+rAyo+T8CbUpPd2SGxGk6m3Mt8WwB-M0LGq0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANk_vhTvj+rAyo+T8CbUpPd2SGxGk6m3Mt8WwB-M0LGq0Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 04/20] wic: Refactor getting bitbake variables
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
X-List-Received-Date: Tue, 30 Jun 2015 08:12:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Cristopher,

On Mon, Jun 29, 2015 at 02:48:30PM -0700, Christopher Larson wrote:
> On Mon, Jun 29, 2015 at 12:10 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> 
> > +    global _BITBAKE_VARS
> > +
> > +    if image not in _BITBAKE_VARS:
> >
> 
> In general, I’d suggest using a cache class/object rather than globals,
> similar to how it’s handled in bb.checksum, or a transparent LRU. Whenever
> a cache is involved, it’s best to consider what its lifetime is.
> Admittedly, wic isn’t long-running, but best not to get into bad habits.

Thank you for your comment.

I thought about using a cache class and decided not to do it to keep the
code consistent with the rest of the module. As it was global variable
in the old code my implementation doesn't make the code worse I hope.

As far as I'm happy with test coverage I'll do more serious refactoring
and hopefully implement something better than that.

--
Regards,
Ed

