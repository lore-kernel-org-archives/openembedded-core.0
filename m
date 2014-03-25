Return-Path: <richard.purdie@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 606966D305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 13:46:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Mar 2014 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,728,1389772800"; d="scan'208";a="507112136"
Received: from drewstep-mobl.ger.corp.intel.com (HELO [10.252.120.102])
	([10.252.120.102])
	by orsmga002.jf.intel.com with ESMTP; 25 Mar 2014 06:43:38 -0700
Message-ID: <1395755016.24890.27.camel@ted>
From: Richard Purdie <richard.purdie@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 25 Mar 2014 13:43:36 +0000
In-Reply-To: <533147BA.706@windriver.com>
References: <531ECDCE.3020805@sonarnerd.net> <531ED455.50702@windriver.com>
	<2472430.vmDQzt5qix@peggleto-mobl5.ger.corp.intel.com>
	<531EE822.7070201@windriver.com> <532173C2.2000606@sonarnerd.net>
	<533147BA.706@windriver.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jussi Laako <jussi@sonarnerd.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora]Re: Failure in license.bbclass
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
X-List-Received-Date: Tue, 25 Mar 2014 13:46:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-25 at 17:09 +0800, Robert Yang wrote:
> 
> On 03/13/2014 05:00 PM, Jussi Laako wrote:
> > Hi,
> >
> > On 03/11/2014 12:40 PM, Robert Yang wrote:
> >> It is used for fixing this bug:
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5572
> >>
> >> Enalbe COPY_LIC_MANIFEST and COPY_LIC_DIRS: No kernel license is
> >> installed in image
> >>
> >> But it used the "oe-pkgdata-util lookup-recipe" which is only on master
> >> branch,
> >> I think that we'd better:
> >>
> >> 1) Revert this commit, then it works with minor problems.
> >>
> >> Or
> >>
> >> 2) Fix the "oe-pkgdata-util lookup-recipe" on dora.
> >
> > With core-image-minimal spiced up with couple of packages, there were quite many
> > license directories left empty, so it requires fair amount of manual work to
> > rectify the situation. So it is far more than just the kernel.
> >
> > For example any libraries coming from util-linux, plus any of the gcc runtimes
> > (libgcc, etc). There are many packages where source name doesn't match with the
> > produced packages.
> >
> > Since BSPs tend to lag behind release schedule, option (2) could possibly help
> > quite many...
> >
> 
> Thanks, I've talked Hongxu, he will fix it on dora without backport
> the 7 commits, and we need revert this one on dora:
> 
> commit e58a1499accd74d3e6fe4f899711d4c680ebc18f
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Wed Nov 20 18:35:39 2013 +0800
> 
>      license.bbclass: fix copying license directories failed
> 
> 
> Paul and RP, what's your opinion, please ?

Seems reasonable to me. We reverted that patch a while ago.

Cheers,

Richard


