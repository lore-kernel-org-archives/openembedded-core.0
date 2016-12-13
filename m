Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B397171A9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:09:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBD89V9q003676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 13 Dec 2016 00:09:31 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 00:09:30 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<2244665.P00pJDD7kM@peggleto-mobl.ger.corp.intel.com>
	<18078b0a-ede2-41ff-491b-9151b5b2aa1c@windriver.com>
	<3698001.Ed7gRfCEom@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d4898605-4cb1-ab19-b7e8-2e5f87fb9b24@windriver.com>
Date: Tue, 13 Dec 2016 16:09:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3698001.Ed7gRfCEom@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] oeqa/sdkext/devtool.py: don't reset when the test is failed
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
X-List-Received-Date: Tue, 13 Dec 2016 08:09:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2016 04:07 PM, Paul Eggleton wrote:
> On Tue, 13 Dec 2016 14:39:46 Robert Yang wrote:
>> On 12/13/2016 02:33 PM, Paul Eggleton wrote:
>>> On Tue, 13 Dec 2016 14:01:08 Robert Yang wrote:
>>>> On 12/13/2016 12:48 PM, Paul Eggleton wrote:
>>>>> On Wed, 16 Nov 2016 22:19:34 Robert Yang wrote:
>>>>>> The contents are helpful to debug when the error happens.
>>>>>
>>>>> In this case removing this is OK because we're operating on an eSDK that
>>>>> the tests install. However, this wouldn't be appropriate for the devtool
>>>>> oe- selftest tests since they are operating on the user's build system
>>>>> itself - not that you probably have any intention of changing those, I
>>>>> just wanted to note that.
>>>>
>>>> Sorry, I don't quite understand, does selftest uses
>>>> oeqa/sdkext/devtool.py,
>>>> please ?
>>>
>>> No, this is for bitbake -c testsdkext.
>>>
>>>> Even if it uses devtool.py, I still think that we need keep the
>>>> error contents for debugging when the error happens. It's very hard to
>>>> debug when there is no error log or no workspace.
>>>
>>> I mean the equivalent oe-selftest tests in oeqa/selftest/devtool.py.
>>>
>>> Actually, I've realised something that applies here as well - leaving the
>>> files around would be OK if we stopped on the first failure, but we don't
>>> -
>>> the next test proceeds after it. How will you be able to rely on what's in
>>> the workspace if several other tests have run afterwards - not to mention
>>> ensure those tests aren't disrupted by the leftover files?
>>
>> That's a problem, but we really need consider debugging, otherwise it's
>> painful when test are failed but nothing left. How about run test cases
>> in different workspaces ?
>
> Currently when I need to debug a test, I tend to either run the test commands
> manually, or comment out the cleanup. If we really want to improve debugging
> then we ought to do it properly - have proper teardown infrastructure and then
> provide a mode that disables it.

Thanks, I will drop the patch atm.

// Robert

>
> Cheers,
> Paul
>

