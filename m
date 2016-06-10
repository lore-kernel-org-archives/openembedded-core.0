Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6A86FF73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 16:16:34 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id a5so68967019ita.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fhDrDLY8rGYzmGxVLXSlk9+ruxlMWdzi4rnUmT08Uz0=;
	b=WA4TVmW7KUf09E7eBKMemKH6V50m/tbHmQa6XtzjO/FJpdrhuBcRx1YFKesGYxE3YN
	sSOMgkpOMAgOvoPTk2x4XyetT9g6wfeD4VDLcdmZQMXIzPYuC1AYtRKxqXSCHtFTu7/P
	tJImJuVhtsXNPVFA/CCVB2E2ziNgmOCUEwP2VEFODhMVk2YKmGZuNA2OeMu6MXjYNMnD
	I3ZJRHX0QQM4vXSgu0RFRLpCdUtSD/FhJ90zhrYLOSeAdAWPyRwwqqLYjwNwM9A6slDp
	SVksMr4FoTAejYj8Zi2GPrJ7UBjsCwD9P9t4PFq6uL8NQHE9WNFG4Ir+t5fMsmDNxFQ7
	f8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fhDrDLY8rGYzmGxVLXSlk9+ruxlMWdzi4rnUmT08Uz0=;
	b=KKvaJs3DwFe+VNXhRupv1bVMvBpYhmw5wChGEaOOSAz5pKWKLvgA6C1mS7Ob2Fj9Gm
	pkaonJxFmna2v7Si++K7tvRij6NVT1SLPcroncSz+n+oDi4gQ/ml0VS9/GOLG6UsjReA
	iDBKuN90Ij8/7kecWlq5Go30vSNeqEcUPMW8KPUhb2wQkrBNgq0+6JRES8SJKGiZGlgf
	y/OcPOAKaqkGnjQ34wddQIA9KNwwBgvI6cTYLSvAevRl6eUZZHu/Oca6PB+9tG7w1vDi
	x2YJlxCX0nkoEF4GNMxfdZmtoWA2O5+5o59korZDATnakV1xStCbgDIt1N1PnHL/XEFq
	zDfQ==
X-Gm-Message-State: ALyK8tLBjhsjP1zXmxARjHd//2R300vRk8H5W5vRpFXdxNe5evUcm5gJNBK9HCvD6odqMvJMisV+2zpKjA2Tb/6c
X-Received: by 10.36.20.196 with SMTP id 187mr31677698itg.83.1465575395549;
	Fri, 10 Jun 2016 09:16:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 10 Jun 2016 09:16:16 -0700 (PDT)
In-Reply-To: <a71f92e38782662b823eba9811ed2407fc689789.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
	<a71f92e38782662b823eba9811ed2407fc689789.1465365165.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jun 2016 17:16:16 +0100
Message-ID: <CAJTo0LaQmz6jeCbtR-QmXOMNaLzg-HFFJBOakVb21v9sDZfj_w@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] python-git: Upgrade from 1.0.2 to 2.0.5
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
X-List-Received-Date: Fri, 10 Jun 2016 16:16:36 -0000
Content-Type: multipart/alternative; boundary=001a1143e3c0d803b70534eedc8e

--001a1143e3c0d803b70534eedc8e
Content-Type: text/plain; charset=UTF-8

On 8 June 2016 at 06:56, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

>  meta/recipes-devtools/python/python-git.inc                         | 6
> +++---
>  .../python/{python-git_1.0.2.bb => python-git_2.0.5.bb}             | 0
>

Any reason why this didn't do python3-git?

This causes problems as the checksums are in the .inc, which doesn't make
sense if multiple versions are sharing it.  I'm carrying
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=5767caa2ea0d1504b5c3f212fdcda3e918e967e0
right now to fix this.

Ross

--001a1143e3c0d803b70534eedc8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2016 at 06:56, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div i=
d=3D":5g5" class=3D"">=C2=A0meta/recipes-devtools/<span class=3D"">python</=
span>/<span class=3D"">python</span>-<span class=3D"">git</span>.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 +++---<br>
=C2=A0.../<span class=3D"">python</span>/{<a href=3D"http://python-git_1.0.=
2.bb" rel=3D"noreferrer" target=3D"_blank"><span class=3D"">python</span>-g=
it_1.0.2.bb</a> =3D&gt; <a href=3D"http://python-git_2.0.5.bb" rel=3D"noref=
errer" target=3D"_blank"><span class=3D"">python</span>-git_2.0.5.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br></div></blockquote><=
/div><br>Any reason why this didn&#39;t do python3-git?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">This causes problems as t=
he checksums are in the .inc, which doesn&#39;t make sense if multiple vers=
ions are sharing it.=C2=A0 I&#39;m carrying=C2=A0<a href=3D"http://git.yoct=
oproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mut&amp;id=3D5767c=
aa2ea0d1504b5c3f212fdcda3e918e967e0">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky-contrib/commit/?h=3Dross/mut&amp;id=3D5767caa2ea0d1504b5c3f212fdcd=
a3e918e967e0</a> right now to fix this.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e3c0d803b70534eedc8e--
