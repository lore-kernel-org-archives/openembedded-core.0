Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 97BC46E5CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 16:45:37 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id x1so137143950lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 08:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=YPicTnicGx4zaMwvkngMv2IaU5gjHfteSXB3w05ga88=;
	b=RleiG/hEI8xF3rT1VDQhX1Q7KSYfGtDEN9PYBdvl8w5O+mK8/g52SRBx8nZk367+Kh
	t2DJqWVgYOK+DbIlFERh+1FFqFe8rzTAkf0PjCx0Qd4Qqq4uPfn26tMlU7mvk7wcGSB9
	ikEtCeyeOxCuZZa6A56CLxeZDkzplSRv48cqlFxr35gfNFsvi0s5G+ppXmBHcHYvNDhA
	qNqqM/Yy1cyswr8o34zBBORWRtqB39nNgL3mx1rfdXZa5Zha5CeILPURLYonuefA6SQW
	9FdeTG48GFGjv1p17zBLLgbw/F8g5gEhrdsVKrjicvwbaF1N7T+T4wNNcgtM5QxtB0AC
	Vapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=YPicTnicGx4zaMwvkngMv2IaU5gjHfteSXB3w05ga88=;
	b=IlUOcDXaCcwUmeQK4x6eWKUl6myrzsE0ma6D3Pk3mMnXYt5ZN6n3bJf8apFHbHzOYJ
	SxvjM6o6Wjr5/t14ifKmA/y1xXplJXGqOPLC+M2eYVm7IxGsuvxMYnYFDSerEIssHuSy
	5gw03aV3HR8gKY4ZTvYj+HjRPjO2g5X4rnKLsdOVC1kIi9hdtCfk4MuWIF5Xm/5D/Xg6
	1cO7u0mP7mLMYycTZzvM2AkClwQSL87s58LYx9dcbASDwdL4/qAP4JcknYwT7iShY3uG
	W9ss+Kov90pmCBYsJ5Egv6toAySudIq2N82xM3kdABbQOtNuqC5hr0OtI7hlTrdjex3r
	HNcg==
X-Gm-Message-State: AD7BkJKuYZU4XZr5kaJSUq8+wfgIdkX0my9/fKRD2WCgjnp49F/CHb4rPfcBYRaKbEQ/Lq0tHdBLeVSEkdZ8l7tR
MIME-Version: 1.0
X-Received: by 10.112.166.100 with SMTP id zf4mr7784528lbb.58.1457369137180;
	Mon, 07 Mar 2016 08:45:37 -0800 (PST)
Received: by 10.114.182.240 with HTTP; Mon, 7 Mar 2016 08:45:37 -0800 (PST)
In-Reply-To: <CAJTo0LZwOpAaUSOVYyuoKQxjU3OkUsi=pTvY5NihHw_kQGJ1Qg@mail.gmail.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZwOpAaUSOVYyuoKQxjU3OkUsi=pTvY5NihHw_kQGJ1Qg@mail.gmail.com>
Date: Mon, 7 Mar 2016 22:15:37 +0530
Message-ID: <CAD3vsf7djsRsAVnRQ7Q0Ztgsdxj2J6TO5FHis1QuSYWdRf6ubA@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Mon, 07 Mar 2016 16:45:39 -0000
Content-Type: multipart/alternative; boundary=001a11c32f28ba91b4052d783187

--001a11c32f28ba91b4052d783187
Content-Type: text/plain; charset=UTF-8

This patch was applying  correctly for jethro and master, when it was sent
on 28th Nov 2015. Now, it applies correctly for jethro.  And for master it
applies with hunk warning as below

-- snip --
patching file meta/classes/license.bbclass
Hunk #1 succeeded at 350 (offset 165 lines).
-- snip --

I can send an updated patch for the master branch. For jethro, this patch
can be applied successfully.

Regards,
Jagadeesh



On Mon, Mar 7, 2016 at 9:29 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 28 November 2015 at 08:09, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> We get below host contamination warnings of license files for
>> each recipe, when we try to create a separate ${PN}-lic package (which
>> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
>> in local.conf.
>>
>
> If something is for master and jethro, please make it clear.
>
> (Merged into mut)
>
> Ross
>

--001a11c32f28ba91b4052d783187
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch was applying =C2=A0correctly for jethro and mas=
ter, when it was sent on 28th Nov 2015. Now, it applies correctly for jethr=
o.=C2=A0 And for master it applies with hunk warning as below<div><br></div=
><div>-- snip --</div><div><div>patching file meta/classes/license.bbclass<=
/div><div>Hunk #1 succeeded at 350 (offset 165 lines).</div></div><div>-- s=
nip --</div><div><br></div><div>I can send an updated patch for the master =
branch. For jethro, this patch can be applied successfully.</div><div><br><=
/div><div>Regards,</div><div>Jagadeesh</div><div><br><div><br><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 7, 2016 at 9:29 PM=
, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br>=
<div class=3D"gmail_quote">On 28 November 2015 at 08:09, Jagadeesh Krishnan=
janappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com=
" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex"><div style=3D"overflow:hidden">We get below host contaminati=
on warnings of license files for<br>
each recipe, when we try to create a separate ${PN}-lic package (which<br>
contains license files), by setting LICENSE_CREATE_PACKAGE equal to &quot;1=
&quot;<br>
in local.conf.</div></blockquote></div><br></span>If something is for maste=
r and jethro, please make it clear.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">(Merged into mut)</div><span class=3D""><font=
 color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></font></span></div>
</blockquote></div><br></div></div></div></div>

--001a11c32f28ba91b4052d783187--
