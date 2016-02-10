Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD2D73197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 02:47:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1A2lbFd019916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Feb 2016 18:47:37 -0800 (PST)
Received: from [172.25.44.9] (172.25.44.9) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 18:47:36 -0800
To: "Maxin B. John" <maxin.john@intel.com>
References: <1448885472-24350-1-git-send-email-maxin.john@intel.com>
	<20151201092706.GA15462@ad.chargestorm.se>
	<CAMKF1srkTNBtULap+gz=S=NXWbjd_6MbYsKHSYtY0ygXY7_9RQ@mail.gmail.com>
	<20151201055826.GA11022@mbabyjoh-mobl.fi.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56BAA4C7.6080006@windriver.com>
Date: Tue, 9 Feb 2016 21:47:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20151201055826.GA11022@mbabyjoh-mobl.fi.intel.com>
X-Originating-IP: [172.25.44.9]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: enable previously unselected utilities
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
X-List-Received-Date: Wed, 10 Feb 2016 02:47:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-12-01 12:58 AM, Maxin B. John wrote:
> Hi,
>
> On Tue, Dec 01, 2015 at 01:29:43AM -0800, Khem Raj wrote:
>> On Tue, Dec 1, 2015 at 1:27 AM, Anders Darander <anders@chargestorm.se> wrote:
>>> Hi,
>>>
>>> Just a couple of questions.
>>>
>>> * Maxin B. John <maxin.john@intel.com> [151130 17:59]:
>>>> Include below listed utilities that are not yet enabled/packaged
>>>> in the iproute2 recipe:
>>>
>>>> lnstat
>>>> ifstat
>>>> genl
>>>> rtacct
>>>> nstat
>>>> ss
>>>
>>> When you enable those, how much does the size ofthe iproute2 package
>>> increase?
>>>
>
> The increase in size is around 268K.
>
> $ du -sh iproute2
> 476K    iproute2
>
> $ du -sh iproute2-new
> 744K    iproute2-new
>
>>> Perhaps those extra tools should be placed in e.g. ${PN}-tools, or
>>> some package like that?
>>
>> I think its better to package each one in separate package of its own.
>>
>
> Ok. I will split these binaries in separate packages.

Maxin,

Will you be able to do this as part of the 4.4 upgrade that
you have just sent or would you like Robert to find someone
to do it when he is back from holiday next week?

../Randy
>
>>>
>>> Cheers,
>>> Anders
>>>
>>>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>>> ---
>>>>   meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> index 29f9062..abaff3f 100644
>>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"
>>>
>>>>   inherit update-alternatives
>>>
>>>> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>>>> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>>>
>>>>   do_configure_append () {
>>>>       sh configure ${STAGING_INCDIR}
>>> --
>>> Anders Darander, Senior System Architect
>>> ChargeStorm AB / eStorm AB
>>> --
>
> Best Regards,
> Maxin
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

