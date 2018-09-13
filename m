Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BD55A745F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 22:16:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 20-v6so8294695wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vkjcreXabtVADFQJ7sLl4Eaw34NHvxUk8hb4CsJmzRc=;
	b=PQ2YbE2qW4IBQKHh6ABH3Yna/dFUXH26ydbIeToEhegxN5/uN289RuJhYQZ9bLLtB1
	d/WUMQW59KOiCfIam8DYGBK0n22tzB/xHHVMTcw6OxaIrEzdCoLb4CVSWnZUiYkkqDPi
	/OiX4c9PrkdF0yNK6celRsbWcawAYocSRLzx+qpndB/xj86wR1jJnAiNvC9lV6TVF6Q2
	trRDvFx+T/s3MFPhHF51gcwbm8tbsy2e1k104/hCzMkW4Kd+HYYouswSEYWZzsYPuZoY
	2qqzFIWo6vdAzKxDazq3HzSFCSjGbbLQ6Ajgw0shjEMer+CKyGSc9n3jSRwx5QlunBbB
	1Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vkjcreXabtVADFQJ7sLl4Eaw34NHvxUk8hb4CsJmzRc=;
	b=ZE9NRUh42UK7Ct3hOfhPAw7xeaxrFln2myDD6IGou+4Tq8ez6v/b1oXqMFnLmXSlOL
	4ALkaP5OkFNJnpvLN6piXT4wMsXzPVcDM4qk4Lj5idLPlwgiKqTdJeHcFpPJ63cbku82
	IFftZrGjb3X1VfH+Q7Tt7XTUDs4CSVNTGsRyokTj/aOuaZFR9nOQDlmNDngJSERV/r8x
	dTPZqx/Fi2Rz3TurCnGhQt1+TzyG+yfeE/hKCU/UAjdehKgpMMheFIKXo0vrjHaVv5jN
	MigfgG5NznW0ChDNZEyBdiF2VB2BA73bd3QgG1zpKn6pNEDjH9ml65bD/PH1hyzCIzAK
	yaOw==
X-Gm-Message-State: APzg51A8TOy+zbry3MuS3V+NVcwHAJQOYuGPn2qBakozy03G75bUvj/s
	a7GL7UYdmbY4rGwCrmlW8qKrWupjloumD4a17mg=
X-Google-Smtp-Source: ANB0VdatqbQ0FdDj55kQFQaaF7VtQnN93viKI012zZlfETqmdvjQ0vb5J/pGKDLd75wSF/MPtac/uDIVPBZXlKlXfTo=
X-Received: by 2002:adf:d245:: with SMTP id o5-v6mr7463448wri.91.1536876997386;
	Thu, 13 Sep 2018 15:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180913072547.12321-1-anuj.mittal@intel.com>
	<CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
In-Reply-To: <CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Sep 2018 00:16:27 +0200
Message-ID: <CA+chaQePowpbWZi_k-iJKdUn+ocPZC_0T4VBArs82DSuO0iJkw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Thu, 13 Sep 2018 22:16:37 -0000
Content-Type: multipart/alternative; boundary="0000000000007e24e00575c80fb4"

--0000000000007e24e00575c80fb4
Content-Type: text/plain; charset="UTF-8"

Is this different issue than what was discussed in:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg109516.html

The message is slightly different (might be changed in newer qemu used
now), but the issue I had before was that features of selected -cpu and
host cpu didn't match and qemu failed with:
qemu-system-x86_64: warning: host doesn't support requested feature:
CPUID.01H:EDX.ss [bit 27]
when some features were missing and kvm was used.

If it's the same root cause, then it's not a bug in qemu.

