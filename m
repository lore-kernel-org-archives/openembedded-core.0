Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6358A7F9C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:31:16 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id g50so33817qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1hGgecZ0fXa8c6CMVhhOLJ0ma1+IBQ3mXiDKXF0ttxw=;
	b=Q/0lDEbD1J2hRx3aA+v7tujq9/XuHnX1lMDmycDeYt9hUC8Di/DWExeJ4MqnxqATbR
	AlSi56ZfekfTMem9WxVb00MF/noKsMLrfwFsOYlyBqHhru0hYyfI7/FpHvjs9T2/utY6
	DGuAr6RU1G36Q4Kc1iqW+bIuEk6uFWU6KUf6o6IkOtUDDUMKpEiK53GEnGoHllEwhxYl
	9+iulTNtDMUwyNX/F0sHPwpb4aCiggTrhxr5zr7BCwD2wrjFxchEM/dOvbgFBgaO3w7g
	DertwrSTIoNChPaUpmdrhBRgxPIp3nBtcjg/kNv0PafbqJJ8kM7HZXxzPDQHyuGB2sWR
	7Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1hGgecZ0fXa8c6CMVhhOLJ0ma1+IBQ3mXiDKXF0ttxw=;
	b=VmquAEJ2gej5F0ZJHlwaLk+wQD6bLBLfa8gkdklyWXbIduvqLcJBzx6yKF71mZq55f
	k2OCbinq38q4vDObdArR2KzL+NWcynWBlSqzaHl8D3N4SY3Y/tpzLImdCWrazg2eUODe
	Bl8dOCg4fmKHzcR3TnS8SAlvvjehGfsDxoktnbXML0ifDUkTWwb+sw2vyHPmalU+t/9v
	mOz3kghhivrIBlRpRoL3oSTNLyUTJVZuVm/OvqSJflEoTRXG0PLOSyheGJlvL6OYg7TT
	cg7n6Lk1TCdMcp5Q4ITcyt2Rno5nDUrCRu38PTQv1UY2CaYS94im598Zm4erQLh1lsqW
	7smg==
X-Gm-Message-State: APjAAAVRQLApcVqHMWK+Wpij4CZXFCzWEJQEYlwvI2my2Wd/N3TGDc/1
	sj4fILlfQjL7WXbvIMdPSETEq3GVZnP8kqEqMRw=
X-Google-Smtp-Source: APXvYqyaXfOL8S8oH1Y2aTL/YZ9haRZ5i3K5Hi05iiGWHHPH/2tqH/zGYUo6SYVM1XE0XAE5m4uDDya4WeIrCPUSgzA=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr1148644qti.80.1572381076583;
	Tue, 29 Oct 2019 13:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572072421.git.akuster808@gmail.com>
	<beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
	<100fd9d42893f3ea7683fb70281d0622f1896259.camel@linuxfoundation.org>
In-Reply-To: <100fd9d42893f3ea7683fb70281d0622f1896259.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 21:31:05 +0100
Message-ID: <CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus 18/28] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Tue, 29 Oct 2019 20:31:16 -0000
Content-Type: multipart/alternative; boundary="000000000000857b680596127fce"

--000000000000857b680596127fce
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 9:19 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-10-25 at 23:49 -0700, Armin Kuster wrote:
> > From: Michael Ho <Michael.Ho@bmw.de>
> >
> > The find_program command will fail if it is used on a tool that is
> > listed in
> > ASSUME_PROVIDED. This is because these tools are in the hosttools
> > directory
> > which is not listed in CMAKE_FIND_ROOT_PATH so cmake will not find
> > them.
> >
> > Adding the directory HOSTTOOLS_DIR to the CMAKE_FIND_ROOT_PATH
> > variable fixes
> > the initial issue of needing to search for tools in ASSUME_PROVIDED.
> >
> > Note that this change alone does not fix the issue because
> > find_program will
> > by default only look into the subdirectories bin and usr/bin under
> > the paths
> > in CMAKE_FIND_ROOT_PATH to find the programs and the hosttools
> > directory has
> > instead the symlinks directly present without these subdirectories.
> >
> > Set CMAKE_PROGRAM_PATH to by default include the root directory so
> > find_program can search the hosttools directory without needing the
> > prefix
> > directories.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > (cherry picked from commit 7847f431cd8db59fce8c9401a603c4b0678ee16d)
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> Given the fallout in meta-oe, I don't plan to take this.
>

+1


> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000857b680596127fce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 29, 2019 at 9:19 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-=
10-25 at 23:49 -0700, Armin Kuster wrote:<br>
&gt; From: Michael Ho &lt;<a href=3D"mailto:Michael.Ho@bmw.de" target=3D"_b=
lank">Michael.Ho@bmw.de</a>&gt;<br>
&gt; <br>
&gt; The find_program command will fail if it is used on a tool that is<br>
&gt; listed in<br>
&gt; ASSUME_PROVIDED. This is because these tools are in the hosttools<br>
&gt; directory<br>
&gt; which is not listed in CMAKE_FIND_ROOT_PATH so cmake will not find<br>
&gt; them.<br>
&gt; <br>
&gt; Adding the directory HOSTTOOLS_DIR to the CMAKE_FIND_ROOT_PATH<br>
&gt; variable fixes<br>
&gt; the initial issue of needing to search for tools in ASSUME_PROVIDED.<b=
r>
&gt; <br>
&gt; Note that this change alone does not fix the issue because<br>
&gt; find_program will<br>
&gt; by default only look into the subdirectories bin and usr/bin under<br>
&gt; the paths<br>
&gt; in CMAKE_FIND_ROOT_PATH to find the programs and the hosttools<br>
&gt; directory has<br>
&gt; instead the symlinks directly present without these subdirectories.<br=
>
&gt; <br>
&gt; Set CMAKE_PROGRAM_PATH to by default include the root directory so<br>
&gt; find_program can search the hosttools directory without needing the<br=
>
&gt; prefix<br>
&gt; directories.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; (cherry picked from commit 7847f431cd8db59fce8c9401a603c4b0678ee16d)<b=
r>
&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com=
" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
<br>
Given the fallout in meta-oe, I don&#39;t plan to take this.<br>
</blockquote><div dir=3D"auto">=C2=A0</div><div dir=3D"auto">+1</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000857b680596127fce--
