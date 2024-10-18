Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F1BD3000C
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:48:39 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web11.22611.1729259312940378062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=QQm5IvRR;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=QQm5IvRR;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 1nLCtpHVxeqGt1nLCtUa0m; Fri, 18 Oct 2024 15:48:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729259311; bh=cbWGl3wZOyBquu/kRSQiuhgdA3VvOw6bBrzxtxkvDiQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	b=QQm5IvRRfWXXNymUdswCeLPbtqgVNvSCJfvHPDzY1xU8g4rjL0Av2ile0JsjOOly+
	 fUvFkt5V1pUOQgZ/dipsdxxqcRCAfgdRbH3AhUw8U2Q68fQNnGudrPeULzR8OZVNM6
	 Z+1/Fzevi0dEjbXHI86Qkm/jpQ/4UzCaQVvsWY+JxnWmlHU20Pp5hU9gCgP4DpD6vz
	 SK4VTJ1pPm/tuCUmlvNU2PbVSXun+UAx+nR6DHqgQZSvJHXJimkXzMT+JzSN8g3ba9
	 Udcy0B+ufbxCUBh+nFGzTk/wV7WvzHk3UAYNRK7oJWVrOlwoGmqWwCcodaIGODcnRT
	 9YuFeKrM6DQ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729259311; bh=cbWGl3wZOyBquu/kRSQiuhgdA3VvOw6bBrzxtxkvDiQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	b=QQm5IvRRfWXXNymUdswCeLPbtqgVNvSCJfvHPDzY1xU8g4rjL0Av2ile0JsjOOly+
	 fUvFkt5V1pUOQgZ/dipsdxxqcRCAfgdRbH3AhUw8U2Q68fQNnGudrPeULzR8OZVNM6
	 Z+1/Fzevi0dEjbXHI86Qkm/jpQ/4UzCaQVvsWY+JxnWmlHU20Pp5hU9gCgP4DpD6vz
	 SK4VTJ1pPm/tuCUmlvNU2PbVSXun+UAx+nR6DHqgQZSvJHXJimkXzMT+JzSN8g3ba9
	 Udcy0B+ufbxCUBh+nFGzTk/wV7WvzHk3UAYNRK7oJWVrOlwoGmqWwCcodaIGODcnRT
	 9YuFeKrM6DQ2Q==
Message-ID: <f9d5f576-20e9-4fbe-b232-f7d1d3a3325f@skyrain.eu>
Date: Fri, 18 Oct 2024 15:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
From: Andrej Valek <andrej.v@skyrain.eu>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
 <a9c4777b9bf0987e3a01138e664fdfbe45907035.camel@linuxfoundation.org>
 <a37cc22a-e880-45e7-aefc-c667d233f36e@skyrain.eu>
Content-Language: en-US
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <a37cc22a-e880-45e7-aefc-c667d233f36e@skyrain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIE/hBFkR91RHku97XmPtaHcNffoqDmitwNpN2Z3iBM3cYwBtw3zYvc/nrwodhZP10y9s8AOqp3NSr8+FEGeo1voyaB7atxoetjbcuA/dmHmekrsXS63
 Zh2Z85DMMt3p3EWTOakDxD2K3xNjFEnkUgaGeDD7BaiIO1rJT4/E8UQftfSwwsvNwphCM+hmhDvZWpuBgjUKaO3MRkjDtDa1m5XE7F9j+ylVkY5PgR2TwPL1
 qV52L4rckpLPVDHKX2qXPI+4OAnA2TFIOU1FbUxtgJA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 13:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206064

Hello Richard,

Could you please check if 
https://lists.openembedded.org/g/openembedded-core/message/205956 fixed 
all issues? In case of not, let me know and will try to fix them.

Regards,
Andrej

On 15.10.2024 14:20, Andrej Valek wrote:
> Hi all,
>
> Busysbox upgrade status: Ok, there were multiple problems occurred.
>
> One problem is the wrong "sha accel" configuration, which I fixed 
> already. The most critical part is not working syslog. It has been 
> broken by 
> https://git.busybox.net/busybox/commit/sysklogd?id=02378ce20c6d2df062357b6d60fc440609d203be 
> so I have to dig into the problem and try to fix it.
>
> Regards,
> Andrej
>
> On 11.10.2024 14:33, Richard Purdie wrote:
>> On Fri, 2024-10-11 at 11:48 +0200, Andrej Valek via 
>> lists.openembedded.org wrote:
>>> - update to next stable version 1.37.0
>>>   - refresh defconfig
>>>     - disable new applets (ip_link_can)
>>>     - enable new applets (time64, find_exec_ok, getfattr, udhcpd_bootp)
>>>   - remove and refresh already merged patches
>>>
>>> Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
>>> ---
>>>   ...ab_1.36.1.bb => busybox-inittab_1.37.0.bb} |   0
>>>   ...01-awk-fix-precedence-of-relative-to.patch | 197 
>>> ------------------
>>>   ...-fix-segfault-when-compiled-by-clang.patch |  41 ----
>>>   ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  37 ----
>>>   ...x-ternary-operator-and-precedence-of.patch |  96 ---------
>>>   .../busybox/busybox/CVE-2021-42380.patch      | 151 --------------
>>>   .../busybox/busybox/CVE-2023-42363.patch      |  67 ------
>>>   meta/recipes-core/busybox/busybox/defconfig   |   8 +-
>>>   .../{busybox_1.36.1.bb => busybox_1.37.0.bb}  |   8 +-
>>>   9 files changed, 7 insertions(+), 598 deletions(-)
>>>   rename meta/recipes-core/busybox/{busybox-inittab_1.36.1.bb => 
>>> busybox-inittab_1.37.0.bb} (100%)
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-compiled-by-clang.patch
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
>>>   delete mode 100644 
>>> meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
>>>   rename meta/recipes-core/busybox/{busybox_1.36.1.bb => 
>>> busybox_1.37.0.bb} (84%)
>> This would seem to be causing:
>>
>> https://valkyrie.yoctoproject.org/#/builders/65/builds/225/steps/11/logs/stdio 
>>
>>
>> and many other failures in that build:
>>
>> https://valkyrie.yoctoproject.org/#/builders/29/builds/251
>>
>> Cheers,
>>
>> Richard
>


