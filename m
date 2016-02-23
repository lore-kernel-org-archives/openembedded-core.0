Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6260677364
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:02:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 23 Feb 2016 08:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="53267604"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2016 08:01:51 -0800
Date: Tue, 23 Feb 2016 18:05:35 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160223160534.GC22912@mbabyjoh-mobl.fi.intel.com>
References: <1456240902-31768-1-git-send-email-maxin.john@intel.com>
	<CAMKF1sox=Q5KCSZq01jkDxBphd45wFo0+eKqi=tF6D6xdHc9cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sox=Q5KCSZq01jkDxBphd45wFo0+eKqi=tF6D6xdHc9cw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] argp-standalone: make it available for non-musl systems too
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
X-List-Received-Date: Tue, 23 Feb 2016 16:02:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Tue, Feb 23, 2016 at 10:40:28AM -0500, Khem Raj wrote:
>Uclibc has its own argp implemented as libuargp so please use that you dont need yet another implementation

>>On Feb 23, 2016 10:18 AM, "Maxin B. John" <maxin.john@intel.com> wrote:
>>
>>Without this, uclibc build of rng-tools will fail with this error:

Thanks.. I will update rng-tools to use libuargp for uclibc builds.

Best Regards,
Maxin

