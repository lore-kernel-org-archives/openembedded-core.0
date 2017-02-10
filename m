Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id F1EEB773D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 16:29:40 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j15so2889957oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m906Z5aaVYlItI1kEO7foBCt77AR2t5Dv+V4Lcu5dAw=;
	b=ng9cXYcN0UYQzTY3yDoOhdyZdKbrJeYaNtwiV8Txm5RiWwz8JgZJwoxxpd+krcWgAJ
	ez+2AN+MJcG7F8aCwTT2xlzalYy+7+QKZZ67uD00B6GmV6Y2c/bs97frEkOQzjJo5VRg
	Nsn6/MLksdY7JLMKpm6X4OFdpHYYFBuGMDn7vOKiovMoMPb4tTgzueMnY9EH38FQty0B
	PNKNz4vbh1rbwiuuBq9i8K9ZPu0i0GGhCaYqndgd9WYyIn65aXa0bd/d5sH5x088shs1
	u+bkuEVe1C+730yqZxT+RjKOKPBt5xH7ywzEfhfmk5nCtXFQcbhyW4ODWaFMn0MjknPm
	k6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m906Z5aaVYlItI1kEO7foBCt77AR2t5Dv+V4Lcu5dAw=;
	b=pGW1BJ/wo+MkeRWfqJ+fv0vM9Irzoka2dzLNoM252utrYYCZiTmqDy6ffp6XMOXuaF
	21vzxfIZi0ewVfugB6sacsM3Y/WbXyhc2FILGuDJj7dBk4tko+7q0N86YBP6izaGZyRM
	iw7Z7mgZSl670ZgKF/RWqkiwQR6XZWlkDtyVnAM5v+V+h4UJsD4aYa6wdDBU153sr3yo
	0nib1LYrDoCEcZuIx9zFYDGPHXjAso1Woxyb9iqKa70Tc8ylWr0OaPjmgCh07lVb7SQh
	C4gT5xq8eC2xs4gMd7WAO3WFbVwHy/jN5hsYnGndDMZ3k6yU/ZZxjZ9rc4rMlsr3d9jR
	Xd5A==
X-Gm-Message-State: AMke39nloRw6Z83ldFfAYvsjJlg60NSzkRnNiuQn/+7Xzctymt7oMbIduh1ep0+WuUM5xllRKwbOisHOjYaUqA==
X-Received: by 10.202.175.10 with SMTP id y10mr5334795oie.188.1486744181120;
	Fri, 10 Feb 2017 08:29:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Fri, 10 Feb 2017 08:29:20 -0800 (PST)
In-Reply-To: <1486734151-28331-2-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1486734151-28331-2-git-send-email-amarnath.valluri@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 10 Feb 2017 09:29:20 -0700
Message-ID: <CABcZANkYDsXQbMP_dkhy-h0xbQNmQ9EE_mg_FbbPkmFu7bFRVA@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/23] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Fri, 10 Feb 2017 16:29:41 -0000
Content-Type: multipart/alternative; boundary=001a113ce83cc9b94105482f9aca

--001a113ce83cc9b94105482f9aca
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 6:42 AM, Amarnath Valluri <
amarnath.valluri@intel.com> wrote:

> From: Joshua Lock <joshua.g.lock@intel.com>
>
> Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than
> base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>

This looks interesting, but worth noting that this will invalidate all
sstates everywhere, as sstate uses unexpanded variables. So even if the
feature is gone, it=E2=80=99ll change the checksums anyway. That=E2=80=99s =
probably okay,
just something to keep in mind.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113ce83cc9b94105482f9aca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 10, 2017 at 6:42 AM, Amarnath Valluri <span dir=3D"ltr">&lt;<a =
href=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.vallu=
ri@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":17l" class=3D"a3s aXjCH m15a28481c1c313b6">From: Joshua Lock &lt;<a h=
ref=3D"mailto:joshua.g.lock@intel.com">joshua.g.lock@intel.com</a>&gt;<br>
<br>
Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than<br>
base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel.com">j=
oshua.g.lock@intel.com</a>&gt;</div></blockquote></div><br>This looks inter=
esting, but worth noting that this will invalidate all sstates everywhere, =
as sstate uses unexpanded variables. So even if the feature is gone, it=E2=
=80=99ll change the checksums anyway. That=E2=80=99s probably okay, just so=
mething to keep in mind.<br>-- <br><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christophe=
r Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></di=
v>
</div></div>

--001a113ce83cc9b94105482f9aca--
