Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B38256121F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 15:13:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s34FDU7G020569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Apr 2014 08:13:30 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 08:13:30 -0700
Message-ID: <533ECC17.8090502@windriver.com>
Date: Fri, 4 Apr 2014 23:13:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Koen Kooi <koen.kooi@linaro.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>,
	"Purdie, Richard" <richard.purdie@intel.com>
References: <1396602904-14596-1-git-send-email-koen.kooi@linaro.org>
	<465539862.Xb3zOTJjse@peggleto-mobl5.ger.corp.intel.com>
	<533E91BD.8000107@linaro.org>
In-Reply-To: <533E91BD.8000107@linaro.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Dora][PATCH] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Fri, 04 Apr 2014 15:13:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/04/2014 07:04 PM, Koen Kooi wrote:
> On 04/04/2014 01:00 PM, Paul Eggleton wrote:
>> On Friday 04 April 2014 11:15:04 Koen Kooi wrote:
>>> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>
>>> Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
>>> if the value is the same as the default from PE/PV/PR.
>>>
>>> Also add a -a/--report-all option to report all changes instead of just
>>> the default significant ones.
>>
>> Hmm, looking at this I'm not sure that this is the right fix for a stable
>> branch - ideally we should just fix the error rather than backporting the
>> feature IMO.
>
> I'm fine with either, this was the easiest for me, a single cherrypick.
>

I'm very sorry to say that we need to revert the following commit from
dora, we don't need it on dora, it's my fault, I need to be more careful
when backport the patches:

commit 5b616aa7b618f6ed221d6fa9738220a2c2349f7d
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Sun Nov 17 12:28:19 2013 +0000

     buildhistory_analysis: fix error when comparing image contents

RP, would you please help to revert it from dora ?

// Robert

