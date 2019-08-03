Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9372F6079F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 18:55:09 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id 2so53415045vso.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aHpSErGeTNrV1VceeUC/Ut9aIswWav5kDoL/3r3yrTQ=;
	b=Lm9iC0/2v34dMIAlcpzgQm/WeyQ1MAa93lmb4BYGj2OFIkQIy1RpySymBBUKGdK/bt
	XVtyk6veUcXwuZWPTMrlhrneAarvYuEKrUKGmy5arhoYKn7Ean9EpD0dTxZb/ECxpOcM
	QGbBlXlPUWGQLV9fRkxQCNSF7rCIvSQPDoYdeex2pj9M64A8hBxec90MMPnbPIDcRozK
	ZzOUglKy7MuRBqrGgKgSDmHmp00TAtTq33+KlSYWpLljhydwX86M2mukqHuzQC3ODH7i
	m2XKJIakKyiMfoAVxOViyM81VS48uoml3SRtVFNzjg3P0N9QWLUwOMdD2cqYvQB1kqqw
	n99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aHpSErGeTNrV1VceeUC/Ut9aIswWav5kDoL/3r3yrTQ=;
	b=qUTZoktDFbbn47JwsBn6raWoaYGhF+E14Mkm5Ku6Ux624E21jPDr0rKCf4flbJI31y
	105+TflRC8paBdh5fcnEXFRhiM0stPt7bBnMqO8OtsFLpAtg5Rcbt7WbsrY3EUvhnNZ3
	TUQCi3aLlx82QjLlElWiXDmLTZFST8NrX3+AV0C31CPscoQ4cw3SsjNlYN3kQmmowd5d
	74qld4xm3dLGeuxZlzvx/SPQDs+UkRh0zjP6kAqyofxKR+h7wK0bFfJW7QuH6ShKGUZ1
	SSw7suWay2BPdwCUjCapzCCjAMMcM27lMtULXuyJWHwrt4VPo0abGGOacHUXjuzJa/k+
	sD2g==
X-Gm-Message-State: APjAAAVyhLkt9OZ6UN1ZcX/4z6mMybQMhExo40KgCuOgiOjNPKPg9Eew
	QQf1XqoAywODGgQf22bkCeAAqFJ47CtKaH9tU+E=
X-Google-Smtp-Source: APXvYqxkPAXh1lwov59yDBoc+O3AEUfzLNA8RpocWfkdIMOGu6J7+DN1aDC96JEyrczroyoKXjGxMGDBI6+AFLxOS9Q=
X-Received: by 2002:a67:8042:: with SMTP id b63mr94330314vsd.23.1564858510518; 
	Sat, 03 Aug 2019 11:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190803183536.38590-1-raj.khem@gmail.com>
In-Reply-To: <20190803183536.38590-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 3 Aug 2019 20:54:59 +0200
Message-ID: <CANNYZj_Qp_c9ncMaAXKHaAjWHnqn3OG4YkNvvKHebh3viU5i=w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa, llvm, meson: Update llvm to 8.0.1 plus define and use LLVM version globally
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
X-List-Received-Date: Sat, 03 Aug 2019 18:55:09 -0000
Content-Type: multipart/alternative; boundary="000000000000a4b2be058f3b0381"

--000000000000a4b2be058f3b0381
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Aug 2019 at 20:36, Khem Raj <raj.khem@gmail.com> wrote:

> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> b/meta/recipes-devtools/llvm/llvm_git.bb
> index 0067635c2b..35ad3ced37 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
>   BRANCH = "release/${MAJOR_VERSION}.x"
>  MAJOR_VERSION = "8"
>  MINOR_VERSION = "0"
> -PATCH_VERSION = "0"
> +PATCH_VERSION = "1"
>  SOLIBVER = "1"
>  PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>  SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH}
> <http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D> \
>   "-Dgallium-xa=true, -Dgallium-xa=false"
>

Should this bit also use LLVMVERSION?  It would be good to define the llvm
version in a single place, otherwise we will continue to trip over partial
mismatching updates. MAJOR_VERSION can be easily determined via inline
python.

Alex

--000000000000a4b2be058f3b0381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 3 Aug 2019 at 20:36, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-=
devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_=
blank">llvm_git.bb</a><br>
index 0067635c2b..35ad3ced37 100644<br>
--- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llvm_git.bb</a><br>
+++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llvm_git.bb</a><br>=C2=A0
BRANCH =3D &quot;release/${MAJOR_VERSION}.x&quot;<br>
=C2=A0MAJOR_VERSION =3D &quot;8&quot;<br>
=C2=A0MINOR_VERSION =3D &quot;0&quot;<br>
-PATCH_VERSION =3D &quot;0&quot;<br>
+PATCH_VERSION =3D &quot;1&quot;<br>
=C2=A0SOLIBVER =3D &quot;1&quot;<br>
=C2=A0PV =3D &quot;${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}&quot;=
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/llvm/llvm-projec=
t.git;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">github.c=
om/llvm/llvm-project.git;branch=3D${BRANCH}</a> \<br>=C2=A0
&quot;-Dgallium-xa=3Dtrue, -Dgallium-xa=3Dfalse&quot;<br>
</blockquote><div><br></div><div>Should this bit also use LLVMVERSION?=C2=
=A0 It would be good to define the llvm version in a single place, otherwis=
e we will continue to trip over partial mismatching updates. MAJOR_VERSION =
can be easily determined via inline python.</div><div><br></div><div>Alex<b=
r></div></div></div>

--000000000000a4b2be058f3b0381--
