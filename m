Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNsyf-0008Pm-Kx
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:13:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Nov 2011 13:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72443889"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2011 13:06:49 -0800
Message-ID: <4EB999E9.30306@linux.intel.com>
Date: Tue, 08 Nov 2011 13:06:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
	<CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
	<CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
	<1320785264.3080.1.camel@lenovo.internal.reciva.com>
	<CAEsOVNfyeYRkEhL1LD1GYBrxqdvNEkjbG5fWgwpTRH_UEyxedA@mail.gmail.com>
In-Reply-To: <CAEsOVNfyeYRkEhL1LD1GYBrxqdvNEkjbG5fWgwpTRH_UEyxedA@mail.gmail.com>
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Tue, 08 Nov 2011 21:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 12:50 PM, McClintock Matthew-B29882 wrote:
> On Tue, Nov 8, 2011 at 2:47 PM, Phil Blundell<philb@gnu.org>  wrote:
>> On Tue, 2011-11-08 at 19:36 +0000, McClintock Matthew-B29882 wrote:
>>> On Mon, Nov 7, 2011 at 5:03 PM, Matthew McClintock<msm@freescale.com>  wrote:
>>>> I don't get it. I think the first version was still OK. The first
>>>> version is pasted below.
>>>>
>>>>> +    idx=0
>>>>> +    tmp="${SERIAL_CONSOLES}"<- If it's not defined this will catch it.
>>>>> +    for i in $tmp
>>>>> +    do
>>>>> +     j=`echo ${i} | sed s/\;/\ /g`
>>>>> +        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}">>  ${D}${sysconfdir}/inittab
>>>>> +     idx=`expr $idx + 1`
>>>>> +    done
>>>>
>>>> See my inline comment above, but if SERIAL_CONSOLES is not defined
>>>> tmp="" and the for loop won't execute. Not sure if there is a more
>>>> standard way to do this though.
>>>
>>> ping..
>>
>> Yeah, now I look at this again I think it is probably OK.  Bitbake won't
>> expand ${SERIAL_CONSOLES} if it's unset, but the shell will and I think
>> you probably will get the right results.  Assuming you've actually
>> tested that case and it does work, I think I'm happy with what you have
>> above.
>
> Thanks Phil, I wanted to make sure I was not missing something obvious ;).
>
> Maintainers, please consider v1 of this patch.
>
Just to follow up, this is now in my queue.

Sau!

> Thanks,
> Matthew
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


