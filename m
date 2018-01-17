Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D5E9E78715
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:31:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 05:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="166815612"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2018 05:31:44 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20180117004018.21928440002@auh.yoctoproject.org>
	<CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <de461d83-a9fc-4dac-22c5-c911b3a34bb0@linux.intel.com>
Date: Wed, 17 Jan 2018 15:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
Subject: Re: [AUH] Upgrade status: 2018-01-16
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
X-List-Received-Date: Wed, 17 Jan 2018 13:31:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/17/2018 04:15 AM, Andre McCurdy wrote:
>>      TOTAL: attempted=120 succeeded=45(37.50%) failed=75(62.50%)
> 
> Giving these percentages to two decimal places seems a little over the top.
> 
> Perhaps the stats could be made even more readable by just giving the
> pass rate, instead of both pass and failure rates, e.g.
> 
>    xxx: attempted=120 succeeded=45 failed=75 (success rate 37%)
> 
> Sorting the lists for each category would improve readability too.

Patches welcome :)

TBH, I don't much care how the overall report looks like. The point of 
AUH is to help recipe maintainers with the tedious, thankless task of 
keeping oe-core up to date and relevant - by automating as much as 
possible of that work, and sending results of it by private email.

Alex

