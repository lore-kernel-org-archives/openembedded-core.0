Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18910.1793107361480057338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YaK97skK;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab3d3c5761so36097247b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 06:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793107360; cv=none;
        d=google.com; s=arc-20260327;
        b=RnV+0ew2KZEphPkId22Bdv6rx0CUcZsSvYOWY8KJzMg9QiqrbixloutaTIaplE4AuL
         o/iwnf0pl/M2Lp6+lD4IXljOf2sdXjX1rlQN7YDKYBI4B4kNnzzHZu7EgsQ36M4TzI87
         SFA0I0ood5tU5+6OZrxNOdkVwTGGqkgpVVgubzshGMbNbZdMeh+R39DldF+mybESRLF6
         HNhn+GunT4ojylduJCiTHz8fwjH2Of8buu7ujNxMqfvbPKy62/rTm+d7tiecafyHymSy
         UV1bM64UI7EFwDGmnIvjc0mgxjyCTGgaI9jvuvUhxH5jzEPZ8QuqvsqwVte4LFVxsXjt
         TQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BsGKKINl4tB17M8G1xlQCk0vYKXG1IFV22CLEKoWlUo=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=Nopgn/JCD0dcDVvmMh7UVk2lWC6WqtDjGfd46CFkVqeXalO/z7FSBAOYKnD5IH7njj
         +7GUwOEwva1gU9OdtnSalRSGLYqqFDSsI07Y5j8Sj9HrPlAOoLqFdB1RQI6TJaZoLFuI
         4Q2ti8uVXxXN0GSuDuDuM8wghGqes2CpdP6LflYsXjqel7C6Yy8MvocufyBLPz/3vTJY
         aupvPEfqHfaSQgawnSVjjtDoEZcT/afizvYtvsLxi0vSKupmdqKpzq3RBBoSbx1jm572
         +aRD7BXo9XBlGhsUtO3hCOdtGjrrP8gKFDsZuySGh0KwMk23K53uv5QnZSrI+toOBty7
         sGNQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107360; x=1793712160; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsGKKINl4tB17M8G1xlQCk0vYKXG1IFV22CLEKoWlUo=;
        b=YaK97skKaqWusFIRUpVhsYWl+EhZL5K9DjnnUhpsTdxazZ0qb9MF/8NaNeORY4ZB+6
         FQOiMomP3txQ+vTaVD8WgIOfFcn38jAt0tbpEcUk4iI5K2tb5nhpaKSZGXgVJQm2NSDE
         OvqLow+7HPGSlr02Z/UryH3u0sw3ubQhm5XQ65EVYX4FccbBzVaWcLYYrLsA2zD0/ToC
         TneK8dORfzY3JwXH7dIO8mx4gb4I6RCroC62QFNZ0bYKjEsHOrNMc4hQ+StDpdf9t3fH
         Yta7y8X5rvhPc1xs1iLAh2eUM8E3J2RhzFMQyb8IirH45E6nQdNg91vqYWDZx0X7zyoU
         jCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107360; x=1793712160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BsGKKINl4tB17M8G1xlQCk0vYKXG1IFV22CLEKoWlUo=;
        b=hCaZrPNVYSjMlsTyujGTi51XcLBSM+nO8/ivanK3210xOEwz2SjzTTiqkpHBYSWUhn
         U+yE/b7/NsWXuaneQ9lJbXh054A1RWY81JVO73QFV0Fp3R/FVapdiqrwnNcR8hBwLXPb
         boYKR9NoqDf+plAqc7ujJr0/QPgidt8u/bHfPSYgfNKJBLDtg64lB5TAu782tj9NBpbU
         OjVi2Hnl3UFQCjLyzic0xWaZ/aIdzRvb1Q1ImebWwZ+q40KiCZj1wfS/du+gDlPZ97TP
         nuRbuOsewAggtHFCrD0wYlqUuk+8AvkaVzAAQjJEa0XXoo94GJHSrXl9INdj1IdtZjfH
         t07w==
X-Gm-Message-State: AFq9FYK01mvkTSBLfKffiyw9R+3ZyZ16apJvACmtiaJYQYpSoW3k3cg3
	pGHbOrwEexzBcq27rhnPEK3EMC6Lwkrh9pKK+aAgOX1ISJzpGW5VgI2ogK+lQFlLBDicIQfAhaR
	P8FHAcSnstZuM3opFBWjuNgnJZgQOR8Y=
