Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6353B7F33F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:24:02 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id v19so6242795vsv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m1P2h8Yo56thAdXNi+nwEfaoprYhclX7WQToS5whMNs=;
	b=gykRlz7oF3R7w7mz8nll1QKB3CtI28/een0wJWoEHsbvjTbxaedLepNBCFbcr3B5h+
	p+LxtkWowaZIYaK/qk+w+zL3sHrveukQHoiu3Kdg2j1XRoaoEVHHBYe06MXeSFbuYmV8
	NKc1Fo8Fr6Y1sMAduYZrwIYLbkZEcH9JQOWtHhDwczeVg+cZl7ofDfhuGnzmZgbAGOZ/
	3h9PAMmj4i0Mlxt7x7alIvLr+e9g+BlaY1U1gmmEsiEoDIA4R8SsYWQN9Kgk+NdAMKef
	MaTZeMwCoJQoAcQ4MlHAB+AouGehcz7d9Klj2nIOip70Y5MCV0J9FT3lalIQirMmFHII
	dAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m1P2h8Yo56thAdXNi+nwEfaoprYhclX7WQToS5whMNs=;
	b=MDREV8xAVTItVABcpQrJbPLSRvBwdEkRnYuw5kd09tAIghAcykYwq7+0ykN7hyRPy4
	HcAmjkRE0EpdeEmOp0KFBneEaSeTe73EwBM7atM5lktAsBDkJq4aIxEiMANaTRUOMHAe
	J1FdVkyb4vb/lSRw5byOKce/MXc/tE0ZJ+k6AP+UOPzycAuVtLmm5kGxHBFp3DFbPGv6
	lFcSBu8WtUTS36Db3XA4BddoporYbiEMd8ZKcqHRBax8GfOfMpCu/9wonjHb6z4uyA1v
	uuB+rYHXlM3B50IC55Eq2Sh7EaWPd+3vdbNEWy4f+3i8lTzZ2qCvhK573ENJG8uvo1t/
	Sdqg==
X-Gm-Message-State: APjAAAXzu//hi21rFvrtp86Yml2+FByN6W/oFUu+O651zw6vAbxU0JqG
	rCuMnwwF1wkW8z57CfwTeyIHbsEi01a5IGfmwpo=
X-Google-Smtp-Source: APXvYqx3ggdFMUQ9UK802Fq53LDAk42WKaTPBD6of+AmSzfri7iyoM01L4C+Jh9589vZQDEtcc5CQtRc7qlcglvWBsI=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr15760075vss.94.1568125443208; 
	Tue, 10 Sep 2019 07:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
	<CAAPZna02yCZxxG3Y1_St-G6mq2wJr5tJxyEzyN-f4E97M=-yNw@mail.gmail.com>
In-Reply-To: <CAAPZna02yCZxxG3Y1_St-G6mq2wJr5tJxyEzyN-f4E97M=-yNw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2019 16:23:51 +0200
Message-ID: <CANNYZj84-U+6yE4NCXTETKbNdDWjNw8-bsXNPT1WeoLHWdhrfw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Tue, 10 Sep 2019 14:24:02 -0000
Content-Type: multipart/alternative; boundary="000000000000017ab8059233a856"

--000000000000017ab8059233a856
Content-Type: text/plain; charset="UTF-8"

The best way is like in your latest patch - inherit python3native and
DEPENDS = "python3". No need for further tweaks, why did you try them?

Alex

On Tue, 10 Sep 2019 at 15:59, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Adding python3-native doesn't work.
>
> Hmm... it seems that adding "export STAGING_LIBDIR =
> "${STAGING_LIBDIR_NATIVE}"" and removing python3 from DEPENDS worked.
>
> Alexander, I don't know what is the best way to do this, maybe you can
> help here.
>
> Thanks!
>
> On Tue, Sep 10, 2019 at 7:40 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 10 Sep 2019 at 11:50, Ross Burton <ross.burton@intel.com> wrote:
> >>
> >> On 09/09/2019 19:41, Alexander Kanavin wrote:
> >> > and find_installation() method of meson does not merely look for the
> >> > native python binary, it runs the binary with a meson-supplied python
> >> > script designed to obtain all sorts of information, including
> >> > target-specific things that we patch native python to report. If the
> >> > target python installation is not present in sysroot, the script will
> >> > fail, and meson will declare that 'there is no valid installation of
> >> > python on your system'.
> >>
> >> So the python3-native pokes around the target python3 to get the right
> >> values?
> >
> >
> > Yes, if STAGING_LIBDIR is set, via this patch:
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> >
> > (don't shoot the pianist, it was working like this pre-rewrite as well).
> >
> > Alex
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000017ab8059233a856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The best way is like in your latest patch - inherit p=
ython3native and DEPENDS =3D &quot;python3&quot;. No need for further tweak=
s, why did you try them?</div><div><br></div><div>Alex<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 =
Sep 2019 at 15:59, Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystem=
s.com.br">fabio.berton@ossystems.com.br</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Adding python3-native doesn&#39;t wo=
rk.<br>
<br>
Hmm... it seems that adding &quot;export STAGING_LIBDIR =3D<br>
&quot;${STAGING_LIBDIR_NATIVE}&quot;&quot; and removing python3 from DEPEND=
S worked.<br>
<br>
Alexander, I don&#39;t know what is the best way to do this, maybe you can<=
br>
help here.<br>
<br>
Thanks!<br>
<br>
On Tue, Sep 10, 2019 at 7:40 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 10 Sep 2019 at 11:50, Ross Burton &lt;<a href=3D"mailto:ross.b=
urton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 09/09/2019 19:41, Alexander Kanavin wrote:<br>
&gt;&gt; &gt; and find_installation() method of meson does not merely look =
for the<br>
&gt;&gt; &gt; native python binary, it runs the binary with a meson-supplie=
d python<br>
&gt;&gt; &gt; script designed to obtain all sorts of information, including=
<br>
&gt;&gt; &gt; target-specific things that we patch native python to report.=
 If the<br>
&gt;&gt; &gt; target python installation is not present in sysroot, the scr=
ipt will<br>
&gt;&gt; &gt; fail, and meson will declare that &#39;there is no valid inst=
allation of<br>
&gt;&gt; &gt; python on your system&#39;.<br>
&gt;&gt;<br>
&gt;&gt; So the python3-native pokes around the target python3 to get the r=
ight<br>
&gt;&gt; values?<br>
&gt;<br>
&gt;<br>
&gt; Yes, if STAGING_LIBDIR is set, via this patch:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/re=
cipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDI=
R-python-sys.patch" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopr=
oject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001=
-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch</a><br>
&gt;<br>
&gt; (don&#39;t shoot the pianist, it was working like this pre-rewrite as =
well).<br>
&gt;<br>
&gt; Alex<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000017ab8059233a856--
