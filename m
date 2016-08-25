Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1BA60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:34:27 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id n128so80924011ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9TTYMbp317ljZek1Men8oTmJBHxlAwDJPY21688v7p8=;
	b=Dp3tJHbU0GIowarx1FMFsLZVLAFf2QfAmyN9K0ArYh1EVK8WlAq7c+m6udDBwMmquE
	ZtOyTPFMDOYGMU2tnfHRjI0UNige66WUDFZ8KsuqjN1a/fIZW3icFFrSv07ohQXJ7Ac7
	5yIP+7MapihOB4vrqTbHlfP6mrM0qfdZ6kQMQ07wzjYZSFULtetQff5UHetQWrRaEIXc
	nQTuj5MuizQCRxbrp3ki3rDBbpeRKuMnd4O5jGmSxcktN8CX0+7/x49fL3E7BdnWfV7c
	6dYIOA2Y8KGKEDN/4DaFrf1Yt9gBq0KOSV6lxg56+U1MWeM2i1bcdS3gJMWuZpstsHO7
	7YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9TTYMbp317ljZek1Men8oTmJBHxlAwDJPY21688v7p8=;
	b=NXlyS60JqEHg6/CArYlg8Zbe3W8zJPTaZ79uEZ2apjX43C5W1BAucDHI33RLLOdIOW
	wo3tbT1JjCJjK4x8xZ8BxsVY3kZgF9DxJJx8x2tT38DFBUXscPub7itfi9molFBzw82+
	oi8+AOjDQNHVT3scy43iEvt/oCMnIZPXUntbk6oih5tpK83xwSiXemFbFqkDDub1Zf+x
	Yui/uAul/If8Tkb4K/17ykyZO4rhMkmipYWYUhO5En6Yh8+mve13P7eF+koE7hWnkP0Z
	wErS0zLTEOlmSCIhs+xM4tZ4DS7oo682Qd5V8/aAMOBE4rXqdQlBnDpVxNuF8JKcKMHo
	OllA==
X-Gm-Message-State: AEkoouuZHyB7vGPV2SYlD1eBpQ9lzp5VruXYrd872f0hzqXG1Yrq5SS0k/CfpajsLY3A2v9JA9OM++svOPUMxsL4
X-Received: by 10.36.121.206 with SMTP id z197mr4209264itc.22.1472117668257;
	Thu, 25 Aug 2016 02:34:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 02:34:07 -0700 (PDT)
In-Reply-To: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
References: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 10:34:07 +0100
Message-ID: <CAJTo0LYcCDfuqVBrVKTGXySzP4OLTCm_cXGs5yr_sL04EMi=MA@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Thu, 25 Aug 2016 09:34:29 -0000
Content-Type: multipart/alternative; boundary=001a114aa820af35b7053ae21ad7

--001a114aa820af35b7053ae21ad7
Content-Type: text/plain; charset=UTF-8

meta-qt5 bugs should go to openembedded-devel@, not -core@.

Ross

On 25 August 2016 at 08:45, Yi Qingliang <niqingliang2003@gmail.com> wrote:

> bug detail:
> https://bugs.archlinux.org/task/49723
>
> patch:
> https://git.archlinux.org/svntogit/packages.git/tree/
> trunk/qt5-declarative-gcc6.patch?h=packages/qt5-declarative
>
> Yi Qingliang
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114aa820af35b7053ae21ad7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-qt5 bugs should go to openembedded-devel@, not -core@=
.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On 25 August 2016 at 08:45, Yi Qingliang <span dir=3D"l=
tr">&lt;<a href=3D"mailto:niqingliang2003@gmail.com" target=3D"_blank">niqi=
ngliang2003@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">bug detail:<br>
<a href=3D"https://bugs.archlinux.org/task/49723" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.archlinux.org/<wbr>task/49723</a><br>
<br>
patch:<br>
<a href=3D"https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-d=
eclarative-gcc6.patch?h=3Dpackages/qt5-declarative" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.archlinux.org/<wbr>svntogit/packages.git/tree/<wb=
r>trunk/qt5-declarative-gcc6.<wbr>patch?h=3Dpackages/qt5-<wbr>declarative</=
a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Yi Qingliang<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114aa820af35b7053ae21ad7--
