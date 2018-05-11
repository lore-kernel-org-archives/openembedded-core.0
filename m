Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFA4678594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 21:09:08 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id p85-v6so9775124lfg.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t1T/fRVeWs/8ft8soss/c6S/j+oiTOjWpx5tNSp7YFk=;
	b=Ty8+QReGBFjKxsM+5NphYoQSu55NxN5jVzGZ8nJRoQC+XD0Y4tKZtXJEStIikokGlb
	N3yULeB/rrkQ69336cA9/xjNaMHsauyLBBh2uQvJZ0i+vm4pbF6Rt/g2+KBUMbRdweRx
	uKZmziT2CMwJ2zPQ7eUjgb7CU4Jp1NMpbkaCQGSiAxyjcRTSEMb8otSPPNc0w8taR3wt
	foa7m4nhXrTDuMBlniYP/za1Q5yXc5/Y7Q6JVq9BOBax/Mmyu2VBkw9AXG9S543JF5lB
	9+BjQE4ksArz6CECtsPyutJ3l0RHbiFtAufR631uE9m79GJjiP7Shhtequd+qYPftvzP
	G1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t1T/fRVeWs/8ft8soss/c6S/j+oiTOjWpx5tNSp7YFk=;
	b=QTIVb1ExJwsbV/KFgQgbNGhABFFvhHmh0v48tszd1Ssc0cxuKX8o2a9805mYKiFujA
	5dk5/6mpeJC7SZgrpXzUUx79B/qG28Yfgj5gKB8P7VqmWiRVf1j8eXWi556Iy/rhjX1o
	2W1srOeRWI7Yq8vjctWOVI1nDi/saORk1Jj3Dz6LsxCtOV7YaLiMF2diqx9iCZjdHZkQ
	DXbNuiiP3sjLFR8isjFhHWGaGT9N67YVyA/Gdye5kh7NWUBt1bCOteE0leVyjid0mAQT
	+a8vlgHmKQ/f260Lv8i8W+V/594thlVneDTPs2PnCzcCG5pmH35+eU6Hr7qbK/Dnkq6U
	ZxlQ==
X-Gm-Message-State: ALKqPwdYIDn5v7k9+BsqnOVVZjKSWhwKBUVnI0WlvEJt5OdwWQTQyl1G
	T2tPFzJzVs5wszcrhM3EnyXHZz8FUrflNZjq9KfS2A==
X-Google-Smtp-Source: AB8JxZqgl/QD0Jgxo4KYXz5SMWoxSWpWAgLA6/R/lvYs2SpTwtiSD9/x3TLdF59RMvrd0T45pIV+3b2clxP3zzVHpHk=
X-Received: by 2002:a2e:9b4a:: with SMTP id
	o10-v6mr5027168ljj.49.1526072948848; 
	Fri, 11 May 2018 14:09:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Fri, 11 May 2018 14:09:08 -0700 (PDT)
In-Reply-To: <BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 May 2018 17:09:08 -0400
Message-ID: <CADkTA4NnhmA37wHWk1r4fZoAFZsoV-x=GW+OW_opdL8jwQgRCw@mail.gmail.com>
To: chris.laplante@agilent.com
Cc: jared.smith@agilent.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_kernel_configme and defconfig
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
X-List-Received-Date: Fri, 11 May 2018 21:09:09 -0000
Content-Type: multipart/alternative; boundary="000000000000048139056bf48caa"

--000000000000048139056bf48caa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 3:28 PM, Chris Laplante via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> OK, I figured out why this happens. This line in kernel-yocto.bbclass:
>
>
>
> scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes}
> ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>
>
>
> =E2=80=A6 passes the BSP def before the sccs. In my case, the BSP def is
> mymachine.scc, and the sccs is the defconfig. So that=E2=80=99s why the d=
efconfig
> comes after the BSP.
>
>
>
> My takeaway is that a BSP plus a defconfig is not a supported use case. I=
s
> that correct?
>

A defconfig isn't magic, it is just another input to the configuration
merging. It will be applied as any other fragment. There is some special
processing only a defconfig is specified, but otherwise, it is the same. So
in this case, whatever it sets would be applied after the BSP definition
and would take precedence (last through the gate wins).

If you have a BSP definition, you normally don't have a defconfig. Where is
the defconfig coming from in your scenario ? The SRC_URI ? You can just
include it from the .scc files to control the order, which is what is
expected when you have a BSP definition.

Were you seeing none of your options set ? or something else ?


>
>
> If so, I think it=E2=80=99s important to add some sanity checking to
> kernel-yocto.bbclass.
>
>
>

There's really nothing that could be checked, since the intent of the
fragments isn't known, and for the most part, defconfigs are the same as
any other fragment (from the point of view of the merging).

Bruce


