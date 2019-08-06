Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00FFA7E601
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:37:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 03:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="373376366"
Received: from ambachan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.220])
	by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2019 03:37:40 -0700
To: openembedded-core@lists.openembedded.org
References: <20190805033218.6750-1-anuj.mittal@intel.com>
	<CAMKF1soxNyT73HsCghDdx4vJSGpwxLLYgf957gnFUSckunrpZw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <50ed5cea-6e95-b59d-a059-4da84a61c999@intel.com>
Date: Tue, 6 Aug 2019 11:37:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soxNyT73HsCghDdx4vJSGpwxLLYgf957gnFUSckunrpZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pango: upgrade 1.42.4 -> 1.44.3
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
X-List-Received-Date: Tue, 06 Aug 2019 10:37:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 06/08/2019 07:53, Khem Raj wrote:
> This causes
> 
> https://errors.yoctoproject.org/Errors/Details/258300/

gvtextlayout_pango.c:140:10: error: unknown type name ‘FT_Face’
           FT_Face face;
           ^~~~~~~

Looks like graphviz was assuming Pango would pull in Freetype headers, 
and it no longer does by design.  Fix graphviz to include what it needs.

Ross

