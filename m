Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBB1CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 15:16:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37138.1792422984641524664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pZgizm6T;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1868867f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792422983; x=1793027783; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SbAiQeLlSMHSc4AVdn4ET4W4Rs/WMdBgjYkllOWjWE0=;
        b=pZgizm6TyH9ibmh+Pxzwn/VMmlWc2ikaw8+drWSkRQcUIUlMaLOOc5nQ0eanh4Yqld
         txXoJMlwW3znJHXzbx/cPXQiVN9qbVfxKyyPi4Df9b9w5Q0O8YApPqeMgDfCaXP/wNix
         ZPp2EBRetbG2CfIeCtP+GWRp05ukBpTFrAvCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422983; x=1793027783;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbAiQeLlSMHSc4AVdn4ET4W4Rs/WMdBgjYkllOWjWE0=;
        b=XIs+oF3q1ldTA5mO7jWTYCY5OnmEG9BJQ1JFqUNX6kJQHckx0fD6exJO4z2E6w6UU1
         1myu/gYZBCaxD7j+enuY6ThnuCsxs9RJDXaxqhDDBU+/ShA7anP1FXEJPCmaBTESz2JO
         LBPrzphdgnkft2ZqX4v80vPttKNai6zTojJjvKfKrEFmUkegENzXS9kZMupBMdltW1xk
         rPcMvicBqLE8NF4vwIsxeQixLcyWferxlFpdXFaBiWEF7XRSdtpe9oh2yS8rGtyN8Pce
         VYVARPALxVPWLZ0OhAdw34m33m2e26xzQWDnv8b2sdJOwolnaPAlsNvHJDxfmxZF3Ado
         +z+A==
X-Gm-Message-State: AFq9FYIhJkoKvtiSP25ih3eKr580iloRCz/1ex90neEZE6gm6FtdRl7v
	u2hif0NvrzRb+el89+3E5uW/KI3b51syEMhx/lloq2+FgASrAaqF72k+2PYJNFkC1Ug=
X-Gm-Gg: AYBFou3RPOv71voG771woEQFGrRF/dd2bpDQurWRn1VBp52LOyAygI9CH0a+8OgYljt
	YTzRN+XC8RmyTmOrRV6tNrWeusl70TuGdGaT9O/UCIQjs/M5slTMiOhcpgSU1EEDgOhMG96HdHL
	tNyZFLeetjOYHHESTvoXyyOu13lrwpxteGMnRpUwDd71FLpCcpYvG2lHn65HdiHt66c/X8TGWCJ
	B7PUaA/syxa4/62nYQ1kpGPiTX7vSitrV+um6zeA29k7WiAA9c+vXZJQQEMgMMk7FXoGx6nP+FL
	EUKEMZik0lJfp2L0u254tSaOsgOhk+yhdiS8InDAbBh1zu57wnOmA+fA8cdEREaYQrG8xNED46f
	c80uXJfGoPK5Hr4IhNh+KN+u0RnXIe0soiyEuDKyUcl7PW9xT96JGQctuFkm+zOtq1FP3RO/k1S
	6OjJipThSGpWXEC5HEa0pu3YK6FJFK9IgqfsgNpgAlnJdC7/UL2cZQhWJr4MullmL+nPnkwRvwV
	onNOltmopZ2IbbOCD6QqskJGaDOSV+UiQTGnDSNHTZwYD0Fz3iRpqYKIHPzhpXS3jaiWzgA
X-Received: by 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr158249785e9.28.1792422982695;
        Mon, 19 Oct 2026 08:16:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc8ee409sm301853895e9.13.2026.10.19.08.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:16:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 17:16:21 +0200
Message-Id: <DM8WX2CJGLU6.1AKN2H7P8G9GS@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
X-Mailer: aerc 0.20.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
 <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
 <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr>
 <CADkTA4Njr1sezPZTZh=CY1Nay4RNtLO5Lmi=vg56CUUsqgsW8A@mail.gmail.com>
In-Reply-To: <CADkTA4Njr1sezPZTZh=CY1Nay4RNtLO5Lmi=vg56CUUsqgsW8A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 15:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248190

