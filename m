Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECE7C74501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 18:26:33 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p142-v6so9096348lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KIIdzEtQD9ggjjQugtwh5FXqjUuEVb052D2ecKpqgFI=;
	b=W9J7QiUr2YEJkDzDibMicAnnlTYcYQSdJ49Peu82iV1nyIBkcvtDaZuHy4SYIaNDUl
	kCQhHs4UTViGSkRtr+LxRctp1xMnbrN2QntC+jLJGiA8rrWUYzU2hpoqMYllDtoQT654
	x7zwQk3ztwVL8GehBXeiD/TI5jBV019DwXZpY8F3xgiRejuPn2hrsaTSydBZPQvfmypW
	m3x0lcKKqMnmf3WJahHn5bmPsfLAS2oY5ulJaWW4TakXLZIBF4+jKniAag5Y86FdNj3j
	D5dwp5qtjDDdlJnZSWcxuY9KFG+3ctSdtfZUZ9bG4avjM9+5smA2LhtJ3ZQ46mBo6kmP
	voAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KIIdzEtQD9ggjjQugtwh5FXqjUuEVb052D2ecKpqgFI=;
	b=XysBTvNpIFePQ5eEH7sRnbonPK8n/Uq9eqEQdXDFnzjRljY7TnM2A7ulJoZhAdQ77w
	6OedIx1xkagPpyjnepl9lVXo2G8hzGPNGHSqkqvBkdjojqh8IMoHHFvcdd7iQhDIfeaQ
	/69eBVcu6JoUEexpQkl+7OYiYVe785FtTSX0Ve/4L7UNVXP5zoJXkFJmRelnBniBgiYV
	l5UpIgFBYZh05EPc8qzsUTqYxIdkOlVkG+OgBQi3W80gtzPppXyoZO0DkZm8Q5eZs4/x
	yb6VKXFhYdcHRu3bnWjylRG6wJDhPQO0/j8QfunYUkdbnYt3sWms0MwUTccA9R1g56En
	bWhw==
X-Gm-Message-State: ALQs6tDiwulNnCiGV7gaXnzaFOc1Yz3vNP8uL5n34OIGyPiSnMQ0NwaN
	VLcH4Gsjcjbs+iUVZUeMzvMPTT0b4N479FQ28ZE=
X-Google-Smtp-Source: AIpwx4+KyJ5O/5R2axXrXxkqE1BzTLzRibok3GbwYOfP94EWpFe9jwni1S7lvdFUxGzAePHJQJBFqXhVp9oS5kWt9V4=
X-Received: by 2002:a19:3bc6:: with SMTP id
	d67-v6mr6399314lfl.100.1523557594069; 
	Thu, 12 Apr 2018 11:26:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.158.143 with HTTP; Thu, 12 Apr 2018 11:26:03 -0700 (PDT)
In-Reply-To: <cb803b32-b0b5-559f-ab66-7e556f1a5e0e@gmail.com>
References: <1523380197-2763-1-git-send-email-alistair.francis@wdc.com>
	<cb803b32-b0b5-559f-ab66-7e556f1a5e0e@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Apr 2018 11:26:03 -0700
Message-ID: <CAKmqyKNAxpF1okjTNRoOS2adu+3Xzfq+N7PuektGarCozGt_6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-oe/numactl: Enable NUMA in the kernel config
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
X-List-Received-Date: Thu, 12 Apr 2018 18:26:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 8:49 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 4/10/18 10:09 AM, Alistair Francis wrote:
>> If a user has specified numa in their DISTRO_FEATURES then they should
>> have NUMA support enabled in the kernel. Without kernel support the
>> numactl program is not very useful.
>>
>
> This should be done in OE-Core as part of main recipe.

Do you mean in core linux-yocto
(meta/recipes-kernel/linux/linux-yocto.inc)? That seemed a little odd
to me as the numactl package comes from the meta-oe layer. I was
thinking it made sense to keep them together.

Alistair

>
> Note that this patch is sent to oe-core ml but is actually against
> meta-oe layer which follows oe-devel mailing list.
>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta-oe/recipes-kernel/linux/linux-yocto.inc           | 2 ++
>>  meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend | 1 +
>>  meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend | 1 +
>>  meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend | 1 +
>>  meta-oe/recipes-support/numactl/numactl/numa.cfg       | 2 ++
>>  meta-oe/recipes-support/numactl/numactl_git.bb         | 1 +
>>  6 files changed, 8 insertions(+)
>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto.inc
>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>>  create mode 100644 meta-oe/recipes-support/numactl/numactl/numa.cfg
>>
>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto.inc b/meta-oe/recipes-kernel/linux/linux-yocto.inc
>> new file mode 100644
>> index 0000000..9533eb6
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto.inc
>> @@ -0,0 +1,2 @@
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>> +
>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>> new file mode 100644
>> index 0000000..161f9d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>> @@ -0,0 +1 @@
>> +require linux-yocto.inc
>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>> new file mode 100644
>> index 0000000..161f9d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>> @@ -0,0 +1 @@
>> +require linux-yocto.inc
>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>> new file mode 100644
>> index 0000000..161f9d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>> @@ -0,0 +1 @@
>> +require linux-yocto.inc
>> diff --git a/meta-oe/recipes-support/numactl/numactl/numa.cfg b/meta-oe/recipes-support/numactl/numactl/numa.cfg
>> new file mode 100644
>> index 0000000..fe1394d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/numactl/numactl/numa.cfg
>> @@ -0,0 +1,2 @@
>> +CONFIG_NUMA=y
>> +CONFIG_ACPI_NUMA=y
>> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
>> index b9cbcf0..ef2dab2 100644
>> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
>> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/numactl/numactl \
>>      file://run-ptest \
>>      file://0001-define-run-test-target.patch \
>>  "
>> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
>>
>>  S = "${WORKDIR}/git"
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

