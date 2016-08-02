Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1096E667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 02:08:29 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1bUP89-0002RC-Lx from Nathan_Lynch@mentor.com ;
	Mon, 01 Aug 2016 19:08:29 -0700
Received: from [172.30.80.54] (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Aug 2016 19:08:29 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1469220826-8991-1-git-send-email-nathan_lynch@mentor.com>
	<1934077.UNhmxL79FM@peggleto-mobl.ger.corp.intel.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <529dcd64-0fb9-cea6-7e0c-b23cddacc7ed@mentor.com>
Date: Mon, 1 Aug 2016 21:08:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1934077.UNhmxL79FM@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "lttng-tools: filter random filename of ptest output"
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
X-List-Received-Date: Tue, 02 Aug 2016 02:08:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 08/01/2016 08:33 PM, Paul Eggleton wrote:
> Hi Nathan,
> 
> On Fri, 22 Jul 2016 15:53:46 Nathan Lynch wrote:
>> This reverts commit 29a8c45be2862be02afe2ebbc5c026a42f351990.
>>
>> A few things wrong with this change:
>>
>> 1. It patches a patch (runtest-2.4.0.patch).
>> 2. It introduces deviations from the desired ptest output format.
>> 3. It discards PASS: lines from the test output; I *want* to see those.
>> 4. The upstream status of "pending" is incorrect; I do not see this
>>    patch on the lttng-dev mailing list (not that it would apply anyway).
> 
> FYI, "pending" doesn't mean "pending acceptance", it means "pending 
> determination" so it was probably correct here - not that that makes any 
> difference to the other reasons for reverting. "Pending" is perhaps a bit of a 
> poor term though. In any event the reference is here in case you need it:
> 
>   http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Thanks for the pointer, I think I was indeed conflating pending and
submitted.



