Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C5D896BA9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 15:27:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2019 07:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; d="scan'208";a="202717097"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by fmsmga007.fm.intel.com with ESMTP; 12 Nov 2019 07:27:59 -0800
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20191107235830.26644-1-ross.burton@intel.com>
	<20191107235830.26644-5-ross.burton@intel.com>
	<a1e5fb76-c7af-dbf4-269d-55469f85589b@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ba0e6b28-a249-b812-aed0-6452d56e9c5f@intel.com>
Date: Tue, 12 Nov 2019 15:27:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a1e5fb76-c7af-dbf4-269d-55469f85589b@gmail.com>
Subject: Re: [PATCH 5/5] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Tue, 12 Nov 2019 15:27:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/11/2019 22:19, akuster808 wrote:
> err, I thought the NVD db is only updated once every two hours. And why
> is this not a variable so folks can tweak accordingly?

This a fast-path so that a refresh isn't even attempted 60 minutes after 
a fetch.  A fetch involves checking the last updates times in the 
metadata anyway so is relatively fast.

Don't see the need for this to be another variable.  Do you have a 
better refresh interval?

Ross

