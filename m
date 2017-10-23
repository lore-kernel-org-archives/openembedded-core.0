Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64C0170178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 17:14:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b79so17590315pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3P4O1Ac3B2sCVpjwUqsjXNwSRNXENaAdr/iAHPp8k3o=;
	b=LMdiGIFm9avn/rqbYu5O+KGgR5AFUexAUq64bl/7VRUf7itkKVbVR+0bMqh3SDPiqZ
	tvPyvQgGKJh0LpmjJ9YOOquj6guyecUsZ6MbX4kKjb3+cScA2AIzKWo2/JfuM351l/vN
	xpI0twPzIVpo4RY0s01zYLF7TDTca3oU3XSCX3rG83vFwUTN242cET+ShJghYQiREjG6
	ugacL+xTaS3PC4Np3imniPJ/GTb8n9MpaHP+1RijlZTcVdOLztz3tdkeiTb34p/OgALy
	DmGbT0gzpnAPoc0zfTUpodVjWHY1JyPgP6QGPlfciceNY2k1xL7SJDWvOkZYD/2xS4PT
	brDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3P4O1Ac3B2sCVpjwUqsjXNwSRNXENaAdr/iAHPp8k3o=;
	b=gYgcZ1IG7rAA9LgCLQyKp/Pui+Z37o1n9EPuvGbAXJTFAXqv/P/A/VtKJHJbzbYx6L
	+nCV51t0mBifDw2fnK8k2K6sJcomopt/ujfSm1TqEAs8ZizHOYjs0XAK4ibjeb0FRMvl
	yoMQKknk7OicHRH23TQK3mF3Fa8zGIbFqo3woN4km0aIc+xuW1i0DYufDyFbiJQjwU5J
	3kSHz6PaikOeMG0B03t1EgOSLekhDNo6OaVHwmppL0swNhCxPidgnuxJE2gwuzIOH5Q8
	MutmwxYEmNPMEyMt3bcDDTm1wSTT8VGzCYrcrg4WYgASOVR1Wsyb3hn1OU7UvCyO+rHd
	eTow==
X-Gm-Message-State: AMCzsaUf2cotSANSi5ckLtT1qtNFWMyQmWV+htzpdk7HZdR4F5SP5Z8N
	nC+YMCeeK0YpT72mGJ+Kn/Zo/bxiOHIAwvEvI5g=
X-Google-Smtp-Source: ABhQp+RMjiuGPIzcclOExzpP9jNihV8TRtaadYx4OegfLdtgUHv6M0aYXxTjaYP4t6ksRzZ5mmXqJFTJVfLxFnjnJkI=
X-Received: by 10.99.51.72 with SMTP id z69mr12580312pgz.317.1508778873190;
	Mon, 23 Oct 2017 10:14:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 23 Oct 2017 10:14:02 -0700 (PDT)
In-Reply-To: <CAJTo0LZZ34aPOfko6usC9VY558FK+T3RSVbevfH0UKtAz8vJYw@mail.gmail.com>
References: <cover.1508748511.git.Qi.Chen@windriver.com>
	<4f1aa881f21424b71dd9fda2c47240c14166c471.1508748511.git.Qi.Chen@windriver.com>
	<CAJTo0LZZ34aPOfko6usC9VY558FK+T3RSVbevfH0UKtAz8vJYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Oct 2017 10:14:02 -0700
Message-ID: <CAMKF1srmj96zxxMXgu5wfvG8vMR-1N11LpgN6kY4tC8_v71oJg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix strange behaviour on qemumips64
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
X-List-Received-Date: Mon, 23 Oct 2017 17:14:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 23, 2017 at 4:41 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Can we trust the mips64 compiler at all?  Is there a specific optimisation
> that systemd is turning on that is causing this breakage?  Have you reported
> this to the gcc bugzilla?
>
> Ross
>
> On 23 October 2017 at 11:44, Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> On qemumips64, `systemctl status <unit>' would have the output of
>> `systemctl show <unit>'. This is incorrect.
>>
>> However, it's not the code logic that cause such problem. It's the
>> compilation flags.
>>
>> Looking back the history, we had problem with systemd on qemumips64
>> which is also related to compilation flags. We solved that by using
>> tweaking FULL_OPTIMIZATION for mips64 to have "-fno-tree-switch-conversion
>> -fno-tree-tail-merge".
>>
>> Now systemd has been upgraded to 234, and we don't have the above problem
>> any more. However, a new problem appears, and that is the output of
>> `systemctl
>> status <unit>'.
>>
>> Hence, we set '-O0' flag for mips64 when building systemd to avoid
>> potential
>> strange problems.
>>
>> [YOCTO #12266]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd_234.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_234.bb
>> b/meta/recipes-core/systemd/systemd_234.bb
>> index 36fd3f8..b294604 100644
>> --- a/meta/recipes-core/systemd/systemd_234.bb
>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>> @@ -158,8 +158,8 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG',
>> 'valgrind', ' -DVALGRIND=1', ''
>>  # disable problematic GCC 5.2 optimizations [YOCTO #8291]
>>  FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns
>> -fno-schedule-insns2"
>>
>> -# Avoid login failure on qemumips64 when pam is enabled
>> -FULL_OPTIMIZATION_append_mips64 = " -fno-tree-switch-conversion
>> -fno-tree-tail-merge"
>> +# Disable optimization on qemumips64 to avoid strange behaviour
>> +FULL_OPTIMIZATION_append_mips64 = " -O0"
>>

I think we need a narrowed-down case may be a opt pass which is causing
the problem. reduce the opt level to -O0 will pessimise the code and impact
the performance.

Firstly, try to use normal -O2 and remove disabling tree-switch-conversion and
tail call disable.

>>  COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
>>  COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

