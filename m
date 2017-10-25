Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 056E5600EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:18:42 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z3so3339111wme.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zd3Mk2DfskjpxjFSAoXzDuMontS3NkclptOPiRgjjW0=;
	b=Cqf+Jc3m4fk/+OUzR4ljo5EmXehQclDe3sTRvrGfCcSvUezsMzRhENkDN+yzA9QS6m
	RN4betjiR7HlJhBsaJ5UsC3ckpVRNVA2q5lBY4fkE2BJzKave6vzVR7s2qBgBhgGSd2N
	/tTiS3NI7IxM6dAdwcDfI5bxZAVhQKpRpS/YRiEQBiGlATVgTGEUEM4dbLfnLNiC5W1P
	qRzhrZVzMMstvkJqQ9Zy4XSKGb8joHjdTITVKaG0Xo0HMMdBloSRYHiDPrwzobKkNIMi
	6GPDRJDXKbnjD9F9gE//ETf/mM5MTLbrAtAX44OejCsE4JXwfuh3C/P1Z6GE8tUcMM8P
	CGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zd3Mk2DfskjpxjFSAoXzDuMontS3NkclptOPiRgjjW0=;
	b=kG2PCxhGFgOikciyeQNnXwJz68K4Td80BMDhiWqrOfMfCoYo1NOlHkHfI7LJFYi2w9
	KvIx11ufG/64Verd2sO7Iznw5MqQQVOw7WhvO722exuQCkaNZaLL1ypS+YIaNZqrhQIG
	LbuuAZhaWdR0B+koccqxuHQFEKmSSIY1UZ7cMsGWUqyETdflx7M50/fTwH9C5ObZd1It
	T36O3WCFgoZcWxKsj8+55yv0tdrqxZpRx0W9GCuV9vSHH7oX9z1PVctEs8lS8JaVA77g
	/X2+5Wsr01K4x20j4+ZmGUhOleKMznLQ/K3NHM5jg1/LVZoCNR5imbPT0GAODVwO5l0K
	GInQ==
X-Gm-Message-State: AMCzsaXZhsT9gN/XqW+lYzYN9Ov/PTDvIteTNkPtYozZ8JU4U1KWBHCy
	NVo5F8mVonnyg2zxtwF3mds6ld1OfUYQgpSh5U8=
X-Google-Smtp-Source: ABhQp+SmkNVVPqu3KuDX9cttUimWa/SHb6EaBhsiwuIhnn22tivEEoHQdJHsCVpyq5GF8zStvEEVhQJIe+9ISSl7rBo=
X-Received: by 10.28.19.73 with SMTP id 70mr2514098wmt.87.1508951923647; Wed,
	25 Oct 2017 10:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Wed, 25 Oct 2017 10:18:43 -0700 (PDT)
In-Reply-To: <52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 25 Oct 2017 10:18:43 -0700
Message-ID: <CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Wed, 25 Oct 2017 17:18:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 4:14 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/25/2017 02:43 AM, Andre McCurdy wrote:
>>
>> On Tue, Oct 24, 2017 at 4:23 PM, Joe Slater <jslater@windriver.com> wrote:
>>>
>>> qemu-usermode is only available for mips64 and o32 code.
>>
>> Isn't that already handled by meta/conf/machine/include/mips/arch-mips.inc
>>
>>    # user mode qemu doesn't support mips64 n32: "Invalid ELF image for
>> this architecture"
>>    MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
>> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
>
> Yes, but this is really unreadable isn't it :) I don't see how anyone could
> grasp that the above means "remove qemu-usermode from MACHINE_FEATURES if
> n32 is in TUNE_FEATURES" (without diving into documentation).
>
> Any better way to express this would be appreciated.

Yes, BACKFILL_CONSIDERED always has been concept which baffles a lot
of users - especially so since we quietly redefined it to mean not
only "functionality which used to always be enabled but is now
configurable" but now also "functionality which was not previously
enabled but is now configurable and we want to enable by default and
make it difficult for users to accidentally leave disabled".

