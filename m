Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E2AB4605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:55:58 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; d="scan'208";a="16888810"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 02 Jan 2018 04:55:58 -0800
Date: Tue, 2 Jan 2018 14:57:06 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180102125705.GB36465@mbabyjoh-desk.ger.corp.intel.com>
References: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
	<1514896905-36107-2-git-send-email-maxin.john@intel.com>
	<fa80eafb-c805-25cf-d47d-cdb2837135e8@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <fa80eafb-c805-25cf-d47d-cdb2837135e8@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] libatomic-ops: upgrade to 7.6.2
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
X-List-Received-Date: Tue, 02 Jan 2018 12:55:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jan 02, 2018 at 02:42:13PM +0200, Alexander Kanavin wrote:
> On 01/02/2018 02:41 PM, Maxin B. John wrote:
> >+UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases/"
> >+SRC_URI = "git://github.com/ivmai/libatomic_ops;branch=${SRCBRANCH}"
> 
> I don't think UPSTREAM_CHECK_URI has any effect when fetching from git, why
> was it added?

It was added as there was a change in SRC_URI with branch info. Thanks for the 
review. I will remove that part.

> Alex
Best Regards,
Maxin

