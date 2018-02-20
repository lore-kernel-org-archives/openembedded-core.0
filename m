Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D49997844B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:26:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1KGQTm9010031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Feb 2018 08:26:29 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 20 Feb 2018 08:26:10 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
	<1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
	<1519083917.24236.261.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <deba09ee-bc72-224b-85d3-887670a26b9d@windriver.com>
Date: Tue, 20 Feb 2018 11:26:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519083917.24236.261.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Tue, 20 Feb 2018 16:26:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/19/2018 06:45 PM, Richard Purdie wrote:
> On Mon, 2018-02-19 at 10:37 -0500, Bruce Ashfield wrote:
>> From: Joe Slater <jslater@windriver.com>
>>
>> Remove do_make_scripts() from module-base.bbclass and put
>> functionality in a recipe.  This will build the scripts only
>> once instead of each time an external module is built.
>>
>> [YOCTO #12228]
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> v2: added the LIC_FILES_CHECKSUM
>>
> 
> Sadly this doesn't pass all our tests:
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/827/steps/Running%20oe-selftest/logs/stdio
> 
> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
> 
> should reproduce.
> 
> I suspect that the recipe may need:
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"

v3 has been sent for the two patches in this series. With the
kernel-devsrc and other scripts/prepare work in progress, I'm sure
there will be more changes coming. But the dependencies and and
build steps are definitely easier to express in the separate recipe
versus being buried in the various bbclasses.

Cheers,

Bruce

> 
> Cheers,
> 
> Richard
> 