On Mon Oct 19, 2026 at 4:43 PM CEST, Bruce Ashfield wrote:
> On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
>> > On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal@sm=
ile.fr>
>> wrote:
>> >
>> >> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
>> >> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
>> >> lists.openembedded.org wrote:
>> >> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> >>
>> >> >> Updating linux-yocto/6.6 to the latest korg -stable release that
>> >> comprises
>> >> >> the following commits:
>> >> >>
>> >> >>     79643295eba17 Linux 6.6.157
>> >> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog =
is
>> >> exceeded
>> >> >>     [...]
>> >> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for
>> allocate
>> >> vs populate"
>> >> >>
>> >> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> >> ---
>> >> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>> >> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>> >> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28
>> +++++++++----------
>> >> >>  3 files changed, 20 insertions(+), 20 deletions(-)
>> >> >
>> >> > Hello Bruce,
>> >> >
>> >> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
>> >> > lttng ptest failure:
>> >> >
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
>> >> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
>> >> 11:38:31+00:00
>> >> >
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
>> >> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-2=
1
>> >> 14:57:16+00:00
>> >> >
>> >> >
>> >>
>> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux8=
6-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.20260921110=
838
>> >> :
>> >> > (only one of each message):
>> >> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
>> >>
>> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zS=
A9mh
>> >> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
>> >> ./tools/base-path//load-stream-extra-path.lttng
>> >> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
>> >> ./tools/save-load//load-42.lttng
>> >> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
>> >> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command wi=
th
>> >> option load-42
>> >> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list comman=
d
>> >> with option yTVkM2lxbFoDS7Nu
>> >> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng
>> enable-rotation
>> >> size XML
>> >> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng
>> enable-rotation
>> >> timer XML
>> >> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
>> >> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML
>> after
>> >> load
>> >> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session
>> >> load-stream-extra-path
>> >> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is
>> valid
>> >> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi=
 is
>> >> valid
>> >> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path=
 is
>> >> valid
>> >> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
>> >> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
>> >> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
>> >> > |FAIL: tools/base-path/test_ust 38 - Destroy session
>> >> load-stream-extra-path
>> >> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
>> >> yTVkM2lxbFoDS7Nu
>> >> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
>> >> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotati=
on
>> >> size value in list XML after load
>> >> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event
>> tp:tptest
>> >> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
>> >> load-stream-extra-path
>> >> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe
>> listing
>> >> >
>> >> > Any ideas?
>> >> >
>> >> > Thanks!
>> >>
>> >> Hello Bruce,
>> >>
>> >> Gentle ping on the above upgrade failure.
>> >>
>> >> Do you have time to look at this? If you don't, we'll have organize t=
o
>> >> find other resources, we can't not update the kernel.
>> >>
>> >
>> > I'll have time next week, but I can't run the test images locally, so
>> I'll
>> > need to come up with my
>> > own tests :)
>>
>> Awesome, thanks Bruce!
>>
>
>
> I bumped -stable again, and when I run the lttng ptests against that
> kernel, I have all tests passing.
>
> So either something in that kernel update fixed it, or I'm doing somethin=
g
> wrong.
>
> Did you see this once ? or consistently ?

Twice (x86-64 and arm64) but during the same a-full build:
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
  qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21 11:38:31=
+00:00
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
  qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21 14:5=
7:16+00:00

Then, I removed the patch from the branch.

> There are some AB-INT bugs that you (among others) have been tracking:
>
>   - 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools ptest=
 timeout
>   - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure:
> tools/config-directory/test_config.py
>   - 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn't login into serial=
 console
> as root using blank password
>
> Could it be one of those ?

I know I've looked through existing bugs and did not find a matching
one. But, given the fact that it happened twice during the same a-full
on 2 different architectures, I don't think it was an AB-INT.

> I'll send my stable updates later today, and maybe we can run them again =
to
> see if you get the same passes.

Happy to. I usually do 2-3 a-full per review cycles. If the
lttng-tools ptests are green, I'll consider this fixed and take the
kernel upgrade patch.

Thanks!
--=20
Yoann Congal
Smile ECS


