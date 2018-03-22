Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id E81FD788D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 18:13:07 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id c11-v6so5823602plo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3GvNCSf7L5eRRIZnQGcAisI7kNphRDr3bJDgi//zzUg=;
	b=HcHvHd4OIWQnlFkNkQvsjnC69CBG4m4eE83MspiZ3kiEzfF0XGvJz/n04sKKrME0+f
	HawDGgsAZbKB7Sy7E7BL5umXyRWRECQNuS1aHp53jiQweILWKm9GLYjzBqFISzOTBGxm
	058ODD/S3SoAZ2bkcCX7sygaMR0kYRIzj7QkG4CGs9uJTkIJFeAKqyvsODKmoAyqJxDx
	XA75aWtPe1icEakR4SXgFGEl/j/kUnX648L49BmEwYcd+dvddQirNIBogoo9s179tDfY
	i/C2dmCdlwCyk4aJV7DeTjQWJcVVy0AMAiGnvmWJJTbZjS6cxYARJQYKRLs+hnkZC8Vs
	/HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3GvNCSf7L5eRRIZnQGcAisI7kNphRDr3bJDgi//zzUg=;
	b=nxjyqS9ivuYkIv3uzBuyd40Or47nz3INpBIXdL2kHnO4yN6HCutvVqqt8/+mcht4z+
	fKt8PYEdrMw/o7RTRU5bLDsdCfAfTGzl3ctuHf/VW/bAuL4q6VEgT8nT4LZAAbQ1Ngkv
	pfO+OmAdSFyWyfe3UZpRwWxfw4YA1CVXWFF8bF4SkqVTuufkeefL4CdLeF/mNlN2Sdrk
	XyKok9011qkIaAlUV36ubFyBVIEu0beZKPaKU9FThBg0Sg6ZboV88fSH8d78gFCbbuJw
	iXR6ypBumgN8HEvlI9RQ3zDNe0oYpTDUHdqcNBjPiTg3ZW8YZZo4t/xjYkNJtYNyZVPV
	TLxA==
X-Gm-Message-State: AElRT7FjCgXTqn7w7vlqKrjCn1U5QLum8LOeldWvMwaU5Lo/uVRwl2em
	aQ/fsuDTkbgZpRXYwFVe/fX8VePjVovUntHQM0c=
X-Google-Smtp-Source: AG47ELsOw7ZnjdtvOAjJ9mvoeczTLgbg1H36RfskWqF65ymdhrBT3tZvNZaM6UT/KJDa19dZCnygXVkdl+vsFg9qxeU=
X-Received: by 2002:a17:902:43e4:: with SMTP id
	j91-v6mr8190146pld.118.1521742388500; 
	Thu, 22 Mar 2018 11:13:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.140.147 with HTTP; Thu, 22 Mar 2018 11:12:37 -0700 (PDT)
In-Reply-To: <CAPGMVzEJq6rdUemqXvDewvBDBSn1Gg7=j-=EdveosFiWgHJPrQ@mail.gmail.com>
References: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
	<CAMKF1sr+NAJEDVProHEExtHZk96Zygbiwq7+5V0wTO6KRB8pMw@mail.gmail.com>
	<CAPGMVzEJq6rdUemqXvDewvBDBSn1Gg7=j-=EdveosFiWgHJPrQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 11:12:37 -0700
Message-ID: <CAMKF1sr79gKW9ZEYMqjcWC3dTMRe2a-xivzyvG1_wC_uHv5Z9A@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package inclusion and networking
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
X-List-Received-Date: Thu, 22 Mar 2018 18:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

use core-image-sato and it has UI to connect to wifi

On Thu, Mar 22, 2018 at 10:53 AM, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Thanks, I'll check it out.
>
> Can you help me setup WiFi connection to poky?
> Im highly struggling with this, I have placed connman in local.conf file ,
> what next is the procedure such that my poky on qemu can detect the WiFi?
> Thanks
>
> On Thu, 22 Mar 2018, 14:43 Khem Raj, <raj.khem@gmail.com> wrote:
>>
>> On Wed, Mar 21, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com>
>> wrote:
>> > Can i install tensorflow and h5py (since they are not there as recipes)
>> > using Internet on yocto? (just the way they are installed on ubuntu or
>> > other
>> > host OS)
>> >
>>
>> may be you can use on device SDK and build it natively on
>> your target
>>
>> EXTRA_IMAGE_FEATURES_append = " tools-sdk"
>> IMAGE_INSTALL_append = " python coreutils findutils git zlib tar"
>>
>> then checkout the sources on target and build it. You might need more
>> packages then keep adding them to IMAGE_INSTALL and rebuilding image

