Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C8ECC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 07:05:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34025.1792047938916852423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 00:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oizCjmq3;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a061a13884so40966425e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792047937; x=1792652737; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80AyDY2ffXAdS9Bqw5U1jb/o2DOHgUUHmJBjyjY5kWI=;
        b=oizCjmq30kv7GvY0eOY/4ZytE/LPTGWBBhLBKgO3ZU7mR7vRnGumKAqoIh6AYqDxua
         e3Ju0FAuB2FhQO3yzm5CzahlbMgP0HPksLH629jDpRl2mlkoE4t4oMFPJBhJRpcV49P2
         dJYUNKUCnu0cxW4M0I1J2K2/jdHApg/3bx3Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047937; x=1792652737;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80AyDY2ffXAdS9Bqw5U1jb/o2DOHgUUHmJBjyjY5kWI=;
        b=HD7LivRTkrwR8tDvosTiclUy9aG8xBJClfw2D6CUoGNwZrrgOtallzdfO/JKVGQOWu
         D6xinUtjVUTHRO6MaYLAmjr0TRGDuOhdFXkAMRWeroWonicAq3qTErI+qp1iLHXvQwi0
         yCzJhPBzow5ZejE4Xnoxg3iuf9ISPJYO3MEyWEEq1M2kFKySUMfM7yltC55t0K1lKTbC
         X3xQOcvfJNbb0kZ4ZHgQ1qDIoHO+Aocw58Y9Ex+53NiUG3ubXmZWJg4GuHo5TI2oMbId
         sCZDqVdTbH5ocTOUcSNUIm1sbbSB1JFGQC/XereiQnX9gJVL9vovmGvu7Tqc+LimKMov
         CE+w==
X-Gm-Message-State: AFq9FYLvps9wuTPwkSd20SqcbqzpUZW7TAkRcnTPMiS7p1RVsS6u7wjq
	/+vsyofigHLSFLFPM7m/qJlAAjDGkWu2k59kOT00hBzgqcDwRCm7dEfNnEdWb4+MoDo=
X-Gm-Gg: AYBFou1c2xA9dBN4C10kHN27cVWl7jht6jVk5vMnDYO6leMp/eH4uHra4tdebftbCOS
	VCkVE/rQP5qOCEzyfGw3nxbJNCWqEPbhumMKuovQMeJkkmsU9wp4AkAU6o99Y3oey3n0eoWHCqv
	8xZOC+oEt40Lp/LR4CtVuEQGS7XAT0jTFBKZOM3t92lFzOhGXvX8iAhCDqDe9XCSgKX/0gKuFY5
	beHXZhnRxbw6xaQm2S5keo75GvPE+MxnuUoYC4mQLPMQmb2FEAdSRgUumAW3qJEX5OBQlt1ZFV1
	pN22UPCPLXDoQI+t/CSJnO4bvqayD/xegbedaXpHb11aasEm4ozyqQ7N/YuQZ9YEOuj0p/2zhdA
	qd9r3xhVvzyF8sWd4BMiU6e0XYEOTCq9NKgElOJUdjHb1DRvn24tgB4+m64Ctzhuv90qIxaIe6g
	m7YGNfqBIcI9WwoSgPXOyA5vueL6ct8Byblsy09aCBbiiqC6MTCMf1DhD5wL9R/Z/lnzYJr4J47
	D3SgvQykwLbuIKs+J8rObkOkCCo/PvlfQPzfpN2Hd+FLtvnHpObLE7986JHNeMu73ue9Dhi
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr232679125e9.0.1792047937096;
        Thu, 15 Oct 2026 00:05:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd99faf3sm48552455e9.14.2026.10.15.00.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:05:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 09:05:35 +0200
Message-Id: <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
 <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
In-Reply-To: <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 07:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247867

On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
> On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>
>> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
>> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >>
>> >> Updating linux-yocto/6.6 to the latest korg -stable release that
>> comprises
>> >> the following commits:
>> >>
>> >>     79643295eba17 Linux 6.6.157
>> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog is
>> exceeded
>> >>     [...]
>> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for allocat=
e
>> vs populate"
>> >>
>> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> ---
>> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++--------=
--
>> >>  3 files changed, 20 insertions(+), 20 deletions(-)
>> >
>> > Hello Bruce,
>> >
>> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
>> > lttng ptest failure:
>> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/46=
04
>> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
>> 11:38:31+00:00
>> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/45=
77
>> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21
>> 14:57:16+00:00
>> >
>> >
>> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux8=
6-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.20260921110=
838
>> :
>> > (only one of each message):
>> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
>> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zS=
A9mh
>> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
>> ./tools/base-path//load-stream-extra-path.lttng
>> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
>> ./tools/save-load//load-42.lttng
>> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
>> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command with
>> option load-42
>> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command
>> with option yTVkM2lxbFoDS7Nu
>> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enable-rotatio=
n
>> size XML
>> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enable-rotatio=
n
>> timer XML
>> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
>> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML afte=
r
>> load
>> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session
>> load-stream-extra-path
>> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is vali=
d
>> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi is
>> valid
>> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path is
>> valid
>> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
>> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
>> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
>> > |FAIL: tools/base-path/test_ust 38 - Destroy session
>> load-stream-extra-path
>> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
>> yTVkM2lxbFoDS7Nu
>> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
>> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotation
>> size value in list XML after load
>> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event tp:tptes=
t
>> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
>> load-stream-extra-path
>> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe listi=
ng
>> >
>> > Any ideas?
>> >
>> > Thanks!
>>
>> Hello Bruce,
>>
>> Gentle ping on the above upgrade failure.
>>
>> Do you have time to look at this? If you don't, we'll have organize to
>> find other resources, we can't not update the kernel.
>>
>
> I'll have time next week, but I can't run the test images locally, so I'l=
l
> need to come up with my
> own tests :)

Awesome, thanks Bruce!
--=20
Yoann Congal
Smile ECS


