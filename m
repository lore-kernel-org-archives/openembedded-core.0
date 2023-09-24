Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0893CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 09:14:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.36498.1695546857275997073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 02:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBSKef7o;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-405497850dbso25381445e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695546856; x=1696151656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pbVl4zMGUYnJ8mSc0IjZ0Z3zvxU4Cz27xwYC70dmfMs=;
        b=CBSKef7osicx7/4ogvly8RVBIdmFPZ2Rxi9M5LuiB1bPMerpRMeeDrCTdRO1roNAIa
         7aHQdCDoJfoHaOYfPywJDGpS6N0Ho7fVq4CTkPzesLkp8DgReg3xQ2k7a9SWwWk1Tf/m
         3pfDb7DI8KfwPgivYAlbsvAZIu3Rb+oJs5rBu2cI8+S+vbr3MyfTk6RdZOtnwIdEAuEN
         BjrKmrNgvfnPI+Zs5Jctatb6QSH56sJjzmYFueUEXx78BduGfxCRxkfbaHxMNrSJ95Gn
         FB+j94f1bWV0F9ECRp5sSOf8ep8FWA/7QurslMtlim8wtwRV8njxHyBOYa/owvy8GwME
         /8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695546856; x=1696151656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbVl4zMGUYnJ8mSc0IjZ0Z3zvxU4Cz27xwYC70dmfMs=;
        b=QsYzJNPJptBD/Qyra5STP9GhE25cJqdq0M9CDnYY4stG+LELtqNXpZ0pxRBKXHovvH
         MVpulpo+sZgIOjuHopmM2vyQGWcyr5GfFEz7fK7Ohk4Exs/lNIhhh845z8LnkhCaKdCr
         Rmq48a9wbu0yFBzG7FmpHpk7fbn1j1gCDP6t4y9ryEtNZO+sUpPAxGwNVct5t7X5lN6L
         ijYR2bGqpv5wvc9m1NqrvGl8alv7j0Glx4wobrM7C0CN7gOzxonaUTHDhKSTs+c1XTUe
         xmCgm5OIuvvydN8rgzJUXBbteK0NNpmqrtZNy9YAlfigS7GjP9SJp/ZhBtiRD4NIpjEx
         sCdw==
X-Gm-Message-State: AOJu0YzEVuZ9EWgo9oLTUnwBBeXEt53GejX+SjyH8PVV50ly56wck84b
	Jtd/Mw/6Zhr+IelBDIwXeD+JnyYBREQ2NcdXsUc=
X-Google-Smtp-Source: AGHT+IF/qQc/NzmIpQgWD19nOUHg9F+ImWuLuoLE8oFIeWtDYZX/GE9b7lnhmi/X3uzfA6XOQHieoYzAXvv2SdW+YnM=
X-Received: by 2002:adf:e4ce:0:b0:322:6201:6049 with SMTP id
 v14-20020adfe4ce000000b0032262016049mr3754432wrm.39.1695546855366; Sun, 24
 Sep 2023 02:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org> <20230920105802.1008778-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230920105802.1008778-3-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 24 Sep 2023 11:14:04 +0200
Message-ID: <CA+chaQdisk-vWfuRvOuK4dGag2coDqJX89OSf_T2YrZEqPSxcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] sstate: Stop allowing overlapping symlinks
 from sstate
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003a6ad0606174490"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188157

--00000000000003a6ad0606174490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just FYI I think this change is now causing few more recipes to be mutually
exclusive, when they build the same library (even when it's packaged in
differently named package), in world builds I'm seeing e.g. libslirp and
libslirp-virt (from meta-virtualization) causing packagedata failure for
one of them (depending which one was built second):

