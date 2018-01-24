Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 695D87856A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 09:00:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 01:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,406,1511856000"; d="scan'208";a="21908314"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 24 Jan 2018 01:00:06 -0800
Date: Wed, 24 Jan 2018 11:01:58 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180124090157.GA29810@mbabyjoh-desk.ger.corp.intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
	<3c471c16-697f-df89-4d46-6d7d763244b2@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3c471c16-697f-df89-4d46-6d7d763244b2@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] package upgrades
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
X-List-Received-Date: Wed, 24 Jan 2018 09:00:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Tue, Jan 23, 2018 at 04:06:11PM +0200, Alexander Kanavin wrote:
> On 01/23/2018 04:05 PM, Maxin B. John wrote:
> >Package upgrades including gtk+3
> 
> Btw, do give it a try to run AUH locally (without sending emails to anyone).

No, I didn't try to run AUH locally.

> Making local runs easy was one of my goals. You can give it a list of things
> to update on the command line, if you don't want it to go over all of
> oe-core, and it will test builds with musl and strange architectures etc.
> Now that you have also jku's packages, it should really help.

It looks like a very helpful tool. I am going to use it for next set of upgrades.

Notes:

Eventhough README in AUH is a good starting point, couldn't locate a quick-start
documentation in the wiki or official documentation. It will be useful. 

Link: https://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/tree/README

> Alex

Thanks and Regards,
Maxin

