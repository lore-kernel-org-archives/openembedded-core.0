Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B11C760664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 02:17:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8C2Hj2g012768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Sep 2013 19:17:45 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 11 Sep 2013 19:17:45 -0700
Message-ID: <5231243A.2060704@windriver.com>
Date: Thu, 12 Sep 2013 10:17:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1378736079.3484.117.camel@ted> <522ECB4B.2070209@windriver.com>
	<1378822091.3484.163.camel@ted> <52303854.1020209@windriver.com>
	<1378894228.3484.176.camel@ted>
In-Reply-To: <1378894228.3484.176.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Thu, 12 Sep 2013 02:17:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/11/2013 06:10 PM, Richard Purdie wrote:
> On Wed, 2013-09-11 at 17:31 +0800, Robert Yang wrote:
>>
>> On 09/10/2013 10:08 PM, Richard Purdie wrote:
>>> On Tue, 2013-09-10 at 15:33 +0800, Robert Yang wrote:
>>>> Thanks, Can we provide a replacement for the "bitbake PN-PV" since it is
>>>> useful, for example, can we support the PREFERRED_VERSION_${PN} in the env
>>>> in the future ? There is a similar bug:
>>>>
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4965
>>>
>>> If you set BB_PRESERVE_ENV=1 you can set PREFERRED_VERSION_xxx from the
>>> environment so this should already be possible?
>>>
>>
>> It seems that the BB_PRESERVE_ENV=1 doesn't work, but we use the
>> BB_ENV_EXTRAWHITE, for example:
>>
>> $ export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE PREFERRED_VERSION_make"
>> $ export PREFERRED_VERSION_make="3.81",
>>
>> Then it works, maybe something is wrong with the BB_PRESERVE_ENV.
>
> It is broken, yes, I've sent out a patch to fix it. There is one other

Thanks, it worked now.

> problem, you can't use "-" in a shell environment variable so you can't
> do:
>
> PREFERRED_VERSION_make-native = xxx
>
> which is annoying. We might want to add some kind of mangling mechanism
> like a double underscore translating to a dash or something...
>

I will update these in the bugzilla

// Robert

> Cheers,
>
> Richard
>
>
>
>

