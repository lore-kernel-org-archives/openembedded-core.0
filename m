Received: from mail-pd0-f171.google.com ([209.85.192.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UXvW2-0004S3-MF
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:33:51 +0200
Received: by mail-pd0-f171.google.com with SMTP id r11so410302pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4XhWdoszTJJWqgTaKcMlGYoYoFaruwzqSIo0Kuyw8us=;
	b=JvckJXTse5zjWL1wNBLq1mT0B3SzRjgp7PQN5TxvLQjOzurNjzGM/C4dMPVCTWjzMh
	PeOYN3hBDGijGhPHoT9DmOOOrx3NYcU970m+9std2GeQiSm6QvoS89L6wQ0aVMP3pvvG
	SJ/L/ALXm8iKbImifSWB3QgrYdIw2r3r9n7zKs9LoyRL+wQ42tBSoDN1f3xfg05XKtyi
	VKAFAw6XvnscfKEzUr/woOIwHZH7oBNngD06uD8iLqcQuwRSzBJijfwRCLHJvSQcCBSK
	1l/3RdpdvQ5CErBD1YVgI18cA5hE8YFSAj9v50VMQp+XYJV+kRlMTfF1QmmvKY/I8bdW
	sJcA==
X-Received: by 10.69.1.39 with SMTP id bd7mr9268846pbd.188.1367507756340;
	Thu, 02 May 2013 08:15:56 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id cq1sm7705934pbc.13.2013.05.02.08.15.54
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:15:55 -0700 (PDT)
Message-ID: <51828212.6000600@gmail.com>
Date: Fri, 03 May 2013 01:11:14 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: ml@communistcode.co.uk
References: <510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
	<511D0669.6020903@communistcode.co.uk>
	<20130221222728.GA1833@sakrah.homelinux.org>
	<512738BF.9000404@communistcode.co.uk>
	<51277D87.3090703@communistcode.co.uk>
	<512785CE.5020508@communistcode.co.uk>
In-Reply-To: <512785CE.5020508@communistcode.co.uk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:33:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2013 1:50 AM, Jack Mitchell wrote:
> On 22/02/13 14:15, Jack Mitchell wrote:
>> On 22/02/13 09:22, Jack Mitchell wrote:
>>> On 21/02/13 22:27, Khem Raj wrote:
>>>> On (14/02/13 15:44), Jack Mitchell wrote:
>>>>> On 14/02/13 15:31, Burton, Ross wrote:
>>>>>> On 14 February 2013 14:31, Jack Mitchell <ml@communistcode.co.uk> 
>>>>>> wrote:
>>>>>>> Did this ever go anywhere? I have just tried again today with 
>>>>>>> exactly the
>>>>>>> same result, all I did was change the DISTRO_FEATURES_INITMAN to 
>>>>>>> systemd.
>>>>>> Odd, as I just built and booted a systemd image (core-image-sato, in
>>>>>> poky master), and it worked fine.
>>>>>>
>>>>>> Ross
>>>>> I have a custom distro definition that cuts a lot of features out.
>>>>> Can you find out which package is supposed to create run and I can
>>>>> check if it is pulled in properly on my setup?
>>>>>
>>>>> I think something must be assumed somewhere and I don't have the
>>>>> features enabled to trigger it.
>>>> its created by base-files package. If you need hint how it works
>>>> with systemd take a look at bbappend that angstrom has for base-files
>>>> in meta-angstrom
>>> Ah, I see. Thanks Khem.
>>>
>>> So, the next question is; how come Angstrom requires these files to 
>>> be appended to base-files in order to get systemd going, when 
>>> oe-core doesn't?
>>>
>>> I notice there is:
>>>
>>> ${localstatedir}/volatile/run \
>>>
>>> In the base-files oe-core package, while in Angstrom we have:
>>>
>>> ${localstatedir}/run \
>>> /run \
>>>
>>> I understand oe-core having it as a volatile; but I don't understand 
>>> why it doesn't create the /run directory. I see some kind of logic 
>>> regarding it here:
>>>
>>> volatiles = "run log lock tmp"
>>>
>>> for d in ${volatiles}; do
>>> ln -sf volatile/$d ${D}${localstatedir}/$d
>>> done
>>>
>>> However, if it doesn't create the directory on my target filesystem 
>>> then something must be wrong...
>>>
>>>
>>
>> Ok, some oddities and questions.
>>
>> I have slightly altered the base-files volatiles create loop from:
>>
>>
>> for d in ${volatiles}; do
>> ln -sf volatile/$d ${D}${localstatedir}/$d
>> done
>>
>> to
>>
>>   for d in ${volatiles}; do
>>     ln -sfv /volatile/$d ${D}/$d
>>   done
>>
>> Which gives the output:
>> DEBUG: Executing shell function do_install
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/run' 
>> -> '/volatile/run'
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/log' 
>> -> '/volatile/log'
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/lock' 
>> -> '/volatile/lock'
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/tmp/tmp' 
>> -> '/volatile/tmp'
>> DEBUG: Shell function do_install finished
>>
>> The oddity is the volatiles variable looks like this:
>>
>> volatiles = "run log lock tmp"
>>
>> So why do we get:
>>
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/tmp/tmp' 
>> -> '/volatile/tmp'
>>
>> with /tmp/tmp?
>>
>> I have also removed the ${localstatedir} otherwise I was getting this:
>>
>> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/var/run' 
>> -> '/volatile/run'
>>
>> With the extra var/ in. Which would make sense for why I wasn't 
>> getting directories made in the root folder. I suppose the issue is, 
>> why was everyone else?
>>
>> Can anyone shed any light on this?
>>
>
> Right,
>
> I think it should be this (minus the debug):
>
>   for d in run log tmp lock; do
>     echo ${D}
>     echo $d
>     ln -sfv ${localstatedir}/volatile/$d ${D}/$d
>   done
>
> Which gives:
>
> DEBUG: Executing shell function do_install
> /mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image 
>
> run
> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/run' 
> -> '/var/volatile/run'
> /mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image 
>
> log
> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/log' 
> -> '/var/volatile/log'
> /mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image 
>
> tmp
> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/tmp/tmp' 
> -> '/var/volatile/tmp'
> /mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image 
>
> lock
> '/mnt/SSD/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/base-files/3.0.14-r73/image/lock' 
> -> '/var/volatile/lock'
> DEBUG: Shell function do_install finished
> ~
>
> The only issue I am having is still the double tmp/tmp thing; anyone 
> know why it is doing it? It seems like a weird substitution or 
> something.....
${D}/tmp is a directory that already exists, so the symbolic link is 
created at ${D}/tmp/tmp instead. Probably need to remove /tmp from dirs1777.

Regards,
Jonathan


