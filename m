Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (unknown [209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CE6D36FB98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:38:34 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so11665697pad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=LTT419eNJ6cXferBJNc3G35ggeZMCyQubUFx53bSepc=;
	b=bOAfp1j+H0ifjmTXZ8o5SWy/ta5+SH740zaiqx2ld/pB4BuPc+oQ2O18QPmJnJKB8K
	VViK45v67yPOMfxEHr3XIqSftSAVWRgPm4Vc6+6lelAjpHNI+8J104/nBFYujHpGV3s3
	pNoiRyVxjZbx/w2ECJeQuriTKSjYd7z538iChj1Lg5EmlmNjVfq6eTcne8wfOdujklM4
	wjuuwq6lNIa2JnktGQTPgNbY9GcXPj5Tfh5B5LfFyNkZgR7BfJ+I/Ggob0P0zLEsHdaX
	znsElP6NsYAoDfh48T6gd8oI/NhixMGJDvOao5yKhP/33h4BoFR/ZFQycv8FwxyG0gxU
	r9lA==
X-Received: by 10.68.110.65 with SMTP id hy1mr2898864pbb.67.1401313115643;
	Wed, 28 May 2014 14:38:35 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	dz4sm49683406pab.47.2014.05.28.14.38.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 May 2014 14:38:34 -0700 (PDT)
Message-ID: <53865758.206@gmail.com>
Date: Wed, 28 May 2014 14:38:32 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
References: <1401312099-4247-1-git-send-email-akuster@mvista.com>
	<538654AE.2020400@mlbassoc.com>
In-Reply-To: <538654AE.2020400@mlbassoc.com>
Subject: Re: [PATCH 0/2 V2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 21:38:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 05/28/2014 02:27 PM, Gary Thomas wrote:
> On 2014-05-28 15:21, Armin Kuster wrote:
>> This updates both tzcode and tzdate to latest
>>
>> V2: License correction
>>      Solar type correction
>>
>> Armin Kuster (2):
>>    Update tzdata to 2014c
>>    Update tzcode to 2014c
>>
>>   .../recipes-extended/tzcode/tzcode-native_2013i.bb |  26 ---
>>   .../recipes-extended/tzcode/tzcode-native_2014c.bb |  25 +++
>>   meta/recipes-extended/tzdata/tzdata_2013i.bb       | 206 
>> ---------------------
>>   meta/recipes-extended/tzdata/tzdata_2014c.bb       | 205 
>> ++++++++++++++++++++
>>   4 files changed, 230 insertions(+), 232 deletions(-)
>>   delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013i.bb
>>   create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
>>   delete mode 100644 meta/recipes-extended/tzdata/tzdata_2013i.bb
>>   create mode 100644 meta/recipes-extended/tzdata/tzdata_2014c.bb
>>
>
> These changes would probably be much easier to read/understand
> if you use the -M option since the actual differences are pretty
> minor.
>

I did.. or I thought I did. hmm...

thanks,

Armin