X-Gm-Gg: AYBFou1KmTid+sOcjjgwqqqVsNkwNA+3zJr97uyHnJCNz7acxM0FZqzVvjDVKjOd/0V
	43c/Jv+NHbLp6v8ksHO4SPmctHRX4ITaJYN5sPrVLa9zYWo0TrVpO45FWMFlD1I7f6zWEXq71Pm
	EGjxQQ1NYtev2x+O1keEZELoI++YOwIznvBbPbotLBmg3O0xXcYQf1M1UKMm177TjD7dQRle5gt
	025fajkjlrSCnvNWLK75E58VP4froP/ftBtwvtchNN5A3li2HOVHlT+yYRb8qX1FQgsIrXpVHzT
	eAOJrl3JU4roo15Glc8aRzvspu9KqJPVXEbC1oVJGS6XT60eRrM8iba7xN5csj38JfVcquZ7gdu
	6AGN2S5AFBVi8qMsVGABcL5vh7fVQ35MOdGhc0Q7MWCKKUt6DRPPW8ZJ4ncBtT40nYZR8nS1rjb
	eyUlTKVND4v0yNjXRo4t8khIqV7rGYusDxCTYKixL47u7LIiLPOSNTK1o=
X-Received: by 2002:a05:690c:6d81:b0:8a9:9a2e:e34f with SMTP id
 00721157ae682-8b166bb19c6mr82760297b3.13.1793107360205; Tue, 27 Oct 2026
 06:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr> <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
 <CADkTA4PdELZG3bQYeDXvMRc2qDw+6b5yNot2Fvjjq4gY3s_Wxg@mail.gmail.com>
 <DM57Z4HX0NXW.27RXSRT7ZD21K@smile.fr> <CADkTA4Njr1sezPZTZh=CY1Nay4RNtLO5Lmi=vg56CUUsqgsW8A@mail.gmail.com>
 <DM8WX2CJGLU6.1AKN2H7P8G9GS@smile.fr> <DMFMNMA1DKKK.3FBS764527ECC@smile.fr>
In-Reply-To: <DMFMNMA1DKKK.3FBS764527ECC@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Oct 2026 09:22:24 -0400
X-Gm-Features: AclHuK8JSGUqhN9j6YhAy1XOuORMZ5Mta9OTnmcor2YSlfgkurDAb5q1VBWA1Wk
Message-ID: <CADkTA4PabVLSkjxCPH4ehgquo2EJt+oEuBvmex5iWgv2sKnsfA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003fd0df065ed25755"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 13:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248747

