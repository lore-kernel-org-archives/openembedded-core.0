Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 153337D5EA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 16:38:42 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r4so10207794edy.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pzoVRB7zYRJWIBM81MrgW6heuuwBTKTGpsmwFTQ8JNw=;
	b=kNUd2T0GOa7NnniVdrlBw6n2JiMDSFrR9wsIDP+MWndVb52wZVuvXEwqbz5UZejC8y
	ly+FKufoQjLvnwV5PrPj5mAvTDMXX5/imidmN2Aun04lzLGhqkG/ShvQuTO7RRSbF8YR
	Vrgj1rYFuCJH2aGjUOKWa27n97/0rPNu73cjyRFHWLJDNgOZhyLx73DRRRgbXIwhoZzz
	mdB4soBF+nwESqqQGj1zaHANxgjl+XL0MDCaJnPXrp6qbF17fD6MhIsJVwTJIXiXIT7/
	oIV8Y9Ym7BlYfFl90YHvjstoiP4YpoUTZGM/XcjI6v0hbAVq9NUQ0KeWJIVs9EBKzRs7
	q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pzoVRB7zYRJWIBM81MrgW6heuuwBTKTGpsmwFTQ8JNw=;
	b=AVJOreSK7xZVB2AjDi6vpR2rh7cptEt0KKhO+q2BPxw97MpbuGaKcW5DLz1MF8ZPGJ
	zMDQ6mT3zspqdCBiSNi8781H2PaXG/9xo8vHuOmtvoGCkCWRdniOVBuFgdmwwA0nv1Ex
	JMZtoMWCNP4u5Q0w5yebAWRVcUvigyLRq8Vfxug1ecw/9NaRQRcusZ8L7ZOfIg0jhCsc
	k1Zkublic58tEGGrar2srZhv1UYh12ENQ9n7+Bgc3jG7myuts5uJ9BJGzLBfL4RMVA2G
	Q/+cwCcVUMTd2tLvwCZLnS6IjgdltmiRFqBDTkk0LbYdcbt6MwbxxyFw8IRL4gkrfwvR
	tSuA==
X-Gm-Message-State: APjAAAVoCceP9L6f7deT9DN7MW640MN5gjXSxu97kcWKazXVMW2dwlQo
	90okY9A7DbJVCiSQZd1snw1GbW5D/8SKe6Bm6ao=
X-Google-Smtp-Source: APXvYqxXlhOV73Ta3MkthJWXT01NAojGQSPg+A/VLViFUWfNilHwy3xmmVryqC+1gHc56JVj6dhXelPBo/wN1ELcByI=
X-Received: by 2002:a17:906:4a5a:: with SMTP id
	a26mr20393176ejv.154.1570379923599; 
	Sun, 06 Oct 2019 09:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570375187.git.akuster808@gmail.com>
In-Reply-To: <cover.1570375187.git.akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 6 Oct 2019 18:38:31 +0200
Message-ID: <CA+chaQdc5=7MgKwr673FdhJZ8RBKj=nA_sUy_uJRpzZqmM6MjQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior] 0/8] Patch review
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
X-List-Received-Date: Sun, 06 Oct 2019 16:38:43 -0000
Content-Type: multipart/alternative; boundary="00000000000082378a0594409132"

--00000000000082378a0594409132
Content-Type: text/plain; charset="UTF-8"

Can you please add:
http://git.openembedded.org/openembedded-core/commit/?id=f7a470531d4bcc2888cbb9a7b197b86174f3aba2

it does apply cleanly in warrior.

Thanks

On Sun, Oct 6, 2019 at 5:24 PM Armin Kuster <akuster808@gmail.com> wrote:

