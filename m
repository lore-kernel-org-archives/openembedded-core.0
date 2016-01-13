Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E49366FFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:45:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0D1jB1h022321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jan 2016 17:45:11 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jan 2016 17:45:11 -0800
Message-ID: <5695ABF4.8080500@windriver.com>
Date: Wed, 13 Jan 2016 09:44:20 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>	
	<3cb28a7edb40f7e138cdc4c15f5cca5802a3018a.1452472146.git.hongxu.jia@windriver.com>
	<1452598749.28375.13.camel@linuxfoundation.org>
In-Reply-To: <1452598749.28375.13.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Wed, 13 Jan 2016 01:45:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2016 07:39 PM, Richard Purdie wrote:
> On Mon, 2016-01-11 at 08:30 +0800, Hongxu Jia wrote:
>> Remove '--without-jbig2dec', since upstream did not
>> support it very well which caused build failure:
>> ...
>>> make[1]: *** No rule to make target `obj/sjbig2_.dev',
>> needed by `obj/sjbig2.dev'.  Stop.
>> ...
>>
>> The same to option '--without-jbig2dec'.
>>
>> Already file a bug to upstream:
>> http://bugs.ghostscript.com/show_bug.cgi?id=696497
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Presumably we use this option for a reason. What effect does removing
> it have? Should we backport the fixes instead?

The initial recipe has used this option without reason, The upstream
have replied the bug:

http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=4b7b278d
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=b0f5a975

I will do the test and backport them in V2

//Hongxu

> Cheers,
>
> Richard


