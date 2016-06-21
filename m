Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FABD60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:39:38 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a186so3741783qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eU5PkbMqSstFb55vdLXO5rOPVGFS8I/gNUpZH4PYnJ0=;
	b=Mr8hgShFqYMG7t3oVB61+FHCq4QB0GHnSe3uspRMeSJDk4xWQ32g4KNqWCJT/TVYKT
	era0VOG5ucy4RTOjtFDe9hI+B+4AnQlAzPwouc54xz9jN3EVxF3b13CJT/AVOFlnD0Xg
	mXeFF1xQ63Bij+6QhcSwC2gckHISTR/NNFZOag1RqbCXOb003c3BiGfiPnWF8vdKjZxT
	69sc0C3ufFFdD+CYLDipEbssguOQwBm2e7c0OmN16UcQ07WrlWRKaTJyPH64/iGMf22v
	SRFWI2XAbx6ZHCqXI6px1LtYAL4FiZ3l+ZtsGvOaz22AH4oH9cnfX1smSBE8uZkwQwF6
	SBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eU5PkbMqSstFb55vdLXO5rOPVGFS8I/gNUpZH4PYnJ0=;
	b=JEJkzH1ahgKbd8w0TqW21SZcrfK6W1y+S4gt6pHUFo+MSfhubOsKLasUJThOYf/rPp
	jVrk4S04pr/Jh3+YxfQeSQgPP3ebX3Af4Mc/VSm0FOysm+66B84vZwwix+eQVEemYhr6
	ExwbnT7zquG2WBkaQH6Qk+/jvgsGnJnrAzcdWTI2nGZV05PWMjUSfMrEAxPwfAUYvxxX
	kaN6JQ6e/fAjpKr3tCnmI1FtQBeGDrSaqE6wiW1rzkYse/yzNfOpwOcdL/DdP88llSdS
	U70wZwZmtEhyWcW9zrqy/g0EM3iAKrzzgpXdAdhHh9wBmIAEoUgk09/aDT/ve9h8SGph
	TOMw==
X-Gm-Message-State: ALyK8tL1+5fPageTCZ6JGmwdn/q5GcHdMbwuJmmSn5cwqt6v7gN5hdxJz6T7o4ECHis0o+LTHW3LMoR7MCA05g==
X-Received: by 10.55.198.196 with SMTP id s65mr29344071qkl.119.1466523564981; 
	Tue, 21 Jun 2016 08:39:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Tue, 21 Jun 2016 08:39:24 -0700 (PDT)
In-Reply-To: <57695F73.80209@mvista.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<1466519942-5978-3-git-send-email-akuster808@gmail.com>
	<CADkTA4PZjmyF7a_3UtmKBkhG_9Mu2_G_P0e69JywAGZbJ45hrQ@mail.gmail.com>
	<57695F73.80209@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Jun 2016 11:39:24 -0400
Message-ID: <CADkTA4NgVT0iXKWxZxOg3HTk55tiTo5Pwq0h6CaxTrwTRvmt4g@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-yocto: add qemuppc64
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
X-List-Received-Date: Tue, 21 Jun 2016 15:39:40 -0000
Content-Type: multipart/alternative; boundary=001a113f3f782543960535cba0e9

--001a113f3f782543960535cba0e9
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 21, 2016 at 11:38 AM, akuster <akuster@mvista.com> wrote:

>
>
> On 06/21/2016 08:01 AM, Bruce Ashfield wrote:
> > On Tue, Jun 21, 2016 at 10:39 AM, Armin Kuster <akuster808@gmail.com>
> wrote:
> >
> >> From: Armin Kuster <akuster@mvista.com>
> >>
> >
> > Is this for master ? If so, can you drop the SRCREV updates ? I have an
> > entire series
> > under test that bumps all the versions.
>
> Did work against master but had merge conflict on last rebase. I figured
> this patch would have to fixed up at time of merge.
>
> >
> > What is listed here, isn't ready to go yet.
>
> hhah, what is listed has going back in time. boy, screwed that merge
> conflict up. I will resend an update to this patch.
>


No worries. I sent an updated series (which you probably saw) with my latest
SRCREVs that I've tested. If you jump off the end of that, you should be
good.

Bruce


