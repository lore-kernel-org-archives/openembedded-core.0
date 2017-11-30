Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D28EA719A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 10:58:10 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id d14so7078257ioc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I2Ym+HmzEkkZXOKKXm41ZqRIUjH2hXksv5iLIjuR2oM=;
	b=z4l5xb3igCMUJzYWRHSuNFlzhc+rDXfZh1LCoN+9Ge8xutmyiE8smMXzpq7jJoSVV5
	FXuoWZhTjGS973ZqznKxeSXjrpvcTx+FqjriC0n6zjA+hCKeZDQXVW+8HpHPf7KOX3jC
	VRi5HF7vP3lg20ZDm+U3GPYE91qtCf+H2jhqyii9iC67ttCk0EjT3AOsp9QLe8TzrwT2
	m8QjsC66p35PYvEIm3+F+qtebgXWrLOMoREF/vQdVj57wGemfeUtsXEsa1oJ1AZL/dtn
	XumCcrZ9vsHR+73F/5n/zvrqZBqMWXQ3tCmMqfGu/EuemQOrO9jyGKO8ZeGArAiyxk+F
	dd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I2Ym+HmzEkkZXOKKXm41ZqRIUjH2hXksv5iLIjuR2oM=;
	b=U/o3Hmmxzdqoi0pgL8U9Ryvw7x1sagRy194UYqT9cmtihzPAQpzVSAyHZFd0UL5dhR
	h85BU3JyiiihscfDrvG1FpTa+JJts6n7E1ehbn4VDPbSF0dBG0NTdxLw3gcrMluUOViu
	0KNwHr9SfVmthB5mRCDX+pIyMgOjVL/TViNGlmqkmeaWHJRpnIWbmhUXN63taSjTNO9H
	UMv+l/BION069TfwYsSAA8pFBDTXlG2dbiWc4uwdZiTX90hLap7SEUGCbZ6hRx+OAtnf
	veFTyG9R1cn3sVtrmSjU5HO9+nIOPDgSyfkN/415UZTl2v/oVmNvJEBQWSJRNyS0kfNO
	kGUA==
X-Gm-Message-State: AJaThX7/1axe9oFJfeFASeCLqN7V8GueshfRUFHOGbxTASse6Ts55FoH
	ummC+W1+sD3m4tq5pp3aDsQdOVtIEMquI0S+enux1w==
X-Google-Smtp-Source: AGs4zMZCCuS1icBs2S0IT0i0c9HvSiC8d0qRy84oMTB0VIJG4QZ+kL3/Pj//tGNF8XonXIPWnV76ZLpkVuUmGVMGOLg=
X-Received: by 10.107.32.18 with SMTP id g18mr7053711iog.227.1512039491799;
	Thu, 30 Nov 2017 02:58:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Thu, 30 Nov 2017 02:57:51 -0800 (PST)
In-Reply-To: <09182bb829b79804f26ee1a0eb83115cb6cef51f.1510642397.git.liezhi.yang@windriver.com>
References: <cover.1510642397.git.liezhi.yang@windriver.com>
	<09182bb829b79804f26ee1a0eb83115cb6cef51f.1510642397.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Nov 2017 10:57:51 +0000
Message-ID: <CAJTo0LYSpB_HSXqRKE_ytqEoDNfFdYhm4pJ4WJj534voMSX-UA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] targetcontrol.py: make QEMU_USE_KVM = "1" work
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
X-List-Received-Date: Thu, 30 Nov 2017 10:58:11 -0000
Content-Type: multipart/alternative; boundary="001a1141b498cbc1ef055f312018"

--001a1141b498cbc1ef055f312018
Content-Type: text/plain; charset="UTF-8"

There are two neater ways of doing this:

1) oe.types.boolean() which handles all the common aliases for true or
false.
2)bitbake typed variables.  Do QEMU_USE_KVM[type]="boolean" where it gets a
default value, and then use oe.data.typed_value('QEMU_USE_KVM', d) to get
the value.

Both ways move the actual value parsing to dedicated code so its less error
prone and more consistent.

Ross

On 14 November 2017 at 06:57, Robert Yang <liezhi.yang@windriver.com> wrote:

