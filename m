Return-Path: <joaohf@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id D9C876E7D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:29 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so16969878obc.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 06:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JO3S+SwImp7rPUPZ49RQTUkd/BluTvvhxBm62c9aMH4=;
	b=RXV/9eP7w/+H0BL5sJepIxhsjwlBoYJB5dbxkAoOITClcYX4YiHwPEcYbDz/Nu8g+J
	zJRrlG1vRIgzyrmKFHtL0yOi7zNb46GKUMIpFmJlucDF0rBXWdmJjEaaav6gJUriDHgx
	Payk2fRTlDm+075dq7XYXocvfKMlCwZgr8+7s3VCNU4WTrs3TNbWSSiZATIdXW4RG+Ya
	N9D5/GeVC6JaH69jewpTmMdLFQcmhfYsNbNMTRpJ6MHaH/3BeQzBsEDK4xm71uG2+qtc
	okswcLGr1Gm8vxUTkbjPmyBemjuuIMMht1RLWobDCBK5BIZx6dPsTbFXgKVllZ2Uq8mu
	GEHw==
MIME-Version: 1.0
X-Received: by 10.182.55.65 with SMTP id q1mr1022040obp.70.1392646950139; Mon,
	17 Feb 2014 06:22:30 -0800 (PST)
Received: by 10.182.44.196 with HTTP; Mon, 17 Feb 2014 06:22:30 -0800 (PST)
In-Reply-To: <CAP9ODKpexMC2MG9d4L56Hn3LJSS-dqdgBw4GDB1y56u-R8AEGg@mail.gmail.com>
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKpexMC2MG9d4L56Hn3LJSS-dqdgBw4GDB1y56u-R8AEGg@mail.gmail.com>
Date: Mon, 17 Feb 2014 11:22:30 -0300
Message-ID: <CANFVK79owKYhh5z4+5FMcScZdMUxcff7eiHanFHvD0oXraP4=A@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Add task to create kernel config fragments
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
X-List-Received-Date: Mon, 17 Feb 2014 14:22:30 -0000
Content-Type: multipart/alternative; boundary=089e01538848c2be5c04f29ae2a7

--089e01538848c2be5c04f29ae2a7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,


> I do like the patchset except that his cover letter seems outdate as
> the task now is diffconfig.


You are right.



> Maybe you could add another task too,
> which we use quite often in meta-fsl-arm, savedefconfig. This would
> easy people to generate strimmed versions for use.
>

Yes, after this patch is accepted, I will prepare the savedefconfig task
(cml1.bbclass).

Thanks.


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>



--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--089e01538848c2be5c04f29ae2a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Otavio,<br><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"">
<br>
</div>I do like the patchset except that his cover letter seems outdate as<=
br>
the task now is diffconfig.</blockquote><div><br></div><div>You are right. =
<br></div><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
 Maybe you could add another task too,<br>
which we use quite often in meta-fsl-arm, savedefconfig. This would<br>
easy people to generate strimmed versions for use.<br></blockquote><div><br=
></div><div>Yes, after this patch is accepted, I will prepare the savedefco=
nfig task (cml1.bbclass).<br><br></div><div>Thanks.<br></div><div><br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><font color=3D"#888888"><br>
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://joaohf_=
at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-SP-Bras=
il</div>
</div></div>

--089e01538848c2be5c04f29ae2a7--
