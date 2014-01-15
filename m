Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 23AEF6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:27:07 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wp4so987428obc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=OuuHmHYaxEyAXAUNwuIWh8+B1OrZAC5FqRfRm0zkdAI=;
	b=mcf5OnDHrsRDz1AdEFEZU/FA01G5KXOYCobYC1ffF6PcngsmuY6Buv0YrntTagci0f
	NN/RyvYJbWB+9aGc/9dpWUigJfGDC85g3Fz59Ed4/aVpgdp7yy0JizxgDDekaN23m/uB
	E3kUzrFG8l8vW/RsOZZgdr0OtqFnoCj7f85V/RSIsUyjAy/PQMU1cn9C0YCgwwKAyrV7
	JMzx/Xckl7aCMLEF95msETJ4vBFuZRUVwUZ0EyysekbpvoATLv9Tz4nzu2N9yeCXL4MQ
	NsO98akSVBkZMINDDVx0/qmY3sYYJCQHITLbPBQ1l4ZEqDX7TMZuGtYA2pz6WH158doi
	NG9g==
MIME-Version: 1.0
X-Received: by 10.182.135.194 with SMTP id pu2mr1347466obb.38.1389785227908;
	Wed, 15 Jan 2014 03:27:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:27:07 -0800 (PST)
In-Reply-To: <b58ba1cebca8be200a6c438b6a146ae4100c2c4e.1389765320.git.bruce.ashfield@windriver.com>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>
	<b58ba1cebca8be200a6c438b6a146ae4100c2c4e.1389765320.git.bruce.ashfield@windriver.com>
Date: Wed, 15 Jan 2014 09:27:07 -0200
X-Google-Sender-Auth: GuCMjFvyVBxvdXH581TeLjx_2Ac
Message-ID: <CAP9ODKqs2ipsdVzx=bTVR8KcAQxYCbEX7BpwWCx7CFtcBs3GRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] linux-yocto/3.10: mohonpeak bsp config and scc files
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
X-List-Received-Date: Wed, 15 Jan 2014 11:27:08 -0000
Content-Type: multipart/alternative; boundary=089e0122a6c0d2dc9b04f00096d9

--089e0122a6c0d2dc9b04f00096d9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 3:57 AM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 ++-
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bbb/meta/recipes-kernel/linux/
> linux-yocto-rt_3.10.bb
> index d301c06eae37..4541a946b707 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> @@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>
>  SRCREV_machine ?= "957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d"
>  SRCREV_machine_qemuppc ?= "37e40b7017a9c78d676b19716011494dc7cb6369"
> -SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
> +SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
>
>  LINUX_VERSION ?= "3.10.25"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bbb/meta/recipes-kernel/linux/
> linux-yocto-tiny_3.10.bb
> index e7565c626c5a..0903c708b9a0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> @@ -10,7 +10,8 @@ LINUX_VERSION ?= "3.10.25"
>  KMETA = "meta"
>
>  SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
> -SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
> +SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
> +
>

left over new line.


>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bbb/meta/recipes-kernel/linux/
> linux-yocto_3.10.bb
> index 33e745692b25..d0772fddc5f1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> @@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?=
> "79af968f2f26378798aec7a6d729ff5a371aae5f"
>  SRCREV_machine_qemux86-64 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
>  SRCREV_machine_qemumips64 ?= "67efb2993ec7726df5567e2572fd64e34e29b46d"
>  SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
> -SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
> +SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta
> "
>
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0122a6c0d2dc9b04f00096d9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 3:57 AM, Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.=
ashfield@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;<=
br>

---<br>
=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_3.10.bb" targ=
et=3D"_blank">linux-yocto-rt_3.10.bb</a> =A0 | 2 +-<br>
=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_3.10.bb" ta=
rget=3D"_blank">linux-yocto-tiny_3.10.bb</a> | 3 ++-<br>
=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.10.bb" target=
=3D"_blank">linux-yocto_3.10.bb</a> =A0 =A0 =A0| 2 +-<br>
=A03 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_3.1=
0.bb" target=3D"_blank">linux-yocto-rt_3.10.bb</a> b/meta/recipes-kernel/li=
nux/<a href=3D"http://linux-yocto-rt_3.10.bb" target=3D"_blank">linux-yocto=
-rt_3.10.bb</a><br>

