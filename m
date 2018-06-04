Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49A2F60777
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 09:24:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w549Nuwh012148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jun 2018 02:24:12 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 4 Jun 2018 02:23:46 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<88bf43bd0058ea5c78ca82468bccfaebcdb4ab09.1527670923.git.liezhi.yang@windriver.com>
	<8168c081f3ce907473d2386466daa4f6447f3fa8.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <826cb5f0-e51c-f007-9c4b-6d3abb12ae95@windriver.com>
Date: Mon, 4 Jun 2018 17:26:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <8168c081f3ce907473d2386466daa4f6447f3fa8.camel@linuxfoundation.org>
Subject: Re: [PATCH 10/16] dropbear: add default config file to disable root login
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
X-List-Received-Date: Mon, 04 Jun 2018 09:24:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/04/2018 06:41 AM, Richard Purdie wrote:
> On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> root login is disabled by default for openssh and we can
>> enable it through IMAGE_FEATURES 'debug-tweaks' or
>> 'allow-empty-password', so change to the same default
>> behavior for dropbear.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta/recipes-core/dropbear/dropbear.inc              | 3 +++
>>   meta/recipes-core/dropbear/dropbear/dropbear.default | 2 ++
>>   2 files changed, 5 insertions(+)
>>   create mode 100644 meta/recipes-
>> core/dropbear/dropbear/dropbear.default
> 
> This or the preceeding patch in the series appears to cause the first
> failure in:
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1096/steps/Running%20oe-selftest/logs/stdio
> 
> (FAIL: test_non_root_user_can_connect_via_ssh_without_password
> (imagefeatures.ImageFeatures))

Sorry, I'm working on this today, but needs more time to test it.

// Robert

> 
> Cheers,
> 
> Richard
> 