--0000000000003fd0df065ed25755
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:42=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Mon Oct 19, 2026 at 5:16 PM CEST, Yoann Congal wrote:
> > On Mon Oct 19, 2026 at 4:43 PM CEST, Bruce Ashfield wrote:
> >> On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr>
> wrote:
> >>
> >>> On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:
> >>> > On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal <yoann.congal=
@smile.fr
> >
> >>> wrote:
> >>> >
> >>> >> On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
> >>> >> > On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via
> >>> >> lists.openembedded.org wrote:
> >>> >> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> >> >>
> >>> >> >> Updating linux-yocto/6.6 to the latest korg -stable release tha=
t
> >>> >> comprises
> >>> >> >> the following commits:
> >>> >> >>
> >>> >> >>     79643295eba17 Linux 6.6.157
> >>> >> >>     32e598324edc3 nvmet-rdma: fix queue leak when connect
> backlog is
> >>> >> exceeded
> >>> >> >>     [...]
> >>> >> >>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for
> >>> allocate
> >>> >> vs populate"
> >>> >> >>
> >>> >> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> >> >> ---
> >>> >> >>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >>> >> >>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >>> >> >>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28
> >>> +++++++++----------
> >>> >> >>  3 files changed, 20 insertions(+), 20 deletions(-)
> >>> >> >
> >>> >> > Hello Bruce,
> >>> >> >
> >>> >> > I think either this 6.6.157 upgrade or the 6.6.156 one triggers =
a
> >>> >> > lttng ptest failure:
> >>> >> >
> >>>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
> >>> >> > qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
> >>> >> 11:38:31+00:00
> >>> >> >
> >>>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
> >>> >> > qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at
> 2026-09-21
> >>> >> 14:57:16+00:00
> >>> >> >
> >>> >> >
> >>> >>
> >>>
> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86=
-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.202609211108=
38
> >>> >> :
> >>> >> > (only one of each message):
> >>> >> > |FAIL: kernel/test_userspace_probe 91 - Load command with opts:
> >>> >>
> >>>
> --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA=
9mh
> >>> >> > |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i
> >>> >> ./tools/base-path//load-stream-extra-path.lttng
> >>> >> > |FAIL: tools/save-load/test_load 2 - Load command with opts: -i
> >>> >> ./tools/save-load//load-42.lttng
> >>> >> > |FAIL: tools/rotation/test_ust 101 - App is un-registered
> >>> >> > |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command
> with
> >>> >> option load-42
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list
> command
> >>> >> with option yTVkM2lxbFoDS7Nu
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng
> >>> enable-rotation
> >>> >> size XML
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng
> >>> enable-rotation
> >>> >> timer XML
> >>> >> > |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XM=
L
> >>> after
> >>> >> load
> >>> >> > |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for
> session
> >>> >> load-stream-extra-path
> >>> >> > |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi i=
s
> >>> valid
> >>> >> > |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger
> mi is
> >>> >> valid
> >>> >> > |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace
> path is
> >>> >> valid
> >>> >> > |FAIL: tools/save-load/test_autoload 1 - Start session daemon
> >>> >> > |FAIL: tools/save-load/test_autoload 3 - No session daemon to ki=
ll
> >>> >> > |FAIL: tools/save-load/test_load 3 - Destroy session load-42
> >>> >> > |FAIL: tools/base-path/test_ust 38 - Destroy session
> >>> >> load-stream-extra-path
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session
> >>> >> yTVkM2lxbFoDS7Nu
> >>> >> > |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
> >>> >> > |FAIL: tools/rotation/test_save_load_mi 20 - Found the right
> rotation
> >>> >> size value in list XML after load
> >>> >> > |FAIL: tools/base-path/test_ust 40 - Validate trace for event
> >>> tp:tptest
> >>> >> > |FAIL: tools/base-path/test_ust 36 - Start tracing for session
> >>> >> load-stream-extra-path
> >>> >> > |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe
> >>> listing
> >>> >> >
> >>> >> > Any ideas?
> >>> >> >
> >>> >> > Thanks!
> >>> >>
> >>> >> Hello Bruce,
> >>> >>
> >>> >> Gentle ping on the above upgrade failure.
> >>> >>
> >>> >> Do you have time to look at this? If you don't, we'll have organiz=
e
> to
> >>> >> find other resources, we can't not update the kernel.
> >>> >>
> >>> >
> >>> > I'll have time next week, but I can't run the test images locally, =
so
> >>> I'll
> >>> > need to come up with my
> >>> > own tests :)
> >>>
> >>> Awesome, thanks Bruce!
> >>>
> >>
> >>
> >> I bumped -stable again, and when I run the lttng ptests against that
> >> kernel, I have all tests passing.
> >>
> >> So either something in that kernel update fixed it, or I'm doing
> something
> >> wrong.
> >>
> >> Did you see this once ? or consistently ?
> >
> > Twice (x86-64 and arm64) but during the same a-full build:
> > *
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
> >   qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21
> 11:38:31+00:00
> > *
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
> >   qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21
> 14:57:16+00:00
> >
> > Then, I removed the patch from the branch.
> >
> >> There are some AB-INT bugs that you (among others) have been tracking:
> >>
> >>   - 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: lttng-tools pt=
est
> timeout
> >>   - 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest failure:
> >> tools/config-directory/test_config.py
> >>   - 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn't login into ser=
ial
> console
> >> as root using blank password
> >>
> >> Could it be one of those ?
> >
> > I know I've looked through existing bugs and did not find a matching
> > one. But, given the fact that it happened twice during the same a-full
> > on 2 different architectures, I don't think it was an AB-INT.
> >
> >> I'll send my stable updates later today, and maybe we can run them
> again to
> >> see if you get the same passes.
> >
> > Happy to. I usually do 2-3 a-full per review cycles. If the
> > lttng-tools ptests are green, I'll consider this fixed and take the
> > kernel upgrade patch.
> >
> > Thanks!
>
> Hi Bruce,
>
> Can you send the linux-yocto/6.6 upgrades for scarthgap "soon-ish"? I've
> started a scarthgap review cycle and I would like to include the kernel
> upgrade in it if possible.
>

I've been hunting an intermittent issue, and just did another -stable bump
yesterday. Once I sort those out, I'll send the changes.

Bruce



