Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RApya-000209-S2
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:23:05 +0200
Received: by ywf7 with SMTP id 7so3814871ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 14:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ylO3GnugotHD8gF00FnM6ECItaPE0aPyY+3V8SRaC3s=;
	b=TaaCNIN/pzeIjWoHfLyv/rhEZwNacW5D7iM5t4MWU7MpsOjnOAv7y8p8JTzRcaQIIp
	5zwhz9CfFAKfN9y9aE1H1TBd880Ua4+Nms2e9jC6KQLZiSpXhcf2+ET3uQVcdWWor1iA
	j5Aetzb9YRr/34tLBvoB0nLycPSk3mhY6xHIE=
Received: by 10.150.254.16 with SMTP id b16mr603283ybi.343.1317676651878;
	Mon, 03 Oct 2011 14:17:31 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id z5sm39568446anz.7.2011.10.03.14.17.29
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 14:17:30 -0700 (PDT)
Message-ID: <4E8A2667.4090700@gmail.com>
Date: Mon, 03 Oct 2011 14:17:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
	<CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
In-Reply-To: <CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Mon, 03 Oct 2011 21:23:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 2:14 PM, McClintock Matthew-B29882 wrote:
> On Mon, Oct 3, 2011 at 2:22 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>   SRC_URI =
>>> "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
>>>
>>> @@ -16,6 +16,7 @@ SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
>>>   SRC_URI[sha256sum] =
>>> "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
>>>
>>>   CFLAGS += "-fno-strict-aliasing"
>>> +EXTRA_OEMAKE_append_powerpc64 = "CXFLAGS=-Wno-error=format"
>>>
>>>   inherit autotools
>>>
>>
>> what kind of errors do you get ? and I wonder why they dont show up on
>> x86_64. It may be something to fix in the madadm code.
>
> I can't find a log of this anywhere, it's probably the default
> compiler warnings for our platform are different?

It would be handy to understand them since I dont see gcc 
differentiating formats between ppc64 and x86_64 which both are 64bit 
hosts. But obviously there is something missing.

>
> You could try enabling those errors and see if your build fails:

If I had a ppc64 build around

>
> EXTRA_OEMAKE_append_x86-64 = "CXFLAGS=-Werror=format"
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



