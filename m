Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4C49C71C56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:26:46 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id m36so128138778qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+tZTYD3Mvqw7T+2NbL7DC0Cjm2pKzslL2QPH+mudcho=;
	b=JQIBbrNbS+NqsdPcpqS9EpMFzu9orcxEU0FN5nW8vu55WfGlcKQgzU6Ge/0R7AFSoP
	T34GuEpO1g8qJ54qJq0WMR7BwmDA9y/o4enaxuf1b4tQNge1+KjN5Cf2+iayUwXA0jR1
	cH9/AqC3YmK3Kqa1esSFprnkxtlNJlMo+6VnW1zWZsejjkgw1TyVFNZiNbhVLf9pQi/2
	NT7qMbv0JlXvlzPuGxaJxZuwDeezniqlE0SQdHOoutKyKM6+LnZSszTLSg6tvUKrLGgf
	Rs2Iojz//NYHYh+2FfrhzlqqJl/k+GMy06/ubIWgQs55Np2w/tAVR/Lcz/XFGgzDQBgK
	2sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+tZTYD3Mvqw7T+2NbL7DC0Cjm2pKzslL2QPH+mudcho=;
	b=Nxm5ZQQD6mPUOrrWPjZ8UigzbYTZeH91N6mWQWpEji9gpr8Y7lwzpqdse88AKKrtab
	+7EfmOCEnMAEhOahfxLC3RaM1qubbYV9pXbzCnzzHEobW9JmexIDTodVCreR48x4cX9l
	9LMyhFQITO/Xg45Fb681j/cPKrhOECL+Ijgk9FhR8TVFfJBJga7JwEfdnDnKbstLPE8q
	94HJtQbsDB11aCbUVXcnTwoUK9kgIuZKVzAT2KJ16839m2g/6cpKODWNcLrqnX3Emm8V
	l0PPxR+BX1JzfwqSLeGeR2J08ls2wtyYpwfMvDy5L2dLX4AGcuwnnaJkA/2cUhuAXFaP
	519g==
X-Gm-Message-State: AN3rC/6v/d+l1TaBtTDu0Q+nmUdXzIhyt6x4Lcv50GBV0apS+Wis+DXv
	y/UuYLatY6UAGGRPkp0yOjSQqZQYx6dw
X-Received: by 10.200.42.238 with SMTP id c43mr2594149qta.144.1492529207892;
	Tue, 18 Apr 2017 08:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 08:26:27 -0700 (PDT)
In-Reply-To: <CAHiDW_GAbFnDivfNvTYGKoUDd5fiyo4yeP4gYiG7aMpMr1nGFw@mail.gmail.com>
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
	<CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
	<58EEE028.5000606@windriver.com>
	<a274ed9b-010d-f890-2c3c-064e6e1bbcc2@linux.intel.com>
	<CAHiDW_GAbFnDivfNvTYGKoUDd5fiyo4yeP4gYiG7aMpMr1nGFw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 16:26:27 +0100
Message-ID: <CAJTo0Lbrax_TaVWcXXZqiiEkSXJPUtCxKC_vuOz3h+s1VBp_7A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Tue, 18 Apr 2017 15:26:48 -0000
Content-Type: multipart/alternative; boundary=001a113f40e440f32d054d72892b

--001a113f40e440f32d054d72892b
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 08:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I had a quick look at this. We have three recipes in oe-core that "need"
> gnome-common (python3-pygobject, gnome-desktop3, matchbox-desktop). The
> only meaningful usage of gnome-common in their configure.ac's is
> GNOME_COMPILE_WARNINGS().
>

FWIW I patched matchbox-desktop in February but never submitted the srcrev
bump.  Now I wish I did...

Ross

--001a113f40e440f32d054d72892b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 08:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I had a quick=
 look at this. We have three recipes in oe-core that &quot;need&quot; gnome=
-common (python3-pygobject, gnome-desktop3, matchbox-desktop). The only mea=
ningful usage of gnome-common in their <a href=3D"http://configure.ac" targ=
et=3D"_blank">configure.ac</a>&#39;s is GNOME_COMPILE_WARNINGS().</div><div=
></div></blockquote></div><br>FWIW I patched matchbox-desktop in February b=
ut never submitted the srcrev bump.=C2=A0 Now I wish I did...</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f40e440f32d054d72892b--
