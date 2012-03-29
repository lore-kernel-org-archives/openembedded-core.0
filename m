Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDAeI-0002d1-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 10:24:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2T8EwEb026618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 01:14:58 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 01:14:59 -0700
Message-ID: <4F741A00.10909@windriver.com>
Date: Thu, 29 Mar 2012 16:14:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332964015-1069-1-git-send-email-obi@opendreambox.org>
	<4F740656.4010903@windriver.com>
	<CAGiJk9c9CSF5cw6m5SfqyOmR2+PF9GiveZfhWm6pkGZ3pkXoZg@mail.gmail.com>
In-Reply-To: <CAGiJk9c9CSF5cw6m5SfqyOmR2+PF9GiveZfhWm6pkGZ3pkXoZg@mail.gmail.com>
Subject: Re: [PATCH] qt4: move from 4.8.0 to 4.8.1
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
X-List-Received-Date: Thu, 29 Mar 2012 08:24:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/29/2012 03:00 PM, Samuel Stirtzel wrote:
> 2012/3/29 Robert Yang<liezhi.yang@windriver.com>:
>>
>> Hi Andreas,
>>
>> I have one question about the qt-x11-free, is it possible to enable
>> the "-sm -accessibility" in oe-core, please? There is a meta-kde
>> layer which requires the "-sm -accessibility", but they are disabled
>> in oe-core currently:
>>
>> QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
>>
>> So there is a "qt4-x11-free_4.8.0.bbappend" in meta-kde, once the
>> the oe-core upgrade to 4.8.1, then the meta-kde has to uprade again.
>>
>> I checked the log of the qt4, can't find the relative log for
>> "-no-accessibility -no-sm".
>>
>> If it is possible to enable them in oe-core, I'd like to send a patch for
>> them.
>>
>> // Robert
>>
>>
>> On 03/29/2012 03:46 AM, Andreas Oberritter wrote:
>>>
>
> Hi Robert,
> this question was already discussed before (see [1]), but then I came
> up with the .bbappend (as I had to change other things too).
> If you still wand to send a patch to the qt4.inc, it should be no
> problem as the previous thread had no negative feedback.
>

Cool, I will send a separate patch after enough testing.
Enable both "-sm" and "-accessibility".

// Robert

>
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017792.html
>
>