>
> thanks,
> Armin
> >
> > Bruce
> >
> >
> >>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> ---
> >>  meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22
> ++++++++++++----------
> >>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22
> ++++++++++++----------
> >>  2 files changed, 24 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> index 667212f..6053ea3 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> >> @@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
> >>  KBRANCH_qemuarm64 ?= "standard/qemuarm64"
> >>  KBRANCH_qemumips ?= "standard/mti-malta32"
> >>  KBRANCH_qemuppc  ?= "standard/qemuppc"
> >> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
> >>  KBRANCH_qemux86  ?= "standard/base"
> >>  KBRANCH_qemux86-64 ?= "standard/base"
> >>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
> >>
> >> -SRCREV_machine_qemuarm ?= "a6899b7c294ed25d9d37afde858cdd52f41f86b0"
> >> -SRCREV_machine_qemuarm64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> >> -SRCREV_machine_qemumips ?= "69936a9614608b7aa893ae78bd69e5cc197816c3"
> >> -SRCREV_machine_qemuppc ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> >> -SRCREV_machine_qemux86 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> >> -SRCREV_machine_qemux86-64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> >> -SRCREV_machine_qemumips64 ?= "f0eb9eabbeafa5eadf66893822ea42d80e04afbd"
> >> -SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> >> -SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
> >> +SRCREV_machine_qemuarm ?= "a7b999561115b0b84814a2a27fe3f8c5b0599b0d"
> >> +SRCREV_machine_qemuarm64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_machine_qemumips ?= "ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e4"
> >> +SRCREV_machine_qemuppc ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_machine_qemuppc64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_machine_qemux86 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_machine_qemux86-64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_machine_qemumips64 ?= "75260c1966188a38e070420624ac65b188f77948"
> >> +SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> >> +SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
> >>
> >>  SRC_URI = "git://
> >> git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH};
> \
> >>             git://
> >>
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}
> >> "
> >> @@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
> >>  KMETA = "kernel-meta"
> >>  KCONF_BSP_AUDIT_LEVEL = "2"
> >>
> >> -COMPATIBLE_MACHINE =
> >> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> >> +COMPATIBLE_MACHINE =
> >>
> "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
> >>
> >>  # Functionality flags
> >>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> index d69ecec..a277199 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> >> @@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
> >>  KBRANCH_qemuarm64 ?= "standard/qemuarm64"
> >>  KBRANCH_qemumips ?= "standard/mti-malta32"
> >>  KBRANCH_qemuppc  ?= "standard/qemuppc"
> >> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
> >>  KBRANCH_qemux86  ?= "standard/base"
> >>  KBRANCH_qemux86-64 ?= "standard/base"
> >>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
> >>
> >> -SRCREV_machine_qemuarm ?= "cdfdcbd7ee553dc2e483813054a378ef9eaa44b6"
> >> -SRCREV_machine_qemuarm64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> >> -SRCREV_machine_qemumips ?= "b1f51ad1d4e95be437bf7725e094d6ad1b8286b0"
> >> -SRCREV_machine_qemuppc ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> >> -SRCREV_machine_qemux86 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> >> -SRCREV_machine_qemux86-64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> >> -SRCREV_machine_qemumips64 ?= "4b17815085dbd2a0408d7969bf4689a4c2b12942"
> >> -SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> >> -SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
> >> +SRCREV_machine_qemuarm ?= "ae04be16985c86803d8016b06aa57c02fe63cab3"
> >> +SRCREV_machine_qemuarm64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_machine_qemumips ?= "1d16db0bce02f4f46a925e5425194de8d25a926e"
> >> +SRCREV_machine_qemuppc ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_machine_qemuppc64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_machine_qemux86 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_machine_qemux86-64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_machine_qemumips64 ?= "6fe42d5321cd24411c2a4b7f2aac8a01dfa82b8f"
> >> +SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> >> +SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
> >>
> >>  SRC_URI = "git://
> >> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH};
> \
> >>             git://
> >>
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> >> "
> >> @@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
> >>  KMETA = "kernel-meta"
> >>  KCONF_BSP_AUDIT_LEVEL = "2"
> >>
> >> -COMPATIBLE_MACHINE =
> >> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> >> +COMPATIBLE_MACHINE =
> >>
> "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
> >>
> >>  # Functionality flags
> >>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >
> >
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113f3f782543960535cba0e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 21, 2016 at 11:38 AM, akuster <span dir=3D"ltr">&lt;<a href=
=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 06/21/2016 08:01 AM, Bruce Ashfield wrote:<br>
&gt; On Tue, Jun 21, 2016 at 10:39 AM, Armin Kuster &lt;<a href=3D"mailto:a=
kuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; From: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Is this for master ? If so, can you drop the SRCREV updates ? I have a=
n<br>
&gt; entire series<br>
&gt; under test that bumps all the versions.<br>
<br>
</span>Did work against master but had merge conflict on last rebase. I fig=
ured<br>
this patch would have to fixed up at time of merge.<br>
<span class=3D""><br>
&gt;<br>
&gt; What is listed here, isn&#39;t ready to go yet.<br>
<br>
</span>hhah, what is listed has going back in time. boy, screwed that merge=
<br>
conflict up. I will resend an update to this patch.<br></blockquote><div><b=
r></div><div><br></div><div>No worries. I sent an updated series (which you=
 probably saw) with my latest<br></div><div>SRCREVs that I&#39;ve tested. I=
