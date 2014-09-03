Return-Path: <max.eliaser@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1708713BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 20:57:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2014 13:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,460,1406617200"; d="scan'208";a="585857557"
Received: from jfdmzpr06.jf.intel.com (HELO [10.7.196.68]) ([10.7.210.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2014 13:57:27 -0700
Message-ID: <1409777669.8504.5.camel@maxtothemax-Studio-XPS-8000>
From: Max Eliaser <max.eliaser@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 03 Sep 2014 13:54:29 -0700
In-Reply-To: <54015FDF.8070001@windriver.com>
References: <cover.1409154816.git.liezhi.yang@windriver.com>
	<c8e81a959f95d3537baa1e9c7e8c090a21d8f1b9.1409154816.git.liezhi.yang@windriver.com>
	<1409331683.8504.1.camel@maxtothemax-Studio-XPS-8000>
	<54015FDF.8070001@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] bootchart2: no bashism in bootchartd.in
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
X-List-Received-Date: Wed, 03 Sep 2014 20:57:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have submitted the pull request, hopefully it gets accepted:
https://github.com/mmeeks/bootchart/pull/58

On Sat, 2014-08-30 at 13:23 +0800, Robert Yang wrote:
> 
> On 08/30/2014 01:01 AM, Max Eliaser wrote:
> > Would you be okay with me sending this one upstream? I think it's a
> > worthwhile modification.
> 
> 
> Yes, of course, thanks for sending.
> 
> // Robert
> 
> >
> > -Max
> >
> > On Wed, 2014-08-27 at 08:57 -0700, Robert Yang wrote:
> >> So use /bin/sh
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   .../bootchart2/bootchartd-no-bashism.patch         |   27 ++++++++++++++++++++
> >>   meta/recipes-devtools/bootchart2/bootchart2_git.bb |    6 +++--
> >>   2 files changed, 31 insertions(+), 2 deletions(-)
> >>   create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
> >>
> >> diff --git a/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
> >> new file mode 100644
> >> index 0000000..b013995
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
> >> @@ -0,0 +1,27 @@
> >> +From ffb5bae5d588aaea6325623462a8070a04767196 Mon Sep 17 00:00:00 2001
> >> +From: Robert Yang <liezhi.yang@windriver.com>
> >> +Date: Thu, 14 Aug 2014 08:33:28 -0700
> >> +Subject: [PATCH] bootchartd.in: no bashism
> >> +
> >> +No bashism in bootchartd.in, so use /bin/sh.
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> +---
> >> + bootchartd.in |    2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/bootchartd.in b/bootchartd.in
> >> +index a408bab..064f6a4 100755
> >> +--- a/bootchartd.in
> >> ++++ b/bootchartd.in
> >> +@@ -1,4 +1,4 @@
> >> +-#!/bin/bash
> >> ++#!/bin/sh
> >> + #
> >> + # Bootchart logger script
> >> + # Ziga Mahkovec  <ziga.mahkovec@klika.si>
> >> +--
> >> +1.7.9.5
> >> +
> >> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> >> index 4116304..04fb901 100644
> >> --- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> >> +++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> >> @@ -91,8 +91,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
> >>   # one commit beyond 1.14.6 for a systemd-related bugfix
> >>   PV = "0.14.6+git${SRCPV}"
> >>
> >> -SRC_URI = "git://github.com/mmeeks/bootchart.git"
> >> -SRC_URI += "file://bootchartd_stop.sh"
> >> +SRC_URI = "git://github.com/mmeeks/bootchart.git \
> >> +           file://bootchartd_stop.sh \
> >> +           file://bootchartd-no-bashism.patch \
> >> +          "
> >>
> >>   SRCREV = "b65ed43b0ae832080fb728245de9ef1a4b48d8b5"
> >>
> >> --
> >> 1.7.9.5
> >>
> >
> >
> >
> >



