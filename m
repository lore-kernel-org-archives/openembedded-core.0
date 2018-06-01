Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A315774F93
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 06:37:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so720972wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 23:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=afRhO4rk0G9IevbtEmvQOM0umeUio7pRll5+T4AMEm0=;
	b=iakOPRcELqfda1eR9jm+AbtDFGVdkEoFFt1WscEhx5vH2pdxUAU6n+J5GWccGChW52
	yWgFiwt+AjYHJ781yRTbMIstkvxjrY8DEifQ5BBUBL2HzhfyDbGkYMdp85p/5+1q7a/k
	EK83L2uR5Q0gGEruvSdJvUqUQIy4krCbPTWL98oP3h9Fqx/RGVSnufM48yR/D65G0wfW
	MbklXbznTkXmQrPM/ro/3wk6iv9H58sJYPnrO8eGeIXUepoKNnWJbOmOlN9I755e5BcZ
	uRKwe4k+UhCSqyhpS/W64/I1EAOOdK0uXA3Ol/OjsAFqXF15IwnzdEyk3h8JgHD0l2H4
	PyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=afRhO4rk0G9IevbtEmvQOM0umeUio7pRll5+T4AMEm0=;
	b=jSNKCuleJfTDb4t2X4Sf8H4ghOaowAPkNcTm3N0W2LsTK2czUWReES/vdlwxe64+1w
	GJQJjgqwLlRJt1YnJVi4XiQlxDE6z+1aiAcM/ZJSDo+18+S7Yzae+55PF6Q9Ycd1L5Gx
	jUGrgUdf+o52CYeoYN986wxW0dn4yA8ONUzvKq4pwDMHMwR20ioHutkZ7my4YqVAZ8n7
	Fn3sBcseiGPbPxsgZTYaJM6tVfBy44YfSNM6Cf16k+zRmjKET/NoEy32GjVoUSChqg+v
	JKwofKQmnktdsEddAb0sKUDqeI96VZ9OR/wJHV9QAofySBUV/nIONRubCWpHxTi0KEnZ
	MQrA==
X-Gm-Message-State: ALKqPwe7GXGjkqfs8Ki8gAMrHZKwEM7hmmQWahmopsrY1A20TmuwJSly
	WgC7WVuaS/MQZC4RvnVJCFHPVq2EM/yhzuUQ0n4=
X-Google-Smtp-Source: ADUXVKLO/xsYjgZjWPYAP7dybICpbZ76UN1YS9VTNho8eX0cFOeV4j2Num2fyYhJs2s0gsLlbbGQx37jTMoHbSc1Bs0=
X-Received: by 2002:a1c:988d:: with SMTP id
	a135-v6mr1855101wme.79.1527835076800; 
	Thu, 31 May 2018 23:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
	<20180502143733.6303-2-Martin.Jansa@gmail.com>
	<CAJTo0LYvdpORbNFs4-gOn0QyPSZ3W8nQkZbX7w=C9t_WvTgCRw@mail.gmail.com>
	<CA+chaQcHdrPsQCJ94t+ifiiKfguuRirNQxY9c-KLfBeXEZqxrw@mail.gmail.com>
	<CA+chaQcRewrss+RQhhY2PEKJ_VHLyGBHrEOMR7gdFk346a2zQA@mail.gmail.com>
	<CA+chaQcq+7-XCNOqWcPNaMkXE-u-BhY0A=79ouHFRPh9NzCm8g@mail.gmail.com>
	<CA+chaQfkZ6DNwvSXrZGy7ZEDEkg7znsv4Uon8qgU7EEpe77Zjw@mail.gmail.com>
	<CAKmqyKPXxY=MOtevF7_dtkx_O+fxJinu6tguw5Vtvz4MWEfL_w@mail.gmail.com>
In-Reply-To: <CAKmqyKPXxY=MOtevF7_dtkx_O+fxJinu6tguw5Vtvz4MWEfL_w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Jun 2018 08:37:44 +0200
Message-ID: <CA+chaQc6=MZnVWHGV8s-XuAahdGWccFNiUnm=9Oj_qswbWxybQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemu: upgrade to 2.12.0
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
X-List-Received-Date: Fri, 01 Jun 2018 06:37:57 -0000
Content-Type: multipart/alternative; boundary="00000000000007374a056d8ed384"

--00000000000007374a056d8ed384
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yesterday I've tried to replay the end of the bisect and surprisingly I
wasn't seeing the hang with d4247ec2d79ef2477cb886fa688706b068119736.

With 2nd bad d4090306c8079ca3df426f82c493314c3537064e it hangs again.

So either I didn't wait long enough for qemu-i386 to finish (I mark it as
bad after it spends > 10mins inside qemu-i386 or the hang doesn't happen
reliably even with "bad" revision of qemu.

The revisions I'm trying are here:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/qemu-h=
ang

