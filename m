Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCBB781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:12:29 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b189so6853314wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SpyySi+QHdt66FUeXCTHmwPSF+4zSX3vALmodTCQWq8=;
	b=cTMk2EG6g5JkDiAZ67vA7tPXNs1/HMdpW5EjVW79tiYjTPMN9KeTRFU96eu3mSFX61
	FTYO/i4/WdzKdiSuDwY62G4cpX1++XwK9jp9UUY25K174IhSYpG1zscciQbOXuZs5Dq8
	Jb4L1Cpr9fAZVOIve+w2dnwwNfwXisAoJsdmrho/TWzF95palLWbvUp8aar4by3oKRwg
	7Fy1JTZhvChPUhMAPToLud1HzgR9BfOCWI91PvDmN0sY1uAKWIUOZkRddZ7N7SFQgRYf
	+JwpZBKNCLC+qB93ZSdk1IasVKR/l4kZWz0Qr1CQjEgRRH/G7biuLawSwxfNl3cTDF/2
	KKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SpyySi+QHdt66FUeXCTHmwPSF+4zSX3vALmodTCQWq8=;
	b=TCTOx6JgNcevjrJeInWCDCGO6Txv3NyNvIOeNDdJyGAwGK0c0hKZ47M+qRbjr8300h
	G8z4bsY9PEE1zZvd+mVJ968UoL94ArrmeDFxGK51zJJBipG957L26CUJ7ixkcO6463aJ
	wsB/UqxYKY4jnrqInm8MdqSSPG0ffZP4z9B48LDjCU7kgxG3BJnoY3vXUS2bwHh2PJUc
	9sB/ljCrVc7NiZKWMhzyXP42dVTKeJgfu/DINs2fc9BhAXgPWd+bMXu6MXpKf8VoCHde
	yC3wpZzXmwQe+Rs8+Sesrzk9ypAO9OyCCcCLyiNUKSSkszL8SedZtU9Fke8NlbbNqUZp
	kLfA==
X-Gm-Message-State: AJaThX7uI+Vk371ZTlxuqRfmdCENIDJ7KeqjMSSiL0MnnL3ONev/Docr
	X+748BxgqHez1xiHBJ/cOxN0lMTIwLmQubigKMk=
X-Google-Smtp-Source: AGs4zMbAVONjXh7Vf+pDF9Po5MvrWN/21FD7rpXm8toDvcWTfY6v/YzNXzKUrfCvVFbKzGkg5QtvNiasxqd9WYugRyM=
X-Received: by 10.28.118.1 with SMTP id r1mr4662607wmc.10.1510567950992; Mon,
	13 Nov 2017 02:12:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Mon, 13 Nov 2017 02:12:30 -0800 (PST)
In-Reply-To: <1510563249.4049.33.camel@andred.net>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Nov 2017 11:12:30 +0100
Message-ID: <CA+chaQcS+pyDt4FVuu1tL-FPPDRx-_Jy6E+evC7SHQjkNgaTOg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Mon, 13 Nov 2017 10:12:30 -0000
Content-Type: multipart/alternative; boundary="089e082f250420cbf0055dda828d"

--089e082f250420cbf0055dda828d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this during do_rootfs or are you seeing this issue when upgrading on the
target as well?

I haven't found the bug for this but IIRC it's because do_rootfs is using
--prefer-arch-to-version parameter.
meta/classes/package_ipk.bbclass:OPKG_ARGS +=3D "--force_postinstall
--prefer-arch-to-version"
which causes this undesired behavior.

On Mon, Nov 13, 2017 at 9:54 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Hi,
>
> On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
> > autoconf-archive is a set of common m4 macros, it should be allarch,
> > just like it is on other distros.
>
> I have found previously that when changing a recipe to produce more gener=
ic
> output, like in this case, and the old binary package is still in deploy/=
,
> then the package manager would always pick the more specific version, eve=
n
> if a more recent (by package version) exists in deploy. In my case I was
> moving from PACKAGE_ARCH=3D${MACHINE_ARCH} to PACKAGE_ARCH=3D${TUNE_PKGAR=
CH},
> but I guess it'll be the same here.
>
> What is the correct way to deal with that other that cleansstate?
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e082f250420cbf0055dda828d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this during do_rootfs or are you seeing this issue when=
 upgrading on the target as well?<div><br></div><div>I haven&#39;t found th=
e bug for this but IIRC it&#39;s because do_rootfs is using --prefer-arch-t=
o-version parameter.</div><div>meta/classes/package_ipk.bbclass:OPKG_ARGS +=
=3D &quot;--force_postinstall --prefer-arch-to-version&quot;<br></div><div>=
which causes this undesired behavior.</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Nov 13, 2017 at 9:54 AM, Andr=C3=A9=
 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"=
_blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi,<br>
<span class=3D""><br>
On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:<br>
&gt; autoconf-archive is a set of common m4 macros, it should be allarch,<b=
r>
&gt; just like it is on other distros.<br>
<br>
</span>I have found previously that when changing a recipe to produce more =
generic<br>
output, like in this case, and the old binary package is still in deploy/,<=
br>
then the package manager would always pick the more specific version, even<=
br>
if a more recent (by package version) exists in deploy. In my case I was<br=
>
moving from PACKAGE_ARCH=3D${MACHINE_ARCH} to PACKAGE_ARCH=3D${TUNE_PKGARCH=
},<br>
but I guess it&#39;ll be the same here.<br>
<br>
What is the correct way to deal with that other that cleansstate?<br>
<br>
Cheers,<br>
Andre&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--089e082f250420cbf0055dda828d--
