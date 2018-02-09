Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4453C7827F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:50:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 23:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,482,1511856000"; d="scan'208";a="16493556"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2018 23:50:28 -0800
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<754a5028-97a1-79a3-fe48-232cea8d3a6d@linux.intel.com>
	<50B33AC5ED75F74F991980326F1C438D1F208698@PGSMSX103.gar.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e5a3c0d5-20ac-437f-8460-aafea427b961@linux.intel.com>
Date: Fri, 9 Feb 2018 09:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D1F208698@PGSMSX103.gar.corp.intel.com>
Subject: Re: [PATCH 1/2] bmap-tools: change SRC_URI to use tarball instead
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
X-List-Received-Date: Fri, 09 Feb 2018 07:50:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/09/2018 09:14 AM, Chang, Rebecca Swee Fun wrote:
>> When you switch the upstream source location like this, you need to verify that
>> upstream version check still works:
>>
>> bitbake -c checkpkg bmap-tools
>>
>> and inspect tmp/log/checkpkg.csv to see the outcome. If bitbake can no longer
>> determine the latest version, set UPSTREAM_CHECK_URI to the webpage where
>> all the tarballs are linked from (I think it would be
>> https://github.com/intel/${BPN}/releases/). There's plenty of recipes in oe-core
>> with similar adjustments, if you need further examples.
>>
> Thanks for your input! I will double check and send a new revision.

Ah, how could I forget. Devtool makes this much more convenient:

devtool latest-version bmap-tools


Alex


