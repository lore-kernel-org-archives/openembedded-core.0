Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41207793DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 12:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HCIPTB001082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 05:18:36 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 05:18:15 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1536913629.git.hongxu.jia@windriver.com>
	<cfff7e9bbbc6e53d83b860c2244c3ac616add0cf.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <7e8174df-da47-0e73-b15b-6afad8337086@windriver.com>
Date: Mon, 17 Sep 2018 20:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cfff7e9bbbc6e53d83b860c2244c3ac616add0cf.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] package.bbclass: improve auto debug package splitting order
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
X-List-Received-Date: Mon, 17 Sep 2018 12:19:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月17日 20:06, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-09-14 at 16:49 +0800, Hongxu Jia wrote:
>> Hi RP,
>>
>> Is it necessary to split multiple sub dbg packages or only
>> one dbg is allowed? If the former, this fix makes sense.
> Only one is recommended and the code only works properly in some cases
> for one. I'd like to be in a position where we could have that as the
> only thing we supported but its simply not practical in some cases.
>
> The debug package dependency handling probably needs a rethink but that
> would be 2.7 development cycle, its too late for 2.6 now.
>
>> I know in oe-core, almost one dbg package per recipe, but
>> in oe, 21 recipes have extra sub dbg package and 18 of them
>> did not set NOAUTOPACKAGEDEBUG = "1".
>>
>> So rather than modify them one by one tediously, how about to
>> improve auto debug package splitting order? If ${PN}-dbg exists,
>> split the unsplit debug file to ${PN}-dbg, if ${PN}-dbg does not
>> exist, still split them to first dbg package.
> I don't really want to encourage multiple -dbg packages per recipe and
> I am a little concerned about making changes to the core packaging code
> with the release coming up. Fixing the recipes, although tedious may be
> safer/better rather than encouraging people to do things which aren't
> well supported.

Got it, I will fix affected recipes

Thanks for replying

//Hongxu

> Cheers,
>
> Richard



