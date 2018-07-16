Return-Path: <cazfi74@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7646004D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:56:45 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l10-v6so26367902oii.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R5dtQpxN46qYBQcXgJu08uXzJtuAgufJ/dtV1xeKjZs=;
	b=rPIfoWmVkF3HTHHpQxVNWWmKk37Z6VG0FxvJ3Ie1rgYd+bQ2uml+R4X1MdIr2jKUH2
	R1Sow/wubAoaxpofBsrWHcop9SwZgGZy8ifc1IjGERO+H3h+MN+fNghVOx44sPMBM8ea
	I7vSJ1AMIYgg/HAFATi96a7nIzjQi0rXBotC7y+G/OMCcO5QWd2ii7UpOtrqWVKZxeFV
	VD4nCL3MFb6F3n6fuX5/764n4vFPUn9qgCe2PfOn92Lt8BvhjJ0jn6MzKiIAKXPOSX6A
	DeQcM4fRrwbFzxKr/plW6574CIK8JJf5mgb8wLJ1X27k50iF0R1XR74tlRPVrgcYtpEf
	OQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R5dtQpxN46qYBQcXgJu08uXzJtuAgufJ/dtV1xeKjZs=;
	b=OKNxBhZBCJwJiy5XXt51wInCRttAr+WM2pHl7dOXwTE2WVJBzTDTi6hFDMDBuD4mW1
	5bdgR0j/Bhsyx4rz7FQ29jnrvGDzJtMdUA646+nHmKmhUBiGRq1picQPc4BN1Wp1TIKW
	waMB5TUSKAxoXPRGqzh7mpRa0Ln5zmm7xSRSNka1znl5z4Pk75f6W2NmRZhc9MbKAf/l
	gzQiN66clA/FxJfUR/wmRnqBUiJcPHmgBjJu+TSpQdTpVa7DToaGVv5s5hgvqVfpiru9
	DvtYYu8gPrR3jOXOIXIieyKX78ic12lPl8hfEHf9y0l2NQNDnpaoU6oR5FAu4+/paLcM
	oY3Q==
X-Gm-Message-State: AOUpUlE6zvWNV2C9ChkVY4YofM3IH1yDOINfBSHqPg/yzzypIzCn9vZQ
	Qs3SYIakAc2szRB1QAJfa7BjjgdPdyeQPwCoS+M=
X-Google-Smtp-Source: AAOMgpehiEoMO1EnoHDfJGaIQjQGCgnKm26GVrGed4RfE+Hvnxkf0dsPMXaVf1M94b6qDLrVvbkLcmHBRCzOonjm+Pk=
X-Received: by 2002:aca:df42:: with SMTP id
	w63-v6mr16003645oig.295.1531727806287; 
	Mon, 16 Jul 2018 00:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4c0d:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 00:56:45
	-0700 (PDT)
In-Reply-To: <CAJTo0Lb_z+qSa=_y9Zp0iqU_mAjJJVG0S0c=7RJX+hA1YDQN8Q@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
	<CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
	<CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
	<CAF6bG8fqn0pgfU18pWWayb4LhZA=dZjwMqGPysPNXCaM8OOr2Q@mail.gmail.com>
	<CAF6bG8dJCN47J3Hw7RDJP6iWTA-wpB+Qd3EywJbqi1w8qZPuvw@mail.gmail.com>
	<CAF6bG8eak_Y2JtCadgfju7FvLr0mcG6oCFUuWrNhzLtDEe6Gyw@mail.gmail.com>
	<CAJTo0Lb_z+qSa=_y9Zp0iqU_mAjJJVG0S0c=7RJX+hA1YDQN8Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Mon, 16 Jul 2018 10:56:45 +0300
Message-ID: <CAF6bG8dqksLsnkKUQwzVP7rEQ0aMGUUHjWYaeOCiUX4dvfynGA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Mon, 16 Jul 2018 07:56:46 -0000
Content-Type: text/plain; charset="UTF-8"

 Sorry, I'm on vacation, so it would be good if someone else can do the patch.


 - ML


On 3 July 2018 at 17:37, Burton, Ross <ross.burton@intel.com> wrote:
> What was missing all along is that we're talking specifically about
> atk-native here, which disables NLS explicitly.  As Meson doesn't yet
> expose a way to turn off i18n we need to stop that.  For now, adding
> USE_NLS=yes is a suitable workaround (and what glib already does).
> Marko, can you send this patch?
>
> Arguably, meson.bbclass could do this, but that would be forcing a
> gettext dependency on everything using Meson.
>
> Ross
>
>
>
> On 1 July 2018 at 19:20, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>  3) Adding 'USE_NLS = "yes"' to atk recipe fixes the problem for me.
>>
>>
>>  - ML
>>
>>
>> On 1 July 2018 at 21:03, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>  I think the problem is not with INHIBIT_DEFAULT_DEPS, but with
>>> USE_NLS on the next couple of lines. With USE_NLS disabled, the
>>> automatic dependency is gettext-minimal-native (not providing
>>> xgettext, I think), and not gettext-native.
>>>
>>>  1) tmp-glibc/work/aarch64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/sysroot-providers/gettext-minimal-native
>>> is there
>>>  2) Adding gettext-minimal-native as atk dependency does not fix the
>>> issue like adding gettext-native dependency does
>>>
>>>
>>>  - ML
>>>
>>>
>>> On 30 June 2018 at 21:43, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>>  This error happens to me with both qemux86 and qemuarm64. Haven't
>>>> tested any others yet.
>>>>
>>>>
>>>>  - ML
>>>>
>>>> On 15 June 2018 at 20:40, Alistair Francis <alistair23@gmail.com> wrote:
>>>>> On Mon, Jun 4, 2018 at 4:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>>> That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
>>>>>> which it shouldn't be in ATK.
>>>>>>
>>>>>> I'd definitely be checking if that is the case, and if you can
>>>>>> replicate the failure with e.g. qemuarm.
>>>>>
>>>>> I can't replicate it with qemuarm and checking with bitbake -e I can't
>>>>> see anywhere that the variable is set. Any ideas on what to try to
>>>>> figure out how it is set?
>>>>>
>>>>> Alistair
>>>>>
>>>>>>
>>>>>> Ross
>>>>>>
>>>>>> On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
>>>>>>> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
>>>>>>> <alexander.kanavin@linux.intel.com> wrote:
>>>>>>>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>>>>>>>
>>>>>>>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> So why isn't the inherit gettext sufficient?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>>>>>>>> this patch:
>>>>>>>>
>>>>>>>>
>>>>>>>> So is the error specific to risc-v? You should dig deeper in that direction
>>>>>>>> then.
>>>>>>>
>>>>>>> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
>>>>>>> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
>>>>>>> gettext.bbclass so we don't depend on gettext-native.
>>>>>>>
>>>>>>> Do I need to ensure cross-canadian is set for RISC-V builds then?
>>>>>>>
>>>>>>> Alistair
>>>>>>>
>>>>>>>>
>>>>>>>> Alex
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

