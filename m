Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 70EFE76312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 21:00:28 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id l127so66306766iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RA+8A0gtAthGROk0L2/RKMjFSAVSvLJPHZg3X5RKrZM=;
	b=kw2EHt3WdvMcgQZoTHFf0T61YblJMtLFmnJH1yS2CYIdKoCNTKOdmP50let1sVHkOH
	XD1c0djKF0/4qtL2gXGOCA6SMfxlzLtIntd92Jrh6viaLDg4Noog7PhkvIsGlvzc0ERQ
	GwF2gtLRnQYC6LgfC7Fpp6qGn8RGJ2TewaRpxFL4620q47/l28TQExcl0aKEkQnrzCqm
	sFxP0hv9HxODvlQXwtlzNEGRqpLGQJ4LiYlOHdaCXXH5uLdLHARC12EC2MEZvwZdGc2v
	0d0fQVsmt9jIuV8e4i0DjpEwukFsr5RCy8Y4MnJ6Sem5wiwLl7T2CHhDACZBLab29FJ/
	InBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RA+8A0gtAthGROk0L2/RKMjFSAVSvLJPHZg3X5RKrZM=;
	b=H/dno4OB69Qa5odzqELsqhIvZKmImYorZepLYEe+dDUAgORRsyDmRNUOQwHhDifgbd
	C0/it94MvFcXT65RREhwUeQ/0VOxXB+ZP+6UVVbGkPqyZhRcvafTuxy/TK2PoggyeSbS
	ETWnHe0pwEoFB1a12rDw8GQzb3eMfPvuAeLAbfRpfGdwN79KDHsYA/alOcCJU1fuBKLo
	rtaQO+kFtxDSsXtgadSsIu3N6oxeGVtQARzHkEoEabhI761EwcSuYGKMOV2tHLsdMpeT
	WSEk6cG+ksC09gUaBY4Ry5RqbyLNarB5KYt/2X4s6/+dYtUFvVjJKJRmAiTD94wWyGQW
	NIlQ==
X-Gm-Message-State: AG10YOQfi3AWb4ufEgJTrlloWAQomJ0L19309S2rRcSq4ng9YJSQ4NhqAGfunFup3CG39MRINGciI7rBFsaIw7Es
X-Received: by 10.50.43.226 with SMTP id z2mr24567513igl.78.1456347629448;
	Wed, 24 Feb 2016 13:00:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 24 Feb 2016 13:00:10 -0800 (PST)
In-Reply-To: <4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Feb 2016 21:00:10 +0000
Message-ID: <CAJTo0LZXUGQN7TrgTXJ3f=qoZLSo_VT7hJ=BdBye561_Tq6+Gg@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Wed, 24 Feb 2016 21:00:29 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f41f90ed052c8a5be9

--047d7bfea0f41f90ed052c8a5be9
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 14:52, Joshua Lock <joshua.g.lock@intel.com> wrote:

> +do_compile () {
> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
> +}
> +
> +do_install () {
> +       oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}'
> BINDIR='${bindir}'
> +}
>

EXTRA_OEMAKE will make this neater.

Ross

--047d7bfea0f41f90ed052c8a5be9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2016 at 14:52, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"=
mailto:joshua.g.lock@intel.com" target=3D"_blank">joshua.g.lock@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":e4v" cla=
ss=3D"a3s" style=3D"overflow:hidden">+do_compile () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; &#39;PREFIX=
=3D${prefix}&#39; BINDIR=3D&#39;${bindir}&#39;<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install &#39;DESTDIR=3D${D}&#39; &#3=
9;PREFIX=3D${prefix}&#39; BINDIR=3D&#39;${bindir}&#39;<br>
+}</div></blockquote></div><br>EXTRA_OEMAKE will make this neater.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--047d7bfea0f41f90ed052c8a5be9--
