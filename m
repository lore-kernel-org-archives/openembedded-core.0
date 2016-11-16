Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id B2D8371A1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:05:29 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id n6so94972901qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l+E5BdpDWOO6TDz+mQ9E59e/FURqIKHj1Irm7BF/mio=;
	b=xoHTwHVulgLba01uoGJ/ptAFJEW+lPbEbOryfBEicOb4ILp5yRIXAbdjh059XqR0JV
	VN3KCIpbLqi0aMyMQZHybL6TKW2HAQcID62+1pF32f7S648Krr/mfcmeJL0+4KQWhooG
	eGsF9XO6QqBsAvF40mXSkXIGujROlN4C97RJpZDvW1im4sB6IXqRLcuRm0go9cj2oKl6
	MSAubAGdL7OEcTVRTrt0DV736kFlPv2mPtuvAmDVfFo4Ph3PtZb0O4+AInp+9fLD+0Im
	bvEOwSwjp0DPK8nl5jkxaQNlMY7tbOr3jfxOx5UwB/81/TND44iCHr/hvVeoHkB5/MXa
	6heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l+E5BdpDWOO6TDz+mQ9E59e/FURqIKHj1Irm7BF/mio=;
	b=JATZzfz0EWA/5ymyCXdZAzYGhdfGlTvCasJqA+yce/XHVXoZgqESsGtU+tDby3GoBS
	8oB8SDTm+AF8CTXJrIKSTZJtXKOztYMtbP60Zk1bmJ+U5nGr2oIpJM4y9qgS/vDDZbW3
	u8GI7+TvRQ/BuNHI1a5a7Tn2DSpiibycPjH/mxGo8F+adbG+6mqDHmloS+WfVYBt2Yde
	a60hKvngW22hJ/ZFgPWN4t680Zs1YJQbHVQNO9yvnTtg4+cI+QP35Tmhw51g71ngiIm6
	hy0XQAy5DV0liQNegTHg3OewiyMBXiytuTYh+QzLkaN0Ma63SSKMtcwRx9ipnAox0g80
	C2vQ==
X-Gm-Message-State: AKaTC01ooVu0XKnEsqJQeRJ/vtIcPIX2uX+F6RymO0k17TcllfMgyItSTDUC/Qba+wRxgbC3hsFiFick/1phfKKY
X-Received: by 10.237.61.42 with SMTP id g39mr1289136qtf.65.1479290730705;
	Wed, 16 Nov 2016 02:05:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 16 Nov 2016 02:05:10 -0800 (PST)
In-Reply-To: <20161114173309.1690-1-edwin.plauchu.camacho@linux.intel.com>
References: <20161114173309.1690-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Nov 2016 10:05:10 +0000
Message-ID: <CAJTo0LYO=Gv+C5rr5sY=HF5Fg0XeudZuSBGz-6cFPW5xsChjiw@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3-git: upgrade to 2.1.0
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
X-List-Received-Date: Wed, 16 Nov 2016 10:05:32 -0000
Content-Type: multipart/alternative; boundary=001a1142a3ea86088505416836fd

--001a1142a3ea86088505416836fd
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 17:33, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

>  meta/recipes-devtools/python/python-git.inc                           |
> 4 ++--
>  .../python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb}             | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-git_2.0.7.bb =>
> python3-git_2.1.0.bb} (100%)
>

As both python-git and python3-git include python-git.inc this patch breaks
python-git.

A sensible fix would be to upgrade both python-git and python3-git, but
move the checksums out of the .inc into both .bb files, so that they can be
upgraded independently.

Ross

--001a1142a3ea86088505416836fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 17:33, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":uw" class=3D"a3s aXjCH m15863e5da0d3124e">=C2=A0m=
eta/recipes-devtools/<span class=3D"il">python</span>/<wbr><span class=3D"i=
l">python</span>-<span class=3D"il">git</span>.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
<span class=3D"">=C2=A0.../<span class=3D"il">python</span>/{<a href=3D"htt=
p://python3-git_2.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-git_=
2.0.7.<wbr>bb</a> =3D&gt; <a href=3D"http://python3-git_2.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-git_2.1.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
</span>=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<span class=3D"">=C2=A0rename meta/recipes-devtools/<span class=3D"il">pyth=
on</span>/{<a href=3D"http://python3-git_2.0.7.bb" rel=3D"noreferrer" targe=
t=3D"_blank"><wbr>python3-git_2.0.7.bb</a> =3D&gt; <a href=3D"http://python=
3-git_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-git_2.1.0.bb</=
a>} (100%)</span></div></blockquote></div><br>As both python-git and python=
3-git include python-git.inc this patch breaks python-git.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">A sensible fix would =
be to upgrade both python-git and python3-git, but move the checksums out o=
f the .inc into both .bb files, so that they can be upgraded independently.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1142a3ea86088505416836fd--
