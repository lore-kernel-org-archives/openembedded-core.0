Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 49B3176FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 03:14:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E3EQwA013534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Sep 2016 20:14:27 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 13 Sep 2016 20:14:26 -0700
From: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
To: "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/3] linux-yocto/4.1: update to 4.1.32
Thread-Index: AQHSDi6p+rRUn/92sEC/eTwK2QfLDqB4T9Mi
Date: Wed, 14 Sep 2016 03:14:25 +0000
Message-ID: <a1lvafofimicfkso811qpswp.1473822860585@email.android.com>
References: <cover.1473704020.git.bruce.ashfield@windriver.com>
	<924accb9f4101282ad0fb3417fdb48e1439679d8.1473704020.git.bruce.ashfield@windriver.com>,
	<272ec6fd-6989-bb61-a8f2-0faef9eb6fbb@windriver.com>
In-Reply-To: <272ec6fd-6989-bb61-a8f2-0faef9eb6fbb@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.1: update to 4.1.32
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
X-List-Received-Date: Wed, 14 Sep 2016 03:14:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_a1lvafofimicfkso811qpswp1473822860585emailandroidcom_"

--_000_a1lvafofimicfkso811qpswp1473822860585emailandroidcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

RP had already let me know. I'm travelling at the moment but will figure ou=
t what happened when I get to my hotel.

If these merged .. simply revert them, since I'll resubmit them at the end =
of the week when I'm back

Bruce



Sent from my Samsung Galaxy smartphone.


-------- Original message --------
From: Robert Yang <liezhi.yang@windriver.com>
Date: 2016-09-13 7:21 PM (GMT-08:00)
To: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, richard.purdie@linuxf=
oundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto/4.1: update to 4.1.32


Hi Bruce,

All the kernel 4.1 and 4.4 buildings are down on autobuilder:
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/9=
28/stehttps://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/9=
47/steps/BuildImages/logs/stdiops/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/9=
28/steps/BuildImages/logs/stdio

// Robert

On 09/13/2016 02:16 AM, Bruce Ashfield wrote:
> Integrating the korg stable update
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++-------=
---
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_4.1.bb
> index f0d6a81a9c54..4308a07a9765 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "b88e2b5805213daeb0136fdd8c840dc0254a3d21"
> -SRCREV_meta ?=3D "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
> +SRCREV_machine ?=3D "ee83bffe0f76032fe0a0b7fde436f0f596101df2"
> +SRCREV_meta ?=3D "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=3D${K=
BRANCH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.1;destsuffix=3D${KMETA}"
>
> -LINUX_VERSION ?=3D "4.1.30"
> +LINUX_VERSION ?=3D "4.1.32"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_4.1.bb
> index 092a224451e1..2294a3db87da 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "4.1.30"
> +LINUX_VERSION ?=3D "4.1.32"
>
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
> -SRCREV_meta ?=3D "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
> +SRCREV_machine ?=3D "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
> +SRCREV_meta ?=3D "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-=
kernel/linux/linux-yocto_4.1.bb
> index e23d7da58881..f4006b74d096 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?=3D "standard/base"
>  KBRANCH_qemux86-64 ?=3D "standard/base"
>  KBRANCH_qemumips64 ?=3D "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?=3D "9c5e96205316d167379d101d808a6cda93adc335"
> -SRCREV_machine_qemuarm64 ?=3D "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
> -SRCREV_machine_qemumips ?=3D "9e531cb59dd7dfa2026637cc456a7bdcbdb50275"
> -SRCREV_machine_qemuppc ?=3D "32968ddd9357f72dfd427f5b3eda62c4a49833c7"
> -SRCREV_machine_qemux86 ?=3D "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
> -SRCREV_machine_qemux86-64 ?=3D "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f=
"
> -SRCREV_machine_qemumips64 ?=3D "106ed721d21c595dfb993a8990c3a29830dfc166=
"
> -SRCREV_machine ?=3D "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
> -SRCREV_meta ?=3D "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
> +SRCREV_machine_qemuarm ?=3D "4db58705727e27bea8ccf805bd5c7d04d2d029ed"
> +SRCREV_machine_qemuarm64 ?=3D "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
> +SRCREV_machine_qemumips ?=3D "d6237b3b244b894d4b3479ecf37acef041416dfa"
> +SRCREV_machine_qemuppc ?=3D "8520e65497ae10e14c38c76920a3457dc64349bf"
> +SRCREV_machine_qemux86 ?=3D "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
> +SRCREV_machine_qemux86-64 ?=3D "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462=
"
> +SRCREV_machine_qemumips64 ?=3D "d0524e144cd15a3c0edf768f68400968a4477cbe=
"
> +SRCREV_machine ?=3D "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
> +SRCREV_meta ?=3D "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.1.git;name=3Dmachi=
ne;branch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.1;destsuffix=3D${KMETA}"
>
> -LINUX_VERSION ?=3D "4.1.30"
> +LINUX_VERSION ?=3D "4.1.32"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
>

