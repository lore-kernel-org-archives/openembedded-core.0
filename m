Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89678746CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 19:07:06 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t20-v6so4526139ply.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kvAP+C+xDk8lUojQX1Wg5+ay0skjNzvejWqZk6lNLdA=;
	b=Com1Tn93H/8p5Ly36xzwou0lFuclFKLrVhx9nU5dcP5uojIsdqnWH0EQLpU47nnKKH
	v7J1us0fB23P7bvolOw+bYYN9jLessDalR0GG8QUFAucixVyA4VKRK+AooyppfDwRPek
	0QTLO6PFl0oB42UH1yFKo9FWrwBcI7dfeIb1I4xETrLqWBWqU72Qed0gblJoG8HQenES
	lZaZ5+jEqSQ3q84eec9UKoBiavmUcppKqBaETURYnn6AK7RQzrT+GxraPiSbUjqAuWN1
	XhZXfJ0cwuyBdl0Qv76N/27xnvC5Rr9DZCCfzBgcmz0+D3pSmIMkyAWfinKKt2Fs8ebJ
	oTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kvAP+C+xDk8lUojQX1Wg5+ay0skjNzvejWqZk6lNLdA=;
	b=mV7VpXC6yvrcw+SYRGxcMMwP16/nzs6A68eMd2JvQREFX1XClOYLb+wgdGA7PyRIxR
	gbQXKPOogJiOurNCYxboHhIudjiPORPn3vx86BQmjoTDhfm9tkuXA0NpJKfTdhCYU5ef
	lr0V9jBnBkcSt0dEjm9xsvPNPSdXBWtgZmTCX6C6i7DAKErSMsIYvJ9dRdKxuhIEq6uP
	+h+phEuNMvajbtHEdCGvhoBPS+YVHs7q3oF0RG1Mb1mXWjeyFm89vPu2PaTfhM+U7VNa
	1gkMx0WMMFRYBgc9C+0Whtzj7R0lyHH0+YcwbLUEL/pZvKN9Vzs+IU6qqE30vVQG7YDq
	c11Q==
X-Gm-Message-State: ALQs6tBlEAAEdfKwMATidl9y9lMJq+zmzHaFQ+ESO07Te0L7j0g2Wj6Y
	CI3IhConpoZdQkSlk5tmGko5CHPvG7RczSzA8WA=
X-Google-Smtp-Source: AIpwx4/1C6A9Slu13EDRdIJlZTBflKdfG4W+XwSLaZu0FMqmsoLKaxkzpIoYHFyjwkOt/T+qxJxRTJL3B4HdJ8/A2fQ=
X-Received: by 2002:a17:902:be18:: with SMTP id
	r24-v6mr2260870pls.275.1523560026950; 
	Thu, 12 Apr 2018 12:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.129 with HTTP; Thu, 12 Apr 2018 12:06:36 -0700 (PDT)
In-Reply-To: <CAKmqyKNAxpF1okjTNRoOS2adu+3Xzfq+N7PuektGarCozGt_6Q@mail.gmail.com>
References: <1523380197-2763-1-git-send-email-alistair.francis@wdc.com>
	<cb803b32-b0b5-559f-ab66-7e556f1a5e0e@gmail.com>
	<CAKmqyKNAxpF1okjTNRoOS2adu+3Xzfq+N7PuektGarCozGt_6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Apr 2018 12:06:36 -0700
Message-ID: <CAMKF1soTmDp2ntWs49=3Lf5x9Cy0ZmKVXyzC902HE7===CvM_Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 19:07:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 11:26 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Thu, Apr 12, 2018 at 8:49 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 4/10/18 10:09 AM, Alistair Francis wrote:
>>> If a user has specified numa in their DISTRO_FEATURES then they should
>>> have NUMA support enabled in the kernel. Without kernel support the
>>> numactl program is not very useful.
>>>
>>
>> This should be done in OE-Core as part of main recipe.
>
> Do you mean in core linux-yocto
> (meta/recipes-kernel/linux/linux-yocto.inc)? That seemed a little odd
> to me as the numactl package comes from the meta-oe layer. I was
> thinking it made sense to keep them together.
>

its controlled by a distro feature which would add right knobs to it in core.
it wont be changing any functionality therefore and hence would be ok

> Alistair
>
>>
>> Note that this patch is sent to oe-core ml but is actually against
>> meta-oe layer which follows oe-devel mailing list.
>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  meta-oe/recipes-kernel/linux/linux-yocto.inc           | 2 ++
>>>  meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend | 1 +
>>>  meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend | 1 +
>>>  meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend | 1 +
>>>  meta-oe/recipes-support/numactl/numactl/numa.cfg       | 2 ++
>>>  meta-oe/recipes-support/numactl/numactl_git.bb         | 1 +
>>>  6 files changed, 8 insertions(+)
>>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto.inc
>>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>>>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>>>  create mode 100644 meta-oe/recipes-support/numactl/numactl/numa.cfg
>>>
>>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto.inc b/meta-oe/recipes-kernel/linux/linux-yocto.inc
>>> new file mode 100644
>>> index 0000000..9533eb6
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto.inc
>>> @@ -0,0 +1,2 @@
>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>>> +
>>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>>> new file mode 100644
>>> index 0000000..161f9d3
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>>> @@ -0,0 +1 @@
>>> +require linux-yocto.inc
>>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>>> new file mode 100644
>>> index 0000000..161f9d3
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>>> @@ -0,0 +1 @@
>>> +require linux-yocto.inc
>>> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>>> new file mode 100644
>>> index 0000000..161f9d3
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>>> @@ -0,0 +1 @@
>>> +require linux-yocto.inc
>>> diff --git a/meta-oe/recipes-support/numactl/numactl/numa.cfg b/meta-oe/recipes-support/numactl/numactl/numa.cfg
>>> new file mode 100644
>>> index 0000000..fe1394d
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/numactl/numactl/numa.cfg
>>> @@ -0,0 +1,2 @@
>>> +CONFIG_NUMA=y
>>> +CONFIG_ACPI_NUMA=y
>>> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
>>> index b9cbcf0..ef2dab2 100644
>>> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
>>> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
>>> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/numactl/numactl \
>>>      file://run-ptest \
>>>      file://0001-define-run-test-target.patch \
>>>  "
>>> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
>>>
>>>  S = "${WORKDIR}/git"
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

