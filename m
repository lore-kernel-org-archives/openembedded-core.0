Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63A12786DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 22:40:05 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 16-v6so437247lfs.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v8fjVsMVxkNvPzu4Iw//5yNKy5RnSH5u11bId5mHzQk=;
	b=ZaDcvOwsaMGol8EMHJe5qmCvegO/mK2078LRlXq6mkCozAYyYPobQRsvjE/m/pSXLY
	jP4sSbNxlcNd9RYQpfxIt90nPiCLOvU0ESDLYj1lwzZOmMv/yIPSYgSgwBJasMRKBDDC
	uoCmHZ7clc4Us2ZvW4/EgDM2gcg3dzmLw1VuuIFrQzF+2wMVj0vf5OgLS+OUFZpjwdkz
	c6kiqNWb+tK5af9+KZomrHX4Zge2UwiuoppOEiXT3+Hm8l9OUYwYLYWmIQlqKZDQElJz
	XN3imhXST2NuYl655fy0YC72SKwBpsksy2BYyjbIxMp4PAz7y26ocafZ4Ug0jxXUJtsr
	7PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v8fjVsMVxkNvPzu4Iw//5yNKy5RnSH5u11bId5mHzQk=;
	b=TUa3PF0o9ZGoY5qdO+kcTs9RmgtNFEl8ufXDFQ0gvWKq7hLPmCzRTRbw6KOPmygRTo
	JBX4gG0Y5l+zsuMOL/19RWZVB6aUaAYkqYnvgkWYD98cg0p/knSvsEyIY4+m72heu+FH
	jlN7aHVEuXZX0xRpE993Br37GIFk0Z2XGmpW8jfrJ99//Tx4PaSa/SRFrzGFX5rG5Sbu
	nLEhQ0nmITeI1eey4fgdP60uUV60VOQVOKEMyWcfjzeZM6IgkRfWTY0Lbe5GclI2xW0B
	ZDSdOFqDlQn5ZqcBJcNPBLGHgr5ZhxCboR/GyZlzZie1RVic7kRSMAwoF92+XfarihqI
	+ORQ==
X-Gm-Message-State: ALKqPwetNr5O6SIBlS4XR0ONfcqbnVF/Q5nK0zHzbGZX0oDFxx2363kT
	AM2nLOG1CK/WQmiLJ8e8OE4JLbTKtwW1GvEAvdGxmQ==
X-Google-Smtp-Source: AB8JxZpZzfzK9PmWSdrUWptFSUESd+Fimo3+3T3f1iO2Iv9A+vm8JPAgCI+2MKuQNkLQRtyD7wwE1O/P7wHJ0LqN1fo=
X-Received: by 2002:a19:becb:: with SMTP id
	o194-v6mr2732311lff.13.1526078406446; 
	Fri, 11 May 2018 15:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Fri, 11 May 2018 15:40:05 -0700 (PDT)
In-Reply-To: <BN6PR1201MB01951494864FB274FEE4878B8B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<CADkTA4NnhmA37wHWk1r4fZoAFZsoV-x=GW+OW_opdL8jwQgRCw@mail.gmail.com>
	<BN6PR1201MB01951494864FB274FEE4878B8B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 May 2018 18:40:05 -0400
Message-ID: <CADkTA4ORbb+_1MHy-7JRq=PEZW+=FabV4b=6Guo6dxtOnQb0-A@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 May 2018 22:40:06 -0000
Content-Type: multipart/alternative; boundary="00000000000050d553056bf5d173"

--00000000000050d553056bf5d173
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 6:17 PM, <chris.laplante@agilent.com> wrote:

