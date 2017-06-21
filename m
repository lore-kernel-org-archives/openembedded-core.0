Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2B06F77EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:08:57 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id a199so79153769qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XE7oLYSoIUHh+GSSXxHjULjNZ1DhGTXiZobnb+OBbMI=;
	b=IbusGdhMNSyri20AL9GCnrRzn3ujRFqbsS7V+XCM+fOq2kdhdJZtrXP3NQvD+Z/sJR
	9FYG3A8NlnLivSP+QkTEvtPhm74f7icLAzvqXUt25At03eZ3Tjeu1tc89S3J2syJqw/9
	v4Gyh6PosDMsRIZWhz3ehxAwN4axjtLvs7k74js7t6odKyuSBQbJKWdSaxmwLvSt021r
	3ykI6eCoKKMsIT2IfoeMqU0UTcU2qz4rI336DzRs8Ox7Ue2Ly1OrNfwXDJpC+f37FN3i
	cr9rqhm7rRyMDQiTh/57SNnVl7xYcvjIAbNpb6U9NheWC3jSji+3wqwCgkWhlOVkbXWF
	1Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XE7oLYSoIUHh+GSSXxHjULjNZ1DhGTXiZobnb+OBbMI=;
	b=a45gCZLoSMuTbj32+kyEUye5+SyHGaDSTq2xczymHfI8/oWjN8QaCQ/9Q1rMI+AUo2
	lSJi5l6JYY860SLs4QIpk+amXSOUttqFN+LevRWdheYA8CdQ9ngEBf9+lFmbIFz3k4L+
	2OoNx1a4r1sntRGlJsE7JeUeF+r9kNx+heHTjuW4HSKb0Um5sTk7mUmiNQT1SzAwekrY
	oBEOPvTM8saqEzH7vw2vKU8oqJ6ITy4TApHDxpn1j8CWcDzEnVG0p84tFuzooVws/iba
	8bUfQkHYkQ2l+F7Fs+m25/4gEFNgrPPT9Y0dfhOvD33+vymvjIJNszvLOiDx2FZ54BOi
	3eqQ==
X-Gm-Message-State: AKS2vOwZYz6gMgMOalV6UReUB7FME+wGjFGDigwDr9Vuvt3v5/Zc/0aP
	hNo8sjeziqcvQjC5niPQabwOg9qmrhsg
X-Received: by 10.55.31.162 with SMTP id n34mr37405804qkh.46.1498043338907;
	Wed, 21 Jun 2017 04:08:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 21 Jun 2017 04:08:38 -0700 (PDT)
In-Reply-To: <CAHiDW_F6Q9aNgRz5=HntGAMJQNLiMURUDW=ym=FojmTErA30zw@mail.gmail.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAHiDW_F6Q9aNgRz5=HntGAMJQNLiMURUDW=ym=FojmTErA30zw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jun 2017 12:08:38 +0100
Message-ID: <CAJTo0LaS--GkQ6XtKHhU5cBQjPUrztKekrVjy1KyKBpo_ceBAw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Wed, 21 Jun 2017 11:08:58 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f8130661055276657a"

--001a1147e5f8130661055276657a
Content-Type: text/plain; charset="UTF-8"

On 21 June 2017 at 11:56, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I wonder if this patch could be related to the strange selftest failures
> where command output seems to be missing completely, e.g.
>     AssertionError: '' != 'ERROR: Unable to find any package producing
> path /not/exist'
>

I'll admit that my first thought when I saw this patch was "this is going
to break selftest" but I failed to run a single build of it before firing
nightly.

Ross

--001a1147e5f8130661055276657a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2017 at 11:56, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I =
wonder if this patch could be related to the strange selftest failures wher=
e command output seems to be missing completely, e.g.<br><div>=C2=A0 =C2=A0=
 AssertionError: &#39;&#39; !=3D &#39;ERROR: Unable to find any package pro=
ducing path /not/exist&#39;<br></div></div></blockquote></div><br>I&#39;ll =
admit that my first thought when I saw this patch was &quot;this is going t=
o break selftest&quot; but I failed to run a single build of it before firi=
ng nightly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1147e5f8130661055276657a--