> Next series to review.
>
> Please comment by Monday.
> All these have already been sent to the list so short review period.
>
>
> The following changes since commit
> acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f:
>
>   runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
>   http://cgit.openembedded.org//log/?h=stable/warrior-nmut
>
> Adrian Bunk (1):
>   json-c: Don't --enable-rdrand
>
> Alexander Kanavin (1):
>   python: update to 3.7.3
>
> Andrii Bordunov via Openembedded-core (1):
>   classes/image-live.bbclass: Don't hardcode cpio.gz
>
> Anuj Mittal (1):
>   python3: upgrade 3.7.3 -> 3.7.4
>
> Armin Kuster (2):
>   qemu: Fix CVE-2019-8934
>   qemu: fix build issue on new hosts with glibc 2.30
>
> Dan Tran (1):
>   unzip: Fix CVE-2019-13232
>
> Jan Klare (1):
>   systemd: update SRCREV for systemd v241-stable
>
>  meta/classes/image-live.bbclass                    |   2 +-
>  meta/recipes-core/systemd/systemd.inc              |   2 +-
>  meta/recipes-devtools/json-c/json-c_0.13.1.bb      |   2 -
>  ...ysconfig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
>  ...2-distutils-prefix-is-inside-staging-area.patch |   2 +-
>  .../python/python3/CVE-2018-20852.patch            | 124 -------
>  .../python/python3/CVE-2019-9636.patch             | 154 ---------
>  .../python/python3/CVE-2019-9740.patch             | 151 ---------
>  .../python/{python3_3.7.2.bb => python3_3.7.4.bb}  |   9 +-
>  meta/recipes-devtools/qemu/qemu.inc                |   3 +
>  ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++
>  ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95 ++++++
>  .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++
>  .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
>  .../unzip/unzip/CVE-2019-13232_p2.patch            | 356
> +++++++++++++++++++++
>  .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
>  meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
>  17 files changed, 882 insertions(+), 441 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2018-20852.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2019-9636.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2019-9740.patch
>  rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.4.bb}
> (97%)
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
>  create mode 100644
> meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
>  create mode 100644
> meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
>  create mode 100644
> meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000082378a0594409132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you please add:<div><a href=3D"http://git.openembedded=
.org/openembedded-core/commit/?id=3Df7a470531d4bcc2888cbb9a7b197b86174f3aba=
2">http://git.openembedded.org/openembedded-core/commit/?id=3Df7a470531d4bc=
c2888cbb9a7b197b86174f3aba2</a><br></div><div><br></div><div>it does apply =
cleanly in warrior.</div><div><br></div><div>Thanks</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 6, 201=
9 at 5:24 PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akust=
er808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Next series to review.<br>
<br>
Please comment by Monday.<br>
All these have already been sent to the list so short review period.<br>
<br>
<br>
The following changes since commit acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f=
:<br>
<br>
=C2=A0 runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46 +0100)<=
br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> stable/warrior-nmut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org//log/?h=3Dstable/warrior-nmu=
t" rel=3D"noreferrer" target=3D"_blank">http://cgit.openembedded.org//log/?=
h=3Dstable/warrior-nmut</a><br>
<br>
Adrian Bunk (1):<br>
=C2=A0 json-c: Don&#39;t --enable-rdrand<br>
<br>
Alexander Kanavin (1):<br>
=C2=A0 python: update to 3.7.3<br>
<br>
Andrii Bordunov via Openembedded-core (1):<br>
=C2=A0 classes/image-live.bbclass: Don&#39;t hardcode cpio.gz<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 python3: upgrade 3.7.3 -&gt; 3.7.4<br>
<br>
Armin Kuster (2):<br>
=C2=A0 qemu: Fix CVE-2019-8934<br>
=C2=A0 qemu: fix build issue on new hosts with glibc 2.30<br>
<br>
Dan Tran (1):<br>
=C2=A0 unzip: Fix CVE-2019-13232<br>
<br>
Jan Klare (1):<br>
=C2=A0 systemd: update SRCREV for systemd v241-stable<br>
<br>
=C2=A0meta/classes/image-live.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/json-c/<a href=3D"http://json-c_0.13.1.bb" rel=
=3D"noreferrer" target=3D"_blank">json-c_0.13.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 -<br>
=C2=A0...ysconfig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 =C2=A02 +-=
<br>
=C2=A0...2-distutils-prefix-is-inside-staging-area.patch |=C2=A0 =C2=A02 +-=
<br>
=C2=A0.../python/python3/CVE-2018-20852.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 124 -------<br>
=C2=A0.../python/python3/CVE-2019-9636.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 154 ---------<br>
=C2=A0.../python/python3/CVE-2019-9740.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 151 ---------<br>
=C2=A0.../python/{<a href=3D"http://python3_3.7.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.7.2.bb</a> =3D&gt; <a href=3D"http://python3_3.7.=
4.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.4.bb</a>}=C2=A0 |=C2=
=A0 =C2=A09 +-<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0...nux-user-assume-__NR_gettid-always-exists.patch |=C2=A0 49 +++<br>
=C2=A0...rename-gettid-to-sys_gettid-to-avoid-clas.patch |=C2=A0 95 ++++++<=
br>
=C2=A0.../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 ++++++++++++=
+<br>
=C2=A0.../unzip/unzip/CVE-2019-13232_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 33 ++<br>
=C2=A0.../unzip/unzip/CVE-2019-13232_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 356 +++++++++++++++++++++<br>
=C2=A0.../unzip/unzip/CVE-2019-13232_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 121 +++++++<br>
=C2=A0meta/recipes-extended/unzip/<a href=3D"http://unzip_6.0.bb" rel=3D"no=
referrer" target=3D"_blank">unzip_6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A017 files changed, 882 insertions(+), 441 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2018-2085=
2.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740=
.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.7.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.2.bb</a> =3D&gt; <a hr=
ef=3D"http://python3_3.7.4.bb" rel=3D"noreferrer" target=3D"_blank">python3=
_3.7.4.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-as=
sume-__NR_gettid-always-exists.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-re=
name-gettid-to-sys_gettid-to-avoid-clas.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p=
1.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p=
2.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p=
3.patch<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000082378a0594409132--
