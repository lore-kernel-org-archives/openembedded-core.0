Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C55086E671
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:52:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; 
   d="scan'208";a="6845317"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 02 Jan 2018 04:52:43 -0800
To: "Maxin B. John" <maxin.john@intel.com>
References: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
	<1514896905-36107-4-git-send-email-maxin.john@intel.com>
	<f52987a9-8c90-af1f-62f2-554ce4aa58e1@linux.intel.com>
	<20180102125215.GA36465@mbabyjoh-desk.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <05a79c81-8946-3fc1-48d3-7b4f2073a1de@linux.intel.com>
Date: Tue, 2 Jan 2018 14:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180102125215.GA36465@mbabyjoh-desk.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] pkgconf: upgrade to 1.3.90
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
X-List-Received-Date: Tue, 02 Jan 2018 12:52:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/02/2018 02:52 PM, Maxin B. John wrote:
> Hi Alex,
> 
> On Tue, Jan 02, 2018 at 02:38:54PM +0200, Alexander Kanavin wrote:
>> On 01/02/2018 02:41 PM, Maxin B. John wrote:
>>> 1.3.7 -> 1.3.90
>>
>> 1.3.90 is a pre-release tag for 1.4.0, can be seen here:
>>
>> https://github.com/pkgconf/pkgconf/blob/master/NEWS
> 
> Thanks. In that case, we can wait till they officially release 1.4.0.

You can practice your regex skills meanwhile, and exclude tags that have 
9<other-digits> in the minor version part.

Alex

