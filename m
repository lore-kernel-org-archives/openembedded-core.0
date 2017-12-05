Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC5D7841C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 16:11:13 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d137so2743564itc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+rXeiO8JG1LvJMU4pphb/Rr4s2mDhBJ+zZcNEAfLmJc=;
	b=CAenRCTlhImDuFVigItX50KxclMMthZpO/A4qcrkXtsERjACPgiuFEPX/h81NE952C
	Z0HYGwSE4zu3H22OpUodzFaot7LuWAndS2LtJ9ymFfkeocTIRxNCIWanDVvyrl/apQtS
	wIo9etIavEeszCsdQV+gZchl40DHlL8/efCg07/oXbXECb2voFn9Eg1QskEHx9zBy3ye
	YzfNfqRlSNDjNSQ3ueWr9pY8o1uB17awfm9U9ENETTXhwkk29JNq0/0D6o6r8T/3Mn3h
	i1WxKC90AGDRvIJzbr27JLWIDlhT14JbHDX+qX1dUJ+nR+xhqIbtc/bbu6dMC9xkmrQG
	35Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+rXeiO8JG1LvJMU4pphb/Rr4s2mDhBJ+zZcNEAfLmJc=;
	b=qf3MHlqtTLDKjTCD/TxzX5D2JT8q+2E6ZgK1d7yRtACfSYVTT24sL0vKj42ykDd/9w
	TMXLxz1mTFtHOM9IDQPsatO54SrQmXaI1EgpKLu2sjX4nxl5jHikwhBCMw2By74sscrj
	r6TkSUhjaJc4DRZjq+ci9j+iLBXgzKMX/criwiitzptnNufXwQG2IcyNdTepGLL5kNqA
	KIEpOoU8daKnnCwff1hsg7td57jicyMMPzQAhL53Jy2kyb9Ki4+5Y1DS/5YrWTUWIjPd
	FQZ0AZAUEJ3EtV0SxJ/OmtouNuR6I+ssNhHYjRmmMi7YLW+/BBR//eNNcDVpDmOJlTIp
	ARHQ==
X-Gm-Message-State: AJaThX7f3ngeRiCJYtBuLS5eohIok9kuvK7mvhTEe3RvaKZW8X8oeJS+
	qGk4hDLU+SCFAhN34ibZugrYE6HD5+BaLqAnIE3+mA==
X-Google-Smtp-Source: AGs4zMZbm+7Jk6C8qwXXD2rp0+c9/SuwBv45nhpJQzAe7LeBRbjAo4w74L59Pomhyw6/9x8ArPOawmtmvoCPUd85yCw=
X-Received: by 10.107.178.145 with SMTP id b139mr29410281iof.52.1512490274966; 
	Tue, 05 Dec 2017 08:11:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 5 Dec 2017 08:10:54 -0800 (PST)
In-Reply-To: <2b4e2875e667df753c33418eefc437d9d0da6216.1512104695.git.liezhi.yang@windriver.com>
References: <cover.1512104695.git.liezhi.yang@windriver.com>
	<2b4e2875e667df753c33418eefc437d9d0da6216.1512104695.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Dec 2017 16:10:54 +0000
Message-ID: <CAJTo0LZV1bVDcebUx=oDBhtZi-xCH5Cv+pFyxFYD0eeJ7=PJ6A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 V2] targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM
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
X-List-Received-Date: Tue, 05 Dec 2017 16:11:14 -0000
Content-Type: multipart/alternative; boundary="001a114ca162912a21055f9a15be"

--001a114ca162912a21055f9a15be
Content-Type: text/plain; charset="UTF-8"

On 1 December 2017 at 05:13, Robert Yang <liezhi.yang@windriver.com> wrote:

> So that both QEMU_USE_KVM = "True" and "1" will work.
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
> index 45bb2bd..7260ad4 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -215,7 +215,7 @@ def testimage_main(d):
>      # Get use_kvm
>      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>      if qemu_use_kvm and \
> -       (qemu_use_kvm == 'True' and 'x86' in machine or \
> +       (oe.types.boolean(qemu_use_kvm) and 'x86' in machine or \
>          d.getVar('MACHINE') in qemu_use_kvm.split()):
>          kvm = True
>      else:
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.
> py
> index f63936c..3fc3870 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>          if qemu_use_kvm and \
> -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
> +           (oe.types.boolean(qemu_use_kvm) and "x86" in
> d.getVar("MACHINE") or \
>              d.getVar("MACHINE") in qemu_use_kvm.split()):
>              use_kvm = True
>          else:
>

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/665/steps/Running%20oe-selftest/logs/stdio

  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/targetcontrol.py",
line 110, in __init__
    (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
UnboundLocalError: local variable 'oe' referenced before assignment

Ross

--001a114ca162912a21055f9a15be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 December 2017 at 05:13, Robert Yang <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.=
yang@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">So that both QEMU_USE_KVM =3D &quot=
;True&quot; and &quot;1&quot; will work.<br>
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
index 45bb2bd..7260ad4 100644<br>
--- a/meta/classes/testimage.<wbr>bbclass<br>
+++ b/meta/classes/testimage.<wbr>bbclass<br>
@@ -215,7 +215,7 @@ def testimage_main(d):<br>
=C2=A0 =C2=A0 =C2=A0# Get use_kvm<br>
=C2=A0 =C2=A0 =C2=A0qemu_use_kvm =3D d.getVar(&quot;QEMU_USE_KVM&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if qemu_use_kvm and \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(qemu_use_kvm =3D=3D &#39;True&#39; and &#39;x8=
6&#39; in machine or \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(oe.types.boolean(qemu_use_<wbr>kvm) and &#39;x=
86&#39; in machine or \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;MACHINE&#39;) in qemu_use_k=
vm.split()):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm =3D True<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/meta/lib/oeqa/targetcontrol.<wbr>py b/meta/lib/oeqa/targetcont=
rol.<wbr>py<br>
index f63936c..3fc3870 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(oe.types.boolean(qemu_use_<wbr>k=
vm) and &quot;x86&quot; in d.getVar(&quot;MACHINE&quot;) or \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;MACHINE&quot=
;) in qemu_use_kvm.split()):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_kvm =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br></blockquote><div><br></div><div=
><a href=3D"https://autobuilder.yocto.io/builders/nightly-oe-selftest/build=
s/665/steps/Running%20oe-selftest/logs/stdio">https://autobuilder.yocto.io/=
builders/nightly-oe-selftest/builds/665/steps/Running%20oe-selftest/logs/st=
dio</a><br><br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-oe-selftest/build/meta/lib/oeqa/targetcontrol.py&quot;, line 1=
10, in __init__<br>=C2=A0 =C2=A0 (oe.types.boolean(qemu_use_kvm) and &quot;=
x86&quot; in d.getVar(&quot;MACHINE&quot;) or \<br>UnboundLocalError: local=
 variable &#39;oe&#39; referenced before assignment=C2=A0<br></div><div><br=
></div><div>Ross</div></div></div></div>

--001a114ca162912a21055f9a15be--
