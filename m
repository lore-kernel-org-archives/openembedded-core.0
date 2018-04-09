Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 46E84751BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 06:14:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 23:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="41801576"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Apr 2018 23:14:56 -0700
To: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
References: <20180408201600.538-1-Martin.Jansa@gmail.com>
	<20180408203419.2390.23424@do.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2b8b89f3-434b-949a-ad68-d1b9a9ab1efa@linux.intel.com>
Date: Mon, 9 Apr 2018 09:08:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180408203419.2390.23424@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpY2Vuc2UuYmJjbGFzczogYmUgYSBiaXQgbW9yZSBzdHJpY3Qgd2hlbiBzZWFyY2hpbmcgJHtQTn0tJHtMSUNFTlNFX1BBQ0tBR0VfU1VGRklYfSBpbiBwYWNrYWdlcw==?=
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
X-List-Received-Date: Mon, 09 Apr 2018 06:14:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 11:34 PM, Patchwork wrote:
> 
> * Patch            license.bbclass: be a bit more strict when searching ${PN}-${LICENSE_PACKAGE_SUFFIX} in packages
>   Issue             Commit shortlog is too long [test_shortlog_length]
>    Suggested fix    Edit shortlog so that it is 90 characters or less (currently 96 characters)

We should probably remove this limit. Commit shortlog should contain a 
description of the change in a single sentence; it is not always 
possible to cram that into 90 characters (or any arbitrarily chosen 
amount of characters, really).

Alex

