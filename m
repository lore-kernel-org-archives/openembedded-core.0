Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA9A7822B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 02:45:16 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r71so7929942wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 18:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AmSpbpQr2ByNtgoaxMVGCSMuHtF9UodaD5Tvp2yhd4o=;
	b=YjOpJvG24GPnn1sMaBZt0VF5sTkIIQLG5F1wkhCcHRriwrzILzudcsCt4Hrg1fPVST
	gsfTzO9nTKr2pNjZ91Uss54fp5MR7Ie73KAPd77kJUWUygjik6Y+ibl5XSmPKFX0XmT8
	JpxcOEpMAp7J2CaB4Lo3IjDFKegA/KERqpL5AXa5OZVMmuJ2HHIrsdMfrTZMsZRs9BQD
	iWfeHiJ3wZb/VRTZD23Rk/9QvkgN3CmrHcuPvy9fJNHDvoihDKkfZn+kh8rA1zPS91tg
	Kei4kjoTKChsI9cfkBRTAn8aS9Tn7Eyxcy0lN0IUiEsB3bnjveI0hY5D+0dR3hmMwSIP
	2b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AmSpbpQr2ByNtgoaxMVGCSMuHtF9UodaD5Tvp2yhd4o=;
	b=Fu5/7/BWON8WzrWbCEuAku3plx9NrOU8+84zQtGx+T12fLWEmL42XZIYajvvXhIlNv
	uBrEQ8ZdBcEdPHPVt9fewHMutqVDk7CtkIX4yysStTvFP3tcZhhXOsFDMujQ77sCN11e
	cMviG3LMPfWRAYBwFxdj2tcDvj84LE65fAHSVGrwTTBvAqDqal2d6o2awn5X0VYagWTO
	eIZfufvhdBUkjpNhw5NRZ+nO8dC/8M25EhT0QdemQnDW4FYAHRjoTAdKGSNafy8XcU16
	BTpMUYvttaVvty2er/yWGmxqXF9z608nzABJGGwVnjZhxYHdufk/KaTS4QTfKyIUAOt3
	Ptkw==
X-Gm-Message-State: AKwxytev2PNouVcc3v5Jotgqt9+WeDXUpZ/tr67Id8ADruifW1nc7385
	ESNVnKodt4OP+F6QB0PiOPmTHKTt+ojblwAJEqs=
X-Google-Smtp-Source: AH8x227YP2madY4KBpMN4oGnMcqgChXpG+1Ors/wSJih59sH5VCd08aW2LJIsgHOmUgkxjAJTfj/ctVJCUUUHQbA9b4=
X-Received: by 10.80.146.81 with SMTP id j17mr41399282eda.205.1517107517037;
	Sat, 27 Jan 2018 18:45:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.143.131 with HTTP; Sat, 27 Jan 2018 18:45:16 -0800 (PST)
In-Reply-To: <dc221756-d573-e60a-4f93-8792089ada1c@gmail.com>
References: <CAEQ58siiwEqY-KuFZDuCxyBOZnA2d-Bo8MFWTF9X_AGMfOxmzw@mail.gmail.com>
	<CAEQ58sjaushTPi=PBy-ttCL9XBtsmHN-p=XjZXA1VW-_4aKZRA@mail.gmail.com>
	<CAEQ58sje+LCZnqDykHQ_gvQoNvgCH5QFCa_k2tGfnCd__Y07Ww@mail.gmail.com>
	<CAEQ58sgADk0b5O_7vv=Y6Ru6zX151e3pPREYY2p6fuXEOuqZ9Q@mail.gmail.com>
	<CAEQ58sh+bBzbOxf+dv90jeAe91Pf4J30=VqT2LuFyZfnjwVoog@mail.gmail.com>
	<CAEQ58sivWmT-mnB=zAZRhzgnQFiV3KP9aNioyKu2k2RvDyjW3A@mail.gmail.com>
	<CAEQ58sjNMVASuDU5GaSKqf3Xp6-UC_8gZZEdM-mtQ_pRFNwR8A@mail.gmail.com>
	<CAEQ58sjBMsMhg4a_TWiKH8Vvo7UaGodtPO1GsXCcU0fxqFSa7A@mail.gmail.com>
	<dc221756-d573-e60a-4f93-8792089ada1c@gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Sun, 28 Jan 2018 03:45:16 +0100
