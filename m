Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 16C9E7615E;
	Thu, 30 Jul 2015 04:07:59 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so3252397igb.0;
	Wed, 29 Jul 2015 21:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lpPG+ha5y8HNkCRa7xFbLMcsMdExiJMwB2cXP4roo6s=;
	b=hAhqensj6K7lksaHar4PKvlm5xDnMxLwjcHE6717cBcPGQe2H5guc5QkZrKxOBiTfe
	CovD36Q5Tei2YOfU0YrY3bXE/wNqknqTUfDqOLfryEx9lcSmEFG9iyBlNw62o55Wk4D4
	6/3WFzgfzBYkqDvV2UxpxiFr9KxcuW3lq+MmRvEf6VTK0XCAc4sUccWQq9n0IagL+95l
	NpcG+AHE1C2+jsEUql4eP6DdEug4JiYk6WZWAkW/Nn0qguWXDLFmGdoxxKOO85N9Sc74
	0Z+F+XUqIpCZD1EnvLfLcGNjj3ScTng1YwaPQF3p8nJasJ9TpcdW68cqhhJAWpsnaEqU
	E+Ww==
X-Received: by 10.50.39.17 with SMTP id l17mr1531581igk.75.1438229279560; Wed,
	29 Jul 2015 21:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 29 Jul 2015 21:07:30 -0700 (PDT)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDB2E4B4@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1B56A49860EB2D45ADE3731B15C959FDB2E4B4@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jul 2015 20:07:30 -0800
Message-ID: <CAMKF1sroAnY+C+TPg9-N24V_CLQzzfFTdz2RE+jF1x=_pwxqOA@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] glibc 2.22
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
X-List-Received-Date: Thu, 30 Jul 2015 04:08:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 12:48 AM, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
> Hi Khem,
>
>
>> glibc 2.22 will release end of this month. For some time I have put
>> together the update here
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/m
>> aster&id=0
>> 2e73ea526d94f21c7ef82eb96b062eff8ebb825
>>
>> It works pretty well for machines I have tested it on ( arm/x86 ) but
>> would be interested if more wider trial could be carried out and
>> issues reported between now and release can be addressed.
>>
>> Please give it a try if you have spare cycles
>
> I tested it on powerpc(e500v2),and did a ltp test. It does work well.
>

thanks for the report


>
>
> Best Regards
> Lei Maohui
>
>
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Tuesday, July 14, 2015 1:37 AM
>> To: Patches and discussions about the oe-core layer; OpenEmbedded
>> Devel List; Yocto discussion list
>> Subject: [OE-core] glibc 2.22
>>
>> Hi All
>>
>> glibc 2.22 will release end of this month. For some time I have put
>> together the update here
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/m
>> aster&id=0
>> 2e73ea526d94f21c7ef82eb96b062eff8ebb825
>>
>> It works pretty well for machines I have tested it on ( arm/x86 ) but
>> would be interested if more wider trial could be carried out and
>> issues reported between now and release can be addressed.
>>
>> Please give it a try if you have spare cycles
>>
>> Thanks
>> -Khem
>>
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