On Thu, Sep 13, 2018 at 11:33 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Sep 13, 2018 at 12:25 AM, Anuj Mittal <anuj.mittal@intel.com>
> wrote:
> > Fixes warnings in builds using core2-32 tune:
> >
> > warning: TCG doesn't support requested feature:
> CPUID.80000001H:EDX.syscall [bit 11]
> > warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.lm
> [bit 29]
> >
> > when executing postinsts using qemu-i386.
> >
> > i386 target doesn't enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1]
> > while cpu choice of core2duo that we use for core2-32 TUNE does [2].
> > Use n270 cpu instead to use with qemu which supports SSSE3 and doesn't
> > have these bits enabled [3].
> >
> > [1] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L739
> > [2] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1439
> > [3] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1603
> >
> > Fixes [YOCTO #12916]
>
> Is this working around a bug in qemu?
>
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>> ---
> >  meta/conf/machine/include/tune-core2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/tune-core2.inc
> b/meta/conf/machine/include/tune-core2.inc
> > index c686bb4682..ddde719bde 100644
> > --- a/meta/conf/machine/include/tune-core2.inc
> > +++ b/meta/conf/machine/include/tune-core2.inc
> > @@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 =
> "${TUNE_FEATURES_tune-x86} core2"
> >  BASE_LIB_tune-core2-32 = "lib"
> >  TUNE_PKGARCH_tune-core2-32 = "core2-32"
> >  PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686}
> core2-32"
> > -QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
> > +QEMU_EXTRAOPTIONS_core2-32 = " -cpu n270"
> >
> >  AVAILTUNES += "core2-64"
> >  TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007e24e00575c80fb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Is this different issue =
than what was discussed in:<div><a href=3D"https://www.mail-archive.com/ope=
nembedded-core@lists.openembedded.org/msg109516.html">https://www.mail-arch=
ive.com/openembedded-core@lists.openembedded.org/msg109516.html</a><br></di=
v><div><br></div><div>The message is slightly different (might be changed i=
n newer qemu used now), but the issue I had before was that features of sel=
ected -cpu and host cpu didn&#39;t match and qemu failed with:</div><div><d=
iv>qemu-system-x86_64: warning: host doesn&#39;t support requested feature:=
 CPUID.01H:EDX.ss [bit 27]</div></div><div>when some features were missing =
and kvm was used.</div><div><br></div><div>If it&#39;s the same root cause,=
 then it&#39;s not a bug in qemu.</div></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Thu, Sep 13, 2018 at 11:33 PM Andre McCurd=
y &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Thu, Sep 13, 2018 at 12:25 =
AM, Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_bla=
nk">anuj.mittal@intel.com</a>&gt; wrote:<br>
&gt; Fixes warnings in builds using core2-32 tune:<br>
&gt;<br>
&gt; warning: TCG doesn&#39;t support requested feature: CPUID.80000001H:ED=
X.syscall [bit 11]<br>
&gt; warning: TCG doesn&#39;t support requested feature: CPUID.80000001H:ED=
X.lm [bit 29]<br>
&gt;<br>
&gt; when executing postinsts using qemu-i386.<br>
&gt;<br>
&gt; i386 target doesn&#39;t enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1=
]<br>
&gt; while cpu choice of core2duo that we use for core2-32 TUNE does [2].<b=
r>
&gt; Use n270 cpu instead to use with qemu which supports SSSE3 and doesn&#=
39;t<br>
&gt; have these bits enabled [3].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/qemu/qemu/blob/master/target/i386/cp=
u.c#L739" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu=
/blob/master/target/i386/cpu.c#L739</a><br>
&gt; [2] <a href=3D"https://github.com/qemu/qemu/blob/master/target/i386/cp=
u.c#L1439" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qem=
u/blob/master/target/i386/cpu.c#L1439</a><br>
&gt; [3] <a href=3D"https://github.com/qemu/qemu/blob/master/target/i386/cp=
u.c#L1603" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qem=
u/blob/master/target/i386/cpu.c#L1603</a><br>
&gt;<br>
&gt; Fixes [YOCTO #12916]<br>
<br>
Is this working around a bug in qemu?<br>
<br>
&gt; Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com=
" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/tune-core2.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/mach=
ine/include/tune-core2.inc<br>
&gt; index c686bb4682..ddde719bde 100644<br>
&gt; --- a/meta/conf/machine/include/tune-core2.inc<br>
&gt; +++ b/meta/conf/machine/include/tune-core2.inc<br>
&gt; @@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 =3D &quot;${TUNE_FEATURE=
S_tune-x86} core2&quot;<br>
&gt;=C2=A0 BASE_LIB_tune-core2-32 =3D &quot;lib&quot;<br>
&gt;=C2=A0 TUNE_PKGARCH_tune-core2-32 =3D &quot;core2-32&quot;<br>
&gt;=C2=A0 PACKAGE_EXTRA_ARCHS_tune-core2-32 =3D &quot;${PACKAGE_EXTRA_ARCH=
S_tune-i686} core2-32&quot;<br>
&gt; -QEMU_EXTRAOPTIONS_core2-32 =3D &quot; -cpu core2duo&quot;<br>
&gt; +QEMU_EXTRAOPTIONS_core2-32 =3D &quot; -cpu n270&quot;<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;core2-64&quot;<br>
&gt;=C2=A0 TUNE_FEATURES_tune-core2-64 =3D &quot;${TUNE_FEATURES_tune-x86-6=
4} core2&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007e24e00575c80fb4--
