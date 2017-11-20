Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C531E78055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:35:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 04:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,426,1505804400"; 
   d="scan'208";a="7301156"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2017 04:35:56 -0800
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
References: <20171118085357.47305-1-stefan@agner.ch>
	<20171118090301.2783.15393@do.openembedded.org>
	<789b135f8ab78e296dd336ac9a21f68f@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f16bda46-922c-acaa-fceb-52c25a3e0e3f@linux.intel.com>
Date: Mon, 20 Nov 2017 14:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <789b135f8ab78e296dd336ac9a21f68f@agner.ch>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjJdIG9wZW5zc2wxMDogVXBncmFkZSAxLjAuMmwuLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Mon, 20 Nov 2017 12:35:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/18/2017 11:03 AM, Stefan Agner wrote:

>> * Patch            [v2,1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
>>   Issue             Missing or incorrectly formatted CVE tag in
>> included patch file [test_cve_tag_format]
>>    Suggested fix    Correct or include the CVE tag on cve patch with
>> format: "CVE: CVE-YYYY-XXXX"
> 
> I did not add any new patches which address CVE, hence I think this is a
> false positive/not applicable.

You mentioned CVEs in the commit message, I think it wants you to format 
them in a standard way there.

Alex

