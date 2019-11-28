Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 486F07F8F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:01:00 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n24so1655061edo.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kOB70AvAWHF03NZt3KZWNZXKM0cDKaKKXop2PsAfSdk=;
	b=XExKhQBrKWju5u27hxwrYXxtw2m6zznXJycKsKc3lyWvCgtViNW5o36WpWGqkU+oCy
	bJJ8fIME7DpbhqgDrUru5uq8UowBSPXU7dPZZyiKWZzvVJyBzQyG17fJOumKUeoRyHka
	5rxBjSfkOZPBhjIPqSNqXg56C5v6YPKnMkCkt8ms/feT2YbIKfBxLtDnLqjEv7yU9Ajv
	M4n8aIvnRvtN5RlMJRyaJJAwLL5lq/ojD/ipK42j1IRj5CAD8HFn+UMv3b3tP+UIVJ49
	mzXR5JU9/ludec6WAS1g21DrVUtBCjzMSz7ftnSpgU6MRMYxE7CYPM56yTPrkUy/8lJJ
	9GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kOB70AvAWHF03NZt3KZWNZXKM0cDKaKKXop2PsAfSdk=;
	b=NUBgGzXldQdUKvhCtYQcTz6kkl8dul41YRmYo8CqTUyU160qCWtzXlE8IftQo9ssmD
	d1JTjXSHS0G86v1ISx+Hgr/LayMHmHzeKMDaweIOpHnsg6dKzd4RZ1cK1F0TWq8yICJd
	hTwNwhvLbNm71yitdGqySxRzcknfjzXVphcd7Yjf808qCSLPz9sDqlNSGqOixrii1qd+
	pmyhlqwCDZyQH2VB4W2+m/1IR+0YdmngfusRg50Fp+PCZCHi4kJ79F90ZwocxvNtSQuc
	FoKMfuNovtizSZWAMjDZ+0mVdZH7z4JOaid3kdme1i+kINvkvbbHAXP3hw4DxXB9aN6Q
	GNvQ==
X-Gm-Message-State: APjAAAVT2+X6bZYfQG81sw59AoGoRv022LBGdrslZX0CTPAtyOyw9294
	0R+qm51dDxmPQQ7QZxQwZnZuGBIaV0+f85KAyTo=
X-Google-Smtp-Source: APXvYqwrGN990PlbgG8KmGSM5gyKUhnSBzduNJkQQWpvq+zUkQlosF6XzqHtHderZm9k24jPu+uM2d1YKLnwR0SciQc=
X-Received: by 2002:a17:906:4910:: with SMTP id
	b16mr55031342ejq.133.1574953260596; 
	Thu, 28 Nov 2019 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <1574921664-22600-1-git-send-email-peter@berginkonsult.se>
	<CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com>
	<4bc9dd83-e4cb-fe7f-ef68-23246f7ad98d@berginkonsult.se>
In-Reply-To: <4bc9dd83-e4cb-fe7f-ef68-23246f7ad98d@berginkonsult.se>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Nov 2019 10:00:49 -0500
Message-ID: <CADkTA4Nc0GeZkTPaxhS-QNRCvD8T1W0qnTR+PDvEJngbpQCsvw@mail.gmail.com>
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix error with old (<4.2) x86 kernels
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
X-List-Received-Date: Thu, 28 Nov 2019 15:01:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 28, 2019 at 9:54 AM Peter Bergin <peter@berginkonsult.se> wrote:
>
> On 2019-11-28 15:08, Bruce Ashfield wrote:
>
>
>
> On Thu, Nov 28, 2019 at 1:14 AM Peter Bergin <peter@berginkonsult.se> wrote:
>>
>> When using kernel-devsrc for older kernels do_install fails with:
>>
>> | cp: failed to get attributes of 'arch/x86/entry': No such file or directory
>>
>> In the Linux kernel commit 1f57d5d85
>> "x86/asm/entry: Move the arch/x86/syscalls/ definitions to arch/x86/entry/syscalls/"
>> moved some files copied in the kernel-devsrc recipe. Commit 1f57d5d85 was added in
>> v4.2.
>>
>> To be able to use kernel-devsrc for kernels older than v4.2 this commit make use of find
>> for the files that shall be copied.
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>  meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index b68d945..b6f2dbc 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -185,14 +185,14 @@ do_install() {
>>         cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
>>
>>         # required for generate missing syscalls prepare phase
>> -       cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build
>> +       cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
>
>
> Potentially stupid question (since obviously you've tested this on versions less than v4.2) ..
>
> Doesn't that find command return nothing in kernels < 4.1 and hence is a cp -a --parents <nothing> $kerneldir/build ?
>
> I have tested this on v4.1 and v5.2 for qemux86-64 target. Both works well as I can see. I added '-v' flag to the changed cp statements in the kernel-devsrc recipe. The outputs in log.do_install was:
>
> For v4.1:
> 'arch/x86/syscalls/syscall_32.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'
> 'arch/x86/syscalls/syscall_32.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'
> 'arch/x86/syscalls/syscalltbl.sh' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscalltbl.sh'
> 'arch/x86/syscalls/syscallhdr.sh' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscallhdr.sh'
> 'arch/x86/syscalls/syscall_64.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_64.tbl'
>
> For v5.2:
> 'arch/x86/entry/syscalls/syscall_32.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'
> 'arch/x86/entry/syscalls/syscall_32.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'
> 'arch/x86/entry/syscalls/syscalltbl.sh' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscalltbl.sh'
> 'arch/x86/entry/syscalls/syscallhdr.sh' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscallhdr.sh'
> 'arch/x86/entry/syscalls/syscall_64.tbl' -> '/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_64.tbl'
>

Ah yes! I had read that as "the files don't exist at all in 4.1"
versus "they are in a different location in 4.1".

The change looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>

I can't think of any more -by tags to add, so I'll leave it at that ;)

Bruce

> Best regards,
> /Peter
>
> I haven't tested it myself (yet), so I thought I'd ask.
>
> Thanks for fixing up the older kernel support!
>
> Bruce
>
>
>>
>>
>>         if [ "${ARCH}" = "x86" ]; then
>>             # files for 'make prepare' to succeed with kernel-devel
>> -           cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build/
>> -           cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh $kerneldir/build/
>> -           cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh $kerneldir/build/
>> -           cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl $kerneldir/build/
>> +           cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/
>> +           cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/
>> +           cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/
>> +           cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/
>>             cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
>>             cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
>>             cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
>> --
>> 2.7.4
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

