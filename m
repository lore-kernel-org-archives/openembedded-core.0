Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02F027887D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:16:00 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 68so32943ite.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qDXyaaBgWZvjeXlDRMnHkKPS2QJzr3M/vcPYZQehIQA=;
	b=pHt6hpNTEvpX4dQicp9rXacD1p2nQMLEcnzsE9AUObYhb8+Z+ddXq505l3SxmHlE5W
	BV/HpeGEizZIC39eQ1PxYmGdvVpAV6abaKXbdY2p6dSVs8O94Bq60ewAoTFHn3BXIbcO
	IqJb63OagnpSQM95w/G1Sj8wjSz+J0WG/uy3NUOoA1ogooeuOpwgIYiQ+4KPho9uzr+B
	Nlb9Aw4SXa4l3BEWdzprJu6wtujlP3nCg7blZUB+IjJRai/LSmHaLgGePu80eVRQFMat
	B3SslCUN/jUM9lWhOuqEjqj9QTuVnAVBwQV1PgLJ54tqjqdx1z9d9c30JaHSbffC5Qer
	Ni6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qDXyaaBgWZvjeXlDRMnHkKPS2QJzr3M/vcPYZQehIQA=;
	b=eb5m7tD0qrD5fN6MJf98iKZF92BM/84iC8XRm09UDxKg7edCtCcjgvlf/8bcajl9Sw
	EhyshjEe0bNcAtBhAH9VGqNvswrX7o6bMNEXbHZgkrQudufVTXJKOB6dc0tehC5C5Fka
	BDPV2sdLe++DybH/C8b4/i7GSnr3fBeD0ZTszBEz5s6O2zNs3ZkhCpbtwA3g95i3xyT8
	QITv99yp1eyYiOcRW9++fMbghajbreOwHL9uHrFcxwWP7jC043MCYZ/1StAkkTVMxKpF
	yrc7nqviM+A5Nz9/Djq6MFW5n2BNMyCZzF2PgwSxdz0ignj+/VrjGnqwnze8C02WcbGH
	zIAQ==
X-Gm-Message-State: AKGB3mK7gbUZdUbIrYCE1gsMM3yUkQMakh+EHJrYQN/yu7N98l2joYeO
	+5MjJzj2dBYDeJanT0FFuYScVLQIzceiE2snzdDOiA==
X-Google-Smtp-Source: ACJfBou7n9oOSzjFAeC0JxO1O2zzMdmEyKCCalZCFtGM5tyEZxkHy0FmW0ToeVHUcZ6Eeklf/rLFSwuUkakOX3b0kAM=
X-Received: by 10.36.162.65 with SMTP id o1mr342775iti.85.1513098962257; Tue,
	12 Dec 2017 09:16:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 09:15:41 -0800 (PST)
In-Reply-To: <CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
References: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
	<CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 17:15:41 +0000
Message-ID: <CAJTo0LY5HZfqBbtoVNjOYVsLOwtUvNjiyrRJcJuCxh8s43CDCg@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: use arm instruction set for armv4 and armv5
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
X-List-Received-Date: Tue, 12 Dec 2017 17:16:03 -0000
Content-Type: multipart/alternative; boundary="f403045fbd8427e399056027ce7b"

--f403045fbd8427e399056027ce7b
Content-Type: text/plain; charset="UTF-8"

Just to make it clear I'm waiting on Andrea or Khem to ping the right patch.

Ross

On 12 December 2017 at 15:23, Andrea Adami <andrea.adami@gmail.com> wrote:

> Hello,
>
> musl 1.18 recipe is still failing.
> Please apply one of the a.m. patches, thanks
>
> Andrea
>
> On Wed, Nov 15, 2017 at 4:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> >> thumb1 is not supported with musl.
> >>
> >> Fixes: [YOCTO #12336]
> >>
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >>  meta/recipes-core/musl/musl.inc | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-core/musl/musl.inc
> b/meta/recipes-core/musl/musl.inc
> >> index 56c9d7f..b4b0de9 100644
> >> --- a/meta/recipes-core/musl/musl.inc
> >> +++ b/meta/recipes-core/musl/musl.inc
> >> @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
> >>  # Doesn't compile in MIPS16e mode due to use of hand-written
> >>  # assembly
> >>  MIPS_INSTRUCTION_SET = "mips"
> >> +
> >> +# Doesn't support thumb1
> >> +ARM_INSTRUCTION_SET_armv4 = "arm"
> >> +ARM_INSTRUCTION_SET_armv5 = "arm"
> >
> > Ah I submitted a parallel fix that was sitting on my branch.
> > is that fine ?
> >
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fbd8427e399056027ce7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just to make it clear I&#39;m waiting on Andrea or Khem to=
 ping the right patch.<div><br></div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 12 December 2017 at 15:23, Andr=
ea Adami <span dir=3D"ltr">&lt;<a href=3D"mailto:andrea.adami@gmail.com" ta=
rget=3D"_blank">andrea.adami@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hello,<br>
<br>
musl 1.18 recipe is still failing.<br>
Please apply one of the a.m. patches, thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrea<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Nov 15, 2017 at 4:37 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami &lt;<a href=3D"mailto:an=
drea.adami@gmail.com">andrea.adami@gmail.com</a>&gt; wrote:<br>
&gt;&gt; thumb1 is not supported with musl.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: [YOCTO #12336]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gma=
il.com">andrea.adami@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-core/musl/musl.<wbr>inc | 4 ++++<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/musl/musl.<wbr>inc b/meta/recipes-c=
ore/musl/musl.<wbr>inc<br>
&gt;&gt; index 56c9d7f..b4b0de9 100644<br>
&gt;&gt; --- a/meta/recipes-core/musl/musl.<wbr>inc<br>
&gt;&gt; +++ b/meta/recipes-core/musl/musl.<wbr>inc<br>
&gt;&gt; @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} =3D &quot;dev-so&quot;<br>
&gt;&gt;=C2=A0 # Doesn&#39;t compile in MIPS16e mode due to use of hand-wri=
tten<br>
&gt;&gt;=C2=A0 # assembly<br>
&gt;&gt;=C2=A0 MIPS_INSTRUCTION_SET =3D &quot;mips&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# Doesn&#39;t support thumb1<br>
&gt;&gt; +ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt;&gt; +ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;<br>
&gt; Ah I submitted a parallel fix that was sitting on my branch.<br>
&gt; is that fine ?<br>
&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045fbd8427e399056027ce7b--
