Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17816.1793104953203768681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 05:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=DpppJ0D2;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so23441355e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793104951; x=1793709751; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZX/fsV+bozCp3GC9VbMT8QgYZldrnBV564sQUMK9sxs=;
        b=DpppJ0D2ol5BmUIPxU3Ts7kf1924mLV0SwSl/OMqIOsZuagzwXmBopEQ+k1q1Sf8g7
         t4fvlbHF9bZ7nEXyi3Y90biYZpFN7YOfzxDBg+oihwasverGhcqPp6f0noQMhFGPMaac
         b4GoW2tLCnDX08M0p96/XsKPHFLSzpOiQBMG2kuxqpLI+G6qHBZr6xhXKOymDUs8mJDd
         RJPTlLXu87kKfJQOhpUXWxDWAaWunClgMWrJOM8K4jwmI9DY8ODpLvEGQApmnG7NkMLJ
         iJgPXDimJSmfraaHiMq/430YShAg7QNf7HGl9z+3Gl9parZBQp6HZqLaKCaz8EjhbvMV
         cgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104951; x=1793709751;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX/fsV+bozCp3GC9VbMT8QgYZldrnBV564sQUMK9sxs=;
        b=aOGRy889z6fB3HRT9i13loeuZcebPxlD1EQnw2bNQ2WeAPpE+dRQPKQ8FofjXcB2G2
         wG34jNtamNvC+LT88/MeeQVisrrDOA7wwaDUEDEQ2QrYx75BWz2X6Uz8qOskUJiPVKZl
         CKgwSRhiP2pD6Kx3OrJQVP/ilZHV5mPyYSI4abpcvnMxs+LYUQNY/irRoTwiM1NEex6S
         9LbRpgnCiJORS52y0bNy8OUVVK+cAP+FDWCf2ESiwC5E/Ukf3MZ1xYyDFFGUsBmXDEgQ
         Z44DDHcarOAe2FFbT5m2SybwaDYcFxcCWIhEUR2y+Fe+iXoXySqnSHsSS+plN3jkC635
         fc8g==
X-Gm-Message-State: AFq9FYJZtj98fEgbpdssgOQEoArLSSAEa0MS1GbXBhCHBZ4k7lCFMFA3
	D5bUqMMJEW9ARcau0u7Qv7z275OgTgEEcrab9UFlg44dOvo2y3XGzeD4AcIIGzhSXFg=
X-Gm-Gg: AYBFou1P1rLgkotc9pPL7b4SdG1dTpatUs2af9NlgynLXe7zU+DwAjolLP7zUJxGNQ+
	85NXFwIARnSLmcIpgVPuoJXQIobwfTlxjbu1yJkk07bYdkGhgAca7+PhvvXkjWhW2omNpjDh9Nr
	8ifSR/7D6yZG6Rxus6uMimT8yd2BYkjNMmBULRKMGXo0ux/mFtp/B5wu+HYrNi7PW/faEwvGNJ0
	jrQxU/bc7zRBBKX+LxM/c55xsSjiDiib9YS1TFLWjeVuHLbNhiIBuZN7VeMeFEv167qEZOfwwC8
	Oknt5xovpJYKwYOb6bLlPwkbbds38GkbK0QkLoauBG4IR7bkAWRnjesN/S2iWseyHtzcwWClMad
	d+V03xkmEQKBcAQ8KFL5MzuMSHlz59Gdl4D85Ss6au2rKMs12JSfcgHnU1KDf8bKE9HK7Ek42Ql
	H9T8xgzkAW63DFA3rMDgwobCjnMFw7JanJdmPDKJrAx3vyidDz7KMB6Y+C+KxBoQbeU9nnHYA6I
	m99opYV3UcqUzU0YeSo+Zn0W+LmYVn4ZWsJTErFoFImhXd1B2DeGxbySsYUnqpEwO267kEK0FgK
	qa7FG4++gSeDwkxN3p1Sb4KURYRk9q/ZFP0h41VebseMaNDnypSKbjCe7yQOVmB+
X-Received: by 2002:a05:600c:840e:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4a35ac3f101mr186673565e9.3.1793104951339;
        Tue, 27 Oct 2026 05:42:31 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm284210045e9.6.2026.10.27.05.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:42:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 13:42:30 +0100
Message-Id: <DMFMNMA1DKKK.3FBS764527ECC@smile.fr>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Bruce Ashfield"
 <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
 <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
 <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr>
 <CADkTA4Njr1sezPZTZh=CY1Nay4RNtLO5Lmi=vg56CUUsqgsW8A@mail.gmail.com>
 <DM8WX2CJGLU6.1AKN2H7P8G9GS@smile.fr>
In-Reply-To: <DM8WX2CJGLU6.1AKN2H7P8G9GS@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248745

