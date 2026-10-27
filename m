Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19648.1793109563251679268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ns9UfYcq;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2501174f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793109561; x=1793714361; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SEpHR32qLTpqj+5sF60ODrXwXKsQHyPJ43M6ccKYalQ=;
        b=Ns9UfYcq3o+XzRw8LJd92wHXLsUCtRpK8unFgGLPcUlKVMHuhLuzQXbeWWn+Aazpzy
         kQWGtC9yHiG+1Pm08ByGIpSS+3VFLI3LX/0gnRXHQX+vH+Q17rSGJQhtJ1cvgXnvfWQh
         8aTMnwAq998CC85vdAAhLOVRyqT5HdJtIoyfUH4Oh7tyLqxa2C2QN82TILuFpAqubr/i
         laxfNaA9v/UBKZFiESYlJ+Obof2xa7UffTQO/CzBkWkk478ynxTNyKrjiJRLnza8JlzF
         3PdHiCXH3eXjendbvn2haL631JIsMbP62DB/+B35CT6A9FdvTHayZxJX10g4LkARg2VE
         P9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109561; x=1793714361;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEpHR32qLTpqj+5sF60ODrXwXKsQHyPJ43M6ccKYalQ=;
        b=ARXJJVYXzWJOzpPSlQYJMJV6mWCCv4Mc0Gh2zz8s/mQ/NwYkTEUqashX99dH6u4gCt
         vqhbEjjg5H+pxNE8hFlojaeiPP57V6F4/beYt0lZcVKM+DLrIMCzzmak5yxYVU5Wc6tb
         /OFO6joDH1KJF90cMNhk5Wm/mCuzFujuw9TMzJ2GSIh1kzGoYANtztNd4vV/CDMHk/zR
         dsZ14W2yCs57xLgd7Bl2f4Xzi54GrAfvXWy0d7J9Cjgvd7Gz4t/nmaVs8C20fmgp9LVM
         KnU5LHm+FOj9XSWmMbrteWe3XWBKW3/iYmt8trL2lwIbr/d9cVCl8zLG9xCDTi3eDa5i
         Rm/Q==
X-Gm-Message-State: AFq9FYL2zfJdeT7fqRmriund8OqGfmoe9C6sg3HNNHk5ZH1UZ9RS8qF3
	FVgGGMaiLkpOCvblz0Xu82fhh6uRl4C9ZnF0QEpEGBH+1TLsXzDY3suzvJPHzAXvasnXb0XTWw/
	X+OMGye+B0Q==
X-Gm-Gg: AYBFou1xaAH3ijIEaG4OCmKTaIwpJD9EgdkE6FWYAGwYighjCr/Ejw9aKe3eqA2ZhxS
	R9kM6zRXh+g+fueQQVJ3EumeQxOk8Cv+Op4z8srVdG7GhaXU58Jn/kdwBS+IboHt92vLa2Ptjcr
	ogfoKnsx7xMD4oYCBNXnmrtnN8PhARjpSGUF4mb2xBy87av2gRPPBmzBAycaBVG7WgfgLz1fifI
	qrirnfmPrg3FWxsU+9AlgGmk3lRFe0TToMRAFUOGrRz0kpk6DBR6md1s3w57CzgDA9VcOvM++5C
	9vRnnWSw0+qc6kOYAfyJXGIEUPTi7ExziDFRs2/aARy/JfMSqH/CwTeDy416G7q7FKV3UZyg2ic
	Ceovb2glGhezXDYkuxnjxRBUfCxqv6VFFeSgDzLshtfSFpoS/qfmJ2JXOrPJ4ay9F+o3VP85CL3
	CpveknAYrfEM+E3QHI+iHA8lyFopruJTFpxpseMX2wAu2q1OXW7mokV6LbxZP9YK4zdXrZ26Qzk
	d8O8ITu7DT0kbi6K19Ii3lYNvD+gQ51G/BsSOrVoZkbM/OkqAz3N6UQ3PZLF8ylNqlrtzYoue43
	ZmQbXIy9TeK1Ti16z/Es2i0VO8xisg38InXNtZVszDEJ
X-Received: by 2002:a05:6000:22c3:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e4f1b6743mr10904401f8f.26.1793109561165;
        Tue, 27 Oct 2026 06:59:21 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm24264788f8f.51.2026.10.27.06.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:59:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 14:59:20 +0100
Message-Id: <DMFOAG1XU9N9.2NAZB8KTSZUCQ@smile.fr>
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
 <DM8WX2CJGLU6.1AKN2H7P8G9GS@smile.fr> <DMFMNMA1DKKK.3FBS764527ECC@smile.fr>
 <CADkTA4PabVLSkjxCPH4ehgquo2EJt+oEuBvmex5iWgv2sKnsfA@mail.gmail.com>
In-Reply-To: <CADkTA4PabVLSkjxCPH4ehgquo2EJt+oEuBvmex5iWgv2sKnsfA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 13:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248748

