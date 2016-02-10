Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D159607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:16:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 10 Feb 2016 01:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="899934445"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 01:16:35 -0800
Date: Wed, 10 Feb 2016 11:19:53 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160210091952.GB25070@mbabyjoh-mobl.fi.intel.com>
References: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LbszEFGBN5RNkb8y50nRRekZQkQ13Cedc+GCUzpL1ACbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbszEFGBN5RNkb8y50nRRekZQkQ13Cedc+GCUzpL1ACbQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mdadm: update to version 3.4
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
X-List-Received-Date: Wed, 10 Feb 2016 09:16:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,
On Tue, Feb 09, 2016 at 10:22:26PM +0000, Burton, Ross wrote:

>>On 9 February 2016 at 17:48, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    3.3.4 -> 3.4
>  poky builds fail with ptest enabled:
>
>    | restripe.c: In function 'test_stripes':
>    | restripe.c:845:4: error: ignoring return value of 'read', declared with attribute warn_unused_result [-Werror=unused-result]
>    |     read(source[i], stripes[i], chunk_size);
>    |     ^
>    | cc1: all warnings being treated as errors
>    | Makefile:214: recipe for target 'test_stripe' failed
>
> Ross

Will fix it and send a v2 soon.

Best Regards,
Maxin

