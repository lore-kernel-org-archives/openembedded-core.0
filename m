Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAE9780AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 17:15:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 09:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,503,1511856000"; d="scan'208";a="17861387"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 09:15:28 -0800
Date: Mon, 12 Feb 2018 19:17:58 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180212171757.GA34580@mbabyjoh-desk.ger.corp.intel.com>
References: <1518454991-32814-1-git-send-email-maxin.john@intel.com>
	<1518454991-32814-2-git-send-email-maxin.john@intel.com>
	<ac189ddf-de59-e13e-a3af-7e76b1d0d681@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <ac189ddf-de59-e13e-a3af-7e76b1d0d681@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] libinput: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 17:15:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
On Mon, Feb 12, 2018 at 07:05:27PM +0200, Alexander Kanavin wrote:
> On 02/12/2018 07:03 PM, Maxin B. John wrote:
> >Skip RC releases for libinput which follow the pattern: x.x.9xx
> >+UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar\.xz"
> 
> Same here: dom't hardcode the compression format. Otherwise, seems fine.

Updated and sent v3. Thanks.

> Alex

Best Regards,
Maxin

