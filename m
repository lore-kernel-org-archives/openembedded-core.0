Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2AE36059A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 18:16:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jun 2014 11:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,576,1400050800"; d="scan'208";a="563139588"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2014 11:16:10 -0700
Message-ID: <53B1A969.4090708@linux.intel.com>
Date: Mon, 30 Jun 2014 11:16:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Life Life <sadlife1990@gmail.com>, Diego Sueiro <diego.sueiro@gmail.com>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>	<53B0DD86.4030402@windriver.com>	<20140630081507.GA5083@ad.chargestorm.se>	<CAMCfZKE6bTaWSCGg=2Gdzau-d=tSM_Vcae60rTWTYw88mMoyJQ@mail.gmail.com>
	<CAAHuHfw8_G0=tndHAvT+GGq2PRY7gAETDEc2qTWaqtdZvimJng@mail.gmail.com>
In-Reply-To: <CAAHuHfw8_G0=tndHAvT+GGq2PRY7gAETDEc2qTWaqtdZvimJng@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cape Manager
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
X-List-Received-Date: Mon, 30 Jun 2014 18:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2014 10:27 AM, Life Life wrote:
> Hello,
>
> How to use this layer, please explain
>

Have you referred to the Yocto Project Documentation?

https://www.yoctoproject.org/documentation/current

There is lots of information about adding layers and additional packages 
from those layers.

Look for information about bblayers file and make sure you also ensure 
you include the package in your image using

IMAGE_INSTALL_append = " beaglebone-capes"

The leading space in the line above is important

Sau!



> Thanks
>
>
> 2014-06-30 16:40 GMT+03:00 Diego Sueiro <diego.sueiro@gmail.com>:
>
>>
>> On Mon, Jun 30, 2014 at 5:15 AM, Anders Darander <anders@chargestorm.se>
>> wrote:
>>
>>> * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
>>>
>>>
>>>> On 06/30/2014 12:24 AM, Life Life wrote:
>>>>> Hello,
>>>
>>>>> I'm trying build yocto based linux, My hardware is beaglebone black I
>>>>> successfull build system image. But I can't see capemanager. Beacuse
>>> my lcd is
>>>>> not work.
>>>
>>>> Hello,
>>>
>>>> The cape manager is in meta-ti layer:
>>>
>>>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
>>>
>>>> Seems that we'd better add it to meta-yoco-bsp ?
>>>
>>> Unless something has changed since I last looked at this, I don't think
>>> so.
>>>
>>> If I remember correctly, capemgr basically consists of a number of
>>> patches not in the mainline kernel (and also not in TI's staging
>>> kernel). I haven't checked it, by I doubt that we have them in the
>>> linux-yocto kernel. (Especially as the last time I checked it, you had
>>> to revert to a 3.8 (if I rember correctly, it might have been an even
>>> earlier kernel) kernel to get full capemgr support.
>>>
>>> If this has changed, then it'd be interesting to know!
>>>
>>> Cheers,
>>> Anders
>>>
>>
>> To get cape manager support you have to use meta-beagleboard layer (
>> linux-mainline_3.8.bb
>> <https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline_3.8.bb>
>> )
>>
>>
>>
>> Regards,
>>
>> --
>> *dS
>> Diego Sueiro
>>
>> Administrador do Embarcados
>> www.embarcados.com.br
>> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>>
>> /*long live rock 'n roll*/
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>
>

