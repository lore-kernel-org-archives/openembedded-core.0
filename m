Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.696.1795110627311891459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 09:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DDEo7Txz;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4b9ba815bso16992477b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795110626; cv=none;
        d=google.com; s=arc-20260327;
        b=JmRyiAGiNfluVx1Wed69Oea1fjlbDE4oosqT8AuX0Q1JVeqwz4XhNmcfDx7j3NGlLr
         osACn5klCkr8Fv5C+9YWp6S9iRNt/qKp9jKohW9Sp0pXhWutAunS1q2X+JaHhoYXxgdj
         jFcRqb2usH31allQJpkcwEAKR1R+uUJ54hz8GxCbUUJ4j/bvSyDXYIt9L/2L3bZ70ON3
         7QDjEbkbs25LU6i4tigTpsnOJXkYmYrH3hZUa5vkoBO5C2+73r3uacL5fqTZjxTP0xFz
         kpcxddpbFLRNqd7UqE/g2ZLUX8FCx/ouLTGJhpyFzPrOchUClhxpgbgGBMquv/nBgMk9
         DMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rfBd+NJWc+M76lk7uVOPeMolUxaK2uZhCXVBoJYwrj0=;
        fh=5WqXRqI6ug1yACSoa6PHrWl4WohnUzPE95rEea745qs=;
        b=meipRubQHWenMoor397KRtHVfHT4cj8LEq3ALk7W5oCVL0XaM1lyUILmKD5PaPF3/A
         v1mYWW+uPGGWNUYrdJly8ptinUn+l8nz3aod+Def7kNd9swTzZaPkmXqXQD8xdvbamT6
         EF2nPWV8UrcHlf6p+IvGQ77IppzbcvrCw0N4eIE3c+gz1E3W3w2H9ZGOtZFJSUmce/A1
         hsX20EW+f7pbEl82lInbDJ/8hL2hZ8AyrBxK81xc2yWY4v+uZKWlgp+BPDdXQUpbbfLb
         ztXKR1xQwIPSqBs86+0eRErvncrpOnP28geCUZoDW56rpfjtoxEqfkTEyQUtucyvI0l+
         kNIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110626; x=1795715426; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfBd+NJWc+M76lk7uVOPeMolUxaK2uZhCXVBoJYwrj0=;
        b=DDEo7TxzyJfDxZ0RUZNdENfXMn09TxtN7Vc29/3F1BtZABxCSiTeUel29KkbLZYYnQ
         31nBWPqnjHdf/83Ad2CPWu4mRgAw1ABoko+kmRD3LJaEMDauBt5VzpXJ48/lxLjyZ/ID
         jZUFF+jisKspkBnFfqJmMHlPO1paUC5bTpIzQBo/c1X6Xm0Bfjq5U8sgaqR9BzmdSdKX
         fgJJpuuSyjv4bHU2YOz3n3iRt5YnMSHRAKDCu5+XHF7HyG5mNgPg2cA/L5Mxt5X/E3P9
         vmayMlBjPn6grz7IWlciUGBIDRUSbL2+NUk+CDOqmrMPCMNCcF56fwGNGOxEFAksaZ5o
         85Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110626; x=1795715426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rfBd+NJWc+M76lk7uVOPeMolUxaK2uZhCXVBoJYwrj0=;
        b=og+Sjyvl0PlfBEFgJ2H+UyRbtXKIM6n70pssv3PC+0SLL9eNzt1UzhAHVmnQv5Ol+I
         LdTdJViAAfMfsS4PA67+AaNYQapQLLGbmpKuooYc1IqPeL20YDzJ9PwO9ZOt0E54JtPW
         0ZT8HVN0H7V0o0746l604wnVMUSIB1gM8YJNDzrtuw7pXP0V/mm021a23vVhRDxN/C9w
         eYc9AuI3GnK9J1qxbjRwPBbRADb2g50jqRYUYhC3XEI1NGah2Lv6fGU5mvkpKSvp4ncJ
         nMpd80KKO5/y98xL/S57w49fR79HWnR5bP/flU41qV8dhEWSsyEsQmQ+zMrEHk12Fq8U
         K2Ug==
