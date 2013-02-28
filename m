Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAxik-0003F1-3u
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:16:05 +0100
Received: by mail-ie0-f171.google.com with SMTP id 10so1715224ied.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 22:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=/ww/VDGgtZcFU0NRy4P88x/O7mN4Mcn/tK1i+P8sSGQ=;
	b=UwNdrK45NXMWzuJrxDPwFunfYIGT+Hsn5PCnLZ1I4gvRstP4UUpp60FIf3a/gu1vzH
	jkkS7/KNbNC8QDCLEjs1Kqk9RJCErGRfiIsTOBzwfPOTCf6s7BaryEkFGjz3CORSNF8V
	7xcoatxTnJvpxQBspsug9IFCiPNxRIXvv5z9cMxf92XosRmvPMfpF09PVBO4CMTwK7RB
	n62+j7WIFniNgBy+i4YTHaB+2Ed+eV2tz7lQE6i09L69fQsesLbHR9wZ5N4v/PKQm92q
	W7oh1qw6sgz5OevG5f01o2BmfmuMmJAPvigmeB2RfmbsgyS4KNzCIwxkM9KyJEmcYfL/
	ojrA==
X-Received: by 10.50.155.134 with SMTP id vw6mr9277135igb.34.1362034779984;
	Wed, 27 Feb 2013 22:59:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Wed, 27 Feb 2013 22:59:09 -0800 (PST)
In-Reply-To: <512E1CBE.5010605@communistcode.co.uk>
References: <512E0E4E.8060205@communistcode.co.uk>
	<512E0FA9.3030007@communistcode.co.uk>
	<512E10A8.2080407@communistcode.co.uk>
	<512E1184.1040202@communistcode.co.uk>
	<512E13DD.3070106@communistcode.co.uk>
	<CAMKF1sqzyqx1FpCHROTJkgrAjQ+xze8bEeT4-vOdCDDN94TzVQ@mail.gmail.com>
	<512E1CBE.5010605@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2013 22:59:09 -0800
Message-ID: <CAMKF1soc9XovmRQHvP3En0zOdELTMPakMK6kLo7ov9L4gUOhhw@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC + Texinfo 5
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
X-List-Received-Date: Thu, 28 Feb 2013 07:16:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 27, 2013 at 6:48 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 27/02/13 14:42, Khem Raj wrote:
>>
>> On Wed, Feb 27, 2013 at 6:10 AM, Jack Mitchell <ml@communistcode.co.uk>
>> wrote:
>>>
>>> On 27/02/13 14:00, Jack Mitchell wrote:
>>>>
>>>> On 27/02/13 13:56, Jack Mitchell wrote:
>>>>>
>>>>> On 27/02/13 13:52, Jack Mitchell wrote:
>>>>>>
>>>>>> On 27/02/13 13:46, Jack Mitchell wrote:
>>>>>>>
>>>>>>> As with the recent binutils texinfo5 compatibility I believe GCC now
>>>>>>> also has the same failings, please see attached log.
>>>>>>>
>>>>>>> I've had a quick look for patches but I am not at all familiar with
>>>>>>> the
>>>>>>> GCC development process and I came up empty handed.
>>>>>>>
>>>>>>> Cheers,
>>>>>>>
>>>>>> Ok, one patch found, there seems to be some @anchor problems too; I'll
>>>>>> see if I can dig anything up.
>>>>>>
>>>>>> http://lists.gnu.org/archive/html/bug-coreutils/2012-07/msg00045.html
>>>>>>
>>>>> Appologies, that isn't even for GCC :(
>>>>>
>>>> Ok, this is the patch; I'll look into trying to use it in the GCC
>>>> recipes
>>>> but they're pretty complicated...
>>>>
>>>> http://patchwork.ozlabs.org/patch/222861/
>>>
>>>
>>> Ok, this doesn't apply cleanly and I can't unwind the patch trail to get
>>> to
>>> this state; if someone knows of a way to do that I would be grateful!
>>>
>>>
>> open a bug for it too
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3947

Please test

http://patchwork.openembedded.org/patch/45255/

and report back


