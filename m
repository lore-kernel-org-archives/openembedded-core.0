Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SsHbA-0005JO-Rs
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 20:06:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KHtJ65028176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 10:55:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.35.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 20 Jul 2012 10:55:19 -0700
Message-ID: <50099B89.7060308@windriver.com>
Date: Fri, 20 Jul 2012 11:55:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
	<50087A5B.9030905@windriver.com>
	<CAKSdS8LB0=8RieBGJSAyxyw9APPEksCKZ1WVz0EWwMZ49-SRow@mail.gmail.com>
In-Reply-To: <CAKSdS8LB0=8RieBGJSAyxyw9APPEksCKZ1WVz0EWwMZ49-SRow@mail.gmail.com>
Subject: Re: meta-toolchain type SDK containing external toolchain possible?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 18:06:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/12 10:45 AM, Manuel Bessler wrote:
> Hi Mark,
>
> On Thu, Jul 19, 2012 at 5:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 7/19/12 3:13 PM, Manuel Bessler wrote:
>>> Is it possible to setup my toolchain such that it will be part of the
>>> SDK package instead of the default {gcc,binutils}-cross-canadian?
>>
>>
>> It is possible, but the external toolchain needs to be provided via a
>> crosssdk/cross-canadian binary.  The external-csl-toolchain.bb can be used
>> as a model for how to do this.
>
> What do you mean by "via a crosssdk/cross-canadian binary"? Built by
> bitbake using the *-cross-canadian recipes?

You need to create a crosssdk/cross-canadian recipe that copies the binary 
toolchain into the right SDK location(s).  Using external-csl-toolchain (or 
similar) as a guide.

>
>
>> For my stuff I did;
>>
>> PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
>> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>
>> PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
>> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>
>> PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
>> "external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>
>>
>>
>>> That alone did not change anything.
>>>
>>> Then I tried adding the following to
>>> recipes-core/meta/external-xxx-toolchain_4.5.3.bb in my layer:
>>> PROVIDES += " gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} "
>>> PROVIDES += " binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} "
>>
>>
>> Within the external-cs-toolchain-cross-canadian.bb I had similar provides as
>> well..
>
> So you have a separate recipe to satisfy cross-canadian ? I tried
> finding this file but had no luck...

Yes, I have external-cs-toolchain.bb, and 
external-cs-toolchain-cross-canadian.bb, which is based on the former.

(most of it is generic, so a single ".inc" version used by both should be 
possible as well..)

--Mark

>
> Thanks,
> Manuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




