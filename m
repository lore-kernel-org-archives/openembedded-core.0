Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E00DA6A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:08:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 14:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="389621540"
Received: from arogani-mobl2.gar.corp.intel.com (HELO linux.fritz.box)
	([10.255.161.197])
	by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2019 14:08:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 09:08:02 +1200
Message-ID: <4862090.aWbVv4fHtx@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <20190920203043.1449-1-pkj@axis.com>
References: <20190920203043.1449-1-pkj@axis.com>
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH 1/2] devtool: finish: Keep patches ordered when updating bbappend
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
X-List-Received-Date: Mon, 23 Sep 2019 21:08:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 21 September 2019 8:30:42 AM NZST Peter Kjellerstedt wrote:
> From: Niclas Svensson <niclass@axis.com>
> 
> The _get_patchset_revs() function returns the patches in an
> OrderedDict to keep them ordered. However, this information was lost
> when the patches were added to the bbappend file.

Both this and 2/2 look good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Thanks
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



