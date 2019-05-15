Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA9637C89C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 14:06:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FE5gVP025531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 07:05:52 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 07:05:31 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<ross.burton@intel.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<1557927173-27875-1-git-send-email-hongxu.jia@windriver.com>
	<b6a1d93c02926c64d706897a6d6b239e13a32ebf.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <9a07b387-4f0b-0e3f-d44d-08153650993e@windriver.com>
Date: Wed, 15 May 2019 22:05:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b6a1d93c02926c64d706897a6d6b239e13a32ebf.camel@linuxfoundation.org>
Subject: Re: [PATCH V2] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 14:06:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/15/19 10:01 PM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-05-15 at 21:32 +0800, Hongxu Jia wrote:
>> If do_configure failed, output content of config.log
>> to configure log, it is helpful to trace the do_configure
>> failure on the build system which is hard to login.
>> (such as autobuilder)
>>
>> Add a knob OUTPUT_CONFIG_LOG to control config.log output
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/autotools.bbclass | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
> We did used to do this, it was removed:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/autotools.bbclass?id=ba837f10555998a8677eb99bfc6698e0cc1f7942

OK, I got it

//Hongxu

> Cheers,
>
> Richard
>