On Mon Oct 19, 2026 at 5:16 PM CEST, Yoann Congal wrote:
> On Mon Oct 19, 2026 at 4:43 PM CEST, Bruce Ashfield wrote:
>> On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>>
>>> On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
>>> > On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal@s=
mile.fr>
>>> wrote:
>>> >
>>> >> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
>>> >> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
>>> >> lists.openembedded.org wrote:
>>> >> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> >> >>
>>> >> >> Updating linux-yocto/6.6 to the latest korg -stable release that
>>> >> comprises
>>> >> >> the following commits:
>>> >> >>
>>> >> >>     79643295eba17 Linux 6.6.157
>>> >> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog=
 is
>>> >> exceeded
>>> >> >>     [...]
>>> >> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for
>>> allocate
>>> >> vs populate"
>>> >> >>
>>> >> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> >> >> ---
>>> >> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>>> >> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>>> >> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28
>>> +++++++++----------
>>> >> >>  3 files changed, 20 insertions(+), 20 deletions(-)
>>> >> >
>>> >> > Hello Bruce,
>>> >> >
>>> >> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
>>> >> > lttng ptest failure:
>>> >> >
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/460=
4
>>> >> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
>>> >> 11:38:31+00:00
>>> >> >
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/457=
7
>>> >> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-=
21
>>> >> 14:57:16+00:00
>>> >> >
>>> >> >
>>> >>
>>> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux=
86-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.2026092111=
0838
>>> >> :
>>> >> > (only one of each message):
>>> >> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
>>> >>
>>> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.z=
SA9mh
>>> >> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
>>> >> ./tools/base-path//load-stream-extra-path.lttng
>>> >> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
>>> >> ./tools/save-load//load-42.lttng
>>> >> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
>>> >> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command w=
ith
>>> >> option load-42
>>> >> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list comma=
nd
>>> >> with option yTVkM2lxbFoDS7Nu
>>> >> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng
>>> enable-rotation
>>> >> size XML
>>> >> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng
>>> enable-rotation
>>> >> timer XML
>>> >> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
>>> >> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML
>>> after
>>> >> load
>>> >> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for sessio=
n
>>> >> load-stream-extra-path
>>> >> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is
>>> valid
>>> >> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger m=
i is
>>> >> valid
>>> >> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace pat=
h is
>>> >> valid
>>> >> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
>>> >> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
>>> >> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
>>> >> > |FAIL: tools/base-path/test_ust 38 - Destroy session
>>> >> load-stream-extra-path
>>> >> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
>>> >> yTVkM2lxbFoDS7Nu
>>> >> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
>>> >> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotat=
ion
>>> >> size value in list XML after load
>>> >> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event
>>> tp:tptest
>>> >> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
>>> >> load-stream-extra-path
>>> >> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe
>>> listing
>>> >> >
>>> >> > Any ideas?
>>> >> >
>>> >> > Thanks!
>>> >>
>>> >> Hello Bruce,
>>> >>
>>> >> Gentle ping on the above upgrade failure.
>>> >>
>>> >> Do you have time to look at this? If you don't, we'll have organize =
to
>>> >> find other resources, we can't not update the kernel.
>>> >>
>>> >
>>> > I'll have time next week, but I can't run the test images locally, so
>>> I'll
>>> > need to come up with my
>>> > own tests :)
>>>
>>> Awesome, thanks Bruce!
>>>
>>
>>
>> I bumped -stable again, and when I run the lttng ptests against that
>> kernel, I have all tests passing.
>>
>> So either something in that kernel update fixed it, or I'm doing somethi=
ng
>> wrong.
>>
>> Did you see this once ? or consistently ?
>
> Twice (x86-64 and arm64) but during the same a-full build:
> * https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/460=
4
>   qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21 11:38:=
31+00:00
> * https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/457=
7
>   qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21 14=
:57:16+00:00
>
> Then, I removed the patch from the branch.
>
>> There are some AB-INT bugs that you (among others) have been tracking:
>>
>>   - 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools ptes=
t timeout
>>   - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure:
>> tools/config-directory/test_config.py
>>   - 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn't login into seria=
l console
>> as root using blank password
>>
>> Could it be one of those ?
>
> I know I've looked through existing bugs and did not find a matching
> one. But, given the fact that it happened twice during the same a-full
> on 2 different architectures, I don't think it was an AB-INT.
>
>> I'll send my stable updates later today, and maybe we can run them again=
 to
>> see if you get the same passes.
>
> Happy to. I usually do 2-3 a-full per review cycles. If the
> lttng-tools ptests are green, I'll consider this fixed and take the
> kernel upgrade patch.
>
> Thanks!

Hi Bruce,

Can you send the linux-yocto/6.6 upgrades for scarthgap "soon-ish"? I've
started a scarthgap review cycle and I would like to include the kernel
upgrade in it if possible.

Thanks!
--=20
Yoann Congal
Smile ECS
