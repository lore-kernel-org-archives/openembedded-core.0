Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 270D578170
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:31:03 +0000 (UTC)
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
	by m0048299.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7F5Stmt018252 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 01:31:04 -0400
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170814080058.129615-1-jose.alarcon@ge.com>
	<1502725875.28941.15.camel@linux.intel.com>
From: Jose Alarcon <jose.alarcon@ge.com>
Message-ID: <e90fad93-0aac-1f8c-e2a1-fd323e082a97@ge.com>
Date: Tue, 15 Aug 2017 08:30:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502725875.28941.15.camel@linux.intel.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1708150094
Cc: openembedded-core@lists.openembedded.org
Subject: Re: EXT: Re: [PATCH v2] libx11: Add patch to fix hanging issue in _XReply
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
X-List-Received-Date: Tue, 15 Aug 2017 05:31:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 14.08.2017 18:51, Leonardo Sandoval wrote:
> On Mon, 2017-08-14 at 11:00 +0300, Jose Alarcon wrote:
>> Assume event queue is empty if another thread is blocking waiting for event.
>>
>> If one thread was blocking waiting for an event and another thread sent a
>> reply to the X server, both threads got blocked until an event was
>> received.
>>
>> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
>> ---
>>  .../libx11/Fix-hanging-issue-in-_XReply.patch      | 60 ++++++++++++++++++++++
>>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |  1 +
>>  2 files changed, 61 insertions(+)
>>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
>> new file mode 100644
>> index 0000000..e04acef
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
>> @@ -0,0 +1,60 @@
>> +From 5235a7f3692a4c3c90dd4ac1be3c670388904bbe Mon Sep 17 00:00:00 2001
>> +From: Tatu Frisk <tatu.frisk@ge.com>
>> +Date: Tue, 14 Mar 2017 14:41:27 +0200
>> +Subject: [PATCH] Fix hanging issue in _XReply
>> +
>> +Assume event queue is empty if another thread is blocking waiting for event.
>> +
>> +If one thread was blocking waiting for an event and another thread sent a
>> +reply to the X server, both threads got blocked until an event was
>> +received.
>> +
>> +Upstream-Status: Submitted.
> Jose, can you please included where it was submitted:
>
> Upstream-Status: Submitted [where]
>
> More info @
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks Leonardo,

I sent a v3 with the upstream status corrected.

--
Jose