> Thanks,
>
> Chris
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Chris
> Laplante via Openembedded-core
> *Sent:* Friday, May 11, 2018 2:51 PM
> *To:* openembedded-core@lists.openembedded.org
> *Cc:* SMITH,JARED (A-Little Falls,ex1) <jared.smith@agilent.com>
> *Subject:* [OE-core] do_kernel_configme and defconfig
>
>
>
> Hi all,
>
>
>
> Is it expected for do_kernel_configme to apply the defconfig last (after
> configuration fragments introduced by sccs)?
>
>
>
> For some reason, in the call to merge_config, =E2=80=9C.kernel-meta/confi=
gs//./defconfig=E2=80=9D
> is passed last whereas I=E2=80=99d expect it would be first (since that s=
hould be
> the base config). This is causing problems, because config options that m=
y
> config fragments are setting are getting overridden by the defconfig =E2=
=80=93 it
> should be the other way around.
>
>
>
> For reference, I=E2=80=99m using Rocko and have just updated to the lates=
t commit.
> We have an in-tree defconfig, and we set KBUILD_DEFCONFIG_machinename
> appropriately. We are using the separate kernel-meta repository to store
> kernel metadata. I have KMACHINE_machinename set up so that it finds the
> correct BSP definition .scc file. Still seem to be missing something,
> though.
>
>
>
> Thanks,
>
> Chris
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000048139056bf48caa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 11, 2018 at 3:28 PM, Chris Laplante via Openembedded-core <=
span dir=3D"ltr">&lt;<a href=3D"mailto:openembedded-core@lists.openembedded=
.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_475090223536561029WordSection1">
<p class=3D"MsoNormal">OK, I figured out why this happens. This line in ker=
nel-yocto.bbclass:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">scc --force -o ${S}/${met=
a_dir}:cfg,merge,<wbr>meta ${includes} ${bsp_definition} ${sccs} ${patches}=
 ${KERNEL_FEATURES}<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=E2=80=A6 passes the BSP def before the sccs. In my =
case, the BSP def is mymachine.scc, and the sccs is the defconfig. So that=
=E2=80=99s why the defconfig comes after the BSP.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">My takeaway is that a BSP plus a defconfig is not a =
supported use case. Is that correct?</p></div></div></blockquote><div><br><=
/div><div>A defconfig isn&#39;t magic, it is just another input to the conf=
iguration merging. It will be applied as any other fragment. There is some =
special processing only a defconfig is specified, but otherwise, it is the =
same. So in this case, whatever it sets would be applied after the BSP defi=
nition and would take precedence (last through the gate wins).</div><div><b=
r></div><div>If you have a BSP definition, you normally don&#39;t have a de=
fconfig. Where is the defconfig coming from in your scenario ? The SRC_URI =
? You can just include it from the .scc files to control the order, which i=
s what is expected when you have a BSP definition.</div><div><br></div><div=
>Were you seeing none of your options set ? or something else ?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"#056=
3C1" vlink=3D"#954F72"><div class=3D"m_475090223536561029WordSection1"><p c=
lass=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If so, I think it=E2=80=99s important to add some sa=
nity checking to kernel-yocto.bbclass.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0</p></div></div></blockquote><div><br><=
/div><div>There&#39;s really nothing that could be checked, since the inten=
t of the fragments isn&#39;t known, and for the most part, defconfigs are t=
he same as any other fragment (from the point of view of the merging).</div=
><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72"><div class=3D"m=
_475090223536561029WordSection1"><p class=3D"MsoNormal"><u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Chris<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:openembedded-core-bou=
nces@lists.openembedded.org" target=3D"_blank">openembedded-core-bounces@<w=
br>lists.openembedded.org</a> [mailto:<a href=3D"mailto:openembedded-core-b=
ounces@lists.openembedded.org" target=3D"_blank">openembedded-core-<wbr>bou=
nces@lists.openembedded.org</a><wbr>]
<b>On Behalf Of </b>Chris Laplante via Openembedded-core<br>
<b>Sent:</b> Friday, May 11, 2018 2:51 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a><br>
<b>Cc:</b> SMITH,JARED (A-Little Falls,ex1) &lt;<a href=3D"mailto:jared.smi=
th@agilent.com" target=3D"_blank">jared.smith@agilent.com</a>&gt;<br>
<b>Subject:</b> [OE-core] do_kernel_configme and defconfig<u></u><u></u></p=
>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi all,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Is it expected for do_kernel_configme to apply the d=
efconfig last (after configuration fragments introduced by sccs)?<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">For some reason, in the call to merge_config, =E2=80=
=9C.kernel-meta/configs//./<wbr>defconfig=E2=80=9D is passed last whereas I=
=E2=80=99d expect it would be first (since that should be the base config).=
 This is causing problems, because config options that my config
 fragments are setting are getting overridden by the defconfig =E2=80=93 it=
 should be the other way around.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">For reference, I=E2=80=99m using Rocko and have just=
 updated to the latest commit. We have an in-tree defconfig, and we set KBU=
ILD_DEFCONFIG_machinename appropriately. We are using the separate kernel-m=
eta repository to store kernel metadata. I
 have KMACHINE_machinename set up so that it finds the correct BSP definiti=
on .scc file. Still seem to be missing something, though.<span style=3D"fon=
t-variant:small-caps"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Chris<u></u><u></u></p>
</div></div></div>
</div>

<br>-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--000000000000048139056bf48caa--
