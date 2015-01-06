Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9862265C75;
	Tue,  6 Jan 2015 14:08:47 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id hz20so19423776lab.20;
	Tue, 06 Jan 2015 06:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=na2qxkk9P5VV8SoYFWjDquuPZktpVSw8WkEOK1zzsiI=;
	b=aV8Mcf66FiFZsjRtl7AGRlWZlaZN4xFlcQkRFOTGJnZ1aH4lO8aKbt4ZIuc9QEjt0g
	YIbPvYX9vFVBu4YHG3mKi5tEoAE3jH5a8DwRXRU59nCWwNISVYXov6TiVi9X2lnZd7m/
	Rmoxhy0K1Jcy1/51N6DWFPsjT2CBOUcJttN4YyYmz5R87d8dVBtPnHQCh32ZX+ZcSifc
	On/NkFvcSBbo2YHYFNsGB/de33i6oYhU5XpaFhxTRGvsR6UOp976BFT7MFwLILzSNPHs
	oqjv3c/hob6BXJH6D2Zshoj4S079ZQ/xZxHxaXu/4ePHYcHHFG0NjKRkUJvnQKw6+4xA
	4YDw==
MIME-Version: 1.0
X-Received: by 10.112.98.99 with SMTP id eh3mr98562688lbb.32.1420553327902;
	Tue, 06 Jan 2015 06:08:47 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 6 Jan 2015 06:08:47 -0800 (PST)
In-Reply-To: <CAJTo0Lbp=oNx9nd-LJ-sz1+N1ZSspPoz=7f9EoFdZhCUEVjiQg@mail.gmail.com>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<20150106110406.GD19402@jama>
	<CAJTo0Lbp=oNx9nd-LJ-sz1+N1ZSspPoz=7f9EoFdZhCUEVjiQg@mail.gmail.com>
Date: Tue, 6 Jan 2015 09:08:47 -0500
Message-ID: <CADkTA4Ns74isgMDWaOnm-P1-TNTAaV9tOEXV3pP2+y_9yUVNmg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 14:08:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 6, 2015 at 6:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 January 2015 at 11:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> > | make: *** No rule to make target `oldconfig'.  Stop.
>> > | ERROR: oe_runmake failed
>> > | WARNING: exit code 1 from a shell command.
>> > | ERROR: Function failed: do_configure (log file is located at
>> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
>> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
>> > do_configure: Failed
>> > ERROR: Task 491
>> > (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/meta-lg/recipes-kernel/linux/linux-lg-mako_git.bb,
>> > do_configure) failed with exit code '1'
>>
>> This was caused by linux.inc, fixed in:
>>
>> http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099687.html
>
>
> I'm replicating this error with an oe-core kernel, so there's more causes
> here.

Can you log the replicating steps and point me at the bug ? I can take any fixes
from there.

Bruce

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

