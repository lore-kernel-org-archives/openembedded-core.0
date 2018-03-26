Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D16F6784F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 16:59:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 09:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,365,1517904000"; d="scan'208";a="28152738"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 26 Mar 2018 09:59:44 -0700
Received: from mingeeon-mobl7.amr.corp.intel.com (unknown [10.254.35.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id EE8A758049B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:59:43 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Stephano Cetola <stephano.cetola@linux.intel.com>
Message-ID: <5119a86d-f69b-a16c-3193-37836eea5cd6@linux.intel.com>
Date: Mon, 26 Mar 2018 09:59:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxM+KAmTE4?=
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
X-List-Received-Date: Mon, 26 Mar 2018 16:59:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.5 M3 final close out.
Next Deadline: YP 2.5 M4 stabilization is 4/2/18

SWAT lead is currently Ross.
SWAT team rotation: Ross -> Juro on March 30, 2018
SWAT team rotation: Juro -> Paul on April 6, 2018
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:
· YP 2.5 M3 rc1 was built and went into QA. This release was built on
with the ‘new’ autobuilder codebase. Some issues were found with
artefact publication but nothing to block the rc1 as yet.
· We are still blocked with morty on the glibc 2.27 and the sdk locale
issues
· Code has been added to uninative to ensure the glibc corruption that
occurred with the newer glibc cannot happen again.
· We have found a new issue where fedora 27’s version of coreutils is
using syscall() to call a syscall directly and hence corrupting
permissions of some files from pseudo’s perspective. We’re currently
discussing this with upstream as its looking problematic to fix and we’d
much prefer they use the glibc wrappers.
· We have a fix for the qemuarm64 hangs during early boot, thanks to
everyone who’s helped fix that, its much appreciated and will help our
automated tests.
· A significant win in opkg compression speed was found (thanks Ross!)

Planned upcoming dot releases:
YP 2.3.4 (Pyro) will be built after 2.5 M3
YP 2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27 issue is
fixed
YP 2.4.3 (Rocko) is planned for post YP 2.5.

Key YP 2.5 Dates are:
YP 2.5 M3 is in QA.  See status above.
YP 2.5 M3 was scheduled for release 3/2/18
YP 2.5 M4 cut off of 4/2/18
YP 2.5 M4 release of 4/27/18

Tracking Metrics:
      WDD 2673 (last week 2673)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]

