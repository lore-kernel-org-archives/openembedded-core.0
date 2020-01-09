Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2083C7FE55
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 15:32:06 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id n27so4471776vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 07:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A5jmfrzK0nt78l9TJZmhLrbx20SDstY01XuC5Kyzl3M=;
	b=elsJpvDW/yIvIHQdbiu3MIIIr5BbMitOMg0Wt5XeQV4c2KG1uUn+b5ArLS1F3SktJe
	Q2YGeo7eONLpbQnSdMAP54cBzLQEoEvmThItFDoJYcb5R+gn+AUTyN8fuBRZqX/0KTmW
	DEuUOuKipXMs48KLBOpGjaMeRKc5ZEokptRU3doORTyj6ro7gZOXYQP7MfTeQU2yLpBH
	g7bqpsRTO/Q82vO74mZ2jA7bv6h1csk9Wkxbfe7YBad3NNZf2qdDaKzcioBUGH0QWyhP
	3XUaMCSzwJfp7Hu6ywq9BLuD842bbj3JeveKSf1IKmvcCcDfD7C8vCFQzUQWycUyMUzM
	y5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A5jmfrzK0nt78l9TJZmhLrbx20SDstY01XuC5Kyzl3M=;
	b=bs5osiTQrzk2vJJuGnpaee74y8fdyDj3DZN28SWBvxzLwc1uScbLBa1WBAcCWZ3GNH
	cf+S1xZR42SbvbS1V7ADEypKPuXcsBJ4R2LbON5aR8eTJHotNCPzDOR/aSpI4SipNV89
	A+fvWAe0VEZkjYR77NmSQX+XtUMEDKMVh4xeMpN1DqBa7HS1XNdk1ym+M/D2cbvhGXnI
	vrLqaR5PA8kJiLyKTCLn85AxUHX7uylVnGM2TMWFPq/A1PS9GAHlwcLTxUE+qRuSgaQ8
	Z8hL/i4nWLwDsQWqcLNT0p6Qov9iRBKwImnc0ubDohmc57zgFhRDSX8+lx9LcFqqmylA
	gxfQ==
X-Gm-Message-State: APjAAAVDmdDlTOGd15NpqMVvKXTEGWSWW+s63pxLoLHTTySjYIRLHJga
	aJheuGc8GNtjf5QL8JUDBQcDHfyVU6vJNp8dDUE=
X-Google-Smtp-Source: APXvYqw5bcJgghtLBMZF2ll5ALHa623rr9v2NlzsGurG7V50l4e7ykkNEe1LuGNfBmMug85C5+e6iejlA0hbc8IW41k=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr6104007vsa.25.1578583927748; 
	Thu, 09 Jan 2020 07:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
In-Reply-To: <492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 16:31:56 +0100
Message-ID: <CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Thu, 09 Jan 2020 15:32:07 -0000
Content-Type: multipart/alternative; boundary="00000000000042faa4059bb6b6c4"

--00000000000042faa4059bb6b6c4
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 00:02, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > Drop backports, rebase other patches.
> >
> > One patch I wasn't able to rebase as upstream code changed too much:
> > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > Please determine if it is still needed, produce a new version,
> > and work with upstream to get it merged.
> >
> > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > is removed as the use case (allowing python 2 and 3 to coexist
> > in SDKs) is no longer relevant with Python 2.x reaching end of line
> > and upstream has refactored the code making a rebase difficult.
> > If needed, please re-add the patch to py2, rather than py3.
> >
> > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> > recipes
> > and classes accordingly.
> >
> > The manifest for the 3.8.0 version is updated; particularly pkgutil
> > module is now packaged in -core (as other things in core need it);
> > this also necessitates allowing empty -pkgutil package to avoid
> > breakage across layers.
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442
>

This is a weird one, and I can't reproduce it locally. Hints?

File: '/home/pokybuild/yocto-worker/beaglebone/build/meta/lib/oe/sstatesig.py',
lineno: 544, function: process
     0540:                else:
     0541:                    add_perm(stat.S_IXOTH, 'x')
     0542:
     0543:                if include_owners:
 *** 0544:                    update_hash(" %10s" %
pwd.getpwuid(s.st_uid).pw_name)
     0545:                    update_hash(" %10s" %
grp.getgrgid(s.st_gid).gr_name)
     0546:
     0547:                update_hash(" ")
     0548:                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