index d301c06eae37..4541a946b707 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_3.10.bb" t=
arget=3D"_blank">linux-yocto-rt_3.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_3.10.bb" t=
arget=3D"_blank">linux-yocto-rt_3.10.bb</a><br>
@@ -5,7 +5,7 @@ KBRANCH_qemuppc =3D &quot;standard/preempt-rt/qemuppc&quot;=
<br>
<br>
=A0SRCREV_machine ?=3D &quot;957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d&quot;=
<br>
=A0SRCREV_machine_qemuppc ?=3D &quot;37e40b7017a9c78d676b19716011494dc7cb63=
69&quot;<br>
-SRCREV_meta ?=3D &quot;778d5f6259f0b8e28a46d8a764979e20e5a8ffc4&quot;<br>
+SRCREV_meta ?=3D &quot;4d658aa580df62232a4a84957b02496436dc17c4&quot;<br>
<br>
=A0LINUX_VERSION ?=3D &quot;3.10.25&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_3=
.10.bb" target=3D"_blank">linux-yocto-tiny_3.10.bb</a> b/meta/recipes-kerne=
l/linux/<a href=3D"http://linux-yocto-tiny_3.10.bb" target=3D"_blank">linux=
-yocto-tiny_3.10.bb</a><br>

index e7565c626c5a..0903c708b9a0 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_3.10.bb"=
 target=3D"_blank">linux-yocto-tiny_3.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_3.10.bb"=
 target=3D"_blank">linux-yocto-tiny_3.10.bb</a><br>
@@ -10,7 +10,8 @@ LINUX_VERSION ?=3D &quot;3.10.25&quot;<br>
=A0KMETA =3D &quot;meta&quot;<br>
<br>
=A0SRCREV_machine ?=3D &quot;79af968f2f26378798aec7a6d729ff5a371aae5f&quot;=
<br>
-SRCREV_meta ?=3D &quot;778d5f6259f0b8e28a46d8a764979e20e5a8ffc4&quot;<br>
+SRCREV_meta ?=3D &quot;4d658aa580df62232a4a84957b02496436dc17c4&quot;<br>
+<br></blockquote><div><br></div><div>left over new line.</div><div>=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.10.b=
b" target=3D"_blank">linux-yocto_3.10.bb</a> b/meta/recipes-kernel/linux/<a=
 href=3D"http://linux-yocto_3.10.bb" target=3D"_blank">linux-yocto_3.10.bb<=
/a><br>

index 33e745692b25..d0772fddc5f1 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.10.bb" targ=
et=3D"_blank">linux-yocto_3.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.10.bb" targ=
et=3D"_blank">linux-yocto_3.10.bb</a><br>
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?=3D &quot;79af968f2f26378798aec7a=
6d729ff5a371aae5f&quot;<br>
=A0SRCREV_machine_qemux86-64 ?=3D &quot;79af968f2f26378798aec7a6d729ff5a371=
aae5f&quot;<br>
=A0SRCREV_machine_qemumips64 ?=3D &quot;67efb2993ec7726df5567e2572fd64e34e2=
9b46d&quot;<br>
=A0SRCREV_machine ?=3D &quot;79af968f2f26378798aec7a6d729ff5a371aae5f&quot;=
<br>
-SRCREV_meta ?=3D &quot;778d5f6259f0b8e28a46d8a764979e20e5a8ffc4&quot;<br>
+SRCREV_meta ?=3D &quot;4d658aa580df62232a4a84957b02496436dc17c4&quot;<br>
<br>
=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yoc=
to-3.10.git;bareclone=3D1;branch=3D${KBRANCH},${KMETA};name=3Dmachine,meta"=
 target=3D"_blank">git.yoctoproject.org/linux-yocto-3.10.git;bareclone=3D1;=
branch=3D${KBRANCH},${KMETA};name=3Dmachine,meta</a>&quot;<br>

<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.1.2<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O=
.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">ht=
tp://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossyste=
ms.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-7" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347=
) 903-9750</span></span><br>
</div></div>

--089e0122a6c0d2dc9b04f00096d9--
