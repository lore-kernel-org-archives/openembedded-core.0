Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CFB816FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:41:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="40571764"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2018 04:41:45 -0700
Date: Mon, 9 Apr 2018 14:42:16 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180409114216.GA22791@mbabyjoh-desk.ger.corp.intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
	<1522855946-8702-4-git-send-email-maxin.john@intel.com>
	<1523027136.2942.9.camel@rpsys.net>
	<20180406151409.GA4329@mbabyjoh-desk.ger.corp.intel.com>
	<da0ba542-6c60-d7f8-5bb1-7dd9e645aeb7@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <da0ba542-6c60-d7f8-5bb1-7dd9e645aeb7@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Richard Purdie <rpurdie@rpsys.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] at-spi2-atk: upgrade to version 2.26.2
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
X-List-Received-Date: Mon, 09 Apr 2018 11:41:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Apr 09, 2018 at 09:14:59AM +0300, Alexander Kanavin wrote:
> On 04/06/2018 06:14 PM, Maxin B. John wrote:
> >>>1. convert to meson build
> >>>2. inherit gnomebase and associated cleanup
> >>>3. add libxml2 to DEPENDS list
> >>>
> >>>Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >>
> >>This and atk seem to fail in gir on x32:
> >>
> >>https://autobuilder.yocto.io/builders/nightly-x32/builds/916/steps/BuildImages/logs/stdio
> >>
> >Will fix it and send the v2.
> 
> We disable gobject introspection on x32 (as there is no qemu support). For
> autotools it works automatically (because the class can rely on a common
> configure switch to enable/disable g-i), but here you need to add a tweak
> similar to the one added to json-glib recipe when it was converted to meson.

Thanks, it was really helpful.

> Alex

Cheers,
Maxin