--_000_a1lvafofimicfkso811qpswp1473822860585emailandroidcom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>RP had already let me know. I'm travelling at the moment but will figu=
re out what happened when I get to my hotel.</div>
<div><br>
</div>
<div>If these merged .. simply revert them, since I'll resubmit them at the=
 end of the week when I'm back</div>
<div><br>
</div>
<div>Bruce</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div id=3D"x_composer_signature">
<div dir=3D"auto" style=3D"font-size:85%; color:#575757">Sent from my Samsu=
ng Galaxy smartphone.</div>
</div>
<div><br>
</div>
<div><br>
</div>
<div>-------- Original message --------</div>
<div>From: Robert Yang &lt;liezhi.yang@windriver.com&gt; </div>
<div>Date: 2016-09-13 7:21 PM (GMT-08:00) </div>
<div>To: &quot;Ashfield, Bruce&quot; &lt;Bruce.Ashfield@windriver.com&gt;, =
richard.purdie@linuxfoundation.org
</div>
<div>Cc: openembedded-core@lists.openembedded.org </div>
<div>Subject: Re: [OE-core] [PATCH 1/3] linux-yocto/4.1: update to 4.1.32 <=
/div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
Hi Bruce,<br>
<br>
All the kernel 4.1 and 4.4 buildings are down on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-x86-l=
sb/builds/928/stehttps://autobuilder.yoctoproject.org/main/builders/poky-ti=
ny/builds/947/steps/BuildImages/logs/stdiops/BuildImages/logs/stdio">https:=
//autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/928/ste=
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/947/ste=
ps/BuildImages/logs/stdiops/BuildImages/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-x86-l=
sb/builds/928/steps/BuildImages/logs/stdio">https://autobuilder.yoctoprojec=
t.org/main/builders/nightly-x86-lsb/builds/928/steps/BuildImages/logs/stdio=
</a><br>
<br>
// Robert<br>
<br>
On 09/13/2016 02:16 AM, Bruce Ashfield wrote:<br>
&gt; Integrating the korg stable update<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;bruce.ashfield@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb&nbsp;&nbsp; |&nb=
sp; 6 &#43;&#43;&#43;---<br>
&gt;&nbsp; meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |&nbsp; 6 &#43=
;&#43;&#43;---<br>
&gt;&nbsp; meta/recipes-kernel/linux/linux-yocto_4.1.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---------=
-<br>
&gt;&nbsp; 3 files changed, 16 insertions(&#43;), 16 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/re=
cipes-kernel/linux/linux-yocto-rt_4.1.bb<br>
&gt; index f0d6a81a9c54..4308a07a9765 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb<br>
&gt; @@ -11,13 &#43;11,13 @@ python () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raise bb.parse.S=
kipPackage(&quot;Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to=
 enable it&quot;)<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;b88e2b5805213daeb0136fdd8c840dc0254a3d21&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a&quot;=
<br>
&gt; &#43;SRCREV_machine ?=3D &quot;ee83bffe0f76032fe0a0b7fde436f0f596101df=
2&quot;<br>
&gt; &#43;SRCREV_meta ?=3D &quot;b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f&q=
uot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI =3D &quot;git://git.yoctoproject.org/linux-yocto-4.1.git=
;branch=3D${KBRANCH};name=3Dmachine \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.1;destsuffix=3D${KMETA}&quot;<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;4.1.30&quot;<br>
&gt; &#43;LINUX_VERSION ?=3D &quot;4.1.32&quot;<br>
&gt;<br>
&gt;&nbsp; PV =3D &quot;${LINUX_VERSION}&#43;git${SRCPV}&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/=
recipes-kernel/linux/linux-yocto-tiny_4.1.bb<br>
&gt; index 092a224451e1..2294a3db87da 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb<br=
>
&gt; @@ -4,13 &#43;4,13 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
&gt;<br>
&gt;&nbsp; require recipes-kernel/linux/linux-yocto.inc<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;4.1.30&quot;<br>
&gt; &#43;LINUX_VERSION ?=3D &quot;4.1.32&quot;<br>
&gt;<br>
&gt;&nbsp; KMETA =3D &quot;kernel-meta&quot;<br>
&gt;&nbsp; KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a&quot;=
<br>
&gt; &#43;SRCREV_machine ?=3D &quot;93b1a6cee7d4a4437a1c0edf3e54ffe78edb446=
2&quot;<br>
&gt; &#43;SRCREV_meta ?=3D &quot;b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f&q=
uot;<br>
&gt;<br>
&gt;&nbsp; PV =3D &quot;${LINUX_VERSION}&#43;git${SRCPV}&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recip=
es-kernel/linux/linux-yocto_4.1.bb<br>
&gt; index e23d7da58881..f4006b74d096 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-kernel/linux/linux-yocto_4.1.bb<br>
&gt; @@ -11,20 &#43;11,20 @@ KBRANCH_qemux86&nbsp; ?=3D &quot;standard/base=
&quot;<br>
&gt;&nbsp; KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
&gt;&nbsp; KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
&gt;<br>
&gt; -SRCREV_machine_qemuarm ?=3D &quot;9c5e96205316d167379d101d808a6cda93a=
dc335&quot;<br>
&gt; -SRCREV_machine_qemuarm64 ?=3D &quot;0847ed67f89b5a8bbaaa0a7b6cfa2a99e=
f34834f&quot;<br>
&gt; -SRCREV_machine_qemumips ?=3D &quot;9e531cb59dd7dfa2026637cc456a7bdcbd=
b50275&quot;<br>
&gt; -SRCREV_machine_qemuppc ?=3D &quot;32968ddd9357f72dfd427f5b3eda62c4a49=
833c7&quot;<br>
&gt; -SRCREV_machine_qemux86 ?=3D &quot;0847ed67f89b5a8bbaaa0a7b6cfa2a99ef3=
4834f&quot;<br>
&gt; -SRCREV_machine_qemux86-64 ?=3D &quot;0847ed67f89b5a8bbaaa0a7b6cfa2a99=
ef34834f&quot;<br>
&gt; -SRCREV_machine_qemumips64 ?=3D &quot;106ed721d21c595dfb993a8990c3a298=
30dfc166&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a&quot;=
<br>
&gt; &#43;SRCREV_machine_qemuarm ?=3D &quot;4db58705727e27bea8ccf805bd5c7d0=
4d2d029ed&quot;<br>
&gt; &#43;SRCREV_machine_qemuarm64 ?=3D &quot;93b1a6cee7d4a4437a1c0edf3e54f=
fe78edb4462&quot;<br>
&gt; &#43;SRCREV_machine_qemumips ?=3D &quot;d6237b3b244b894d4b3479ecf37ace=
f041416dfa&quot;<br>
&gt; &#43;SRCREV_machine_qemuppc ?=3D &quot;8520e65497ae10e14c38c76920a3457=
dc64349bf&quot;<br>
&gt; &#43;SRCREV_machine_qemux86 ?=3D &quot;93b1a6cee7d4a4437a1c0edf3e54ffe=
78edb4462&quot;<br>
&gt; &#43;SRCREV_machine_qemux86-64 ?=3D &quot;93b1a6cee7d4a4437a1c0edf3e54=
ffe78edb4462&quot;<br>
&gt; &#43;SRCREV_machine_qemumips64 ?=3D &quot;d0524e144cd15a3c0edf768f6840=
0968a4477cbe&quot;<br>
&gt; &#43;SRCREV_machine ?=3D &quot;93b1a6cee7d4a4437a1c0edf3e54ffe78edb446=
2&quot;<br>
&gt; &#43;SRCREV_meta ?=3D &quot;b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f&q=
uot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI =3D &quot;git://git.yoctoproject.org/linux-yocto-4.1.git=
;name=3Dmachine;branch=3D${KBRANCH}; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.1;destsuffix=3D${KMETA}&quot;<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;4.1.30&quot;<br>
&gt; &#43;LINUX_VERSION ?=3D &quot;4.1.32&quot;<br>
&gt;<br>
&gt;&nbsp; PV =3D &quot;${LINUX_VERSION}&#43;git${SRCPV}&quot;<br>
&gt;<br>
&gt;<br>
</div>
</span></font>
</body>
</html>

--_000_a1lvafofimicfkso811qpswp1473822860585emailandroidcom_--