X-Gm-Message-State: APuU4Z9L3JSqzb1mq5nvValIRVGy0xkAmdDdS8sIhnoDPtim3dMlaRuM
	b/fFZ0mhuj32f9XnJldkww8K9mehXGIVaYob/Jya1zrhXc+XwG6pipuLUS32Hx+7nU6/ubCDhld
	XnZIK5/pjYuzktu8rk3s8Vyf9L3ZBSZo=
X-Gm-Gg: AZFdTZeGsNBUpmswKRUuOBadC8YXKgcNj6a2hkVDIUTBZXqkQRqhJ1sb9jGgdJO+Fpa
	bM/YzFV/I2sbNOIsQaf4BcGM+hRuhZgplsPEyrXyIaKPLFDGh4P2kc+D0/L3GFe70YIbl0V4V4z
	OTSa33D+rlL6A3tZL+Rr9xmW6B8vF1U7HYmX9rDdeTIpPOjuVdBAhAeWAZZqxtd1guFRwXhM3MT
	JMssnz5ukgmzX4Boob3uGXI8VcWyj40Y+AvVhdl72TUVjVbjx6EUb3Hq9dZx6651X3l7qsypSnj
	U+c9OJYJ5xdyvea1BknNBqCDT66JqrWY/xmkVa84D2lvmktTPuF1yEPIQx/xUXKShGY/9BDKmWU
	Z6ha65ovEBx8uuLstbhBKz+Gdp6OGICxP4ttgaWBIIUhb/HyX4c0=
X-Received: by 2002:a05:690c:e17:b0:8b4:dd2b:10da with SMTP id
 00721157ae682-8b52049a10cmr2799167b3.20.1795110626249; Thu, 19 Nov 2026
 09:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20261115211936.3574127-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261115211936.3574127-1-khem.raj@oss.qualcomm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 19 Nov 2026 10:50:14 -0700
X-Gm-Features: AclHuK9cz7pn93sWe0QjqyGa43yYAhwfvQRCO3pOJz47ADw9NgbhWFFqtXzXcg4
Message-ID: <CAJdd5GYS47auf6wGf6cN5xSHzoShRORwUYCGn29UX+9atRNvZQ@mail.gmail.com>
Subject: Re: [PATCH] create-spdx-3.0: Install deploy task SPDX into the task's
 arch directory
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000035d0b60660a4c3fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 17:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250716

--00000000000035d0b60660a4c3fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:19=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Deploy tasks write their SPDX documents to DEPLOY_DIR_SPDX/SSTATE_PKGARCH=
,
> but the sstate manifest of a machine specific deploy task, such as
> do_deploy, uses the stamp-extra-info arch (MACHINE_ARCH). For an allarch
> recipe with do_deploy, the documents therefore land in the shared allarch
> directory while each machine has its own manifest, so building it for a
> second machine in the same TMPDIR fails:
>
>   ERROR: qcom-partition-conf-git-r0 do_deploy: Recipe qcom-partition-conf
>   is trying to install files into a shared area when those files already
>   exist.
>
> .../deploy/spdx/3.0.1/allarch/deploy/qcom-partition-conf-do_deploy-deploy=
.spdx.json
>       (matched in manifest-uno_q-qcom-partition-conf.deploy)
>
> Install the documents into the directory of the stamp-extra-info arch
> instead, falling back to SSTATE_PKGARCH. The arch must not be part of the
> sstate object itself, since an allarch recipe shares that object between
> machines, so write the documents without the arch directory, through a
> task scoped SPDX_PKGARCH that is empty, and add the arch to the sstate
> output directory, as do_deploy itself does with DEPLOY_DIR_IMAGE.
>

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com


