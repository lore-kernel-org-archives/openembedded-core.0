Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31AE0783B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:55:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7PItWUM015622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Aug 2017 11:55:32 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 Aug 2017 11:55:31 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Jose Alarcon <jose.alarcon@ge.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
Date: Fri, 25 Aug 2017 13:55:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:55:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/17 1:48 PM, Andre McCurdy wrote:
> On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon <jose.alarcon@ge.com> wrote:
>> On 24.08.2017 20:45, Andre McCurdy wrote:
>>> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
>>>> This patch was a temporal workaround needed with 4.1 kernels.
>>>> Remove it.
>>> OLDEST_KERNEL is still set to 3.2.0
>>>
>>> How can you be sure nobody is using 4.1 ?
>>
>> That's a good point!
>>
>> I didn't know about this variable. I believe we should not integrate
>> this change.
>> I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.
> 
> The original patch has been merged to master so a second patch will be
> needed to revert it.
> 

It may make sense to selectively apply the patch based on what OLDEST_KERNEL is
set to.

This way if a user or distribution sets a newer 'OLDEST_KERNEL', that item can
be removed automatically.

--Mark