> It only could be set to "True", which was not common in oe, e.g.:
> * Works
> QEMU_USE_KVM = "True"
>
> * Didn't work, this would surprise user.
> QEMU_USE_KVM = "1"
>
> Make it work with both 1 and True now, the "True" is for compatibility.
>
> [YOCTO #12343]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  meta/lib/oeqa/targetcontrol.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.
> bbclass
> index 45bb2bd..66b4baf 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -215,7 +215,7 @@ def testimage_main(d):
>      # Get use_kvm
>      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>      if qemu_use_kvm and \
> -       (qemu_use_kvm == 'True' and 'x86' in machine or \
> +       (qemu_use_kvm in ('True', '1') and 'x86' in machine or \
>          d.getVar('MACHINE') in qemu_use_kvm.split()):
>          kvm = True
>      else:
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.
> py
> index f63936c..1625569 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>          if qemu_use_kvm and \
> -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
> +           (qemu_use_kvm in ("True", "1") and "x86" in
> d.getVar("MACHINE") or \
>              d.getVar("MACHINE") in qemu_use_kvm.split()):
>              use_kvm = True
>          else:
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141b498cbc1ef055f312018
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">There are two neater ways of do=
ing this:</div><br>1) oe.types.boolean() which handles all the common alias=
es for true or false.<div>2)bitbake typed variables.=C2=A0 Do QEMU_USE_KVM[=
type]=3D&quot;boolean&quot; where it gets a default value, and then use oe.=
data.typed_value(&#39;QEMU_USE_KVM&#39;, d) to get the value.</div><div><br=
></div><div>Both ways move the actual value parsing to dedicated code so it=
s less error prone and more consistent.</div><div><br></div><div>Ross</div>=
<div><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 14 Novemb=
er 2017 at 06:57, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezh=
i.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex">It only could be set to &quot;True&quot;, =
which was not common in oe, e.g.:<br>
* Works<br>
QEMU_USE_KVM =3D &quot;True&quot;<br>
<br>
* Didn&#39;t work, this would surprise user.<br>
QEMU_USE_KVM =3D &quot;1&quot;<br>
<br>
Make it work with both 1 and True now, the &quot;True&quot; is for compatib=
ility.<br>
<br>
[YOCTO #12343]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/testimage.bbclass | 2 +-<br>
=C2=A0meta/lib/oeqa/targetcontrol.py | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/testimage.<wbr>bbclass b/meta/classes/testimage.<=
wbr>bbclass<br>
index 45bb2bd..66b4baf 100644<br>
--- a/meta/classes/testimage.<wbr>bbclass<br>
+++ b/meta/classes/testimage.<wbr>bbclass<br>
@@ -215,7 +215,7 @@ def testimage_main(d):<br>
=C2=A0 =C2=A0 =C2=A0# Get use_kvm<br>
=C2=A0 =C2=A0 =C2=A0qemu_use_kvm =3D d.getVar(&quot;QEMU_USE_KVM&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if qemu_use_kvm and \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(qemu_use_kvm =3D=3D &#39;True&#39; and &#39;x8=
6&#39; in machine or \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(qemu_use_kvm in (&#39;True&#39;, &#39;1&#39;) =
and &#39;x86&#39; in machine or \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;MACHINE&#39;) in qemu_use_k=
vm.split()):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm =3D True<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/meta/lib/oeqa/targetcontrol.<wbr>py b/meta/lib/oeqa/targetcont=
rol.<wbr>py<br>
index f63936c..1625569 100644<br>
--- a/meta/lib/oeqa/targetcontrol.<wbr>py<br>
+++ b/meta/lib/oeqa/targetcontrol.<wbr>py<br>
@@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_dir =3D d.getVar(&quot;TESTIMAGE_DUM=
P_DIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_use_kvm =3D d.getVar(&quot;QEMU_USE_=
KVM&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if qemu_use_kvm and \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(qemu_use_kvm =3D=3D &quot;True&q=
uot; and &quot;x86&quot; in d.getVar(&quot;MACHINE&quot;) or \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(qemu_use_kvm in (&quot;True&quot=
;, &quot;1&quot;) and &quot;x86&quot; in d.getVar(&quot;MACHINE&quot;) or \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;MACHINE&quot=
;) in qemu_use_kvm.split()):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_kvm =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div></div>

--001a1141b498cbc1ef055f312018--