> Hi Bruce,
>
>
>
> Thanks for your insights. The defconfig is coming from
> KBUILD_DEFCONFIG_machinename =3D =E2=80=9Cour_defconfig=E2=80=9D in our m=
achine conf. I
> understand that the defconfig is just another configuration fragment, but
> given that it has its own variable (KBUILD_DEFCONFIG) I guess I was
> expecting a bit of =E2=80=9Cmagic=E2=80=9D out of it; namely, ordering su=
ch that the
> fragment called =E2=80=9Cdefconfig=E2=80=9D comes first. Otherwise I don=
=E2=80=99t really see the
> point in supporting in-tree defconfig + .scc/cfg fragments, since the
> former will just wipe out the latter.
>
>
>
> That being said, your explanation of the current behavior makes sense, bu=
t
> I think it should be emphasized somewhere in the manual. Care if I submit=
 a
> documentation patch?
>

Absolutely! Feel free to cc' me on the patch and I'll give it a review as
well.

Bruce


>
>
> Thanks,
> Chris
>
>
>
> *From:* Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> *Sent:* Friday, May 11, 2018 5:09 PM
> *To:* LAPLANTE,CHRIS (A-Little Falls,ex1) <chris.laplante@agilent.com>
> *Cc:* Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>; SMITH,JARED (A-Little
> Falls,ex1) <jared.smith@agilent.com>
> *Subject:* Re: [OE-core] do_kernel_configme and defconfig
>
>
>
>
>
>
>
> On Fri, May 11, 2018 at 3:28 PM, Chris Laplante via Openembedded-core <
> openembedded-core@lists.openembedded.org> wrote:
>
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
>
>
> A defconfig isn't magic, it is just another input to the configuration
> merging. It will be applied as any other fragment. There is some special
> processing only a defconfig is specified, but otherwise, it is the same. =
So
> in this case, whatever it sets would be applied after the BSP definition
> and would take precedence (last through the gate wins).
>
>
>
> If you have a BSP definition, you normally don't have a defconfig. Where
> is the defconfig coming from in your scenario ? The SRC_URI ? You can jus=
t
> include it from the .scc files to control the order, which is what is
> expected when you have a BSP definition.
>
>
>
> Were you seeing none of your options set ? or something else ?
>
>
>
>
>
> If so, I think it=E2=80=99s important to add some sanity checking to
> kernel-yocto.bbclass.
>
>
>
>
>
> There's really nothing that could be checked, since the intent of the
> fragments isn't known, and for the most part, defconfigs are the same as
> any other fragment (from the point of view of the merging).
>
>
>
> Bruce
>
>
>
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
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--00000000000050d553056bf5d173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 11, 2018 at 6:17 PM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:chris.laplante@agilent.com" target=3D"_blank">chris.laplante@agilent.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_2885979704273208764WordSection1">
<p class=3D"MsoNormal">Hi Bruce,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks for your insights. The defconfig is coming fr=
om KBUILD_DEFCONFIG_machinename =3D =E2=80=9Cour_defconfig=E2=80=9D in our =
machine conf. I understand that the defconfig is just another configuration=
 fragment, but given that it has its own variable (KBUILD_DEFCONFIG)
 I guess I was expecting a bit of =E2=80=9Cmagic=E2=80=9D out of it; namely=
, ordering such that the fragment called =E2=80=9Cdefconfig=E2=80=9D comes =
first. Otherwise I don=E2=80=99t really see the point in supporting in-tree=
 defconfig + .scc/cfg fragments, since the former will just wipe out the
 latter. <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">That being said, your explanation of the current beh=
