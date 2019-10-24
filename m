Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id CF7F77F9B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:38:01 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id z19so30815897ior.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qJKGKHmemFyoynhNbUY2/v1QmrIFxCootJZ5dZDZNd0=;
	b=T6uqAEqOTKzR12VwiLAbmQL3N7UPSAFsKkCnKwh+ZleGNI4V+baHIKOkFKe+qFHPyD
	PxMNXFnU35/ZTGE53HaqFxFfJOJUICiXLUVMSKiT7UGLqS29F3SxnDLi/7fdWtuO/owa
	cptiNIMFstA64iua3h0HwqOuXcKWOxvBsqBuVeRqSfCU9MWGx4RgP55p7sJRaa5cre/b
	CINSoHcg/RKUXYFDb//4+MmIjfwW1aw4UIDZejU7ykEzyhmmTGEMk2w9m+/sVx8wOM9s
	1iHAlpAcSy+GxhQHgzdpioxBudKk0dPrZdqOs5sEW1sSLNr/DUCubJfrLo/+UHfHi5H0
	3aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qJKGKHmemFyoynhNbUY2/v1QmrIFxCootJZ5dZDZNd0=;
	b=V3jb4yKrQwMAkkcGThqkwoNbg2QbiK6jxiyAeexJVfJW6X15qFqCBczSqAF8CcX3YA
	KT34vZUOQut2Xh0jRIR0FeefWRW/UrA0PHnpHApxLMYSbXxEUuIFLtxwEvoIbax/Rtsr
	qo51K1bZIJdn7CKtSItCwnmDKa3/iSLx/qUVk2538fiVUluxCnlS92iZFrQyWoUQqdj8
	U0wSUf3X9aGGz0phaWrujkHSzsA7qWlDsnsIeGHeHCQCmiR2stwgzB0I8+pqkUP1E6TJ
	/MWJ62wWXUog9y62wIfDdWN2f4RBuOjqgG/yODvH45TqlPZLIGlC43y/cfiwstCqE/I9
	pNsw==
X-Gm-Message-State: APjAAAU03yYKNQlc2R76WZkWRhmn8DOxepyODaAAedo9CZHSJPDECFQ6
	XpsSx+T/FhvoUiGvXV5hlZiANMYTBPYMal3esPM=
X-Google-Smtp-Source: APXvYqyJUMHvn2D7F0n5BZEB8gr6IRfVVC0vOlcLLgon8Ph4NB1Dfk0/z5dSVdIaMX9YQbzWJn3O+XOynMGRmW1Aysc=
X-Received: by 2002:a02:3e96:: with SMTP id
	s144mr16438120jas.138.1571942282662; 
	Thu, 24 Oct 2019 11:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <qospj1$49m$1@blaine.gmane.org>
In-Reply-To: <qospj1$49m$1@blaine.gmane.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 24 Oct 2019 11:37:51 -0700
Message-ID: <CANx9H-Bq2SBtqOAc6O6M3Cfi6Rfh9omOeQ01n8ARymxw=+=0dg@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sudo: recipe broken
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
X-List-Received-Date: Thu, 24 Oct 2019 18:38:02 -0000
Content-Type: multipart/alternative; boundary="0000000000005d97110595ac5595"

--0000000000005d97110595ac5595
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 11:13 AM Ferry Toth <fntoth@gmail.com> wrote:

> It looks like https://www.sudo.ws/download.html changed certificate and
> directory structure. So that breaks not only thud, but also warrior and
> zeus. It can be fixed by changing the path in the recipe to
> https://www.sudo.ws/dist/sudo-${PV}.tar.gz or
> ftp://ftp.sudo.ws/pub/sudo/sudo-${PV}.tar.gz.
>

Can you please send a patch (and please not the ftp url)

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005d97110595ac5595
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 24, 2019 at 11:13 AM Ferry Toth &lt;<a href=3D"=
mailto:fntoth@gmail.com">fntoth@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">It looks like <a href=3D"https://www.sudo.ws/download=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.sudo.ws/download.ht=
ml</a> changed certificate and <br>
directory structure. So that breaks not only thud, but also warrior and <br=
>
zeus. It can be fixed by changing the path in the recipe to <br>
<a href=3D"https://www.sudo.ws/dist/sudo-$%7BPV%7D.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://www.sudo.ws/dist/sudo-${PV}.tar.gz</a> or<br>
<a href=3D"ftp://ftp.sudo.ws/pub/sudo/sudo-$%7BPV%7D.tar.gz" rel=3D"norefer=
rer" target=3D"_blank">ftp://ftp.sudo.ws/pub/sudo/sudo-${PV}.tar.gz</a>.<br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you please s=
end a patch (and please not the ftp url)</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000005d97110595ac5595--
