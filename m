Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE2971984
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 12:02:17 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id i40so8270022qti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wTjwbsNAB1V9jBQLzOg/6bq38y4+H4RTEbwzxCTmuTg=;
	b=XIDGrTA9Mnf1pVcNqTYR5m0LwbiRPbtqMO5079MAdq7UKg+uZ53fg82GTTJzg37Hjq
	B+gTGsoLz47MzzKlZ6tw98x8+lMy+ITltorFGLecKUwkArnEy+SBNJMDyoRSrvGixhJ4
	VgKoJQleTNUUBsWH3gEUN7u7gf4bZu37Wu1VjiiRkccOy/0kfWffH0SmOOTHT4RfcM/k
	z4iKjOA5g2udSmW/C+d8ktX9zxxCofugex1C3HYz0wpBjhQZKNy45Ijtojh3R5Aqq+/7
	YjUR3ah7S/XWGp8aX76w5RHqcjvLpRVLhTbD5k9jjy3zEBpb35hLmxRX8ddr4DIfFDTN
	YRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wTjwbsNAB1V9jBQLzOg/6bq38y4+H4RTEbwzxCTmuTg=;
	b=o4S2FwJ27gFhM3PZwaptgQUojtrpyYY/iOSGcZMsnUs2vmVUxxAN0+/n/lCTFbXYus
	RMLNq+NHjttBNmqmGgupVITcLpj/6dLy/TrI1luIawbkSIg4Y4UTUaK0IXoJ2LWlzjrL
	uMigOvR5EplBVc8a7QB8bnH0twq6oj+4gaGRwqLrj79Avf9Zyl41GW90S6GvWTjMo7Ft
	zPt3v8gxOG5u26RNe41sm8fUy3UKtD9MdpPkeLCCr6nOMu9Wq9MO/igoHRGnNAQmYC31
	hk45s+G7KlKDjW3JbsVTTYKDiG8ImiQ9YnmBGeWiBjts5UmVRI3qfCL3m0SmnW0vsYQ5
	IYHQ==
X-Gm-Message-State: AKGB3mJ8Indht+sSPE64zyXKP+jvpd35yan7fOfA6WcvXN3KTBDOV7Gv
	/sIW4VpmnZh9RwPtYEs/HS3O0V+sHSQmOqO3ZO2HKQ==
X-Google-Smtp-Source: AGs4zManz/eoZgDl8GSjDnmoMQu0a7aWa3+LJdbmxYRZPupkLykTaY7dpj8ZrYsfbH3o0rgYSqb62NwnqPtEomiLjCo=
X-Received: by 10.237.55.74 with SMTP id i68mr4729006qtb.237.1512561739056;
	Wed, 06 Dec 2017 04:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Wed, 6 Dec 2017 04:02:18 -0800 (PST)
In-Reply-To: <655290B7709079438B7932553958E60DA138C514@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA138C514@ESS-EX01.essvote.corp.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Dec 2017 07:02:18 -0500
Message-ID: <CADkTA4PzeUWDYk=pLpTVFYgWeQXpJy0syK-F8V4PqxKa7hQwsQ@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error caused by kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Wed, 06 Dec 2017 12:02:18 -0000
Content-Type: multipart/alternative; boundary="001a11359c96284b87055faab906"

--001a11359c96284b87055faab906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2017 at 6:29 PM, Davis, Michael <michael.davis@essvote.com>
wrote:

> After some more digging I found it is because the KTYPE is defined as
> standard/base and the spp script can only find standard.
>
> Is this expected behavior and yocto-bsp should be fixed or a bug and spp
> should be fixed?
>
>
>

That would be expected from the spp point of view, but if a tool is
generating that invalid KTYPE, that is a bug in the tool.

yocto-bsp was recently depreciated and removed in master recently, so
fixing it may not make sense at this point, but logging it in the bug
tracker (against the tool) wouldn't hurt.

Bruce