On Fri, Jun 1, 2018 at 2:01 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, May 31, 2018 at 8:41 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > I've finished the bisect today:
> >
> > qemu$ git bisect log
> > git bisect start
> > # good: [9f750794985d7386f088da941c76b73880b2b6c4] sev/i386: add
> > sev_get_capabilities()
> > git bisect good 9f750794985d7386f088da941c76b73880b2b6c4
> > # bad: [91c60f124e682a78c9a2ef951e8e58ebab6441d0] target/ppc: fix
> tlbsync to
> > check privilege level depending on GTSE
> > git bisect bad 91c60f124e682a78c9a2ef951e8e58ebab6441d0
> > # bad: [a57946ff2acb9c0d95c9f127914540586b0b8c21] Merge remote-tracking
> > branch 'remotes/awilliam/tags/vfio-update-20180313.0' into staging
> > git bisect bad a57946ff2acb9c0d95c9f127914540586b0b8c21
> > # good: [5bdd374347b873ab59b356a284494a8bc1664008] Merge remote-trackin=
g
> > branch 'remotes/bonzini/tags/for-upstream-sev' into staging
> > git bisect good 5bdd374347b873ab59b356a284494a8bc1664008
> > # bad: [55901900ec69d6fd6f332003d8ab81b2f8a38529] Merge remote-tracking
> > branch 'remotes/vivier2/tags/linux-user-for-2.12-pull-request' into
> staging
> > git bisect bad 55901900ec69d6fd6f332003d8ab81b2f8a38529
> > # bad: [d4090306c8079ca3df426f82c493314c3537064e] qemu-binfmt-conf.sh:
> add
> > qemu-xtensa
> > git bisect bad d4090306c8079ca3df426f82c493314c3537064e
> > # bad: [d4247ec2d79ef2477cb886fa688706b068119736] linux-user: Support
> > f_flags in statfs when available.
> > git bisect bad d4247ec2d79ef2477cb886fa688706b068119736
> > # good: [f8b985d65cf67004483816d5afcb7bf686e11702] linux-user: Remove t=
he
> > unused "not implemented" signal handling stubs
> > git bisect good f8b985d65cf67004483816d5afcb7bf686e11702
> > # good: [3ff48453e894990ea6495574037e70ed9b91947e] linux-user: allows t=
o
> use
> > "--systemd ALL" with qemu-binfmt-conf.sh
> > git bisect good 3ff48453e894990ea6495574037e70ed9b91947e
> > # first bad commit: [d4247ec2d79ef2477cb886fa688706b068119736]
> linux-user:
> > Support f_flags in statfs when available.
>
> Awesome! Thanks for this.
>
> >
> >
> > Unfortunately just revering "[d4247ec2d79ef2477cb886fa688706b068119736]
> > linux-user: Support f_flags in statfs when available" at the top of
> v2.12.0
> > still hangs.
> >
> > I will try to dig a bit more, but any advice would be appreciated.
>
> I managed to reproduce the hang today, so I'll investigate tomorrow.
> I'm surprised reverting the commit doesn't work.
>
> Alistair
>
> >
> > On Tue, May 29, 2018 at 10:40 PM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >>
> >> After removing ld-is-gold I was able to reproduce the issue.
> >>
> >> Unfortunately removing the
> >>
> meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-=
x86-target.patch
> >> doesn't help with the hang, then I've tried to upgrade to latest SRCRE=
V
> in
> >> qemu master (currently 5a5c383b1373aeb6c87a0d6060f6c3dc7c53082b)
> >>
> >> Will try to bisect where it started to hang between 2.11.0 and 2.12.0,
> but
> >> it might be faster if Alistair Francis can chime in as the author of
> this
> >> patch, he might have better idea why it stopped working.
> >>
> >> Cheers,
> >>
> >> On Tue, May 29, 2018 at 2:56 PM Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >>>
> >>> I've tried to reproduce it locally, but g-ir-scanner-qemuwrapper is
> >>> failing for me in various recipes and I never got as far as webkitgtk
> >>>
> >>> pango:
> >>> Error relocating
> >>>
> TOPDIR/tmp-musl/work/i586-oe-linux-musl/pango/1.40.14-r0/recipe-sysroot//=
usr/lib/libGL.so.1:
> >>> __glX_tls_Context: symbol not found
> >>> http://errors.yoctoproject.org/Errors/Details/178988/
> >>>
> >>> after disabling GI for pango (GI_DATA_ENABLED_pn-pango =3D "False") i=
t
> >>> failed in
> >>> librsvg:
> >>> Error relocating
> >>>
> TOPDIR/tmp-musl/work/i586-oe-linux-musl/librsvg/2.40.20-r0/recipe-sysroot=
//usr/lib/libGL.so.1:
> >>> __glX_tls_Context: symbol not found
> >>> http://errors.yoctoproject.org/Errors/Details/178991/
> >>>
> >>> gstreamer1.0-plugins-base:
> >>> Error relocating
> >>>
> TOPDIR/tmp-musl/work/i586-oe-linux-musl/gstreamer1.0-plugins-base/1.14.0-=
r0/recipe-sysroot//usr/lib/libEGL.so.1:
> >>> _egl_TLS: symbol not found
> >>> http://errors.yoctoproject.org/Errors/Details/178993/
> >>>
> >>> and gtk+3 as well, because of disabled GI for pango:
> >>> Couldn't find include 'Pango-1.0.gir' (search path:
> >>>
> '['TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recipe-sysroo=
t/usr/share/gir-1.0',
> >>> '../gdk',
> >>>
> 'TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recipe-sysroot/=
usr/share/gir-1.0',
> >>>
> 'TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recipe-sysroot-=
native/usr/share/gir-1.0',
> >>> '/usr/share/gir-1.0',
> >>>
> 'TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recipe-sysroot-=
native/usr/share/gir-1.0']')
> >>>
> >>>
> TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recipe-sysroot/u=
sr/share/gobject-introspection-1.0/Makefile.introspection:159:
> >>> recipe for target 'Gdk-3.0.gir' failed
> >>> http://errors.yoctoproject.org/Errors/Details/178992/
> >>>
> >>> I'm not sure how exactly AB is doing this qemux86 musl build, it migh=
t
> be
> >>> some more changes I have locally or missing/superfluous something in =
my
> >>> config.
> >>>
> >>> On Tue, May 29, 2018 at 11:10 AM Martin Jansa <martin.jansa@gmail.com=
>
> >>> wrote:
> >>>>
> >>>> This hang should have been fixed by:
> >>>>
> >>>>
> meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-=
x86-target.patch
> >>>>
> >>>> which was added with previous upgrade to 2.11.0:
> >>>>
> >>>> commit d6d0d99569e0d8b62a61e27d389e7939af45bab9
> >>>> Author: Alistair Francis <alistair.francis@xilinx.com>
> >>>> Date:   Wed Jan 17 13:39:06 2018 -0800
> >>>>
> >>>>     qemu: Bump to version 2.11.0
> >>>>
> >>>> and my update only shifted the chunk by 2 lines in:
> >>>>
> >>>> commit a742584f253e25b97729abe19ca9e4fa2809ea2e
> >>>> Author: Martin Jansa <martin.jansa@gmail.com>
> >>>> Date:   Wed May 2 14:37:33 2018 +0000
> >>>>
> >>>>     qemu: refresh patches with devtool
> >>>>
> >>>> and the patch is still being applied. I was waiting for
> >>>> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/ to
> reproduce it,
> >>>> but it seems that Khem is working on some bigger overhaul of the job=
s
> and
> >>>> it's not ready yet, I'll try to reproduce it locally now and if I ca=
n
> >>>> reproduce it, then I'll try to just remove this patch, because the
> upstream
> >>>> didn't accept it very well in:
> >>>> http://lists.gnu.org/archive/html/qemu-devel/2018-01/msg04185.html
> >>>> and the discussion there died few months ago.
> >>>>
> >>>> Regards,
> >>>>
> >>>> On Fri, May 18, 2018 at 11:59 PM Burton, Ross <ross.burton@intel.com=
>
> >>>> wrote:
> >>>>>
> >>>>> This is causing the AB to hang when built for qemux86 with musl
> whilst
> >>>>> building webkitgtk during the gobject-introspection qemu-i386 calls=
,
> >>>>> qemu enters an infinite loop.
> >>>>>
> >>>>> I've not yet reproduced locally to try and get a log out of qemu, b=
ut
> >>>>> it has happened on the autobuilder repeatedly.
> >>>>>
> >>>>> Ross
> >>>>>
> >>>>> On 2 May 2018 at 15:37, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> >>>>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>>> > ---
> >>>>> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >>>>> >  ...4-treat-DISAS_UPDATE-as-variant-of-D.patch | 67
> >>>>> > -------------------
> >>>>> >  ...-connect-socket-to-a-spawned-command.patch | 52 +++++++------=
-
> >>>>> >  .../qemu/qemu/disable-grabs.patch             | 43 ++++++------
> >>>>> >  meta/recipes-devtools/qemu/qemu/memfd.patch   | 57
> ----------------
> >>>>> >  .../qemu/qemu/qemu-2.5.0-cflags.patch         | 15 ++++-
> >>>>> >  .../qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}   |  6 +-
> >>>>> >  7 files changed, 65 insertions(+), 177 deletions(-)
> >>>>> >  delete mode 100644
> >>>>> >
> meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE=
-as-variant-of-D.patch
> >>>>> >  delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
> >>>>> >  rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb =3D>
> qemu_2.12.0.bb}
> >>>>> > (87%)
> >>>>> >
> >>>>> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> >>>>> > b/meta/conf/distro/include/tcmode-default.inc
> >>>>> > index 00399ae820..8b5214ed96 100644
> >>>>> > --- a/meta/conf/distro/include/tcmode-default.inc
> >>>>> > +++ b/meta/conf/distro/include/tcmode-default.inc
> >>>>> > @@ -28,7 +28,7 @@ BINUVERSION ?=3D "2.30%"
> >>>>> >  GDBVERSION ?=3D "8.0%"
> >>>>> >  GLIBCVERSION ?=3D "2.27%"
> >>>>> >  LINUXLIBCVERSION ?=3D "4.15%"
> >>>>> > -QEMUVERSION ?=3D "2.11%"
> >>>>> > +QEMUVERSION ?=3D "2.12%"
> >>>>> >
> >>>>> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >>>>> >  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> >>>>> > diff --git
> >>>>> >
> a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> >>>>> >
> b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> >>>>> > deleted file mode 100644
> >>>>> > index f90cae694c..0000000000
> >>>>> > ---
> >>>>> >
> a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> >>>>> > +++ /dev/null
> >>>>> > @@ -1,67 +0,0 @@
> >>>>> > -From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > -From: Victor Kamensky <kamensky@cisco.com>
> >>>>> > -Date: Fri, 23 Mar 2018 18:26:45 +0000
> >>>>> > -Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as varian=
t
> of
> >>>>> > - DISAS_EXIT
> >>>>> > -MIME-Version: 1.0
> >>>>> > -Content-Type: text/plain; charset=3DUTF-8
> >>>>> > -Content-Transfer-Encoding: 8bit
> >>>>> > -
> >>>>> > -In OE project 4.15 linux kernel boot hang was observed under
> >>>>> > -single cpu aarch64 qemu. Kernel code was in a loop waiting for
> >>>>> > -vtimer arrival, spinning in TC generated blocks, while interrupt
> >>>>> > -was pending unprocessed. This happened because when qemu tried t=
o
> >>>>> > -handle vtimer interrupt target had interrupts disabled, as
> >>>>> > -result flag indicating TCG exit, cpu->icount_decr.u16.high,
> >>>>> > -was cleared but arm_cpu_exec_interrupt function did not call
> >>>>> > -arm_cpu_do_interrupt to process interrupt. Later when target
> >>>>> > -reenabled interrupts, it happened without exit into main loop, s=
o
> >>>>> > -following code that waited for result of interrupt execution
> >>>>> > -run in infinite loop.
> >>>>> > -
> >>>>> > -To solve the problem instructions that operate on CPU sys state
> >>>>> > -(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
> >>>>> > -should be considered as DISAS_EXIT variant, and should be
> >>>>> > -forced to exit back to main loop so qemu will have a chance
> >>>>> > -processing pending CPU state updates, including pending
> >>>>> > -interrupts.
> >>>>> > -
> >>>>> > -This change brings consistency with how DISAS_UPDATE is treated
> >>>>> > -in aarch32 case.
> >>>>> > -
> >>>>> > -CC: Peter Maydell <peter.maydell@linaro.org>
> >>>>> > -CC: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>>> > -CC: qemu-stable@nongnu.org
> >>>>> > -Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >>>>> > -Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> >>>>> > -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>>>> > -Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
> >>>>> > -Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >>>>> > -Upstream-Status: Backport
> >>>>> > ----
> >>>>> > - target/arm/translate-a64.c | 6 +++---
> >>>>> > - 1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>> > -
> >>>>> > -diff --git a/target/arm/translate-a64.c
> b/target/arm/translate-a64.c
> >>>>> > -index 31ff047..327513e 100644
> >>>>> > ---- a/target/arm/translate-a64.c
> >>>>> > -+++ b/target/arm/translate-a64.c
> >>>>> > -@@ -13378,12 +13378,12 @@ static void
> >>>>> > aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> >>>>> > -         case DISAS_UPDATE:
> >>>>> > -             gen_a64_set_pc_im(dc->pc);
> >>>>> > -             /* fall through */
> >>>>> > --        case DISAS_JUMP:
> >>>>> > --            tcg_gen_lookup_and_goto_ptr();
> >>>>> > --            break;
> >>>>> > -         case DISAS_EXIT:
> >>>>> > -             tcg_gen_exit_tb(0);
> >>>>> > -             break;
> >>>>> > -+        case DISAS_JUMP:
> >>>>> > -+            tcg_gen_lookup_and_goto_ptr();
> >>>>> > -+            break;
> >>>>> > -         case DISAS_NORETURN:
> >>>>> > -         case DISAS_SWI:
> >>>>> > -             break;
> >>>>> > ---
> >>>>> > -2.7.4
> >>>>> > -
> >>>>> > diff --git
> >>>>> >
> a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> >>>>> >
> b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> >>>>> > index 6e6bf95c18..f1cf53a8c5 100644
> >>>>> > ---
> >>>>> >
> a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> >>>>> > +++
> >>>>> >
> b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> >>>>> > @@ -1,4 +1,4 @@
> >>>>> > -From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > +From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> >  From: Alistair Francis <alistair.francis@xilinx.com>
> >>>>> >  Date: Thu, 21 Dec 2017 11:35:16 -0800
> >>>>> >  Subject: [PATCH] chardev: connect socket to a spawned command
> >>>>> > @@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded
> >>>>> > specific]
> >>>>> >
> >>>>> >  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> >>>>> >  ---
> >>>>> > - chardev/char-socket.c | 86
> >>>>> > ++++++++++++++++++++++++++++++++++++++++++++++++---
> >>>>> > - chardev/char.c        |  3 ++
> >>>>> > - qapi/char.json        |  5 +++
> >>>>> > - 3 files changed, 90 insertions(+), 4 deletions(-)
> >>>>> > + chardev/char-socket.c | 102
> >>>>> > ++++++++++++++++++++++++++++++++++++++++++
> >>>>> > + chardev/char.c        |   3 ++
> >>>>> > + qapi/char.json        |   5 +++
> >>>>> > + 3 files changed, 110 insertions(+)
> >>>>> >
> >>>>> >  diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> >>>>> > -index 53eda8ef00..f566107c35 100644
> >>>>> > +index 159e69c3b1..84778cf31a 100644
> >>>>> >  --- a/chardev/char-socket.c
> >>>>> >  +++ b/chardev/char-socket.c
> >>>>> > -@@ -852,6 +852,68 @@ static gboolean
> >>>>> > socket_reconnect_timeout(gpointer opaque)
> >>>>> > +@@ -934,6 +934,68 @@ static gboolean
> >>>>> > socket_reconnect_timeout(gpointer opaque)
> >>>>> >       return false;
> >>>>> >   }
> >>>>> >
> >>>>> > @@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >   static void qmp_chardev_open_socket(Chardev *chr,
> >>>>> >                                       ChardevBackend *backend,
> >>>>> >                                       bool *be_opened,
> >>>>> > -@@ -859,6 +921,9 @@
> >>>>> > +@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev
> >>>>> > *chr,
> >>>>> >   {
> >>>>> >       SocketChardev *s =3D SOCKET_CHARDEV(chr);
> >>>>> >       ChardevSocket *sock =3D backend->u.socket.data;
> >>>>> > @@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >       bool do_nodelay     =3D sock->has_nodelay ? sock->nodelay :
> >>>>> > false;
> >>>>> >       bool is_listen      =3D sock->has_server  ? sock->server  :
> true;
> >>>>> >       bool is_telnet      =3D sock->has_telnet  ? sock->telnet  :
> >>>>> > false;
> >>>>> > -@@ -925,7 +990,14 @@
> >>>>> > -     } else if (reconnect > 0) {
> >>>>> > +@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chard=
ev
> >>>>> > *chr,
> >>>>> >           s->reconnect_time =3D reconnect;
> >>>>> >       }
> >>>>> > --
> >>>>> > +
> >>>>> >  +#ifndef _WIN32
> >>>>> >  +    if (cmd) {
> >>>>> >  +        chardev_open_socket_cmd(chr, cmd, errp);
> >>>>> > @@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >  +        *be_opened =3D true;
> >>>>> >  +    } else
> >>>>> >  +#endif
> >>>>> > -     if (s->reconnect_time) {
> >>>>> > -         sioc =3D qio_channel_socket_new();
> >>>>> > -         tcp_chr_set_client_ioc_name(chr, sioc);
> >>>>> > -@@ -985,10 +1057,26 @@
> >>>>> > -     const char *host =3D qemu_opt_get(opts, "host");
> >>>>> > +     /* If reconnect_time is set, will do that in
> chr_machine_done.
> >>>>> > */
> >>>>> > +     if (!s->reconnect_time) {
> >>>>> > +         if (s->is_listen) {
> >>>>> > +@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpt=
s
> >>>>> > *opts, ChardevBackend *backend,
> >>>>> >       const char *port =3D qemu_opt_get(opts, "port");
> >>>>> > +     const char *fd =3D qemu_opt_get(opts, "fd");
> >>>>> >       const char *tls_creds =3D qemu_opt_get(opts, "tls-creds");
> >>>>> >  +#ifndef _WIN32
> >>>>> >  +    const char *cmd =3D qemu_opt_get(opts, "cmd");
> >>>>> > @@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >       SocketAddressLegacy *addr;
> >>>>> >       ChardevSocket *sock;
> >>>>> >
> >>>>> > -     backend->type =3D CHARDEV_BACKEND_KIND_SOCKET;
> >>>>> >  +#ifndef _WIN32
> >>>>> >  +    if (cmd) {
> >>>>> >  +        /*
> >>>>> > @@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >  +        }
> >>>>> >  +    } else
> >>>>> >  +#endif
> >>>>> > -     if (!path) {
> >>>>> > -         if (!host) {
> >>>>> > -             error_setg(errp, "chardev: socket: no host given");
> >>>>> > -@@ -1021,13 +1109,24 @@
> >>>>> > -     sock->has_reconnect =3D true;
> >>>>> > ++
> >>>>> > +     if ((!!path + !!fd + !!host) !=3D 1) {
> >>>>> > +         error_setg(errp,
> >>>>> > +                    "Exactly one of 'path', 'fd' or 'host'
> >>>>> > required");
> >>>>> > +@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOp=
ts
> >>>>> > *opts, ChardevBackend *backend,
> >>>>> >       sock->reconnect =3D reconnect;
> >>>>> >       sock->tls_creds =3D g_strdup(tls_creds);
> >>>>> > +
> >>>>> >  +#ifndef _WIN32
> >>>>> >  +    sock->cmd =3D g_strdup(cmd);
> >>>>> >  +#endif
> >>>>> > -
> >>>>> > ++
> >>>>> >       addr =3D g_new0(SocketAddressLegacy, 1);
> >>>>> >  +#ifndef _WIN32
> >>>>> >  +    if (path || cmd) {
> >>>>> > @@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644
> >>>>> >  +#else
> >>>>> >           q_unix->path =3D g_strdup(path);
> >>>>> >  +#endif
> >>>>> > -     } else {
> >>>>> > +     } else if (host) {
> >>>>> >           addr->type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;
> >>>>> >           addr->u.inet.data =3D g_new(InetSocketAddress, 1);
> >>>>> >  diff --git a/chardev/char.c b/chardev/char.c
> >>>>> > -index 2ae4f465ec..5d52cd5de5 100644
> >>>>> > +index 76d866e6fe..9747d51d7c 100644
> >>>>> >  --- a/chardev/char.c
> >>>>> >  +++ b/chardev/char.c
> >>>>> >  @@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {
> >>>>> > @@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644
> >>>>> >                                        '*server'    : 'bool',
> >>>>> >                                        '*wait'      : 'bool',
> >>>>> >  --
> >>>>> > -2.14.1
> >>>>> > +2.17.0
> >>>>> > +
> >>>>> > diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> >>>>> > b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> >>>>> > index 77117890f4..e29c011a6f 100644
> >>>>> > --- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> >>>>> > +++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> >>>>> > @@ -1,3 +1,11 @@
> >>>>> > +From a31c5c695cb716310257f1fc60a06b821e74fe7f Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > +From: Ross Burton <ross.burton@intel.com>
> >>>>> > +Date: Wed, 18 Sep 2013 14:04:54 +0100
> >>>>> > +Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> >>>>> > +MIME-Version: 1.0
> >>>>> > +Content-Type: text/plain; charset=3DUTF-8
> >>>>> > +Content-Transfer-Encoding: 8bit
> >>>>> > +
> >>>>> >  When the pointer enters the Qemu window it calls SDL_WM_GrabInpu=
t,
> >>>>> > which calls
> >>>>> >  XGrabPointer in a busyloop until it returns GrabSuccess. However
> if
> >>>>> > there's already
> >>>>> >  a pointer grab (screen is locked, a menu is open) then qemu will
> >>>>> > hang until the
> >>>>> > @@ -11,35 +19,30 @@ them in a conditional that can be set by the
> >>>>> > autobuilder environment, preserving
> >>>>> >  the current grabbing behaviour for everyone else.
> >>>>> >
> >>>>> >  Upstream-Status: Pending
> >>>>> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>>>> > -
> >>>>> > -From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > -From: Ross Burton <ross.burton@intel.com>
> >>>>> > -Date: Wed, 18 Sep 2013 14:04:54 +0100
> >>>>> > -Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> >>>>> > -
> >>>>> >  Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>>>> >  Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> >>>>> > +
> >>>>> >  ---
> >>>>> > - ui/sdl.c | 12 ++++++++++--
> >>>>> > - 1 file changed, 10 insertions(+), 2 deletions(-)
> >>>>> > + ui/sdl.c | 13 +++++++++++--
> >>>>> > + 1 file changed, 11 insertions(+), 2 deletions(-)
> >>>>> >
> >>>>> > -Index: qemu-2.11.1/ui/sdl.c
> >>>>> >
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> > ---- qemu-2.11.1.orig/ui/sdl.c
> >>>>> > -+++ qemu-2.11.1/ui/sdl.c
> >>>>> > -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
> >>>>> > - static int scaling_active =3D 0;
> >>>>> > - static Notifier mouse_mode_notifier;
> >>>>> > - static int idle_counter;
> >>>>> > +diff --git a/ui/sdl.c b/ui/sdl.c
> >>>>> > +index a5fd503..ab8d1b1 100644
> >>>>> > +--- a/ui/sdl.c
> >>>>> > ++++ b/ui/sdl.c
> >>>>> > +@@ -68,6 +68,11 @@ static int idle_counter;
> >>>>> > + static const guint16 *keycode_map;
> >>>>> > + static size_t keycode_maplen;
> >>>>> > +
> >>>>> >  +#ifndef True
> >>>>> >  +#define True 1
> >>>>> >  +#endif
> >>>>> >  +static doing_grabs =3D True;
> >>>>> > -
> >>>>> > ++
> >>>>> >   #define SDL_REFRESH_INTERVAL_BUSY 10
> >>>>> >   #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
> >>>>> > -@@ -431,14 +435,16 @@ static void sdl_grab_start(void)
> >>>>> > +                             / SDL_REFRESH_INTERVAL_BUSY + 1)
> >>>>> > +@@ -398,14 +403,16 @@ static void sdl_grab_start(void)
> >>>>> >           }
> >>>>> >       } else
> >>>>> >           sdl_hide_cursor();
> >>>>> > @@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c
> >>>>> >       gui_grab =3D 0;
> >>>>> >       sdl_show_cursor();
> >>>>> >       sdl_update_caption();
> >>>>> > -@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
> >>>>> > +@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState
> *ds,
> >>>>> > DisplayOptions *o)
> >>>>> >        * This requires SDL >=3D 1.2.14. */
> >>>>> >       setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
> >>>>> >
> >>>>> > diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch
> >>>>> > b/meta/recipes-devtools/qemu/qemu/memfd.patch
> >>>>> > deleted file mode 100644
> >>>>> > index 62e8d3800b..0000000000
> >>>>> > --- a/meta/recipes-devtools/qemu/qemu/memfd.patch
> >>>>> > +++ /dev/null
> >>>>> > @@ -1,57 +0,0 @@
> >>>>> > -Upstream-Status: Backport
> >>>>> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>>>> > -
> >>>>> > -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > -From: Paolo Bonzini <pbonzini@redhat.com>
> >>>>> > -Date: Tue, 28 Nov 2017 11:51:27 +0100
> >>>>> > -Subject: [PATCH] memfd: fix configure test
> >>>>> > -MIME-Version: 1.0
> >>>>> > -Content-Type: text/plain; charset=3DUTF-8
> >>>>> > -Content-Transfer-Encoding: 8bit
> >>>>> > -
> >>>>> > -Recent glibc added memfd_create in sys/mman.h.  This conflicts
> with
> >>>>> > -the definition in util/memfd.c:
> >>>>> > -
> >>>>> > -    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12:
> error:
> >>>>> > static declaration of memfd_create follows non-static declaration
> >>>>> > -
> >>>>> > -Fix the configure test, and remove the sys/memfd.h inclusion sin=
ce
> >>>>> > the
> >>>>> > -file actually does not exist---it is a typo in the memfd_create(=
2)
> >>>>> > man
> >>>>> > -page.
> >>>>> > -
> >>>>> > -Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>>> > -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >>>>> > ----
> >>>>> > - configure    | 2 +-
> >>>>> > - util/memfd.c | 4 +---
> >>>>> > - 2 files changed, 2 insertions(+), 4 deletions(-)
> >>>>> > -
> >>>>> > -diff --git a/configure b/configure
> >>>>> > -index 9c8aa5a98b..99ccc1725a 100755
> >>>>> > ---- a/configure
> >>>>> > -+++ b/configure
> >>>>> > -@@ -3923,7 +3923,7 @@ fi
> >>>>> > - # check if memfd is supported
> >>>>> > - memfd=3Dno
> >>>>> > - cat > $TMPC << EOF
> >>>>> > --#include <sys/memfd.h>
> >>>>> > -+#include <sys/mman.h>
> >>>>> > -
> >>>>> > - int main(void)
> >>>>> > - {
> >>>>> > -diff --git a/util/memfd.c b/util/memfd.c
> >>>>> > -index 4571d1aba8..412e94a405 100644
> >>>>> > ---- a/util/memfd.c
> >>>>> > -+++ b/util/memfd.c
> >>>>> > -@@ -31,9 +31,7 @@
> >>>>> > -
> >>>>> > - #include "qemu/memfd.h"
> >>>>> > -
> >>>>> > --#ifdef CONFIG_MEMFD
> >>>>> > --#include <sys/memfd.h>
> >>>>> > --#elif defined CONFIG_LINUX
> >>>>> > -+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
> >>>>> > - #include <sys/syscall.h>
> >>>>> > - #include <asm/unistd.h>
> >>>>> > -
> >>>>> > ---
> >>>>> > -2.11.0
> >>>>> > diff --git
> a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> >>>>> > b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> >>>>> > index eb99d14639..360519f1a1 100644
> >>>>> > --- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> >>>>> > +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> >>>>> > @@ -1,8 +1,19 @@
> >>>>> > +From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mon Sep 17 00:00:0=
0
> >>>>> > 2001
> >>>>> > +From: Stephen Arnold <sarnold@vctlabs.com>
> >>>>> > +Date: Sun, 12 Jun 2016 18:09:56 -0700
> >>>>> > +Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set so=
me
> >>>>> > environment
> >>>>> > +
> >>>>> >  Upstream-Status: Pending
> >>>>> >
> >>>>> > +---
> >>>>> > + configure | 4 ----
> >>>>> > + 1 file changed, 4 deletions(-)
> >>>>> > +
> >>>>> > +diff --git a/configure b/configure
> >>>>> > +index 69e05fb..12fc3d8 100755
> >>>>> >  --- a/configure
> >>>>> >  +++ b/configure
> >>>>> > -@@ -4468,10 +4468,6 @@ fi
> >>>>> > +@@ -5413,10 +5413,6 @@ write_c_skeleton
> >>>>> >   if test "$gcov" =3D "yes" ; then
> >>>>> >     CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
> >>>>> >     LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> >>>>> > @@ -12,4 +23,4 @@ Upstream-Status: Pending
> >>>>> >  -  CFLAGS=3D"-O2 $CFLAGS"
> >>>>> >   fi
> >>>>> >
> >>>>> > - ##########################################
> >>>>> > + if test "$have_asan" =3D "yes"; then
> >>>>> > diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> >>>>> > b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> >>>>> > similarity index 87%
> >>>>> > rename from meta/recipes-devtools/qemu/qemu_2.11.1.bb
> >>>>> > rename to meta/recipes-devtools/qemu/qemu_2.12.0.bb
> >>>>> > index f4b7d69fca..63590fc9eb 100644
> >>>>> > --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> >>>>> > +++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> >>>>> > @@ -20,8 +20,6 @@ SRC_URI =3D
> >>>>> > "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> >>>>> >
>  file://chardev-connect-socket-to-a-spawned-command.patch
> >>>>> > \
> >>>>> >             file://apic-fixup-fallthrough-to-PIC.patch \
> >>>>> >
> >>>>> > file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch =
\
> >>>>> > -           file://memfd.patch \
> >>>>> > -
> >>>>> >
> file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
> >>>>> >             "
> >>>>> >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+\..*)\.tar"
> >>>>> >
> >>>>> > @@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D " \
> >>>>> >              file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
> >>>>> >              "
> >>>>> >
> >>>>> > -SRC_URI[md5sum] =3D "61cf862b6007eba4ac98247776af2e27"
> >>>>> > -SRC_URI[sha256sum] =3D
> >>>>> > "d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7aeef7605dfaaf81732ccb=
"
> >>>>> > +SRC_URI[md5sum] =3D "122fd7cdf241ff7eb1e42c0b503b5d1b"
> >>>>> > +SRC_URI[sha256sum] =3D
> >>>>> > "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c=
"
> >>>>> >
> >>>>> >  COMPATIBLE_HOST_mipsarchn32 =3D "null"
> >>>>> >  COMPATIBLE_HOST_mipsarchn64 =3D "null"
> >>>>> > --
> >>>>> > 2.17.0
> >>>>> >
> >>>>> > --
> >>>>> > _______________________________________________
> >>>>> > Openembedded-core mailing list
> >>>>> > Openembedded-core@lists.openembedded.org
> >>>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--00000000000007374a056d8ed384
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yesterday I&#39;ve tried to replay the end of the bisect a=
nd surprisingly I wasn&#39;t seeing the hang with=C2=A0d4247ec2d79ef2477cb8=
86fa688706b068119736.<div><br></div><div>With 2nd bad=C2=A0d4090306c8079ca3=
df426f82c493314c3537064e it hangs again.</div><div><br></div><div>So either=
 I didn&#39;t wait long enough for qemu-i386 to finish (I mark it as bad af=
ter it spends &gt; 10mins inside qemu-i386 or the hang doesn&#39;t happen r=
eliably even with &quot;bad&quot; revision of qemu.</div><div><br></div><di=
v>The revisions I&#39;m trying are here:</div><div><a href=3D"http://git.op=
enembedded.org/openembedded-core-contrib/log/?h=3Djansa/qemu-hang">http://g=
it.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/qemu-hang</a><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun =
1, 2018 at 2:01 AM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.=
com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Thu, May 31, 2018 at 8:41 AM, Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wro=
te:<br>
&gt; I&#39;ve finished the bisect today:<br>
&gt;<br>
&gt; qemu$ git bisect log<br>
&gt; git bisect start<br>
&gt; # good: [9f750794985d7386f088da941c76b73880b2b6c4] sev/i386: add<br>
&gt; sev_get_capabilities()<br>
&gt; git bisect good 9f750794985d7386f088da941c76b73880b2b6c4<br>
&gt; # bad: [91c60f124e682a78c9a2ef951e8e58ebab6441d0] target/ppc: fix tlbs=
ync to<br>
&gt; check privilege level depending on GTSE<br>
&gt; git bisect bad 91c60f124e682a78c9a2ef951e8e58ebab6441d0<br>
&gt; # bad: [a57946ff2acb9c0d95c9f127914540586b0b8c21] Merge remote-trackin=
g<br>
&gt; branch &#39;remotes/awilliam/tags/vfio-update-20180313.0&#39; into sta=
ging<br>
&gt; git bisect bad a57946ff2acb9c0d95c9f127914540586b0b8c21<br>
&gt; # good: [5bdd374347b873ab59b356a284494a8bc1664008] Merge remote-tracki=
ng<br>
&gt; branch &#39;remotes/bonzini/tags/for-upstream-sev&#39; into staging<br=
>
&gt; git bisect good 5bdd374347b873ab59b356a284494a8bc1664008<br>
&gt; # bad: [55901900ec69d6fd6f332003d8ab81b2f8a38529] Merge remote-trackin=
g<br>
&gt; branch &#39;remotes/vivier2/tags/linux-user-for-2.12-pull-request&#39;=
 into staging<br>
&gt; git bisect bad 55901900ec69d6fd6f332003d8ab81b2f8a38529<br>
&gt; # bad: [d4090306c8079ca3df426f82c493314c3537064e] qemu-binfmt-conf.sh:=
 add<br>
&gt; qemu-xtensa<br>
&gt; git bisect bad d4090306c8079ca3df426f82c493314c3537064e<br>
&gt; # bad: [d4247ec2d79ef2477cb886fa688706b068119736] linux-user: Support<=
br>
&gt; f_flags in statfs when available.<br>
&gt; git bisect bad d4247ec2d79ef2477cb886fa688706b068119736<br>
&gt; # good: [f8b985d65cf67004483816d5afcb7bf686e11702] linux-user: Remove =
the<br>
&gt; unused &quot;not implemented&quot; signal handling stubs<br>
&gt; git bisect good f8b985d65cf67004483816d5afcb7bf686e11702<br>
&gt; # good: [3ff48453e894990ea6495574037e70ed9b91947e] linux-user: allows =
to use<br>
&gt; &quot;--systemd ALL&quot; with qemu-binfmt-conf.sh<br>
&gt; git bisect good 3ff48453e894990ea6495574037e70ed9b91947e<br>
&gt; # first bad commit: [d4247ec2d79ef2477cb886fa688706b068119736] linux-u=
ser:<br>
&gt; Support f_flags in statfs when available.<br>
<br>
Awesome! Thanks for this.<br>
<br>
&gt;<br>
&gt;<br>
&gt; Unfortunately just revering &quot;[d4247ec2d79ef2477cb886fa688706b0681=
19736]<br>
&gt; linux-user: Support f_flags in statfs when available&quot; at the top =
of v2.12.0<br>
&gt; still hangs.<br>
&gt;<br>
&gt; I will try to dig a bit more, but any advice would be appreciated.<br>
<br>
I managed to reproduce the hang today, so I&#39;ll investigate tomorrow.<br=
>
I&#39;m surprised reverting the commit doesn&#39;t work.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; On Tue, May 29, 2018 at 10:40 PM Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; After removing ld-is-gold I was able to reproduce the issue.<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately removing the<br>
&gt;&gt; meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-=
32-bit-x86-target.patch<br>
&gt;&gt; doesn&#39;t help with the hang, then I&#39;ve tried to upgrade to =
latest SRCREV in<br>
&gt;&gt; qemu master (currently 5a5c383b1373aeb6c87a0d6060f6c3dc7c53082b)<b=
r>
&gt;&gt;<br>
&gt;&gt; Will try to bisect where it started to hang between 2.11.0 and 2.1=
2.0, but<br>
&gt;&gt; it might be faster if Alistair Francis can chime in as the author =
of this<br>
&gt;&gt; patch, he might have better idea why it stopped working.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 29, 2018 at 2:56 PM Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<b=
r>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve tried to reproduce it locally, but g-ir-scanner-qemuw=
rapper is<br>
&gt;&gt;&gt; failing for me in various recipes and I never got as far as we=
bkitgtk<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; pango:<br>
&gt;&gt;&gt; Error relocating<br>
&gt;&gt;&gt; TOPDIR/tmp-musl/work/i586-oe-linux-musl/pango/1.40.14-r0/recip=
e-sysroot//usr/lib/libGL.so.1:<br>
&gt;&gt;&gt; __glX_tls_Context: symbol not found<br>
&gt;&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/17898=
8/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/178988/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; after disabling GI for pango (GI_DATA_ENABLED_pn-pango =3D &qu=
ot;False&quot;) it<br>
&gt;&gt;&gt; failed in<br>
&gt;&gt;&gt; librsvg:<br>
&gt;&gt;&gt; Error relocating<br>
&gt;&gt;&gt; TOPDIR/tmp-musl/work/i586-oe-linux-musl/librsvg/2.40.20-r0/rec=
ipe-sysroot//usr/lib/libGL.so.1:<br>
&gt;&gt;&gt; __glX_tls_Context: symbol not found<br>
&gt;&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/17899=
1/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/178991/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; gstreamer1.0-plugins-base:<br>
&gt;&gt;&gt; Error relocating<br>
&gt;&gt;&gt; TOPDIR/tmp-musl/work/i586-oe-linux-musl/gstreamer1.0-plugins-b=
ase/1.14.0-r0/recipe-sysroot//usr/lib/libEGL.so.1:<br>
&gt;&gt;&gt; _egl_TLS: symbol not found<br>
&gt;&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/17899=
3/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/178993/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; and gtk+3 as well, because of disabled GI for pango:<br>
&gt;&gt;&gt; Couldn&#39;t find include &#39;Pango-1.0.gir&#39; (search path=
:<br>
&gt;&gt;&gt; &#39;[&#39;TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.=
29-r0/recipe-sysroot/usr/share/gir-1.0&#39;,<br>
&gt;&gt;&gt; &#39;../gdk&#39;,<br>
&gt;&gt;&gt; &#39;TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/=
recipe-sysroot/usr/share/gir-1.0&#39;,<br>
&gt;&gt;&gt; &#39;TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/=
recipe-sysroot-native/usr/share/gir-1.0&#39;,<br>
&gt;&gt;&gt; &#39;/usr/share/gir-1.0&#39;,<br>
&gt;&gt;&gt; &#39;TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/=
recipe-sysroot-native/usr/share/gir-1.0&#39;]&#39;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; TOPDIR/tmp-musl/work/i586-oe-linux-musl/gtk+3/3.22.29-r0/recip=
e-sysroot/usr/share/gobject-introspection-1.0/Makefile.introspection:159:<b=
r>
&gt;&gt;&gt; recipe for target &#39;Gdk-3.0.gir&#39; failed<br>
&gt;&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/17899=
2/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/178992/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m not sure how exactly AB is doing this qemux86 musl bui=
ld, it might be<br>
&gt;&gt;&gt; some more changes I have locally or missing/superfluous someth=
ing in my<br>
&gt;&gt;&gt; config.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, May 29, 2018 at 11:10 AM Martin Jansa &lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This hang should have been fixed by:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-h=
angs-on-32-bit-x86-target.patch<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; which was added with previous upgrade to 2.11.0:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; commit d6d0d99569e0d8b62a61e27d389e7939af45bab9<br>
&gt;&gt;&gt;&gt; Author: Alistair Francis &lt;<a href=3D"mailto:alistair.fr=
ancis@xilinx.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Date:=C2=A0 =C2=A0Wed Jan 17 13:39:06 2018 -0800<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu: Bump to version 2.11.0<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; and my update only shifted the chunk by 2 lines in:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; commit a742584f253e25b97729abe19ca9e4fa2809ea2e<br>
&gt;&gt;&gt;&gt; Author: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Date:=C2=A0 =C2=A0Wed May 2 14:37:33 2018 +0000<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu: refresh patches with devtool<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; and the patch is still being applied. I was waiting for<br=
>
&gt;&gt;&gt;&gt; <a href=3D"http://jenkins.nas-admin.org/view/OE/job/oe_wor=
ld_qemux86/" rel=3D"noreferrer" target=3D"_blank">http://jenkins.nas-admin.=
org/view/OE/job/oe_world_qemux86/</a> to reproduce it,<br>
&gt;&gt;&gt;&gt; but it seems that Khem is working on some bigger overhaul =
of the jobs and<br>
&gt;&gt;&gt;&gt; it&#39;s not ready yet, I&#39;ll try to reproduce it local=
ly now and if I can<br>
&gt;&gt;&gt;&gt; reproduce it, then I&#39;ll try to just remove this patch,=
 because the upstream<br>
&gt;&gt;&gt;&gt; didn&#39;t accept it very well in:<br>
&gt;&gt;&gt;&gt; <a href=3D"http://lists.gnu.org/archive/html/qemu-devel/20=
18-01/msg04185.html" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.=
org/archive/html/qemu-devel/2018-01/msg04185.html</a><br>
&gt;&gt;&gt;&gt; and the discussion there died few months ago.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, May 18, 2018 at 11:59 PM Burton, Ross &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;<br>
&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; This is causing the AB to hang when built for qemux86 =
with musl whilst<br>
&gt;&gt;&gt;&gt;&gt; building webkitgtk during the gobject-introspection qe=
mu-i386 calls,<br>
&gt;&gt;&gt;&gt;&gt; qemu enters an infinite loop.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;ve not yet reproduced locally to try and get a l=
og out of qemu, but<br>
&gt;&gt;&gt;&gt;&gt; it has happened on the autobuilder repeatedly.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Ross<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 2 May 2018 at 15:37, Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt;&gt;&gt;&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto=
:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 ...4-treat-DISAS_UPDATE-as-variant-of-D.pat=
ch | 67<br>
&gt;&gt;&gt;&gt;&gt; &gt; -------------------<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 ...-connect-socket-to-a-spawned-command.pat=
ch | 52 +++++++-------<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 .../qemu/qemu/disable-grabs.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ++++++------<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/qemu/qemu/memfd.patch=
=C2=A0 =C2=A0| 57 ----------------<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 .../qemu/qemu/qemu-2.5.0-cflags.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++-<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 .../qemu/{<a href=3D"http://qemu_2.11.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a> =3D&gt; <a href=3D=
"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb=
</a>}=C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 7 files changed, 65 insertions(+), 177 dele=
tions(-)<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; meta/recipes-devtools/qemu/qemu/0001-arm-translat=
e-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/qe=
mu/qemu/memfd.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/qemu/{<a href=
=3D"http://qemu_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1=
.bb</a> =3D&gt; <a href=3D"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=
=3D"_blank">qemu_2.12.0.bb</a>}<br>
&gt;&gt;&gt;&gt;&gt; &gt; (87%)<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/conf/distro/include/tcmode-defa=
ult.inc<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt;&gt;&gt;&gt; &gt; index 00399ae820..8b5214ed96 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/conf/distro/include/tcmode-default.inc=
<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++ b/meta/conf/distro/include/tcmode-default.inc=
<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -28,7 +28,7 @@ BINUVERSION ?=3D &quot;2.30%&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 GDBVERSION ?=3D &quot;8.0%&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.27%&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;4.15%&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -QEMUVERSION ?=3D &quot;2.11%&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +QEMUVERSION ?=3D &quot;2.12%&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSI=
ON}&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} =
?=3D &quot;${GCCVERSION}&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; &gt; a/meta/recipes-devtools/qemu/qemu/0001-arm-transl=
ate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/0001-arm-transl=
ate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; index f90cae694c..0000000000<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; a/meta/recipes-devtools/qemu/qemu/0001-arm-transl=
ate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -1,67 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From a75a52d62418dafe462be4fe30485501d1010bb9 Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From: Victor Kamensky &lt;<a href=3D"mailto:kame=
nsky@cisco.com" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Date: Fri, 23 Mar 2018 18:26:45 +0000<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Subject: [PATCH] arm/translate-a64: treat DISAS_=
UPDATE as variant of<br>
&gt;&gt;&gt;&gt;&gt; &gt; - DISAS_EXIT<br>
&gt;&gt;&gt;&gt;&gt; &gt; -MIME-Version: 1.0<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Content-Transfer-Encoding: 8bit<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -In OE project 4.15 linux kernel boot hang was ob=
served under<br>
&gt;&gt;&gt;&gt;&gt; &gt; -single cpu aarch64 qemu. Kernel code was in a lo=
op waiting for<br>
&gt;&gt;&gt;&gt;&gt; &gt; -vtimer arrival, spinning in TC generated blocks,=
 while interrupt<br>
&gt;&gt;&gt;&gt;&gt; &gt; -was pending unprocessed. This happened because w=
hen qemu tried to<br>
&gt;&gt;&gt;&gt;&gt; &gt; -handle vtimer interrupt target had interrupts di=
sabled, as<br>
&gt;&gt;&gt;&gt;&gt; &gt; -result flag indicating TCG exit, cpu-&gt;icount_=
decr.u16.high,<br>
&gt;&gt;&gt;&gt;&gt; &gt; -was cleared but arm_cpu_exec_interrupt function =
did not call<br>
&gt;&gt;&gt;&gt;&gt; &gt; -arm_cpu_do_interrupt to process interrupt. Later=
 when target<br>
&gt;&gt;&gt;&gt;&gt; &gt; -reenabled interrupts, it happened without exit i=
nto main loop, so<br>
&gt;&gt;&gt;&gt;&gt; &gt; -following code that waited for result of interru=
pt execution<br>
&gt;&gt;&gt;&gt;&gt; &gt; -run in infinite loop.<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -To solve the problem instructions that operate o=
n CPU sys state<br>
&gt;&gt;&gt;&gt;&gt; &gt; -(i.e enable/disable interrupt), and marked as DI=
SAS_UPDATE,<br>
&gt;&gt;&gt;&gt;&gt; &gt; -should be considered as DISAS_EXIT variant, and =
should be<br>
&gt;&gt;&gt;&gt;&gt; &gt; -forced to exit back to main loop so qemu will ha=
ve a chance<br>
&gt;&gt;&gt;&gt;&gt; &gt; -processing pending CPU state updates, including =
pending<br>
&gt;&gt;&gt;&gt;&gt; &gt; -interrupts.<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -This change brings consistency with how DISAS_UP=
DATE is treated<br>
&gt;&gt;&gt;&gt;&gt; &gt; -in aarch32 case.<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -CC: Peter Maydell &lt;<a href=3D"mailto:peter.ma=
ydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -CC: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.=
bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -CC: <a href=3D"mailto:qemu-stable@nongnu.org" ta=
rget=3D"_blank">qemu-stable@nongnu.org</a><br>
&gt;&gt;&gt;&gt;&gt; &gt; -Suggested-by: Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Signed-off-by: Victor Kamensky &lt;<a href=3D"ma=
ilto:kamensky@cisco.com" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Reviewed-by: Richard Henderson &lt;<a href=3D"ma=
ilto:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@lina=
ro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Message-id: <a href=3D"mailto:1521526368-1996-1-=
git-send-email-kamensky@cisco.com" target=3D"_blank">1521526368-1996-1-git-=
send-email-kamensky@cisco.com</a><br>
&gt;&gt;&gt;&gt;&gt; &gt; -Signed-off-by: Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; &gt; ----<br>
&gt;&gt;&gt;&gt;&gt; &gt; - target/arm/translate-a64.c | 6 +++---<br>
&gt;&gt;&gt;&gt;&gt; &gt; - 1 file changed, 3 insertions(+), 3 deletions(-)=
<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -diff --git a/target/arm/translate-a64.c b/target=
/arm/translate-a64.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -index 31ff047..327513e 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---- a/target/arm/translate-a64.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+++ b/target/arm/translate-a64.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -13378,12 +13378,12 @@ static void<br>
&gt;&gt;&gt;&gt;&gt; &gt; aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUS=
tate *cpu)<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_UPD=
ATE:<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gen_a64_set_pc_im(dc-&gt;pc);<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* fall through */<br>
&gt;&gt;&gt;&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br=
>
&gt;&gt;&gt;&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_g=
en_lookup_and_goto_ptr();<br>
&gt;&gt;&gt;&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break=
;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_EXI=
T:<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tcg_gen_exit_tb(0);<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br=
>
&gt;&gt;&gt;&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_g=
en_lookup_and_goto_ptr();<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break=
;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_NOR=
ETURN:<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_SWI=
:<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; &gt; a/meta/recipes-devtools/qemu/qemu/chardev-connect=
-socket-to-a-spawned-command.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/chardev-connect=
-socket-to-a-spawned-command.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; index 6e6bf95c18..f1cf53a8c5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; a/meta/recipes-devtools/qemu/qemu/chardev-connect=
-socket-to-a-spawned-command.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/chardev-connect=
-socket-to-a-spawned-command.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From 3bb3100c22eb30146a69656480bdffeef8663575 Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; +From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 From: Alistair Francis &lt;<a href=3D"mailt=
o:alistair.francis@xilinx.com" target=3D"_blank">alistair.francis@xilinx.co=
m</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Date: Thu, 21 Dec 2017 11:35:16 -0800<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Subject: [PATCH] chardev: connect socket to=
 a spawned command<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -45,16 +45,16 @@ Upstream-Status: Inappropriat=
e [embedded<br>
&gt;&gt;&gt;&gt;&gt; &gt; specific]<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Signed-off-by: Patrick Ohly &lt;<a href=3D"=
mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>=
&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; - chardev/char-socket.c | 86<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++++++++++++++++++++++++++++++++++++++++++++++++-=
--<br>
&gt;&gt;&gt;&gt;&gt; &gt; - chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++<br>
&gt;&gt;&gt;&gt;&gt; &gt; - qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 5 +++<br>
&gt;&gt;&gt;&gt;&gt; &gt; - 3 files changed, 90 insertions(+), 4 deletions(=
-)<br>
&gt;&gt;&gt;&gt;&gt; &gt; + chardev/char-socket.c | 102<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++++++++++++++++++++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt; &gt; + chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 ++<br>
&gt;&gt;&gt;&gt;&gt; &gt; + qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +++<br>
&gt;&gt;&gt;&gt;&gt; &gt; + 3 files changed, 110 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 diff --git a/chardev/char-socket.c b/charde=
v/char-socket.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -index 53eda8ef00..f566107c35 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; +index 159e69c3b1..84778cf31a 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 --- a/chardev/char-socket.c<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +++ b/chardev/char-socket.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -852,6 +852,68 @@ static gboolean<br>
&gt;&gt;&gt;&gt;&gt; &gt; socket_reconnect_timeout(gpointer opaque)<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -934,6 +934,68 @@ static gboolean<br>
&gt;&gt;&gt;&gt;&gt; &gt; socket_reconnect_timeout(gpointer opaque)<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 =
100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0static void qmp_chardev_open_socket(C=
hardev *chr,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ChardevBackend *backend,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool *be_opened,<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -859,6 +921,9 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -941,6 +1003,9 @@ static void qmp_chardev_ope=
n_socket(Chardev<br>
&gt;&gt;&gt;&gt;&gt; &gt; *chr,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0{<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SO=
CKET_CHARDEV(chr);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevSocket *sock =3D=
 backend-&gt;u.socket.data;<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -133,11 +133,10 @@ index 53eda8ef00..f566107c3=
5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_nodelay=C2=A0 =
=C2=A0 =C2=A0=3D sock-&gt;has_nodelay ? sock-&gt;nodelay :<br>
&gt;&gt;&gt;&gt;&gt; &gt; false;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_listen=C2=A0 =
=C2=A0 =C2=A0 =3D sock-&gt;has_server=C2=A0 ? sock-&gt;server=C2=A0 : true;=
<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_telnet=C2=A0 =
=C2=A0 =C2=A0 =3D sock-&gt;has_telnet=C2=A0 ? sock-&gt;telnet=C2=A0 :<br>
&gt;&gt;&gt;&gt;&gt; &gt; false;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -925,7 +990,14 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0} else if (reconnect &gt; 0)=
 {<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -1008,6 +1073,14 @@ static void qmp_chardev_o=
pen_socket(Chardev<br>
&gt;&gt;&gt;&gt;&gt; &gt; *chr,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rec=
onnect_time =3D reconnect;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef _WIN32<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 if (cmd) {<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_open_s=
ocket_cmd(chr, cmd, errp);<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -146,12 +145,12 @@ index 53eda8ef00..f566107c3=
5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *be_opened =3D=
 true;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 } else<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#endif<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (s-&gt;reconnect_time) {<=
br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sioc =3D qio_c=
hannel_socket_new();<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_set_cl=
ient_ioc_name(chr, sioc);<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -985,10 +1057,26 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0const char *host =3D qemu_op=
t_get(opts, &quot;host&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* If reconnect_time is set,=
 will do that in chr_machine_done.<br>
&gt;&gt;&gt;&gt;&gt; &gt; */<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!s-&gt;reconnect_time) {=
<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;is_l=
isten) {<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -1065,9 +1138,26 @@ static void qemu_chr_pars=
e_socket(QemuOpts<br>
&gt;&gt;&gt;&gt;&gt; &gt; *opts, ChardevBackend *backend,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *port =3D qe=
mu_opt_get(opts, &quot;port&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const char *fd =3D qemu_opt_=
get(opts, &quot;fd&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *tls_creds =
=3D qemu_opt_get(opts, &quot;tls-creds&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef _WIN32<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 const char *cmd =3D qemu_opt=
_get(opts, &quot;cmd&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 =
100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketAddressLegacy *ad=
dr;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevSocket *sock;<br=
>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0backend-&gt;type =3D CHARDEV=
_BACKEND_KIND_SOCKET;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef _WIN32<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 if (cmd) {<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -173,17 +171,18 @@ index 53eda8ef00..f566107c3=
5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 } else<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#endif<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!path) {<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!host) {<b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error_setg(errp, &quot;chardev: socket: no host given&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -1021,13 +1109,24 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sock-&gt;has_reconnect =3D t=
rue;<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if ((!!path + !!fd + !!host)=
 !=3D 1) {<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(err=
p,<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;Exactly one of &#39;path&#39;, &#39;fd&#39; or =
&#39;host&#39;<br>
&gt;&gt;&gt;&gt;&gt; &gt; required&quot;);<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -1112,12 +1202,24 @@ static void qemu_chr_par=
se_socket(QemuOpts<br>
&gt;&gt;&gt;&gt;&gt; &gt; *opts, ChardevBackend *backend,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sock-&gt;reconnect =3D =
reconnect;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sock-&gt;tls_creds =3D =
g_strdup(tls_creds);<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef _WIN32<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 sock-&gt;cmd =3D g_strdup(cm=
d);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#endif<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketA=
ddressLegacy, 1);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef _WIN32<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 if (path || cmd) {<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -198,11 +197,11 @@ index 53eda8ef00..f566107c3=
5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#else<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q_unix-&g=
t;path =3D g_strdup(path);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#endif<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0} else if (host) {<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;=
type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;=
u.inet.data =3D g_new(InetSocketAddress, 1);<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 diff --git a/chardev/char.c b/chardev/char.=
c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -index 2ae4f465ec..5d52cd5de5 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; +index 76d866e6fe..9747d51d7c 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 --- a/chardev/char.c<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +++ b/chardev/char.c<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 @@ -792,6 +792,9 @@ QemuOptsList qemu_chard=
ev_opts =3D {<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd =
100644<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;*server&#39;=C2=A0 =C2=A0 : &#39;bool&#39;,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;*wait&#39;=C2=A0 =C2=A0 =C2=A0 : &#39;bool&#39;,<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 --<br>
&gt;&gt;&gt;&gt;&gt; &gt; -2.14.1<br>
&gt;&gt;&gt;&gt;&gt; &gt; +2.17.0<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/disa=
ble-grabs.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/disable-grabs.p=
atch<br>
&gt;&gt;&gt;&gt;&gt; &gt; index 77117890f4..e29c011a6f 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/recipes-devtools/qemu/qemu/disable-gra=
bs.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu/disable-gra=
bs.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -1,3 +1,11 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; +From a31c5c695cb716310257f1fc60a06b821e74fe7f Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.bur=
ton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Subject: [PATCH] sdl.c: allow user to disable po=
inter grabs<br>
&gt;&gt;&gt;&gt;&gt; &gt; +MIME-Version: 1.0<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 When the pointer enters the Qemu window it =
calls SDL_WM_GrabInput,<br>
&gt;&gt;&gt;&gt;&gt; &gt; which calls<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 XGrabPointer in a busyloop until it returns=
 GrabSuccess. However if<br>
&gt;&gt;&gt;&gt;&gt; &gt; there&#39;s already<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 a pointer grab (screen is locked, a menu is=
 open) then qemu will<br>
&gt;&gt;&gt;&gt;&gt; &gt; hang until the<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -11,35 +19,30 @@ them in a conditional that ca=
n be set by the<br>
&gt;&gt;&gt;&gt;&gt; &gt; autobuilder environment, preserving<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 the current grabbing behaviour for everyone=
 else.<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.bur=
ton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Subject: [PATCH] sdl.c: allow user to disable po=
inter grabs<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Signed-off-by: Eric B=C3=A9nard &lt;<a href=
=3D"mailto:eric@eukrea.com" target=3D"_blank">eric@eukrea.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; - ui/sdl.c | 12 ++++++++++--<br>
&gt;&gt;&gt;&gt;&gt; &gt; - 1 file changed, 10 insertions(+), 2 deletions(-=
)<br>
&gt;&gt;&gt;&gt;&gt; &gt; + ui/sdl.c | 13 +++++++++++--<br>
&gt;&gt;&gt;&gt;&gt; &gt; + 1 file changed, 11 insertions(+), 2 deletions(-=
)<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Index: qemu-2.11.1/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---- qemu-2.11.1.orig/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+++ qemu-2.11.1/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_f=
ormat;<br>
&gt;&gt;&gt;&gt;&gt; &gt; - static int scaling_active =3D 0;<br>
&gt;&gt;&gt;&gt;&gt; &gt; - static Notifier mouse_mode_notifier;<br>
&gt;&gt;&gt;&gt;&gt; &gt; - static int idle_counter;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +diff --git a/ui/sdl.c b/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; +index a5fd503..ab8d1b1 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; +--- a/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++++ b/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -68,6 +68,11 @@ static int idle_counter;<br>
&gt;&gt;&gt;&gt;&gt; &gt; + static const guint16 *keycode_map;<br>
&gt;&gt;&gt;&gt;&gt; &gt; + static size_t keycode_maplen;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#ifndef True<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#define True 1<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +#endif<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +static doing_grabs =3D True;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; ++<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0#define SDL_REFRESH_INTERVAL_BUSY 10<=
br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0#define SDL_MAX_IDLE_COUNT (2 * GUI_R=
EFRESH_INTERVAL_DEFAULT \<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -431,14 +435,16 @@ static void sdl_grab_start=
(void)<br>
&gt;&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ SDL_REFRESH_INTER=
VAL_BUSY + 1)<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -398,14 +403,16 @@ static void sdl_grab_start=
(void)<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_hide_=
cursor();<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gui_grab =3D 0;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_show_cursor();<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_update_caption();<b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -986,6 +992,8 @@ void sdl_display_init(Displa=
yState *ds,<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -945,6 +952,8 @@ static void sdl1_display_ini=
t(DisplayState *ds,<br>
&gt;&gt;&gt;&gt;&gt; &gt; DisplayOptions *o)<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This requires SDL &g=
t;=3D 1.2.14. */<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setenv(&quot;SDL_DISABL=
E_LOCK_KEYS&quot;, &quot;1&quot;, 1);<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/memf=
d.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/memfd.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; index 62e8d3800b..0000000000<br>
&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/recipes-devtools/qemu/qemu/memfd.patch=
<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -1,57 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; -From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzi=
ni@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Date: Tue, 28 Nov 2017 11:51:27 +0100<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Subject: [PATCH] memfd: fix configure test<br>
&gt;&gt;&gt;&gt;&gt; &gt; -MIME-Version: 1.0<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Content-Transfer-Encoding: 8bit<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Recent glibc added memfd_create in sys/mman.h.=
=C2=A0 This conflicts with<br>
&gt;&gt;&gt;&gt;&gt; &gt; -the definition in util/memfd.c:<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 /builddir/build/BUILD/qemu-2.11.0-=
rc1/util/memfd.c:40:12: error:<br>
&gt;&gt;&gt;&gt;&gt; &gt; static declaration of memfd_create follows non-st=
atic declaration<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Fix the configure test, and remove the sys/memfd=
.h inclusion since<br>
&gt;&gt;&gt;&gt;&gt; &gt; the<br>
&gt;&gt;&gt;&gt;&gt; &gt; -file actually does not exist---it is a typo in t=
he memfd_create(2)<br>
&gt;&gt;&gt;&gt;&gt; &gt; man<br>
&gt;&gt;&gt;&gt;&gt; &gt; -page.<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com=
</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -Signed-off-by: Paolo Bonzini &lt;<a href=3D"mail=
to:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; ----<br>
&gt;&gt;&gt;&gt;&gt; &gt; - configure=C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;&gt;&gt;&gt; &gt; - util/memfd.c | 4 +---<br>
&gt;&gt;&gt;&gt;&gt; &gt; - 2 files changed, 2 insertions(+), 4 deletions(-=
)<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; -diff --git a/configure b/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt; -index 9c8aa5a98b..99ccc1725a 100755<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---- a/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+++ b/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -3923,7 +3923,7 @@ fi<br>
&gt;&gt;&gt;&gt;&gt; &gt; - # check if memfd is supported<br>
&gt;&gt;&gt;&gt;&gt; &gt; - memfd=3Dno<br>
&gt;&gt;&gt;&gt;&gt; &gt; - cat &gt; $TMPC &lt;&lt; EOF<br>
&gt;&gt;&gt;&gt;&gt; &gt; --#include &lt;sys/memfd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+#include &lt;sys/mman.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; - int main(void)<br>
&gt;&gt;&gt;&gt;&gt; &gt; - {<br>
&gt;&gt;&gt;&gt;&gt; &gt; -diff --git a/util/memfd.c b/util/memfd.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -index 4571d1aba8..412e94a405 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---- a/util/memfd.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+++ b/util/memfd.c<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -31,9 +31,7 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; - #include &quot;qemu/memfd.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; --#ifdef CONFIG_MEMFD<br>
&gt;&gt;&gt;&gt;&gt; &gt; --#include &lt;sys/memfd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; --#elif defined CONFIG_LINUX<br>
&gt;&gt;&gt;&gt;&gt; &gt; -+#if defined CONFIG_LINUX &amp;&amp; !defined CO=
NFIG_MEMFD<br>
&gt;&gt;&gt;&gt;&gt; &gt; - #include &lt;sys/syscall.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; - #include &lt;asm/unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt; &gt; -2.11.0<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/qemu=
-2.5.0-cflags.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cfla=
gs.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; index eb99d14639..360519f1a1 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-=
cflags.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-=
cflags.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -1,8 +1,19 @@<br>
&gt;&gt;&gt;&gt;&gt; &gt; +From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mo=
n Sep 17 00:00:00<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2001<br>
&gt;&gt;&gt;&gt;&gt; &gt; +From: Stephen Arnold &lt;<a href=3D"mailto:sarno=
ld@vctlabs.com" target=3D"_blank">sarnold@vctlabs.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Date: Sun, 12 Jun 2016 18:09:56 -0700<br>
&gt;&gt;&gt;&gt;&gt; &gt; +Subject: [PATCH] qemu-native: set ld.bfd, fix cf=
lags, and set some<br>
&gt;&gt;&gt;&gt;&gt; &gt; environment<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +---<br>
&gt;&gt;&gt;&gt;&gt; &gt; + configure | 4 ----<br>
&gt;&gt;&gt;&gt;&gt; &gt; + 1 file changed, 4 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt; &gt; +diff --git a/configure b/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt; +index 69e05fb..12fc3d8 100755<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 --- a/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 +++ b/configure<br>
&gt;&gt;&gt;&gt;&gt; &gt; -@@ -4468,10 +4468,6 @@ fi<br>
&gt;&gt;&gt;&gt;&gt; &gt; +@@ -5413,10 +5413,6 @@ write_c_skeleton<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0if test &quot;$gcov&quot; =3D &quot;y=
es&quot; ; then<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;-fprofile-arcs =
-ftest-coverage -g $CFLAGS&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;-fprofile-arcs=
 -ftest-coverage $LDFLAGS&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -12,4 +23,4 @@ Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 -=C2=A0 CFLAGS=3D&quot;-O2 $CFLAGS&quot;<br=
>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0fi<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; - ##########################################<br>
&gt;&gt;&gt;&gt;&gt; &gt; + if test &quot;$have_asan&quot; =3D &quot;yes&qu=
ot;; then<br>
&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/recipes-devtools/qemu/<a href=
=3D"http://qemu_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1=
.bb</a><br>
&gt;&gt;&gt;&gt;&gt; &gt; b/meta/recipes-devtools/qemu/<a href=3D"http://qe=
mu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a><br>
&gt;&gt;&gt;&gt;&gt; &gt; similarity index 87%<br>
&gt;&gt;&gt;&gt;&gt; &gt; rename from meta/recipes-devtools/qemu/<a href=3D=
"http://qemu_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb=
</a><br>
&gt;&gt;&gt;&gt;&gt; &gt; rename to meta/recipes-devtools/qemu/<a href=3D"h=
ttp://qemu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</=
a><br>
&gt;&gt;&gt;&gt;&gt; &gt; index f4b7d69fca..63590fc9eb 100644<br>
&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http:=
//qemu_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a><b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http:=
//qemu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a><b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -20,8 +20,6 @@ SRC_URI =3D<br>
&gt;&gt;&gt;&gt;&gt; &gt; &quot;<a href=3D"http://wiki.qemu-project.org/dow=
nload/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.q=
emu-project.org/download/${BP}.tar.bz2</a> \<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://chardev-connect-socket-to-a-spawned-command.patch<br>
&gt;&gt;&gt;&gt;&gt; &gt; \<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://apic-fixup-fallthrough-to-PIC.patch \<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x=
86-target.patch \<br>
&gt;&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://=
memfd.patch \<br>
&gt;&gt;&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt;&gt;&gt; &gt; file://0001-arm-translate-a64-treat-DISAS_UPDATE-=
as-variant-of-D.patch \<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;=
pver&gt;\d+\..*)\.tar&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; @@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D=
 &quot; \<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
ile://cpus.c-qemu_cpu_kick_thread_debugging.patch \<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -SRC_URI[md5sum] =3D &quot;61cf862b6007eba4ac9824=
7776af2e27&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt;&gt; &gt; &quot;d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7=
aeef7605dfaaf81732ccb&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +SRC_URI[md5sum] =3D &quot;122fd7cdf241ff7eb1e42c=
0b503b5d1b&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt;&gt; &gt; &quot;c9f4a147bc915d24df9784affc611a115f42d24720a=
89210b479f1ba7a3f679c&quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&=
quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&=
quot;<br>
&gt;&gt;&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt;&gt;&gt; &gt; 2.17.0<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt;&gt;&gt; &gt; _______________________________________________<b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openemb=
edded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><b=
r>
&gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div>

--00000000000007374a056d8ed384--
