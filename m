Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9CC763BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 18:40:11 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so22551122pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Iw5uKlhdu/tzMpnEm4uU3VtG79XqGdPWJek8X3G0d4E=;
	b=Y090wzr95jR0PSPJzgv1drj5X53hO6GxPqS1cQZJazpFrqDN8gO2T202M1zJkYd9wZ
	02fzgR7Yz5O/Y3vgc/JkB7lbVn+cDQFLrSJV7DMHqjYHAH/Tqhpxl8gEug8ik1Wk6Tbg
	seGMo14X3/T+wfcdJ/d6PI5f4EWvrDv3tRCIT/d+WQMBdTPhx8tnyMz8s08zoMDlRM32
	nvREy97Rql6kKnV5fohYHUrF2L6RLCbGnHcWB2E53DQ3sBOYhxGLJVPW5n2n/y4VGbqi
	jme9vfy3SUNlfUpayhyZCWZeDPa3EtjG+iTZvp55fRcTEYgRqWqcWDCWHZxWtQTG+Doy
	aXUw==
X-Received: by 10.70.54.165 with SMTP id k5mr2392571pdp.138.1439491211373;
	Thu, 13 Aug 2015 11:40:11 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:e515:2fc5:d7bb:e982?
	([2601:202:4000:1239:e515:2fc5:d7bb:e982])
	by smtp.googlemail.com with ESMTPSA id
	pe3sm3472067pdb.55.2015.08.13.11.40.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 11:40:10 -0700 (PDT)
Message-ID: <55CCE489.504@gmail.com>
Date: Thu, 13 Aug 2015 11:40:09 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<CAHiDW_Fzm5wcJHEq54sSLOi564XUgsOrXY0sOxi_Ta5xe8kEpQ@mail.gmail.com>
In-Reply-To: <CAHiDW_Fzm5wcJHEq54sSLOi564XUgsOrXY0sOxi_Ta5xe8kEpQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Thu, 13 Aug 2015 18:40:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/12/2015 07:14 AM, Jussi Kukkonen wrote:
> Hi,
>
> I realise I'm a bit late (with the commit in master already) but I'm
> looking at upgrading this recipe and had some questions on this patch
> and the recipe in general.
>
> On 9 August 2015 at 08:28, Armin Kuster <akuster808@gmail.com> wrote:
>> adding the license definitions on the few packages that
>> deviate from the overall package license.
>>
>> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
>> and spot checking files.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> index f53afcc..f9d331f 100644
>> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> @@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
>>   HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>>   SECTION = "libs"
>>   LICENSE = "LGPLv2.1 & GPLv2"
>
> I think this is wrong, whichever version you look at -- our current
> version is just "LGPLv2.1+", the current upstream release is "LGPLv3+
> | GPLv2+"
>
> I'm going to send a patch upgrading the recipe to the current upstream
> release (and setting license to "LGPLv3+ | GPLv2+"): it might seem
> like this makes gnutls effectively LGPLv3 but that actually happened
> last year with the gmp upgrade. Comments on this welcome.

I believe that conversation should be in the mailing list archive.

For me LGPLv2+ makes is all version above GPL2, but since I am not a 
lawyer it makes not sense on how to play that game. So I decided to drop 
pressuring the update.

- Armin


>
>> +LICENSE_${PN}-cast = "CC0"
>> +LICENSE_${PN}-gosthash = "MIT"
>> +
>> +# both public and GPL license listed
>> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
>> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
>
>  From the reference I had the impression this "LICENSE_something"
> construct would imply there is a package "something". But the nettle
> recipe does not produce "nettle-cast" or any of these. What is the
> purpose here?
>
> Thanks,
>   Jussi
>
>> +
>> +
>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>>                       file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>>                       file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