>
>
> *From:* Davis, Michael
> *Sent:* Tuesday, December 05, 2017 4:45 PM
> *To:* 'openembedded-core@lists.openembedded.org'
> *Subject:* Error caused by kernel-yocto: ensure that only valid BSPs are
> built
>
>
>
> After upgrading rocko all my builds are failing with the following messag=
e.
>
> *ERROR*: linux-yocto-4.12.14+gitAUTOINC+e3c9041f48_1d685baca1-r0.1
> do_kernel_metadata: Could not locate BSP definition for test/standard and
> no defconfig was provided
>
> The source of the issue seems to be commit 44aea7b87307795fe4e089c51d45af
> ccaa2f6525.
>
> This includes a fresh BSP I created with yocto-bsp create, so the helper
> tools are generating examples that don=E2=80=99t work.
>
> bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE}
> -DKTYPE=3D${LINUX_KERNEL_TYPE}) always returns nothing even though I have
> .scc files defined.
>
> What is the new expected format to avoid this error?
>
>
>
> Thanks,
>
> Mike
>
>
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

--001a11359c96284b87055faab906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Dec 5, 2017 at 6:29 PM, Davis, Michael <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:michael.davis@essvote.com" target=3D"_blank">michael.davis@=
essvote.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_3399086678128771907m_4691851981726773144m_54358162029895627=
92Section1">
<p class=3D"MsoNormal"><span style=3D"color:#1f497d">After some more diggin=
g I found it is because the KTYPE is defined as standard/base and the spp s=
cript can only find standard.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1f497d">Is this expected behav=
ior and yocto-bsp should be fixed or a bug and spp should be fixed?<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><i><span style=3D"color:#1f497d"><u></u>=C2=A0</span=
></i></p></div></div></blockquote><div><br></div><div>That would be expecte=
d from the spp point of view, but if a tool is generating that invalid KTYP=
E, that is a bug in the tool.</div><div><br></div><div>yocto-bsp was recent=
ly depreciated and removed in master recently, so fixing it may not make se=
nse at this point, but logging it in the bug tracker (against the tool) wou=
ldn&#39;t hurt.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"=
><div class=3D"m_3399086678128771907m_4691851981726773144m_5435816202989562=
792Section1"><p class=3D"MsoNormal"><i><span style=3D"color:#1f497d"><u></u=
></span></i></p>
<p class=3D"MsoNormal"><span style=3D"color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Davis, M=
ichael
<br>
<b>Sent:</b> Tuesday, December 05, 2017 4:45 PM<br>
<b>To:</b> &#39;<a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.opene<wbr>mbedded.org</a>&#39;<b=
r>
<b>Subject:</b> Error caused by kernel-yocto: ensure that only valid BSPs a=
re built<u></u><u></u></span></p>
</div>
</div><div><div class=3D"m_3399086678128771907m_4691851981726773144h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">After upgrading rocko all my builds are failing with=
 the following message.<u></u><u></u></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Courier New&quot=
;;color:#ff5454;background:white">ERROR</span></b><span style=3D"font-famil=
y:&quot;Courier New&quot;;color:black;background:white">:
</span><span style=3D"font-family:&quot;Courier New&quot;;color:#b21818;bac=
kground:white">linux-yocto-4.12.14+gitAUTOINC<wbr>+e3c9041f48_1d685baca1-r0=
.1 do_kernel_metadata: Could not locate BSP definition for test/standard an=
d no defconfig was provided<u></u><u></u></span></p>
<p class=3D"MsoNormal">The source of the issue seems to be commit <span sty=
le=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-serif&qu=
ot;;color:#333333;background:white">
44aea7b87307795fe4e089c51d45af<wbr>ccaa2f6525.<u></u><u></u></span></p>
<p class=3D"MsoNormal">This includes a fresh BSP I created with yocto-bsp c=
reate, so the helper tools are generating examples that don=E2=80=99t work.=
<span style=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans=
-serif&quot;;color:#333333;background:white"><u></u><u></u></span></p>
<p class=3D"MsoNormal">bsp_definition=3D$(spp ${includes} --find -DKMACHINE=
=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE}) always returns nothing even =
though I have .scc files defined.<u></u><u></u></p>
<p class=3D"MsoNormal">What is the new expected format to avoid this error?=
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Mike<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div></div></div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"m_3399086678128771907m_4691851981726773144gmail_signature" data-smart=
mail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11359c96284b87055faab906--