f you jump off the end of that, you should be good.<br><br></div><div>Bruce=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks,<br>
Armin<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.c=
om">akuster@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a> | 22 ++++++=
++++++----------<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> | 22 ++++++=
++++++----------<br>
&gt;&gt;=C2=A0 2 files changed, 24 insertions(+), 20 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoc=
to_4.1.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
&gt;&gt; index 667212f..6053ea3 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
&gt;&gt; @@ -7,19 +7,21 @@ KBRANCH_qemuarm=C2=A0 ?=3D &quot;standard/arm-ve=
rsatile-926ejs&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemuarm64 ?=3D &quot;standard/qemuarm64&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemumips ?=3D &quot;standard/mti-malta32&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemuppc=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
&gt;&gt; +KBRANCH_qemuppc64=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV_machine_qemuarm ?=3D &quot;a6899b7c294ed25d9d37afde858cdd5=
2f41f86b0&quot;<br>
&gt;&gt; -SRCREV_machine_qemuarm64 ?=3D &quot;9ba8c36e9ea7419d06accab5311e7=
fb0d56513ff&quot;<br>
&gt;&gt; -SRCREV_machine_qemumips ?=3D &quot;69936a9614608b7aa893ae78bd69e5=
cc197816c3&quot;<br>
&gt;&gt; -SRCREV_machine_qemuppc ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb=
0d56513ff&quot;<br>
&gt;&gt; -SRCREV_machine_qemux86 ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb=
0d56513ff&quot;<br>
&gt;&gt; -SRCREV_machine_qemux86-64 ?=3D &quot;9ba8c36e9ea7419d06accab5311e=
7fb0d56513ff&quot;<br>
&gt;&gt; -SRCREV_machine_qemumips64 ?=3D &quot;f0eb9eabbeafa5eadf66893822ea=
42d80e04afbd&quot;<br>
&gt;&gt; -SRCREV_machine ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d56513f=
f&quot;<br>
&gt;&gt; -SRCREV_meta ?=3D &quot;9f68667031354532563766a3d04ca8a618e9177a&q=
uot;<br>
&gt;&gt; +SRCREV_machine_qemuarm ?=3D &quot;a7b999561115b0b84814a2a27fe3f8c=
5b0599b0d&quot;<br>
&gt;&gt; +SRCREV_machine_qemuarm64 ?=3D &quot;57f17e7008c57885ef5c41bda2829=
589e499ae28&quot;<br>
&gt;&gt; +SRCREV_machine_qemumips ?=3D &quot;ce9d4e563925e65c7a4b73fd6027ed=
8d2a4fc5e4&quot;<br>
&gt;&gt; +SRCREV_machine_qemuppc ?=3D &quot;57f17e7008c57885ef5c41bda282958=
9e499ae28&quot;<br>
&gt;&gt; +SRCREV_machine_qemuppc64 ?=3D &quot;57f17e7008c57885ef5c41bda2829=
589e499ae28&quot;<br>
&gt;&gt; +SRCREV_machine_qemux86 ?=3D &quot;57f17e7008c57885ef5c41bda282958=
9e499ae28&quot;<br>
&gt;&gt; +SRCREV_machine_qemux86-64 ?=3D &quot;57f17e7008c57885ef5c41bda282=
9589e499ae28&quot;<br>
&gt;&gt; +SRCREV_machine_qemumips64 ?=3D &quot;75260c1966188a38e070420624ac=
65b188f77948&quot;<br>
&gt;&gt; +SRCREV_machine ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae2=
8&quot;<br>
&gt;&gt; +SRCREV_meta ?=3D &quot;4b4199bd24f206d459061bb0a920d009429d5ed3&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-4.1.git;name=3D=
machine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blank">git.yocto=
project.org/linux-yocto-4.1.git;name=3Dmachine;branch=3D${KBRANCH}</a>; \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dk=
meta;name=3Dmeta;branch=3Dyocto-4.1;destsuffix=3D${KMETA}" rel=3D"noreferre=
r" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-4.1;destsuffix=3D${KMETA}</a><br>
&gt;&gt; &quot;<br>
&gt;&gt; @@ -31,7 +33,7 @@ PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<=
br>
&gt;&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;&gt;<br>
&gt;&gt; -COMPATIBLE_MACHINE =3D<br>
&gt;&gt; &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux8=
6-64&quot;<br>
&gt;&gt; +COMPATIBLE_MACHINE =3D<br>
&gt;&gt; &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumip=
s64|qemux86-64&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Functionality flags<br>
&gt;&gt;=C2=A0 KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilte=
r.scc&quot;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yoc=
to_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; index d69ecec..a277199 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
&gt;&gt; @@ -7,19 +7,21 @@ KBRANCH_qemuarm=C2=A0 ?=3D &quot;standard/arm-ve=
rsatile-926ejs&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemuarm64 ?=3D &quot;standard/qemuarm64&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemumips ?=3D &quot;standard/mti-malta32&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemuppc=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
&gt;&gt; +KBRANCH_qemuppc64=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
&gt;&gt;=C2=A0 KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV_machine_qemuarm ?=3D &quot;cdfdcbd7ee553dc2e483813054a378e=
f9eaa44b6&quot;<br>
&gt;&gt; -SRCREV_machine_qemuarm64 ?=3D &quot;bc64c8124504681545cb97a22b69a=
4e4bfeb55e2&quot;<br>
&gt;&gt; -SRCREV_machine_qemumips ?=3D &quot;b1f51ad1d4e95be437bf7725e094d6=
ad1b8286b0&quot;<br>
&gt;&gt; -SRCREV_machine_qemuppc ?=3D &quot;bc64c8124504681545cb97a22b69a4e=
4bfeb55e2&quot;<br>
&gt;&gt; -SRCREV_machine_qemux86 ?=3D &quot;bc64c8124504681545cb97a22b69a4e=
4bfeb55e2&quot;<br>
&gt;&gt; -SRCREV_machine_qemux86-64 ?=3D &quot;bc64c8124504681545cb97a22b69=
a4e4bfeb55e2&quot;<br>
&gt;&gt; -SRCREV_machine_qemumips64 ?=3D &quot;4b17815085dbd2a0408d7969bf46=
89a4c2b12942&quot;<br>
&gt;&gt; -SRCREV_machine ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb55e=
2&quot;<br>
&gt;&gt; -SRCREV_meta ?=3D &quot;870134f4bfa6208d6e5339e065486be3b6e693a5&q=
uot;<br>
&gt;&gt; +SRCREV_machine_qemuarm ?=3D &quot;ae04be16985c86803d8016b06aa57c0=
2fe63cab3&quot;<br>
&gt;&gt; +SRCREV_machine_qemuarm64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e4=
7b3b8c89711&quot;<br>
&gt;&gt; +SRCREV_machine_qemumips ?=3D &quot;1d16db0bce02f4f46a925e5425194d=
e8d25a926e&quot;<br>
&gt;&gt; +SRCREV_machine_qemuppc ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b=
3b8c89711&quot;<br>
&gt;&gt; +SRCREV_machine_qemuppc64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e4=
7b3b8c89711&quot;<br>
&gt;&gt; +SRCREV_machine_qemux86 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b=
3b8c89711&quot;<br>
&gt;&gt; +SRCREV_machine_qemux86-64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e=
47b3b8c89711&quot;<br>
&gt;&gt; +SRCREV_machine_qemumips64 ?=3D &quot;6fe42d5321cd24411c2a4b7f2aac=
8a01dfa82b8f&quot;<br>
&gt;&gt; +SRCREV_machine ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c8971=
1&quot;<br>
&gt;&gt; +SRCREV_meta ?=3D &quot;8900370d334ab4f7224fa71d7d46d62f0b11199d&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-4.4.git;name=3D=
machine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blank">git.yocto=
project.org/linux-yocto-4.4.git;name=3Dmachine;branch=3D${KBRANCH}</a>; \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dk=
meta;name=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}" rel=3D"noreferre=
r" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-4.4;destsuffix=3D${KMETA}</a><br>
&gt;&gt; &quot;<br>
&gt;&gt; @@ -31,7 +33,7 @@ PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<=
br>
&gt;&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;&gt;<br>
&gt;&gt; -COMPATIBLE_MACHINE =3D<br>
&gt;&gt; &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux8=
6-64&quot;<br>
&gt;&gt; +COMPATIBLE_MACHINE =3D<br>
&gt;&gt; &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumip=
s64|qemux86-64&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Functionality flags<br>
&gt;&gt;=C2=A0 KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilte=
r.scc&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 1.9.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113f3f782543960535cba0e9--
