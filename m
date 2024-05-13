Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE61EC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 09:52:08 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.56492.1715593924971483663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 02:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJ6GKzLN;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so62308871fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 02:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715593923; x=1716198723; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elbkEhzSnTtgFPxuZUJqqjqrdeuNdpZyB+yldFiYNPc=;
        b=eJ6GKzLNNkqRCyUagf8GSHg/dKDg9I30X2t4Xe+FIkUZQTYORB1LmlXkEdoSAwKbgb
         ckA0QOkv/vOmfQIlygsLb0QP5ISLkeLmXgRsH6mnDYOdoT+RnIiPC6f6BmIc8EEx6UFG
         aH2n+Q/tbJJbHPgiY0eYVfTWVymz1BxQbh4tRSDOr8vDvMOMMy5zaZ+AMBwArQfvltFI
         dYNPGktTJK+hqO6vvP0wyIrjKbfxhZKgY8hk+3Ibl3X3hVeN6HKRxQp22eRTvacE5ELD
         +a5Ic5n/diga1RtV1L16ib7fOTwaAJnvSlkj/t3azUbu/ANOp7CUm0FhoApPB4CXbq/4
         lueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715593923; x=1716198723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elbkEhzSnTtgFPxuZUJqqjqrdeuNdpZyB+yldFiYNPc=;
        b=FMnJmF9Y61YeX2+W7JxEzM538Wzdl6kMvs10Aa1dyGShTZ6+ZoaFG4YQaWwXhY6NZo
         U9hAyNKh1E4F3AGrwLIjGupJad0Ne6wCt/Go9NOhdZvGzPhqdNVr3mcc0q4TDvU0iO0r
         zC5tBji0XwyFxzYjj5+erTcH4v2Lrci5oWtTEVd/yuZA/O1dfUVQ+4rWU/MUWcg3ByEF
         hxZ440jB/MytOY32AZmQt2krmJJs9A/wmiLVjP+rcQX0fGcCxWhczxgkYNFr7vfpSY6M
         FGxaoEz6UtaaASaWK9tvVaR0vJ7RQVUNu1mpIso1BVCM9wozdhDCPgHq9MpRwWysXmFk
         6m0w==
X-Gm-Message-State: AOJu0YwTs5Lt0emHjJ+I/ldUlZN4nvw4VoRlRw0MJXTOd3mY2BSKsbK+
	sxtzRtSFEdtgIwm+zlENRd83v/dTDoR/SeCXiLTMKlSuwNHc7rKXxC98hLomeiAhQFCVbmWGS6y
	Y5TgvBjhj1KUygzsg9A6XyvBbgN8=
X-Google-Smtp-Source: AGHT+IH4xdHaFHWHYdwtxrgAs9x6wL4niXxyp5lpebmmu2Dj4+7gA4l63L7D5+Eoj3Kk42X6grjEZPB1Aqj0Tgo6g3I=
X-Received: by 2002:a2e:a98d:0:b0:2dd:cb34:ddbc with SMTP id
 38308e7fff4ca-2e5205c8fc4mr108004081fa.48.1715593922807; Mon, 13 May 2024
 02:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211123135919.26315-1-richard.purdie@linuxfoundation.org> <25272.1715593639334797374@lists.openembedded.org>
In-Reply-To: <25272.1715593639334797374@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 11:51:51 +0200
Message-ID: <CANNYZj-3wQKzHGNhe0zTqxaVaxROUHcmMajgnMvNzrkXf9T+2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059165a061852d6a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 09:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199227

--00000000000059165a061852d6a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you demonstrate how the issue can be observed on current poky master
please?

Alex

On Mon 13. May 2024 at 11.47, pmi183 via lists.openembedded.org <pmi183=3D
gmail.com@lists.openembedded.org> wrote:

