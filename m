Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 13AF2768AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:07:45 +0000 (UTC)
Received: by qgj62 with SMTP id 62so95413177qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8LX4k1Tk1wiW27Q4vg8leo4x7HvW3XdshWgJ/7H/Djc=;
	b=HHyoqbqHsXS5e7CxIHWP/Wi4QircQPyfeVBzqVJBjgJ3rZFSyiwdMap47BuqdIUxmj
	tZcjf09N00bG52Kq8/sYXQ+JU64gdnild4sLx4e2nMvsmf+/z9+8ZlyF30wGFxBOrf8D
	Xrf4x2b5YSsrvH2JdeJPKUjxRDBvHwYNwrThZu1qmrgtUJIPQ4dCVMqnuVqhEhqm3m2x
	yn7XKyCnZaPdn8sTQDgbexMOP1mCQBDlYrWT4PJtLgfcokdVMSA7H507oaTAIoAYkl1o
	b+NZM6QUJkoSceSqN520WY/CtVdWY3Un6jR3GA1ZbMnJn+QajrqFJEUhbYX6mmM5l6KM
	pThg==
X-Gm-Message-State: ALoCoQlKZm7MMgJ80Pptvj3euTT07CYOLRZlmQhncYk6cM7Q67PLVt7BT9DrVU75i97ABh9hsR4b
X-Received: by 10.141.28.200 with SMTP id f191mr41349001qhe.52.1439222865318; 
	Mon, 10 Aug 2015 09:07:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:07:25 -0700 (PDT)
In-Reply-To: <07a97e450b3f0cdf8e23897deabfeba0aad39ec3.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
	<07a97e450b3f0cdf8e23897deabfeba0aad39ec3.1439216269.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:07:25 +0100
Message-ID: <CAJTo0LYFkXT=So46MRu9awhijnEhPYOxzP_LJKny1FokJe4ijg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] blktool: update to 4-7
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
X-List-Received-Date: Mon, 10 Aug 2015 16:07:46 -0000
Content-Type: multipart/alternative; boundary=001a11423412a3ec2a051cf72f86

--001a11423412a3ec2a051cf72f86
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 15:23, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  PR = "r1"
>

This can be removed.


> +# The three patches below are taken from
> ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
>  SRC_URI =
> "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
> -
>  ${DEBIAN_MIRROR}/main/b/blktool/blktool_4-6.1.diff.gz;apply=yes;name=patch"
> +           file://0001-fix-typos-in-manpage.patch \
> +           file://0002-fix-string-error.patch \
> +
>  file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
> +          "
>

The patch origin metadata should be in the patches, not the recipe.

Cheers,
Ross

--001a11423412a3ec2a051cf72f86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 15:23, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":1tu" class=3D"a3s" style=3D"overflow:hidden">=C2=A0PR =3D &=
quot;r1&quot;<br></div></blockquote><div><br></div><div>This can be removed=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1tu" cla=
ss=3D"a3s" style=3D"overflow:hidden">
+# The three patches below are taken from <a href=3D"ftp://ftp.debian.org/d=
ebian/pool/main/b/blktool/blktool_4-7.debian.tar.xz" rel=3D"noreferrer" tar=
get=3D"_blank">ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.=
debian.tar.xz</a><br>
=C2=A0SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.=
gz;name=3Dtarball \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${DEBIAN_MIRROR}/main/b/blktool/b=
lktool_4-6.1.diff.gz;apply=3Dyes;name=3Dpatch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-typos-in-manpage.=
patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-fix-string-error.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Fix-3-d-argument-for-=
BLKROSET-it-must-be-const-int.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div></blockquote></div><br>The =
patch origin metadata should be in the patches, not the recipe.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11423412a3ec2a051cf72f86--