>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003fd0df065ed25755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2026 at 8:42=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Mon Oct 19, 2026 at 5:16 PM CEST, Yoann Congal wrote:<br=
>
&gt; On Mon Oct 19, 2026 at 4:43 PM CEST, Bruce Ashfield wrote:<br>
&gt;&gt; On Thu, Oct 15, 2026 at 3:05=E2=80=AFAM Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Wed Oct 14, 2026 at 6:55 PM CEST, Bruce Ashfield wrote:<br>
&gt;&gt;&gt; &gt; On Wed, Oct 14, 2026 at 10:31=E2=80=AFAM Yoann Congal &lt=
;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@sm=
ile.fr</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wr=
ote:<br>
&gt;&gt;&gt; &gt;&gt; &gt; On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfi=
eld via<br>
&gt;&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;=
<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt; Updating linux-yocto/6.6 to the latest korg =
-stable release that<br>
&gt;&gt;&gt; &gt;&gt; comprises<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt; the following commits:<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A079643295eba17 Linux 6.6.1=
57<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A032e598324edc3 nvmet-rdma:=
 fix queue leak when connect backlog is<br>
&gt;&gt;&gt; &gt;&gt; exceeded<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A073b7a11814838 Revert &quo=
t;arm64: mm: Don&#39;t remap pgtables for<br>
&gt;&gt;&gt; allocate<br>
&gt;&gt;&gt; &gt;&gt; vs populate&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt; ---<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yoct=
o-rt_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 .../linux/<a href=3D"http://linux-yoct=
o-tiny_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"h=
ttp://linux-yocto_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_=
6.6.bb</a>=C2=A0 | 28<br>
&gt;&gt;&gt; +++++++++----------<br>
&gt;&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 3 files changed, 20 insertions(+), 20 =
deletions(-)<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Hello Bruce,<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; I think either this 6.6.157 upgrade or the 6.6.1=
56 one triggers a<br>
&gt;&gt;&gt; &gt;&gt; &gt; lttng ptest failure:<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/bu=
ilders/73/builds/4604" rel=3D"noreferrer" target=3D"_blank">https://autobui=
lder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; qemux86-64-ptest debian11-vk-3 scarthgap complet=
ed at 2026-09-21<br>
&gt;&gt;&gt; &gt;&gt; 11:38:31+00:00<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/bu=
ilders/61/builds/4577" rel=3D"noreferrer" target=3D"_blank">https://autobui=
lder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap com=
pleted at 2026-09-21<br>
&gt;&gt;&gt; &gt;&gt; 14:57:16+00:00<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260921-=
71/testresults/qemux86-64-ptest/core-image-ptest-lttng-tools/log.do_testima=
ge.311077.20260921110838" rel=3D"noreferrer" target=3D"_blank">https://valk=
yrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86-64-ptest/core=
-image-ptest-lttng-tools/log.do_testimage.311077.20260921110838</a><br>
&gt;&gt;&gt; &gt;&gt; :<br>
&gt;&gt;&gt; &gt;&gt; &gt; (only one of each message):<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: kernel/test_userspace_probe 91 - Load com=
mand with opts:<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; --input-path=3D/tmp/tmp.test_userspace_probe_save_load_elf_tra=
ce_path.zSA9mh<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 35 - Load comman=
d with opts: -i<br>
&gt;&gt;&gt; &gt;&gt; ./tools/base-path//load-stream-extra-path.lttng<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/save-load/test_load 2 - Load comman=
d with opts: -i<br>
&gt;&gt;&gt; &gt;&gt; ./tools/save-load//load-42.lttng<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_ust 101 - App is un-r=
egistered<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 2 - Lttng-t=
ool list command with<br>
&gt;&gt;&gt; &gt;&gt; option load-42<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 17 - Ltt=
ng-tool list command<br>
&gt;&gt;&gt; &gt;&gt; with option yTVkM2lxbFoDS7Nu<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 8 - Vali=
d lttng<br>
&gt;&gt;&gt; enable-rotation<br>
&gt;&gt;&gt; &gt;&gt; size XML<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 5 - Vali=
d lttng<br>
&gt;&gt;&gt; enable-rotation<br>
&gt;&gt;&gt; &gt;&gt; timer XML<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/relayd-grouping/test_ust 120 - Vali=
d lttng list XML<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 18 - Val=
id lttng list XML<br>
&gt;&gt;&gt; after<br>
&gt;&gt;&gt; &gt;&gt; load<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 37 - Stop lttng =
tracing for session<br>
&gt;&gt;&gt; &gt;&gt; load-stream-extra-path<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/trigger/test_add_trigger_cli 293 - =
add-trigger mi is<br>
&gt;&gt;&gt; valid<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/trigger/test_remove_trigger_cli 20 =
- remove-trigger mi is<br>
&gt;&gt;&gt; &gt;&gt; valid<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 39 - UST per-uid=
 network trace path is<br>