> Hi Richard,
>
> While using buildhistory, i faced an issue with files-in-package.txt
> missing and digging into the logs i found out:
>
>
>
> find:
> =E2=80=98/home/user/src/poky-master/build/tmp/work/core2-64-poky-linux/ba=
se-passwd/3.6.3/packages-split/*=E2=80=99:
> No such file or directory
> Calling `buildhistory_list_pkg_files`  from do_package seems to be
> accessing the dir before being ready and fails.
>
> Additionally, using `BUILDHISTORY_RESET` along with
> `BUILDHISTORY_PRESERVE` looks to fail to preserve files since there is
> nothing to handle buildhistory/old dir and ends up losing all files marke=
d
> to preserve.
>
> Thank you,
> Pedro
>
> ----------------------------------------
>
>  meta/classes/buildhistory.bbclass | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index fd53e92402..4962c53cae 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -98,11 +98,6 @@ python buildhistory_emit_pkghistory() {
>      if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split(=
):
>          return 0
>
> -    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> -        # Create files-in-<package-name>.txt files containing a list of
> files of each recipe's package
> -        bb.build.exec_func("buildhistory_list_pkg_files", d)
> -        return 0
> -
>      if not d.getVar('BB_CURRENTTASK') in ['packagedata',
> 'packagedata_setscene']:
>          return 0
>
> @@ -110,6 +105,7 @@ python buildhistory_emit_pkghistory() {
>      import json
>      import shlex
>      import errno
> +    import shutil
>
>      pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
>      oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
> @@ -223,6 +219,20 @@ python buildhistory_emit_pkghistory() {
>          items.sort()
>          return ' '.join(items)
>
> +    def copypreservedoldpkgdatafiles(pkg, preserve):
> +        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
> +            listofobjs =3D os.listdir(os.path.join(oldpkghistdir, pkg))
> +            for obj in listofobjs:
> +                if obj not in preserve:
> +                    continue
> +                try:
> +                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
> +                    shutil.copyfile(os.path.join(oldpkghistdir, pkg,
> obj), os.path.join(pkghistdir, pkg, obj))
> +                except IOError as e:
> +                    bb.note("Unable to copy file. %s" % e)
> +                except EnvironmentError as e:
> +                    bb.note("Unable to copy file. %s" % e)
> +
>      pn =3D d.getVar('PN')
>      pe =3D d.getVar('PE') or "0"
>      pv =3D d.getVar('PV')
> @@ -250,6 +260,11 @@ python buildhistory_emit_pkghistory() {
>      if not os.path.exists(pkghistdir):
>          bb.utils.mkdirhier(pkghistdir)
>      else:
> +        reset =3D d.getVar("BUILDHISTORY_RESET")
> +        if reset:
> +            for pkg in packagelist:
> +                copypreservedoldpkgdatafiles(pkg, preserve)
> +
>          # Remove files for packages that no longer exist
>          for item in os.listdir(pkghistdir):
>              if item not in preserve:
> @@ -327,6 +342,10 @@ python buildhistory_emit_pkghistory() {
>
>          write_pkghistory(pkginfo, d)
>
> +    # Only executed when running task `packagedata`
> +    if d.getVar('BB_CURRENTTASK') =3D=3D 'packagedata':
> +        bb.build.exec_func("buildhistory_list_pkg_files", d)
> +
>      oe.qa.exit_if_errors(d)
>  }
>
> --
> 2.34.1
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199226):
> https://lists.openembedded.org/g/openembedded-core/message/199226
> Mute This Topic: https://lists.openembedded.org/mt/87258776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000059165a061852d6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you demonstrate how the issue can be observed on curr=
ent poky master please?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon 13. May 2024 at 11.47, pmi183 via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;pmi183=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">Hi Richard,<br><br>While using buildhistor=
y, i faced an issue with files-in-package.txt missing and digging into the =
logs i found out:<br>
<p style=3D"margin:0px">=C2=A0</p>
<p><code style=3D"font-family:monospace">find: =E2=80=98/home/user/src/poky=
-master/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.3/packages-split=
/*=E2=80=99: No such file or directory</code></p>
Calling `buildhistory_list_pkg_files`=C2=A0 from do_package seems to be acc=
essing the dir before being ready and fails.<br><br>Additionally, using `BU=
ILDHISTORY_RESET` along with `BUILDHISTORY_PRESERVE` looks to fail to prese=
rve files since there is nothing to handle buildhistory/old dir and ends up=
 losing all files marked to preserve.<br><br>Thank you,<br>Pedro<br><br>---=
-------------------------------------<br><br>=C2=A0meta/classes/buildhistor=
y.bbclass | 29 ++++++++++++++++++++++++-----<br>=C2=A01 file changed, 24 in=
sertions(+), 5 deletions(-)<br><br>diff --git a/meta/classes/buildhistory.b=
bclass b/meta/classes/buildhistory.bbclass<br>index fd53e92402..4962c53cae =
100644<br>--- a/meta/classes/buildhistory.bbclass<br>+++ b/meta/classes/bui=
ldhistory.bbclass<br>@@ -98,11 +98,6 @@ python buildhistory_emit_pkghistory=
() {<br>=C2=A0 =C2=A0 =C2=A0if not &quot;package&quot; in (d.getVar(&#39;BU=
ILDHISTORY_FEATURES&#39;) or &quot;&quot;).split():<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0<br><br>- =C2=A0 =C2=A0if d.getVar(&#39;BB_CURRENTTAS=
K&#39;) in [&#39;package&#39;, &#39;package_setscene&#39;]:<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Create files-in-&lt;package-name&gt;.txt files containin=
g a list of files of each recipe&#39;s package<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.build.exec_func(&quot;buildhistory_list_pkg_files&quot;, d)<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>-<br>=C2=A0 =C2=A0 =C2=A0if not d.ge=
tVar(&#39;BB_CURRENTTASK&#39;) in [&#39;packagedata&#39;, &#39;packagedata_=
setscene&#39;]:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br><br>@@ -11=
0,6 +105,7 @@ python buildhistory_emit_pkghistory() {<br>=C2=A0 =C2=A0 =C2=
=A0import json<br>=C2=A0 =C2=A0 =C2=A0import shlex<br>=C2=A0 =C2=A0 =C2=A0i=
mport errno<br>+ =C2=A0 =C2=A0import shutil<br><br>=C2=A0 =C2=A0 =C2=A0pkgh=
istdir =3D d.getVar(&#39;BUILDHISTORY_DIR_PACKAGE&#39;)<br>=C2=A0 =C2=A0 =
=C2=A0oldpkghistdir =3D d.getVar(&#39;BUILDHISTORY_OLD_DIR_PACKAGE&#39;)<br=
>@@ -223,6 +219,20 @@ python buildhistory_emit_pkghistory() {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0items.sort()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn &#39; &#39;.join(items)<br><br>+ =C2=A0 =C2=A0def copypreservedoldpkg=
datafiles(pkg, preserve):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists=
(os.path.join(oldpkghistdir, pkg)):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0listofobjs =3D os.listdir(os.path.join(oldpkghistdir, pkg))<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for obj in listofobjs:<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if obj not in preserve:<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cont=
inue<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.uti=
ls.mkdirhier(os.path.join(pkghistdir, pkg))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(os.path.join(o=
ldpkghistdir, pkg, obj), os.path.join(pkghistdir, pkg, obj))<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except IOError as e:<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.not=
e(&quot;Unable to copy file. %s&quot; % e)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0except EnvironmentError as e:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Un=
able to copy file. %s&quot; % e)<br>+<br>=C2=A0 =C2=A0 =C2=A0pn =3D d.getVa=
r(&#39;PN&#39;)<br>=C2=A0 =C2=A0 =C2=A0pe =3D d.getVar(&#39;PE&#39;) or &qu=
ot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0pv =3D d.getVar(&#39;PV&#39;)<br>@@ -250,=
6 +260,11 @@ python buildhistory_emit_pkghistory() {<br>=C2=A0 =C2=A0 =C2=
=A0if not os.path.exists(pkghistdir):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bb.utils.mkdirhier(pkghistdir)<br>=C2=A0 =C2=A0 =C2=A0else:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reset =3D d.getVar(&quot;BUILDHISTORY_RESET&quot;)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if reset:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for pkg in packagelist:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0copypreservedoldpkgdatafiles(pkg, preserve)<br>+<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove files for packages that no longer e=
xist<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for item in os.listdir(pkghistdir=
):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if item not in preser=
ve:<br>@@ -327,6 +342,10 @@ python buildhistory_emit_pkghistory() {<br><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_pkghistory(pkginfo, d)<br><br>+ =C2=
=A0 =C2=A0# Only executed when running task `packagedata`<br>+ =C2=A0 =C2=
=A0if d.getVar(&#39;BB_CURRENTTASK&#39;) =3D=3D &#39;packagedata&#39;:<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;buildhistory_list_pkg_=
files&quot;, d)<br>+<br>=C2=A0 =C2=A0 =C2=A0oe.qa.exit_if_errors(d)<br>=C2=
=A0}<br><br>--<br>2.34.1
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199226): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199226" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199226</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87258776/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87258776/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000059165a061852d6a2--