>
> Fixes: 1b77fe51ec ("spdx: Add ability for deploy tasks to create SPDX")
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  4 +++-
>  meta/lib/oe/sbom30.py                | 11 +++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index 0d0bddcc67..f214448a1e 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -426,8 +426,10 @@ python () {
>          new_postfuncs.extend(postfuncs)
>
>          d.setVarFlag(task, "postfuncs", " ".join(new_postfuncs))
> +        d.setVar("SPDX_PKGARCH:task-" + task[3:].replace("_", "-"), "")
> +        spdx_arch =3D d.getVarFlag(task, "stamp-extra-info", False) or
> "${SSTATE_PKGARCH}"
>          d.prependVarFlag(task, "sstate-inputdirs", f"{spdx_deploy} ")
> -        d.prependVarFlag(task, "sstate-outputdirs", "${DEPLOY_DIR_SPDX} =
")
> +        d.prependVarFlag(task, "sstate-outputdirs",
> f"${{DEPLOY_DIR_SPDX}}/{spdx_arch} ")
>          d.prependVarFlag(task, "file-checksums", "${SPDX3_DEP_FILES} ")
>          d.prependVarFlag(task, "dirs", f"{spdx_deploy} ")
>          d.prependVarFlag(task, "cleandirs", f"{spdx_deploy} ")
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 520f9df3ef..62e181b970 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -1043,6 +1043,13 @@ def load_jsonld(d, path, required=3DFalse):
>      return objset
>
>
> +def get_pkg_arch(d):
> +    pkg_arch =3D d.getVar("SPDX_PKGARCH")
> +    if pkg_arch is None:
> +        pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    return pkg_arch
> +
> +
>  def jsonld_arch_path(d, arch, subdir, name, deploydir=3DNone):
>      if deploydir is None:
>          deploydir =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> @@ -1109,7 +1116,7 @@ def write_jsonld_doc(d, objset, dest):
>
>
>  def make_jsonld_link(d, fn, subdir, name, deploydir):
> -    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    pkg_arch =3D get_pkg_arch(d)
>
>      link_name =3D jsonld_arch_path(
>          d,
> @@ -1136,7 +1143,7 @@ def write_recipe_jsonld_doc(
>      create_spdx_id_links=3DTrue,
>      create_task_link=3DFalse,
>  ):
> -    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    pkg_arch =3D get_pkg_arch(d)
>
>      dest =3D jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name,
> deploydir=3Ddeploydir)
>
>

--00000000000035d0b60660a4c3fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 15,=
 2026 at 2:19=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Deploy tasks write their SPDX documents to DEPLOY_DIR_SP=
DX/SSTATE_PKGARCH,<br>
but the sstate manifest of a machine specific deploy task, such as<br>
do_deploy, uses the stamp-extra-info arch (MACHINE_ARCH). For an allarch<br=
>
recipe with do_deploy, the documents therefore land in the shared allarch<b=
r>
directory while each machine has its own manifest, so building it for a<br>
second machine in the same TMPDIR fails:<br>
<br>
=C2=A0 ERROR: qcom-partition-conf-git-r0 do_deploy: Recipe qcom-partition-c=
onf<br>
=C2=A0 is trying to install files into a shared area when those files alrea=
dy<br>
=C2=A0 exist.<br>
=C2=A0 =C2=A0 .../deploy/spdx/3.0.1/allarch/deploy/qcom-partition-conf-do_d=
eploy-deploy.spdx.json<br>
=C2=A0 =C2=A0 =C2=A0 (matched in manifest-uno_q-qcom-partition-conf.deploy)=
<br>
<br>
Install the documents into the directory of the stamp-extra-info arch<br>
instead, falling back to SSTATE_PKGARCH. The arch must not be part of the<b=
r>
sstate object itself, since an allarch recipe shares that object between<br=
>
machines, so write the documents without the arch directory, through a<br>
task scoped SPDX_PKGARCH that is empty, and add the arch to the sstate<br>
output directory, as do_deploy itself does with DEPLOY_DIR_IMAGE.<br></bloc=
kquote><div><br></div><div>LGTM, thanks</div><div><br></div><div>Reviewed-b=
y: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail=
.com</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Fixes: 1b77fe51ec (&quot;spdx: Add ability for deploy tasks to create SPDX&=
quot;)<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" ta=
rget=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
Cc: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blan=
k">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 4 +++-<br>
=C2=A0meta/lib/oe/sbom30.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 11 +++++++++--<br>
=C2=A02 files changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index 0d0bddcc67..f214448a1e 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -426,8 +426,10 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_postfuncs.extend(postfuncs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(task, &quot;postfuncs&quot;,=
 &quot; &quot;.join(new_postfuncs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;SPDX_PKGARCH:task-&quot; + task=
[3:].replace(&quot;_&quot;, &quot;-&quot;), &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_arch =3D d.getVarFlag(task, &quot;stamp-e=
xtra-info&quot;, False) or &quot;${SSTATE_PKGARCH}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(task, &quot;sstate-input=
dirs&quot;, f&quot;{spdx_deploy} &quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVarFlag(task, &quot;sstate-outputdirs=
&quot;, &quot;${DEPLOY_DIR_SPDX} &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVarFlag(task, &quot;sstate-outputdirs=
&quot;, f&quot;${{DEPLOY_DIR_SPDX}}/{spdx_arch} &quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(task, &quot;file-checksu=
ms&quot;, &quot;${SPDX3_DEP_FILES} &quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(task, &quot;dirs&quot;, =
f&quot;{spdx_deploy} &quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(task, &quot;cleandirs&qu=
ot;, f&quot;{spdx_deploy} &quot;)<br>
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py<br>
index 520f9df3ef..62e181b970 100644<br>
--- a/meta/lib/oe/sbom30.py<br>
+++ b/meta/lib/oe/sbom30.py<br>
@@ -1043,6 +1043,13 @@ def load_jsonld(d, path, required=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0return objset<br>
<br>
<br>
+def get_pkg_arch(d):<br>
+=C2=A0 =C2=A0 pkg_arch =3D d.getVar(&quot;SPDX_PKGARCH&quot;)<br>
+=C2=A0 =C2=A0 if pkg_arch is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quo=
t;)<br>
+=C2=A0 =C2=A0 return pkg_arch<br>
+<br>
+<br>
=C2=A0def jsonld_arch_path(d, arch, subdir, name, deploydir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0if deploydir is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deploydir =3D Path(d.getVar(&quot;DEPLOY_=
DIR_SPDX&quot;))<br>
@@ -1109,7 +1116,7 @@ def write_jsonld_doc(d, objset, dest):<br>
<br>
<br>
=C2=A0def make_jsonld_link(d, fn, subdir, name, deploydir):<br>
-=C2=A0 =C2=A0 pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
+=C2=A0 =C2=A0 pkg_arch =3D get_pkg_arch(d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0link_name =3D jsonld_arch_path(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d,<br>
@@ -1136,7 +1143,7 @@ def write_recipe_jsonld_doc(<br>
=C2=A0 =C2=A0 =C2=A0create_spdx_id_links=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0create_task_link=3DFalse,<br>
=C2=A0):<br>
-=C2=A0 =C2=A0 pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
+=C2=A0 =C2=A0 pkg_arch =3D get_pkg_arch(d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0dest =3D jsonld_arch_path(d, pkg_arch, subdir, <a href=
=3D"http://objset.doc.name" rel=3D"noreferrer" target=3D"_blank">objset.doc=
.name</a>, deploydir=3Ddeploydir)<br>
<br>
</blockquote></div></div>

--00000000000035d0b60660a4c3fe--
