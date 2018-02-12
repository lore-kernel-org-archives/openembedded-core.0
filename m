Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA93360103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:32:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17300074"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga008.fm.intel.com with ESMTP; 12 Feb 2018 06:32:34 -0800
Date: Mon, 12 Feb 2018 16:35:04 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180212143503.GA26313@mbabyjoh-desk.ger.corp.intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
	<1518444986-25886-3-git-send-email-maxin.john@intel.com>
	<3c2e005c-2a1b-5656-4794-54ce2c34109a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3c2e005c-2a1b-5656-4794-54ce2c34109a@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] fontconfig: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 14:32:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Feb 12, 2018 at 04:19:53PM +0200, Alexander Kanavin wrote:
> On 02/12/2018 04:16 PM, Maxin B. John wrote:
> >In the case of fontconfig, version x.x.9x are release candidates
> >for next version.
> >+UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.[^9]\d*).tar.gz"
> 
> This will incorrectly exclude x.x.9 which is not a release candidate. You
> need to exclude "9 followed by one or more digits", not just 9 alone.

You are right. Thanks for looking into this. However, in practice, I haven't found
a single non-RC release which follow the pattern x.x.9 for these 
packages (fontconfig, libinput). That doesn't mean, it is improbable.

> Also, "." in .tar.gz means "any character", if you want to match literal "."
> it should be "\."

Ok.

> This is a good place to practice:
> http://regex101.com

Thanks. I will update and send a v2.

> Alex

Best Regards,
Maxin