avior makes sense, but I think it should be emphasized somewhere in the man=
ual. Care if I submit a documentation patch?</p></div></div></blockquote><d=
iv><br></div><div>Absolutely! Feel free to cc&#39; me on the patch and I&#3=
9;ll give it a review as well.</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"blue" v=
link=3D"purple"><div class=3D"m_2885979704273208764WordSection1"><p class=
=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<br>
Chris<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>From:</b> Bruce Ashfield [mailto:<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.<wbr>com=
</a>]
<br>
<b>Sent:</b> Friday, May 11, 2018 5:09 PM<br>
<b>To:</b> LAPLANTE,CHRIS (A-Little Falls,ex1) &lt;<a href=3D"mailto:chris.=
laplante@agilent.com" target=3D"_blank">chris.laplante@agilent.com</a>&gt;<=
br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.<wbr>openembedded.org</a>&gt;; SMITH,JARED (A-Little Falls,e=
x1) &lt;<a href=3D"mailto:jared.smith@agilent.com" target=3D"_blank">jared.=
smith@agilent.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] do_kernel_configme and defconfig<u></u><u></u=
></p><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Fri, May 11, 2018 at 3:28 PM, Chris Laplante via =
Openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a>&=
gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">OK, I figured out why this happens. This line in ker=
nel-yocto.bbclass:<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">
scc --force -o ${S}/${meta_dir}:cfg,merge,<wbr>meta ${includes} ${bsp_defin=
ition} ${sccs} ${patches} ${KERNEL_FEATURES}<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=E2=80=A6 passes the BSP def before the sccs. In my =
case, the BSP def is mymachine.scc, and the sccs is the defconfig. So that=
=E2=80=99s why the defconfig comes after the BSP.
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">My takeaway is that a BSP plus a defconfig is not a =
supported use case. Is that correct?<u></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">A defconfig isn&#39;t magic, it is just another inpu=
t to the configuration merging. It will be applied as any other fragment. T=
here is some special processing only a defconfig is specified, but otherwis=
e, it is the same. So in this case, whatever
 it sets would be applied after the BSP definition and would take precedenc=
e (last through the gate wins).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If you have a BSP definition, you normally don&#39;t=
 have a defconfig. Where is the defconfig coming from in your scenario ? Th=
e SRC_URI ? You can just include it from the .scc files to control the orde=
r, which is what is expected when you
 have a BSP definition.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Were you seeing none of your options set ? or someth=
ing else ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">If so, I think it=E2=80=99s important to add some sa=
nity checking to kernel-yocto.bbclass.
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There&#39;s really nothing that could be checked, si=
nce the intent of the fragments isn&#39;t known, and for the most part, def=
configs are the same as any other fragment (from the point of view of the m=
erging).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Chris<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b>
<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=
=3D"_blank">
openembedded-core-bounces@<wbr>lists.openembedded.org</a> [mailto:<a href=
=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>]
<b>On Behalf Of </b>Chris Laplante via Openembedded-core<br>
<b>Sent:</b> Friday, May 11, 2018 2:51 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.<wbr>openembedded.org</a><br>
<b>Cc:</b> SMITH,JARED (A-Little Falls,ex1) &lt;<a href=3D"mailto:jared.smi=
th@agilent.com" target=3D"_blank">jared.smith@agilent.com</a>&gt;<br>
<b>Subject:</b> [OE-core] do_kernel_configme and defconfig<u></u><u></u></p=
>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Hi all,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Is it expected for do_kernel_configme to apply the d=
efconfig last (after configuration fragments introduced by sccs)?<u></u><u>=
</u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">For some reason, in the call to merge_config, =E2=80=
=9C.kernel-meta/configs//./<wbr>defconfig=E2=80=9D is passed last whereas I=
=E2=80=99d expect it would be first (since that should be the base config).=
 This
 is causing problems, because config options that my config fragments are s=
etting are getting overridden by the defconfig =E2=80=93 it should be the o=
ther way around.
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">For reference, I=E2=80=99m using Rocko and have just=
 updated to the latest commit. We have an in-tree defconfig, and we set KBU=
ILD_DEFCONFIG_machinename appropriately. We are using the
 separate kernel-meta repository to store kernel metadata. I have KMACHINE_=
machinename set up so that it finds the correct BSP definition .scc file. S=
till seem to be missing something, though.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Chris<u></u><u></u></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/ope=
nembedded-<wbr>core</a><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;<u></u><u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--00000000000050d553056bf5d173--