&gt;&gt;&gt; &gt;&gt; valid<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 1 - Start s=
ession daemon<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/save-load/test_autoload 3 - No sess=
ion daemon to kill<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/save-load/test_load 3 - Destroy ses=
sion load-42<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 38 - Destroy ses=
sion<br>
&gt;&gt;&gt; &gt;&gt; load-stream-extra-path<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 21 - Des=
troy session<br>
&gt;&gt;&gt; &gt;&gt; yTVkM2lxbFoDS7Nu<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/mi/test_mi 3 - MI test: Version xsd=
 validation<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/rotation/test_save_load_mi 20 - Fou=
nd the right rotation<br>
&gt;&gt;&gt; &gt;&gt; size value in list XML after load<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 40 - Validate tr=
ace for event<br>
&gt;&gt;&gt; tp:tptest<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: tools/base-path/test_ust 36 - Start traci=
ng for session<br>
&gt;&gt;&gt; &gt;&gt; load-stream-extra-path<br>
&gt;&gt;&gt; &gt;&gt; &gt; |FAIL: kernel/test_userspace_probe 92 - Validate=
 userspace probe<br>
&gt;&gt;&gt; listing<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Any ideas?<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Thanks!<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Hello Bruce,<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Gentle ping on the above upgrade failure.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Do you have time to look at this? If you don&#39;t, w=
e&#39;ll have organize to<br>
&gt;&gt;&gt; &gt;&gt; find other resources, we can&#39;t not update the ker=
nel.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I&#39;ll have time next week, but I can&#39;t run the tes=
t images locally, so<br>
&gt;&gt;&gt; I&#39;ll<br>
&gt;&gt;&gt; &gt; need to come up with my<br>
&gt;&gt;&gt; &gt; own tests :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Awesome, thanks Bruce!<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I bumped -stable again, and when I run the lttng ptests against th=
at<br>
&gt;&gt; kernel, I have all tests passing.<br>
&gt;&gt;<br>
&gt;&gt; So either something in that kernel update fixed it, or I&#39;m doi=
ng something<br>
&gt;&gt; wrong.<br>
&gt;&gt;<br>
&gt;&gt; Did you see this once ? or consistently ?<br>
&gt;<br>
&gt; Twice (x86-64 and arm64) but during the same a-full build:<br>
&gt; * <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders=
/73/builds/4604" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/valkyrie/?#/builders/73/builds/4604</a><br>
&gt;=C2=A0 =C2=A0qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026=
-09-21 11:38:31+00:00<br>
&gt; * <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders=
/61/builds/4577" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/valkyrie/?#/builders/61/builds/4577</a><br>
&gt;=C2=A0 =C2=A0qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at =
2026-09-21 14:57:16+00:00<br>
&gt;<br>
&gt; Then, I removed the patch from the branch.<br>
&gt;<br>
&gt;&gt; There are some AB-INT bugs that you (among others) have been track=
ing:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0- 16309 =E2=80=94 ACCEPTED: [scarthgap] AB-INT PTEST: =
lttng-tools ptest timeout<br>
&gt;&gt;=C2=A0 =C2=A0- 16139 =E2=80=94 AB-INT PTEST: lttng-tools ptest fail=
ure:<br>
&gt;&gt; tools/config-directory/test_config.py<br>
&gt;&gt;=C2=A0 =C2=A0- 16358 =E2=80=94 AB-INT PTEST: lttng-tools: Couldn&#3=
9;t login into serial console<br>
&gt;&gt; as root using blank password<br>
&gt;&gt;<br>
&gt;&gt; Could it be one of those ?<br>
&gt;<br>
&gt; I know I&#39;ve looked through existing bugs and did not find a matchi=
ng<br>
&gt; one. But, given the fact that it happened twice during the same a-full=
<br>
&gt; on 2 different architectures, I don&#39;t think it was an AB-INT.<br>
&gt;<br>
&gt;&gt; I&#39;ll send my stable updates later today, and maybe we can run =
them again to<br>
&gt;&gt; see if you get the same passes.<br>
&gt;<br>
&gt; Happy to. I usually do 2-3 a-full per review cycles. If the<br>
&gt; lttng-tools ptests are green, I&#39;ll consider this fixed and take th=
e<br>
&gt; kernel upgrade patch.<br>
&gt;<br>
&gt; Thanks!<br>
<br>
Hi Bruce,<br>
<br>
Can you send the linux-yocto/6.6 upgrades for scarthgap &quot;soon-ish&quot=
;? I&#39;ve<br>
started a scarthgap review cycle and I would like to include the kernel<br>
upgrade in it if possible.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ve been hunting an inter=
mittent issue, and just did another -stable bump</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">yesterday. Once I sort those out, I&#39;l=
l send the changes.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003fd0df065ed25755--
