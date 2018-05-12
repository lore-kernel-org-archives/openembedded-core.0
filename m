Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CBCE87890E;
	Sat, 12 May 2018 06:10:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p12-v6so3655751pff.13;
	Fri, 11 May 2018 23:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wkOvjJsXvUru0y3NURklI+CUij60gAYevyKik3A1nZw=;
	b=FKVKEiYyu/1ug9a3UKdySJPgJ3iRrSTy+N8b+qQuJ8Z+VRBig1bt4Nhmk1Mij0WZkL
	IO3Lo6mgq5F7hYw4zzM+3thUtTf6ZATXo7M9Jbgs8E+NnlBLjammHQOSmReXEhAAK5lb
	7Ke8zQWctigYTua6M7TkV4stT85GnDj8To9r/WJCI5nJrkQYnOkdIUfqoZTSp+T7RwX4
	Gt9TtnXfzdAHk6WOu7zCm+CefkN64rQUj2CJh4opQPkPP8p+cdc+bWb2/X7+HQQNGew5
	J1GPrNDYbjkFLpgt+DbWulDuA0rwXBUaSq0rMUl7ZmZTSXHE1clAVFH7UNVDEwW6bUOV
	2B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wkOvjJsXvUru0y3NURklI+CUij60gAYevyKik3A1nZw=;
	b=n1MZ6XcX4RhHPs1QmaiF6g9e8yojcVr5clj0MmMJqNsHbS3gc+v/P2DF0a4fwXZB7R
	DnWPhpqJBpaHlCzBwueMNvKGvMSuZgOWfDcRVWe09BFjJkLSFj0XPBc7pXETeDKxle3R
	zrWDqHW3cL6WZw84hBudaHJqJcgKBdw1rKb1c4jMl2sf35sphsMPZFMJbrofRbzbIZf+
	MSUJ/DDvoNjZkihBqoFGimW11L7Smo+O8i2ypfvzfHiQp7JR6W+alcB2/lI8f9Kgw7vC
	uSGRd0APqjdbFexLigS6tXVGT6zmDyZ1jwPVh4r6LvUpdX/2md8SL355rPsXqWC7cJOi
	FKyQ==
X-Gm-Message-State: ALKqPwezpPQEz+dNbzUgVF1ZTyP1gx5SOZu2S7k6j0zu/PXCiDttuD5D
	zPVs3fIjW9JarlDJ6BIAo6DsMxHD6zqfyjVQUKA=
X-Google-Smtp-Source: AB8JxZosAKcmjYqw8Dlz2KumPk1vSp895bvrHqzORvuIo+f4tyBRF8gbC3bJVfjeqkAGGxor0J7NnZlboq+NDlAU7B4=
X-Received: by 2002:a62:828c:: with SMTP id
	w134-v6mr1861816pfd.138.1526105443079; 
	Fri, 11 May 2018 23:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Fri, 11 May 2018 23:10:12
	-0700 (PDT)
In-Reply-To: <CAJTo0LYmyzY67JC=72OMRBRH=8juBSnAVaYUKB6ENZ9koqPqTA@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CAJTo0LYmyzY67JC=72OMRBRH=8juBSnAVaYUKB6ENZ9koqPqTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2018 23:10:12 -0700
Message-ID: <CAMKF1spiysRSaNDtaou+Bq7Ss3xLefPf1HnZsdXKUKUbBoWtUQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Sat, 12 May 2018 06:10:43 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross

Thanks for testing

I looked at failures and one of them is

RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase
1541: FAILED

and this is the compile error.

pager.c: In function 'pager_preexec':
pager.c:36:12: error: passing argument 2 to restrict-qualified
parameter aliases with argument 4 [-Werror=restrict]
  select(1, &in, NULL, &in, NULL);
            ^~~        ~~~
cc1: all warnings being treated as errors
mv: cannot stat '/usr/src/kernel/tools/objtool/.pager.o.tmp': No such
file or directory


Firstly I must say that I am impressed with autotest, We are building
on-device toolchain and then downloading a kernel and building it to
test i.. bravo

Problem here is that poky pins linux-yocto to 4.14, with gcc8 we need
to use 4.15.x
eventually 4.14 will get fixed but until then use 4.15,
the test subject component that is being compiled
is not ported to gcc-8, not sure how we can improve it. Is it
compiling linux-yocto kmods ? or external kmod ? We need to patch the
test before building,

I think the mesa error is new with mesa-18 I havent seen this on my
end. Its showing up when we enable llvmpipe which is not general
default so it might not happen in general.

selftest is failing like this

| Copying files into the device: __populate_fs: Could not allocate
block in ext2 filesystem while writing file "ldconfig"
| mkfs.ext4: Could not allocate block in ext2 filesystem while
populating file system
| WARNING: /tmp/eSDKQAfqaczn6s/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_ext4.15615:1
exit 1 from 'mkfs.$fstype -F $extra_imagecmd
/tmp/eSDKQAfqaczn6s/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-qemux86-64-20180511212710.rootfs.$fstype
-d /tmp/eSDKQAfqaczn6s/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs'

not sure if I understand it fully but it sems system ran out of disk space.


On Fri, May 11, 2018 at 3:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
> I threw the branch at the Yocto Project autobuilder today, produced a
> number of failures:
>
> http://errors.yoctoproject.org/Errors/Latest//?filter=b23dba19607412c8cc7d267d95354d65f5631088&type=commit
>
> Ross
>
> On 5 May 2018 at 01:26, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All
>>
>> As you might have noticed that gcc 8.1 was released this week, I am
>> calling out for some testing help on testing branch so we can weed out
>> issues you might see in your setups. so if you have your
>> builders idling over weekend, then you know what they can do this weekend :)
>>
>> Highlighted changes are
>>
>> https://gcc.gnu.org/gcc-8/changes.html
>>
>> and porting doc is
>>
>> https://gcc.gnu.org/gcc-8/porting_to.html
>>
>> The branch is here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>>
>> Its uptodate on top of current master oe-core
>>
>> May fourth be with you !!
>>
>> Cheers!
>>
>> -Khem
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

