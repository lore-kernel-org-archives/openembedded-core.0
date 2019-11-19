Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 325DC7F821
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 11:41:05 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b16so13963181vso.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 03:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yce7Kj1JB6Yuc+04oIFf75M5ixEgTxqQ9jw0fsviFLA=;
	b=fzHjpQjAUCMMM5MzXKjrGieu9OX6Ijc/2oR5gy1ybtOqvkFCNO18HgEYeFdwVw55w3
	mPweTd+dI5JeQU05/6BtHGndUUp/zyVyWq159wdlcIwYRhDm2WxltDfF5MlG0Hl5sVNl
	QFVhHTsXtsQWOulRH1V+tKSfywZd/UI7q/5RxRvQTNPj+EiyY8er0mM28/A01aUCgHxj
	0Rau+e4/8FJ/FiGR40CXERLBLwCwasFLuUx8JljdfG0zgcwI74Odrn04DuccTflg1ZGI
	wLhRXT0+5ktSK5xpL/FNS2ovQbpCRvRLbtjaP+G+PrZzvDr85OeuZZTsPENwPkIg96Mb
	ucLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yce7Kj1JB6Yuc+04oIFf75M5ixEgTxqQ9jw0fsviFLA=;
	b=mHcLmv0eDnCRSbLWBXnTUtljsTyAEOJhaC/S+XMnhBIhcF6UN20+D8pZbgbEhWWmqX
	LI2aEiv+km5dmYZYkotXGvnRVq51vi+4fAdALEkHect2JUb52yozBksbV8IRKXVFTWOz
	uMPnNOHRSz7752Y72RbRxb4kE4QN/6Tb3Vfa20A8bSDqZxJI6lfUKe5g3+c/tMgUVmvH
	DhFgg3cu7MfiTPy6U79Jwk6pR/dGWpi6poq2UNOvAI+wtxapx9GqOAkNt72jzO9zrYOr
	BbnaTizyLda+IXG+PM9KyyhcOM8Qx8FKN5pOGE3QIBnJjrvgmrUrzpAB4nIWaLJYV77J
	Ft4Q==
X-Gm-Message-State: APjAAAW9BIKiuhxcwLjn1gA/hT2HJlednQaIzcYbrVCy7TlAfutLL8cp
	eyPEj4An/6swRsd7hRX2leEEhp1e8jW92wsvtRGUxw==
X-Google-Smtp-Source: APXvYqxLja6erkSS0W05nxWqKR7Q7FKTGGKnj+ubeKyKX/gY6uw9L33hx68Sh0b0ca2yfxaHw9gpYAigFpjVhFzQ9pg=
X-Received: by 2002:a05:6102:4ab:: with SMTP id
	r11mr15557570vsa.25.1574163666114; 
	Tue, 19 Nov 2019 03:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
In-Reply-To: <CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 12:40:55 +0100
Message-ID: <CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 11:41:05 -0000
Content-Type: multipart/alternative; boundary="000000000000231fdc0597b18a91"

--000000000000231fdc0597b18a91
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2019 at 21:09, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 18, 2019 at 6:33 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > The homepage: https://www.kernel.org/doc/man-pages/download.html
> > specifies that the latest tarballs are published one level up
> > from where we currently take them.
> >
>
> archive is a better location for what it's worth. Since long after a
> release, the tarball may disappear from
> level up but chances of it being in archive are higher. So Let's not
> change this URI, unless there is another
> reason that I missed.
>

I have to disagree actually! The reasons are:
1. Taking man-pages from archive means we are always shipping an out of
date version, particularly if a tarball is archived months or years later
than it was released.
2. Specifically here, the main folder has all man-page releases going back
1.5 years, which is longer than yocto release's support window. Meanwhile,
the archive is missing several latest releases.
3. Even if a yocto release ships a version of man-pages that is then
archived and removed from main folder, it is trivial and safe to backport
an update from master. man-pages tarballs contain pre-built documentation
and don't threaten release stability.

If this becomes a real problem, we can also write to Michael Kerrisk and
ask that he doesn't move tarballs around.

Alex

--000000000000231fdc0597b18a91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 18 Nov 2019 at 21:09, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, Nov 18, 2019 at 6:33 AM Alexander Kanav=
in<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The homepage: <a href=3D"https://www.kernel.org/doc/man-pages/download=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/man-=
pages/download.html</a><br>
&gt; specifies that the latest tarballs are published one level up<br>
&gt; from where we currently take them.<br>
&gt;<br>
<br>
archive is a better location for what it&#39;s worth. Since long after a<br=
>
release, the tarball may disappear from<br>
level up but chances of it being in archive are higher. So Let&#39;s not<br=
>
change this URI, unless there is another<br>
reason that I missed.<br></blockquote><div><br></div><div>I have to disagre=
e actually! The reasons are:</div><div>1. Taking man-pages from archive mea=
ns we are always shipping an out of date version, particularly if a tarball=
 is archived months or years later than it was released.<br></div><div>2. S=
pecifically here, the main folder has all man-page releases going back 1.5 =
years, which is longer than yocto release&#39;s support window. Meanwhile, =
the archive is missing several latest releases.<br></div><div>3. Even if a =
yocto release ships a version of man-pages that is then archived and remove=
d from main folder, it is trivial and safe to backport an update from maste=
r. man-pages tarballs contain pre-built documentation and don&#39;t threate=
n release stability.</div><div><br></div><div>If this becomes a real proble=
m, we can also write to Michael Kerrisk and ask that he doesn&#39;t move ta=
rballs around.<br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000231fdc0597b18a91--
