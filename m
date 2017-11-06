Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id E205F60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:33:56 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id l196so4684175itl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ajw88yHF7MSXHNIxXTRPENacmHBZ9HX2E0rO0xoeMuE=;
	b=yR7rhxYS3B+e5bDtw61cG4fayqKlDAN9GfmdqqrKRf9Qae/VWjuQa0xh1+rbzg+Cmu
	9EiSobgy10lq4tbqDVwG+wdO02olKvtgIuj8kmkxa3kvRZMCiMJfe4dJHkQdyF1X8v2Z
	q6nMAMKEKgINmguVs58Rov/iHGAR8q8DW9lyP1VlCbz9zwdoteTR5E/EbIH46QwL9jrl
	iD6dEJ8Vm3H+OmOoQMuJgbIl3zULZpxFulY77ZSBQZM5+S8UvM2ncMBE1SfBvR70YwuI
	8twWRBiGd9c9+BfeXo7r2R06Y9vki2YY8TIZfNAQkso8GQmcjbQcJJgjTPOcijtBhqxe
	h8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ajw88yHF7MSXHNIxXTRPENacmHBZ9HX2E0rO0xoeMuE=;
	b=qOqsoVkpYuvuCsAmBGYO4vjYtGFsg0etfUCCvLHknZC36Tdlwda/c2jFMAtIN5XzyZ
	PLBKGyUC1IKRF6IEJIeOHuXkcZemI0nv2jPNvJjcrXoqj244v+Vdvwf/7E/xt6QT/unP
	/fmDn7R/d023rbVcAfu1kamVbUW8uMul3u3ATR5AV5CSiEEBvYNL0Po4xrSxBNBlKiCR
	h7/OYyy64gDJJO3r2pr2q5YUYfvG9a33biMJdifWpalt/P1Ls6TFcFSfmqS/AqVuEG80
	qlVItdnlZCGZ4Klejn2Ze9ZC/PwXMH7XAhrYSZL/oxGWar15LE8dpSb0i8dWzZ0bIU1Z
	GNew==
X-Gm-Message-State: AJaThX73eCfsaoBrCvjHntH0RVZ5KYjCNv3pn3pNgD3r+QpPEtMXAGy9
	xdqF8/HuNSSuTVqe2hQjijthkOqqnYryTvuLchwang==
X-Google-Smtp-Source: ABhQp+Q+l5MyUFZsniOAje9WEosg+T2Tb7Noj5DNFUdkyHmhCuzkmGDdKSAw1gHnc2jNDC7+08o2Qq1fasYPr4Md4K8=
X-Received: by 10.36.87.207 with SMTP id u198mr8929343ita.108.1509968037844;
	Mon, 06 Nov 2017 03:33:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 6 Nov 2017 03:33:37 -0800 (PST)
In-Reply-To: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
References: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Nov 2017 11:33:37 +0000
Message-ID: <CAJTo0La7eK950Up4033qmX_1PQnS5nJJt4zb_P7uJn1Y8eO0QQ@mail.gmail.com>
To: Neal Gompa <ngompa13@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Mon, 06 Nov 2017 11:33:57 -0000
Content-Type: multipart/alternative; boundary="001a1143a75c84c0c6055d4ed400"

--001a1143a75c84c0c6055d4ed400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The bitbake API isn't really stable and has a reasonable amount of change,
so if you were to package it then there's a good chance it would be out of
date within six months and people who wanted to use the latest oe-core
release against the packaged bitbake would hit API version errors.  The
recommended usage is to bundle in some way bitbake and the metadata
(combo-layer, submodules, repo, whatever).

As such there are no tarballs.  There are branches for each version and
commits where the version is bumped, if you're really determined to package
a snapshot.

Ross

On 5 November 2017 at 15:09, Neal Gompa <ngompa13@gmail.com> wrote:

> Hey all,
>
> Apologies if this is the wrong mailing list for this, but I'm looking
> reintroduce BitBake into Fedora, but it seems like there hasn't been
> releases in two years. I also cannot identify anywhere that provides
> tarballs of BitBake to package.
>
> Am I not looking in the right place?
>
> I looked in the following locations:
>
> * GitHub: https://github.com/openembedded/bitbake
> * OE Git: http://git.openembedded.org/bitbake/
> * Yocto downloads page: https://www.yoctoproject.org/downloads/tools
>
> The Fedora package previously referenced snapshot tarballs generated
> by tagged releases in OE Git, but there haven't been new tagged
> releases in two years.
>
> I'd appreciate any help here.
>
> Thanks in advance and best regards!
>
> --
> =E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=
=EF=BC=81/ Always, there's only one truth!
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143a75c84c0c6055d4ed400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The bitbake API isn&#39;t really stable and has a rea=
sonable amount of change, so if you were to package it then there&#39;s a g=
ood chance it would be out of date within six months and people who wanted =
to use the latest oe-core release against the packaged bitbake would hit AP=
I version errors.=C2=A0 The recommended usage is to bundle in some way bitb=
ake and the metadata (combo-layer, submodules, repo, whatever).<br></div><d=
iv><br></div><div>As such there are no tarballs.=C2=A0 There are branches f=
or each version and commits where the version is bumped, if you&#39;re real=
ly determined to package a snapshot.</div><div><br></div><div>Ross</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 November =
2017 at 15:09, Neal Gompa <span dir=3D"ltr">&lt;<a href=3D"mailto:ngompa13@=
gmail.com" target=3D"_blank">ngompa13@gmail.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hey all,<br>
<br>
Apologies if this is the wrong mailing list for this, but I&#39;m looking<b=
r>
reintroduce BitBake into Fedora, but it seems like there hasn&#39;t been<br=
>
releases in two years. I also cannot identify anywhere that provides<br>
tarballs of BitBake to package.<br>
<br>
Am I not looking in the right place?<br>
<br>
I looked in the following locations:<br>
<br>
* GitHub: <a href=3D"https://github.com/openembedded/bitbake" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/<wbr>openembedded/bitbake</a><br=
>
* OE Git: <a href=3D"http://git.openembedded.org/bitbake/" rel=3D"noreferre=
r" target=3D"_blank">http://git.openembedded.org/<wbr>bitbake/</a><br>
* Yocto downloads page: <a href=3D"https://www.yoctoproject.org/downloads/t=
ools" rel=3D"noreferrer" target=3D"_blank">https://www.yoctoproject.org/<wb=
r>downloads/tools</a><br>
<br>
The Fedora package previously referenced snapshot tarballs generated<br>
by tagged releases in OE Git, but there haven&#39;t been new tagged<br>
releases in two years.<br>
<br>
I&#39;d appreciate any help here.<br>
<br>
Thanks in advance and best regards!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there&#39;s only one truth!<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1143a75c84c0c6055d4ed400--