Exception: KeyError: 'getpwuid(): uid not found: 6000'


Alex

--00000000000042faa4059bb6b6c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 00:02, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-01-08 at 14:27 =
+0100, Alexander Kanavin wrote:<br>
&gt; Drop backports, rebase other patches.<br>
&gt; <br>
&gt; One patch I wasn&#39;t able to rebase as upstream code changed too muc=
h:<br>
&gt; 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch<br>
&gt; Please determine if it is still needed, produce a new version,<br>
&gt; and work with upstream to get it merged.<br>
&gt; <br>
&gt; 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch<br>
&gt; is removed as the use case (allowing python 2 and 3 to coexist<br>
&gt; in SDKs) is no longer relevant with Python 2.x reaching end of line<br=
>
&gt; and upstream has refactored the code making a rebase difficult.<br>
&gt; If needed, please re-add the patch to py2, rather than py3.<br>
&gt; <br>
&gt; Python 3.8 no longer adds &quot;m&quot; to &quot;3.8&quot; in paths, s=
o adjust the<br>
&gt; recipes<br>
&gt; and classes accordingly.<br>
&gt; <br>
&gt; The manifest for the 3.8.0 version is updated; particularly pkgutil<br=
>
&gt; module is now packaged in -core (as other things in core need it);<br>
&gt; this also necessitates allowing empty -pkgutil package to avoid<br>
&gt; breakage across layers.<br>
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/1442" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/65/builds/1442</a><br></blockquote><div><br></div=
><div>This is a weird one, and I can&#39;t reproduce it locally. Hints?<br>=
</div><div><br></div><div><pre class=3D"gmail-row gmail-log" style=3D"heigh=
t:846.15px;overflow-y:auto;display:block"><span class=3D"gmail-ng-scope"><d=
iv style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-=
binding"><span class=3D"gmail-">File: &#39;/home/pokybuild/yocto-worker/bea=
glebone/build/meta/lib/oe/sstatesig.py&#39;, lineno: 544, function: process=
</span></span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap=
 gmail-log_o gmail-ng-binding"><span class=3D"gmail-">     0540:           =
     else:</span></span></div><div style=3D"height:18px"><span class=3D"gma=
il-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">     0541: =
                   add_perm(stat.S_IXOTH, &#39;x&#39;)</span></span></div><=
div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng=
-binding"><span class=3D"gmail-">     0542:</span></span></div><div style=
=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"=
><span class=3D"gmail-">     0543:                if include_owners:</span>=
</span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-=
log_o gmail-ng-binding"><span class=3D"gmail-"> *** 0544:                  =
  update_hash(&quot; %10s&quot; % pwd.getpwuid(s.st_uid).pw_name)</span></s=
pan></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log=
_o gmail-ng-binding"><span class=3D"gmail-">     0545:                    u=
pdate_hash(&quot; %10s&quot; % grp.getgrgid(s.st_gid).gr_name)</span></span=
></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o =
gmail-ng-binding"><span class=3D"gmail-">     0546:</span></span></div><div=
 style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bi=
nding"><span class=3D"gmail-">     0547:                update_hash(&quot; =
&quot;)</span></span></div><div style=3D"height:18px"><span class=3D"gmail-=
no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">     0548:    =
            if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):</span></=
span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-lo=
g_o gmail-ng-binding"><span class=3D"gmail-">Exception: KeyError: &#39;getp=
wuid(): uid not found: 6000&#39;</span></span></div><div style=3D"height:18=
px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=
=3D"gmail-"><br></span></span></div><div style=3D"height:18px"><span class=
=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-"><br>=
</span></span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap=
 gmail-log_o gmail-ng-binding"><span class=3D"gmail-"><span style=3D"font-f=
amily:arial,sans-serif">Alex</span><br></span></span></div></span></pre> </=
div></div></div>

--00000000000042faa4059bb6b6c4--