DEBUG: Staging files from
TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/libslirp-virt/4.6.1+git/pkgdata-=
pdata-input
to TOPDIR/BUILD/pkgdata/raspberrypi4-64
ERROR: Recipe libslirp-virt is trying to install files into a shared area
when those files already exist. The files and the manifests listing them
are:
  TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dev
    (matched in manifest-raspberrypi4_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp0
    (matched in manifest-raspberrypi4_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dbg
    (matched in manifest-raspberrypi4_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-src
    (matched in manifest-raspberrypi4_64-libslirp.packagedata)
Please adjust the recipes so only one recipe provides a given file.
DEBUG: Python function sstate_task_postfunc finished

Bruce is 4.6.1 version in meta-virtualization still needed or can you
update to libslirp 4.7.0 from oe-core?
From the git log
https://git.yoctoproject.org/meta-virtualization/log/recipes-networking/sli=
rp
it looks like it was originally imported from meta-retro and later renamed
from libslirp to libslirt-virt until the oe-core version is validated in
runtime.

And I'm seeing the same with some internal recipes (e.g. we have
faultmanager recipe which provides libfm - completely different from libfm
from oe-core, just library name coincidence).

Cheers,

On Wed, Sep 20, 2023 at 12:58=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> When originally implemented, overlapping symlinks in DEPLOY_DIR were
> common. That
> is no longer the case and these overlapping links are causing bugs in
> other areas
> (e.g. bug 14123).
>
> Therefore start showing errors for overlapping symlinks in shared areas.
> Whilst here,
> fix a broken file reference in the grep command to match current file
> layouts and
> update the message shown to users to match current times. Most of the
> message content
> is obsolete now due to other advances and changes in the way the staging
> code
> now works.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sstate.bbclass | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 706c2ae9388..afcda2980b3 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -266,7 +266,7 @@ def sstate_install(ss, d):
>      overlap_allowed =3D (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or
> "").split()
>      match =3D []
>      for f in sharedfiles:
> -        if os.path.exists(f) and not os.path.islink(f):
> +        if os.path.exists(f):
>              f =3D os.path.normpath(f)
>              realmatch =3D True
>              for w in overlap_allowed:
> @@ -276,36 +276,18 @@ def sstate_install(ss, d):
>                      break
>              if realmatch:
>                  match.append(f)
> -                sstate_search_cmd =3D "grep -rlF '%s' %s
> --exclude=3Dmaster.list | sed -e 's:^.*/::'" % (f,
> d.expand("${SSTATE_MANIFESTS}"))
> +                sstate_search_cmd =3D "grep -rlF '%s' %s --exclude=3Dind=
ex-*
> | sed -e 's:^.*/::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
>                  search_output =3D subprocess.Popen(sstate_search_cmd,
> shell=3DTrue, stdout=3Dsubprocess.PIPE).communicate()[0]
>                  if search_output:
>                      match.append("  (matched in %s)" %
> search_output.decode('utf-8').rstrip())
>                  else:
>                      match.append("  (not matched to any task)")
>      if match:
> -        bb.error("The recipe %s is trying to install files into a shared
> " \
> -          "area when those files already exist. Those files and their
> manifest " \
> -          "location are:\n  %s\nPlease verify which recipe should provid=
e
> the " \
> -          "above files.\n\nThe build has stopped, as continuing in this
> scenario WILL " \
> -          "break things - if not now, possibly in the future (we've seen
> builds fail " \
> -          "several months later). If the system knew how to recover from
> this " \
> -          "automatically it would, however there are several different
> scenarios " \
> -          "which can result in this and we don't know which one this is.
> It may be " \
> -          "you have switched providers of something like virtual/kernel
> (e.g. from " \
> -          "linux-yocto to linux-yocto-dev), in that case you need to
> execute the " \
> -          "clean task for both recipes and it will resolve this error. I=
t
> may be " \
> -          "you changed DISTRO_FEATURES from systemd to udev or vice
> versa. Cleaning " \
> -          "those recipes should again resolve this error, however
> switching " \
> -          "DISTRO_FEATURES on an existing build directory is not
> supported - you " \
> -          "should really clean out tmp and rebuild (reusing sstate shoul=
d
> be safe). " \
> -          "It could be the overlapping files detected are harmless in
> which case " \
> -          "adding them to SSTATE_ALLOW_OVERLAP_FILES may be the correct
> solution. It could " \
> -          "also be your build is including two different conflicting
> versions of " \
> -          "things (e.g. bluez 4 and bluez 5 and the correct solution for
> that would " \
> -          "be to resolve the conflict. If in doubt, please ask on the
> mailing list, " \
> -          "sharing the error and filelist above." % \
> +        bb.fatal("Recipe %s is trying to install files into a shared " \
> +          "area when those files already exist. The files and the
> manifests listing " \
> +          "them are:\n  %s\n"
> +          "Please adjust the recipes so only one recipe provides a given
> file. " % \
>            (d.getVar('PN'), "\n  ".join(match)))
> -        bb.fatal("If the above message is too much, the simpler version
> is you're advised to wipe out tmp and rebuild (reusing sstate is fine).
> That will likely fix things in most (but not all) cases.")
>
>      if ss['fixmedir'] and os.path.exists(ss['fixmedir'] +
> "/fixmepath.cmd"):
>          sharedfiles.append(ss['fixmedir'] + "/fixmepath.cmd")
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187919):
> https://lists.openembedded.org/g/openembedded-core/message/187919
> Mute This Topic: https://lists.openembedded.org/mt/101475773/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000003a6ad0606174490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just FYI I think this change is now causing few more =
recipes to be mutually exclusive, when they build the same library (even wh=
en it&#39;s packaged in differently named package), in world builds I&#39;m=
 seeing e.g. libslirp and libslirp-virt (from meta-virtualization) causing =
packagedata failure for one of them (depending which one was built second):=
</div><div><br></div><div>DEBUG: Staging files from TOPDIR/BUILD/work/raspb=
errypi4_64-oe-linux/libslirp-virt/4.6.1+git/pkgdata-pdata-input to TOPDIR/B=
UILD/pkgdata/raspberrypi4-64<br>ERROR: Recipe libslirp-virt is trying to in=
stall files into a shared area when those files already exist. The files an=
d the manifests listing them are:<br>=C2=A0 TOPDIR/BUILD/pkgdata/raspberryp=
i4-64/runtime-reverse/libslirp-dev<br>=C2=A0 =C2=A0 (matched in manifest-ra=
spberrypi4_64-libslirp.packagedata)<br>=C2=A0 TOPDIR/BUILD/pkgdata/raspberr=
ypi4-64/runtime-reverse/libslirp0<br>=C2=A0 =C2=A0 (matched in manifest-ras=
pberrypi4_64-libslirp.packagedata)<br>=C2=A0 TOPDIR/BUILD/pkgdata/raspberry=
pi4-64/runtime-reverse/libslirp-dbg<br>=C2=A0 =C2=A0 (matched in manifest-r=
aspberrypi4_64-libslirp.packagedata)<br>=C2=A0 TOPDIR/BUILD/pkgdata/raspber=
rypi4-64/runtime-reverse/libslirp-src<br>=C2=A0 =C2=A0 (matched in manifest=
-raspberrypi4_64-libslirp.packagedata)<br>Please adjust the recipes so only=
 one recipe provides a given file. <br>DEBUG: Python function sstate_task_p=
ostfunc finished<br></div><div><br></div>Bruce is 4.6.1 version in meta-vir=
tualization still needed or can you update to libslirp 4.7.0 from oe-core?<=
div>From the git log=C2=A0<a href=3D"https://git.yoctoproject.org/meta-virt=
ualization/log/recipes-networking/slirp">https://git.yoctoproject.org/meta-=
virtualization/log/recipes-networking/slirp</a> it looks like it was origin=
ally imported from meta-retro and later renamed from libslirp to libslirt-v=
irt until the oe-core version is validated in runtime.</div><div><br></div>=
<div>And I&#39;m seeing the same with some internal recipes (e.g. we have f=
aultmanager recipe which provides libfm - completely different from libfm f=
rom oe-core, just library name coincidence).</div><div><br></div><div>Cheer=
s,</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Sep 20, 2023 at 12:58=E2=80=AFPM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">When originally implemented, overlapping symlinks in DEPLOY_DIR were =
common. That<br>
is no longer the case and these overlapping links are causing bugs in other=
 areas<br>
(e.g. bug 14123).<br>
<br>
Therefore start showing errors for overlapping symlinks in shared areas. Wh=
ilst here,<br>
fix a broken file reference in the grep command to match current file layou=
ts and<br>
update the message shown to users to match current times. Most of the messa=
ge content<br>
is obsolete now due to other advances and changes in the way the staging co=
de<br>
now works.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes-global/sstate.bbclass | 30 ++++++-----------------------=
-<br>
=C2=A01 file changed, 6 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 706c2ae9388..afcda2980b3 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -266,7 +266,7 @@ def sstate_install(ss, d):<br>
=C2=A0 =C2=A0 =C2=A0overlap_allowed =3D (d.getVar(&quot;SSTATE_ALLOW_OVERLA=
P_FILES&quot;) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0match =3D []<br>
=C2=A0 =C2=A0 =C2=A0for f in sharedfiles:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f) and not os.path.islink(f)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D os.path.normpath(f)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realmatch =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for w in overlap_allowed:<b=
r>
@@ -276,36 +276,18 @@ def sstate_install(ss, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if realmatch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match.append(=
f)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_search_cmd =
=3D &quot;grep -rlF &#39;%s&#39; %s --exclude=3Dmaster.list | sed -e &#39;s=
:^.*/::&#39;&quot; % (f, d.expand(&quot;${SSTATE_MANIFESTS}&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_search_cmd =
=3D &quot;grep -rlF &#39;%s&#39; %s --exclude=3Dindex-* | sed -e &#39;s:^.*=
/::&#39;&quot; % (f, d.expand(&quot;${SSTATE_MANIFESTS}&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0search_output=
 =3D subprocess.Popen(sstate_search_cmd, shell=3DTrue, stdout=3Dsubprocess.=
PIPE).communicate()[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if search_out=
put:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0match.append(&quot;=C2=A0 (matched in %s)&quot; % search_output.decode(&=
#39;utf-8&#39;).rstrip())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0match.append(&quot;=C2=A0 (not matched to any task)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if match:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;The recipe %s is trying to inst=
all files into a shared &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;area when those files already exi=
st. Those files and their manifest &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;location are:\n=C2=A0 %s\nPlease =
verify which recipe should provide the &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;above files.\n\nThe build has sto=
pped, as continuing in this scenario WILL &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;break things - if not now, possib=
ly in the future (we&#39;ve seen builds fail &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;several months later). If the sys=
tem knew how to recover from this &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;automatically it would, however t=
here are several different scenarios &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;which can result in this and we d=
on&#39;t know which one this is. It may be &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;you have switched providers of so=
mething like virtual/kernel (e.g. from &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;linux-yocto to linux-yocto-dev), =
in that case you need to execute the &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clean task for both recipes and i=
t will resolve this error. It may be &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;you changed DISTRO_FEATURES from =
systemd to udev or vice versa. Cleaning &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;those recipes should again resolv=
e this error, however switching &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;DISTRO_FEATURES on an existing bu=
ild directory is not supported - you &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;should really clean out tmp and r=
ebuild (reusing sstate should be safe). &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;It could be the overlapping files=
 detected are harmless in which case &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;adding them to SSTATE_ALLOW_OVERL=
AP_FILES may be the correct solution. It could &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;also be your build is including t=
wo different conflicting versions of &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;things (e.g. bluez 4 and bluez 5 =
and the correct solution for that would &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;be to resolve the conflict. If in=
 doubt, please ask on the mailing list, &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sharing the error and filelist ab=
ove.&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Recipe %s is trying to install =
files into a shared &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;area when those files already exi=
st. The files and the manifests listing &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;them are:\n=C2=A0 %s\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Please adjust the recipes so only=
 one recipe provides a given file. &quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(d.getVar(&#39;PN&#39;), &quot;\n=
=C2=A0 &quot;.join(match)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;If the above message is too muc=
h, the simpler version is you&#39;re advised to wipe out tmp and rebuild (r=
eusing sstate is fine). That will likely fix things in most (but not all) c=
ases.&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ss[&#39;fixmedir&#39;] and os.path.exists(ss[&#39;fi=
xmedir&#39;] + &quot;/fixmepath.cmd&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sharedfiles.append(ss[&#39;fixmedir&#39;]=
 + &quot;/fixmepath.cmd&quot;)<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187919): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187919" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187919</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101475773/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101475773/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000003a6ad0606174490--

