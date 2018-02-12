Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B485A6093C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 17:06:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 09:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,503,1511856000"; d="scan'208";a="200579901"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga005.jf.intel.com with ESMTP; 12 Feb 2018 09:06:05 -0800
Date: Mon, 12 Feb 2018 19:08:35 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180212170834.GA32860@mbabyjoh-desk.ger.corp.intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
	<1518444986-25886-3-git-send-email-maxin.john@intel.com>
	<3c2e005c-2a1b-5656-4794-54ce2c34109a@linux.intel.com>
	<20180212143503.GA26313@mbabyjoh-desk.ger.corp.intel.com>
	<aa878915-dc7b-2fdc-f90d-f10522c54d7a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <aa878915-dc7b-2fdc-f90d-f10522c54d7a@linux.intel.com>
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
X-List-Received-Date: Mon, 12 Feb 2018 17:06:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Feb 12, 2018 at 04:43:54PM +0200, Alexander Kanavin wrote:
> On 02/12/2018 04:35 PM, Maxin B. John wrote:
> >>This is a good place to practice:
> >>http://regex101.com
> >
> >Thanks. I will update and send a v2.
> 
> To save you a bit of time, I think the right construct should be either
> 
> (9|[0-8]\d+)
> 
> or
> 
> (?!9\d+)\d+
 
This looks much better. Thanks!

> 
> Alex

Thanks and Regards,
Maxin