On Tue Oct 27, 2026 at 2:22 PM CET, Bruce Ashfield wrote:
> On Tue, Oct 27, 2026 at 8:42=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> On Mon Oct 19, 2026 at 5:16 PM CEST, Yoann Congal wrote:
>> > On Mon Oct 19, 2026 at 4:43 PM CEST, Bruce Ashfield wrote:
>> >> On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal <yoann.congal@sm=
ile.fr>
>> wrote:
>> >>
>> >>> On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
>> >>> > On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.conga=
l@smile.fr
>> >
>> >>> wrote:
>> >>> >
>> >>> >> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
>> >>> >> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
>> >>> >> lists.openembedded.org wrote:
>> >>> >> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >>> >> >>
>> >>> >> >> Updating linux-yocto/6.6 to the latest korg -stable release th=
at
>> >>> >> comprises
>> >>> >> >> the following commits:
>> >>> >> >>
>> >>> >> >>     79643295eba17 Linux 6.6.157
>> >>> >> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect
>> backlog is
>> >>> >> exceeded
>> >>> >> >>     [...]
>> >>> >> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for
>> >>> allocate
>> >>> >> vs populate"
>> >>> >> >>
>> >>> >> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >>> >> >> ---
>> >>> >> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>> >>> >> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>> >>> >> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28
>> >>> +++++++++----------
>> >>> >> >>  3 files changed, 20 insertions(+), 20 deletions(-)
>> >>> >> >
>> >>> >> > Hello Bruce,
>> >>> >> >
>> >>> >> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers=
 a
>> >>> >> > lttng ptest failure:
>> >>> >> >
>> >>>
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
>> >>> >> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-2=
1
>> >>> >> 11:38:31+00:00
>> >>> >> >
>> >>>
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
>> >>> >> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at
>> 2026-09-21
>> >>> >> 14:57:16+00:00
>> >>> >> >
>> >>> >> >
>> >>> >>
>> >>>
>> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux8=
6-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.20260921110=
838
>> >>> >> :
>> >>> >> > (only one of each message):
>> >>> >> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
>> >>> >>
>> >>>
>> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zS=
A9mh
>> >>> >> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
>> >>> >> ./tools/base-path//load-stream-extra-path.lttng
>> >>> >> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
>> >>> >> ./tools/save-load//load-42.lttng
>> >>> >> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
>> >>> >> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list comman=
d
>> with
>> >>> >> option load-42
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list
>> command
>> >>> >> with option yTVkM2lxbFoDS7Nu
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng
>> >>> enable-rotation
>> >>> >> size XML
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng
>> >>> enable-rotation
>> >>> >> timer XML
>> >>> >> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XM=
L
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list X=
ML
>> >>> after
>> >>> >> load
>> >>> >> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for
>> session
>> >>> >> load-stream-extra-path
>> >>> >> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi =
is
>> >>> valid
>> >>> >> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigge=
r
>> mi is
>> >>> >> valid
>> >>> >> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace
>> path is
>> >>> >> valid
>> >>> >> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
>> >>> >> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to k=
ill
>> >>> >> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
>> >>> >> > |FAIL: tools/base-path/test_ust 38 - Destroy session
>> >>> >> load-stream-extra-path
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
>> >>> >> yTVkM2lxbFoDS7Nu
>> >>> >> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
>> >>> >> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right
>> rotation
>> >>> >> size value in list XML after load
>> >>> >> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event
>> >>> tp:tptest
>> >>> >> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
>> >>> >> load-stream-extra-path
>> >>> >> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace prob=
e
>> >>> listing
>> >>> >> >
>> >>> >> > Any ideas?
>> >>> >> >
>> >>> >> > Thanks!
>> >>> >>
>> >>> >> Hello Bruce,
>> >>> >>
>> >>> >> Gentle ping on the above upgrade failure.
>> >>> >>
>> >>> >> Do you have time to look at this? If you don't, we'll have organi=
ze
>> to
>> >>> >> find other resources, we can't not update the kernel.
>> >>> >>
>> >>> >
>> >>> > I'll have time next week, but I can't run the test images locally,=
 so
>> >>> I'll
>> >>> > need to come up with my
>> >>> > own tests :)
>> >>>
>> >>> Awesome, thanks Bruce!
>> >>>
>> >>
>> >>
>> >> I bumped -stable again, and when I run the lttng ptests against that
>> >> kernel, I have all tests passing.
>> >>
>> >> So either something in that kernel update fixed it, or I'm doing
>> something
>> >> wrong.
>> >>
>> >> Did you see this once ? or consistently ?
>> >
>> > Twice (x86-64 and arm64) but during the same a-full build:
>> > *
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
>> >   qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
>> 11:38:31+00:00
>> > *
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
>> >   qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21
>> 14:57:16+00:00
>> >
>> > Then, I removed the patch from the branch.
>> >
>> >> There are some AB-INT bugs that you (among others) have been tracking=
:
>> >>
>> >>   - 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools p=
test
>> timeout
>> >>   - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure:
>> >> tools/config-directory/test_config.py
>> >>   - 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn't login into se=
rial
>> console
>> >> as root using blank password
>> >>
>> >> Could it be one of those ?
>> >
>> > I know I've looked through existing bugs and did not find a matching
>> > one. But, given the fact that it happened twice during the same a-full
>> > on 2 different architectures, I don't think it was an AB-INT.
>> >
>> >> I'll send my stable updates later today, and maybe we can run them
>> again to
>> >> see if you get the same passes.
>> >
>> > Happy to. I usually do 2-3 a-full per review cycles. If the
>> > lttng-tools ptests are green, I'll consider this fixed and take the
>> > kernel upgrade patch.
>> >
>> > Thanks!
>>
>> Hi Bruce,
>>
>> Can you send the linux-yocto/6.6 upgrades for scarthgap "soon-ish"? I've
>> started a scarthgap review cycle and I would like to include the kernel
>> upgrade in it if possible.
>>
>
> I've been hunting an intermittent issue, and just did another -stable bum=
p
> yesterday. Once I sort those out, I'll send the changes.

Sounds good.

Thanks Bruce!
--=20
Yoann Congal
Smile ECS

