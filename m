Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3833E7F424
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 19:39:18 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id v19so6995515vsv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9h3Y1g226ewH7FjwQPB/rxON3f75awtT86g5jT1Upts=;
	b=FDnusLDq302oESpBwLIJfbyRCCo/egrj9ZZSI9l00Ek2ZK6opH+MvI5YWO0h7iTNsB
	8/xVWXr478fJ3IIbFncC+IjJQ3rPDXgeIY/Is/D0nkMmNmulTTfX/QwGfRFhdBkm87TF
	IIb0bi6GMws84X3mvYUp9uTjWCuqYAXE36ksLtzkfXRaRweOYVy5d33kPRMoaIUs8djC
	xs7Bc5CtT9jZ6YLmCxeZ6ST1qPRwmRTvqGRcLL8oUIvaVf3zrcw6330OZzrSzLF2tGcs
	bu77GKjq4NvwtM/RDqBfi6Pah78ZRo6QC6+YjamFHKZoHFdR0K0Chpj2b+4x0TWNtBhf
	/0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9h3Y1g226ewH7FjwQPB/rxON3f75awtT86g5jT1Upts=;
	b=V/gag4KPA8HK9uRvt+CRNmJKBS5hqSvI0GC06xdTGlw1oIaWvVcMUqLWbQvuMcoJRD
	k1XVs8ISDy5OkR275yFIigRREhG6nyIgC9YA0Xd4VJhc4/tN5N1h13Dt+tG0GXfeV7MR
	e5QmTqsYVYhuwAsieV62Hdz28vPVvNSKgmuQ0wDNvuTqNICH0gSoAnws4CWfv65MfbWy
	ra+ZgNIt5QVEySFz5ZYAyxGWIjuUPKSDTLH1dAsT2FOGbvBmv/WdkZ+/gRG1QvQY/qn4
	y0mx87xezTxZ9+NtXqR2ZpNnkNLC2z+PvD0q8xjQxQ4c7pMxVEQFfGqwzV59WnoT4EH7
	sWBw==
X-Gm-Message-State: APjAAAVmxaawC99aB3a9ykYeXIZodp2oLr7XYZNrHzmvqMbelE+7ib6V
	FAEK/UaTjrKm4+kt01Ql4q6+x4T1bWL+9nJsZjw=
X-Google-Smtp-Source: APXvYqwkEddHj1anIaF6pBIg5Je3VszBSvZbJyMjTK4wrML3GVO5R6x+vSUC2N6dYPReMTHq+vKeP9wdHr4E5yH7btk=
X-Received: by 2002:a67:ea09:: with SMTP id g9mr10179652vso.23.1570822759061; 
	Fri, 11 Oct 2019 12:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-10-alex.kanavin@gmail.com>
	<60257c1a-0225-dd3d-af04-bddad416de07@gmail.com>
In-Reply-To: <60257c1a-0225-dd3d-af04-bddad416de07@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2019 21:39:07 +0200
Message-ID: <CANNYZj_K=oGF9qnYW-j2s2f_oxit8JH_mGWVL11EqOCeaQby2A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/19] gtk-doc: upgrade 1.31 -> 1.32
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
X-List-Received-Date: Fri, 11 Oct 2019 19:39:18 -0000
Content-Type: multipart/alternative; boundary="0000000000008f1d830594a7ac65"

--0000000000008f1d830594a7ac65
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Oct 2019 at 21:30, akuster808 <akuster808@gmail.com> wrote:

> > --- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> > +++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
> > @@ -1,4 +1,4 @@
> > -From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 2001
> > +From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Mon, 5 Sep 2016 22:25:44 +0100
>
> Why did the patch change?
>

rebasing patches with 'devtool upgrade' can do this. I usually don't trim
such non-changes as they're obvious and harmless.

Alex

--0000000000008f1d830594a7ac65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 11 Oct 2019 at 21:30, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex">&gt; --- a/meta/r=
ecipes-gnome/gtk-doc/files/pkg-config-native.patch<br>
&gt; +++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 5 Sep 2016 22:25:44 +0100<br>
<br>
Why did the patch change?<br></blockquote><div><br></div><div>rebasing patc=
hes with &#39;devtool upgrade&#39; can do this. I usually don&#39;t trim su=
ch non-changes as they&#39;re obvious and harmless.</div><div><br></div><di=
v>Alex</div></div></div>

--0000000000008f1d830594a7ac65--
