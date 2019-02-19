Return-Path: <leon@sidebranch.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB547C97F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 20:45:35 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id t13so12590622vsk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 12:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZKuAAPWWfRgXyqRDfkyQvxaARtlaPI85RoIB3L1WYwQ=;
	b=uTLmTJSjcWasguJJgrGib8Y03vHdkEUtbyb8hqL2GsUn2M2kMZEi8UPxqHCKtuZtfj
	Gte65uuEllemaOIUFxiMS6nrRYPZG2qzbDjGV1G8hsPuL9sepYS99nRT5IGmCJaZyZRW
	sIIKsBL7Y3s3nV+3hn/z5GJt/5q4bRwg4AzDiGkpiTLEpb32ckUqHiwbMMwDXrEQp+TX
	XrW/+Cp/HJYPdpSMFgLIV1vG3zrCsQyc/Rt/gJ/Cjao8F8ToQcQsFmQSbqX+EcWy6dY6
	4tm7G6yLJdS27icxGWlVXhH5V/6L6aUWRLPVnSdKZGpvk5XRKXv8cGEJtR3SQcFSjbNU
	asAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZKuAAPWWfRgXyqRDfkyQvxaARtlaPI85RoIB3L1WYwQ=;
	b=AVyqpi5A87KAPfqsnYEVMKrpTh/LOGm3y1KmpHeV5hi1FhukBkmO92aIRik75edyxd
	GQ/huEMDk7rDWc3JPI6Z6qRcwdUSujUbtd8NlKEg15osdU3ltHu0AeDH+k49zeVrqTbV
	SOXRZuUyX8PaiXOwUQR0SIgkxBs7eFUeiOwYc66M1x9AuzAYRZgEg5p8vPIz1WKm8fcU
	O/uNCtG2coSVQG0pHm+yhNznL3phYyLQ3ZGDyyf1JK2lKuEtR7RuuG30rxK4EHOjnWNu
	hbJuR+aYbrNxAioqtiE+mdwbNmYHnpyIErisqqfmapVXGyfpXs0wt2JfxRXqo93jjbo9
	VC2g==
X-Gm-Message-State: AHQUAubnLKnUKONnhEE5iJPdgV/FQTmx5xgwdh0DtU6OEifnGW60Ipi3
	QEQUNGZV6pYuDYtxv9rbaazz547yhn3iRaq4VL5zbg==
X-Google-Smtp-Source: AHgI3IY5Q5NXvd/uRacKdeSNNp8gL+ccB5vt3eYB0oF0bmclxsyDuO8h4DGYE31VShVG7Nk5RI4PVvJXVSRKhbq4aJw=
X-Received: by 2002:a67:ec8d:: with SMTP id h13mr15555802vsp.92.1550609134320; 
	Tue, 19 Feb 2019 12:45:34 -0800 (PST)
MIME-Version: 1.0
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
In-Reply-To: <CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 19 Feb 2019 21:45:22 +0100
Message-ID: <CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Tue, 19 Feb 2019 20:45:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

On Tue, Feb 19, 2019 at 8:28 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Feb 19, 2019 at 9:13 AM Leon Woestenberg <leon@sidebranch.com> wrote:
>>
>> Hello Mike,
>>
>> sounds familiar.
>>
>> On Tue, 19 Feb 2019 at 17:55, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>>
>>> Took me a while to figure out why my board took 90 seconds to boot suddenly.
>>> The issue turned out to be the ext4 partition created by wic.
>>
>> I suspect it's not WIC's fault.
>>>
>>> ZynqMP> load mmc 0:2 0x100000 /lib/firmware/fpga.bin
>>> 19311092 bytes read in 85529 ms (219.7 KiB/s)
>>>
>>> Now if I boot the board rename and copy that file onto itself, then it's
>>> suddenly normal again when I reboot the board:
>>>
>>> ZynqMP> load mmc 0:2 0x10000
>>> I'm not knowledgeable on ext4, so any ideas what's being passed onto the image
>>> creation tool that causes this?
>>
>> I suspect your version of U-Boot does not handle files spread across multiple filesystems (allocation) extends efficiently.
>>
>> Copying the file makes the copy being layed out in one extend probably.
>
>
> If WIC is generating filesystem images from scratch there's no excuse for files to be unnecessarily fragmented.
>
> Even if some of all of the boot time can be recovered by a patch to u-boot that won't help systems which have already been deployed and don't have a way to update the bootloader.
>
I am not sure if "fragmented" is the right term in terms of filesystem
details. Filesystem allocation extents (not "extends" as I mistyped
earlier) are different from heavy file fragmentation. However, I agree
things can be made more optimal.

So, with adding the above, there are *two* issues at play here:
1) Most/older versions of U-Boot not able to efficiently load files
from ext4 filesystems, that cross multiple extents. I am aware of two
fixes, see below.
2) WIC uses mkext4fs in such a way that files can cross multiple
(allocation) extents. This is sub-optimal and know to cause issues
with many U-Boot versions (deployed on existing systems in the field).
The problems shows "randomly" with large files being deployed to the
ext4 filesystem. We (OE/Yocto) may want to fix this.

>> I am aware of two fixes for U-Boot. I will look them up, and reply again to this thread.

Google for these two commits. I cherry-picked the first one for my
project and can confirm it brings back the desired performance. (Still
assuming this is the identical cause as for TO/Mike.)

commit 855b8e4f9f255415a7753819e392e4b5d984f35c
Author: Matt Madison <matt@madison.systems>
Date:   Sat Aug 19 08:46:46 2017 -0700

    ext4: cache extent blocks during file reads

    A simpler and less-efficient approach to solving
    the problem with extent index blocks than what
    was in fc0fc50f38a4d7d0554558076a79dfe8b0d78cd5,
    but one that does not break write operations.

    Signed-off-by: Matt Madison <matt@madison.systems>

Regards,

Leon.

p.s. excuse the earlier HTML mail with signature

