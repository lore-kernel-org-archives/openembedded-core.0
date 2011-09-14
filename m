Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3qdF-0002Y5-Er
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 16:40:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EEYvfX000577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Sep 2011 07:34:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Sep 2011 07:34:57 -0700
Message-ID: <4E70BB90.9000109@windriver.com>
Date: Wed, 14 Sep 2011 09:34:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: "Xu, Dongxiao" <dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<57947e84078c2fbd1dde287bd9910cfd95e2ea27.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1D79.80208@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754AE15@shsmsx501.ccr.corp.intel.com>
	<4E6E3FE0.2060805@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754B024@shsmsx501.ccr.corp.intel.com>
	<4E6F7596.4050507@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D81DF1C1@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D81DF1C1@shsmsx501.ccr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rpm: add multilib prefix for archs under deploy/rpm
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
X-List-Received-Date: Wed, 14 Sep 2011 14:40:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/13/11 9:56 PM, Xu, Dongxiao wrote:
> Hi Mark,
> 
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Mark Hatle
>> Sent: Tuesday, September 13, 2011 11:24 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs under
>> deploy/rpm
>>
>> On 9/12/11 9:39 PM, Xu, Dongxiao wrote:
>>> Hi Mark,
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>> Of Mark Hatle
>>>> Sent: Tuesday, September 13, 2011 1:23 AM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs
>>>> under deploy/rpm
>>>>
>>>> On 9/12/11 10:07 AM, Xu, Dongxiao wrote:
>>>>> Hi Mark,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf
>>>>>> Of Mark Hatle
>>>>>> Sent: Monday, September 12, 2011 10:56 PM
>>>>>> To: openembedded-core@lists.openembedded.org
>>>>>> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for
>>>>>> archs under deploy/rpm
>>>>>>
>>>>>> On 9/12/11 3:34 AM, Dongxiao Xu wrote:
>>>>>>> Currently MACHINE_ARCH deploy folder is unique in multilib system,
>>>>>>> thus a lib32 version of rpm package will override a normal rpm
>>>>>>> package if its PACKAGE_ARCH is ${MACHINE_ARCH}.
>>>>>>>
>>>>>>> Define different deploy folder for multilib architectures to avoid
>>>>>>> the confliction.
>>>>>>
>>>>>> I'm not sure I understand here.  Within the deployment directory is
>>>>>> a set of directories for each RPM architecture.  Are you saying
>>>>>> that we can get two packages that have different contents but the
>>>>>> same RPM
>>>> architecture?
>>>>>>
>>>>>
>>>>> Yes, for example the netbase recipe, which the PACKAGE_ARCH =
>>>> MACHINE_ARCH.
>>>>> Both the normal version of netbase package and the lib32 version are
>>>>> named as "netbase-4.45-r1.qemux86_64.rpm" putting in
>>>>> tmp/deploy/rpm/qemux86-64 directory, so we need to differentiate them.
>>>>
>>>> Wow, that is very broken.  I think part of the problem is that the
>>>> arch is used to signify not only ABI (and optimizations), but also machine
>> type in this case.
>>>>
>>>> What we really need is an additional architecture type that handles
>>>> machine specific packages for each multilib type.  I'm really not
>>>> sure what they would be called or how it would work though.
>>>>
>>>> Anyone have suggestions for naming and processing of these?  (I'm
>>>> almost tempted to say "machine_lib")
>>>
>>> In the weekend I had a talk with Richard and he suggested on adding
>> MLPREFIX to MACHINE_ARCH to differentiate them.
>>> Otherwise user need to define a new value for
>> MACHINE_virtclass-multilib-lib32?
>>
>> I can't think of a better solution for this right now.  Note, that if the MLPREFIX
>> is added to the MACHINE_ARCH, a corresponding change to Zypper will be
>> needed as well.
> 
> I tried this approach by defining 'MACHINE_virtclass-multilib-lib32="qemux86"' in local.conf, and it works. Therefore we will have qemux86, qemux86-64, x86, x86-64, and all architectures under tmp/deploy/rpm folder. 
> 
> Does zypper work with this approach?

This should work, we just need to ensure that zypper/libzypp are paying
attention to the MACHINE... type(s) as well.  There is a small chunk of code
within the libzypp recipe that generates a table of available/compatible
architectures.  This is what will need to be updated.

(I do think the MACHINE_virtclass change you made is likely the best approach
right now.)

--Mark

> Thanks,
> Dongxiao
> 
>>
>> --Mark
>>
>>> Thanks,
>>> Dongxiao
>>>
>>>>
>>>> --Mark
>>>>
>>>>> Thanks,
>>>>> Dongxiao
>>>>>
>>>>>> Can you give me an example of what is going wrong?
>>>>>>
>>>>>> --Mark
>>>>>>
>>>>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>>>>>> ---
>>>>>>>  meta/classes/multilib.bbclass   |    5 +++++
>>>>>>>  meta/classes/rootfs_rpm.bbclass |    4 +++-
>>>>>>>  2 files changed, 8 insertions(+), 1 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/classes/multilib.bbclass
>>>>>>> b/meta/classes/multilib.bbclass index 76c86b2..6ace1fe 100644
>>>>>>> --- a/meta/classes/multilib.bbclass
>>>>>>> +++ b/meta/classes/multilib.bbclass
>>>>>>> @@ -77,4 +77,9 @@ python __anonymous () {
>>>>>>>      multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
>>>>>>>      multilib_map_variable("PACKAGE_INSTALL", variant, d)
>>>>>>>      multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
>>>>>>> +
>>>>>>> +    package_arch = d.getVar("PACKAGE_ARCH", True)
>>>>>>> +    machine_arch = d.getVar("MACHINE_ARCH", True)
>>>>>>> +    if package_arch == machine_arch:
>>>>>>> +        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
>>>>>>>  }
>>>>>>> diff --git a/meta/classes/rootfs_rpm.bbclass
>>>>>>> b/meta/classes/rootfs_rpm.bbclass index 135ca75..7936d77 100644
>>>>>>> --- a/meta/classes/rootfs_rpm.bbclass
>>>>>>> +++ b/meta/classes/rootfs_rpm.bbclass
>>>>>>> @@ -218,7 +218,9 @@ python () {
>>>>>>>              default_tune =
>>>>>> localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1],
>>>>>> False)
>>>>>>>              if default_tune:
>>>>>>>                  localdata.setVar("DEFAULTTUNE", default_tune)
>>>>>>> -            ml_package_archs +=
>> localdata.getVar("PACKAGE_ARCHS",
>>>>>> True) or ""
>>>>>>> +            localdata.setVar("MACHINE_ARCH", eext[1] + "_" +
>>>>>> localdata.getVar("MACHINE_ARCH", False))
>>>>>>> +            package_archs = localdata.getVar("PACKAGE_ARCHS",
>>>> True)
>>>>>> or ""
>>>>>>> +            ml_package_archs += " " + package_archs
>>>>>>>              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1],
>>>>>> localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
>>>>>>>      bb.data.setVar('MULTILIB_PACKAGE_ARCHS',
>> ml_package_archs,
>>>>>> d)  }
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co
>>>>>> re
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor
>>>>> e
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