Message-ID: <CAEQ58sgDFgf5oedxXm5PDd0L=NMzv-rLw5--YRT7crUOv-Qdyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-devsrc fails to install the rpm package
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
X-List-Received-Date: Sun, 28 Jan 2018 02:45:16 -0000
Content-Type: multipart/alternative; boundary="f403045c28b2a3a1150563cd1e62"

--f403045c28b2a3a1150563cd1e62
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Thank you for your reply.

The commit description is effectively what is happening (or at least,
partly) in my case.
I will get back to you as soon as the build with fresh environment
completes.

2018-01-27 20:34 GMT+01:00 Khem Raj <raj.khem@gmail.com>:

>
>
> On 1/27/18 11:28 AM, Francesco Giancane wrote:
>
>> Hi guys,
>>
>> I am trying to build an image with kernel-devsrc in target and sdk
>> (teaching purposes, no production here) but when packages are to be
>> installed, bitbake fails, telling that nothing provides /bin/awk.
>>
>> Looking at kernel-devsrc.spec,it seems that the requirement is added, but
>> following the inheritance chain, there is no trace of this dependency in
>> recipes.
>>
>> Can someone tell me what is happening here?
>>
>
> perhaps you need the fixes in here
> http://git.openembedded.org/openembedded-core/commit/?id=336
> 0eadb719f1d3b406e6cf48d99a74fdb2f6c77
>
> cherry-pick it to your local rocko branch and see if it helps
>
>
>
>> I am using rocko and building for raspberry pi3 64 bit. No other layer is
>> added.
>>
>> Thanks,
>>
>> Francesco Giancane
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c28b2a3a1150563cd1e62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem,<div><br></div><div>Thank you for your reply.</div=
><div><br></div><div>The commit description is effectively what is happenin=
g (or at least, partly) in my case.</div><div>I will get back to you as soo=
n as the build with fresh environment completes.<br><div class=3D"gmail_ext=
ra">
<br><div class=3D"gmail_quote">2018-01-27 20:34 GMT+01:00 Khem Raj <span di=
r=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
<br>
On 1/27/18 11:28 AM, Francesco Giancane wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi guys,<br>
<br>
I am trying to build an image with kernel-devsrc in target and sdk (teachin=
g purposes, no production here) but when packages are to be installed, bitb=
ake fails, telling that nothing provides /bin/awk.<br>
<br>
Looking at kernel-devsrc.spec,it seems that the requirement is added, but f=
ollowing the inheritance chain, there is no trace of this dependency in rec=
ipes.<br>
<br>
Can someone tell me what is happening here?<br>
</blockquote>
<br></span>
perhaps you need the fixes in here<br>
<a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D3360e=
adb719f1d3b406e6cf48d99a74fdb2f6c77" rel=3D"noreferrer" target=3D"_blank">h=
ttp://git.openembedded.org/op<wbr>enembedded-core/commit/?id=3D336<wbr>0ead=
b719f1d3b406e6cf48d99a74fd<wbr>b2f6c77</a><br>
<br>
cherry-pick it to your local rocko branch and see if it helps<div class=3D"=
HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I am using rocko and building for raspberry pi3 64 bit. No other layer is a=
dded.<br>
<br>
Thanks,<br>
<br>
Francesco Giancane<br>
<br>
</blockquote></div></div><span class=3D"HOEnZb"><font color=3D"#888888">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div></div>

--f403045c28b2a3a1150563cd1e62--
