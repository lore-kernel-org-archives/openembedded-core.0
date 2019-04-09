Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9806C7D768
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 21:31:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id k11so399598wro.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z25heakNldit0yKYlkRHAdvB12PsqZWHE5tbbuTJfGg=;
	b=Q/4sZaKN8hVrs3zW3GDJ45WT6asWHbuh8Q30J7+sQSLS4wxJME2txuK7GHZT/z0zvF
	3kjFN4UPIzWKXrMc28I/LSW4nsOp7v/EcMx3yqf2nno+grIktH44bs3BbrmqUeDkgZq7
	jhLWlkG4edb9BuyXGvDBpWbHTXS6QOd5td4qjb/qvCHUA1Hr9MMk7rQ3tEPlz/vEaUf9
	mSfH4aOlqou8JcXOS8jjZAhOOvE6NEd0ce1C+0K66qu2fO+8yOOTnF34D2f3OKhQF0AU
	XHup11SpUkMphcRy7692KZT5Nz+BInsiM7DmXsL8tT1Eh06XVW0t8I4NqtZqbmEFuH6d
	9UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z25heakNldit0yKYlkRHAdvB12PsqZWHE5tbbuTJfGg=;
	b=P1BUw1gehQd6Y3Lhvf8S9LeA2cmWGOionhce8quw3IcqYmJble0w+l4w5MxuVLwKjJ
	Dim0Sj4kBstNamFk0onLpHGtCqNWFRAmjGu86atq+0M25Eb/D3c52m0gc+C2a0AteqQb
	+t6qsIzHDEycu+AFz63Flqxu0akG7+yrFeXDQ1hey4Nhs9JjCOdqiKi+2iNXS6UMWuM/
	Nqu2iTU0HKLLPJK5P9i7V5H71FJMrHYi0t6SaStxt8cAMJ+p0YO+I7tAtvP/aJHRaR1p
	9X9x4mA+d4f+n7/a0DIdkxnSHOpjIhWkk1vRz8nf9PggKN1htfSyqmOQeXjbkwZuA6a4
	zhjg==
X-Gm-Message-State: APjAAAWOrzMI26x+bPlNLz9bvEvcipIctkvUfEGtfVprQ4HW9cQREbvK
	BOJi4dPKxJQ/zNR2wPjTuKveUjahlpZOGCMToZU=
X-Google-Smtp-Source: APXvYqwKOe5Xou5QIEYkALmbPOzDwrA8CstBJQDvMJ/DHllrtfz0kvhNmbg8oHqIkPiBqYTfOBq0TeujMPI89xVTKK8=
X-Received: by 2002:adf:f607:: with SMTP id t7mr26038962wrp.191.1554845511190; 
	Tue, 09 Apr 2019 14:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554628807.git.akuster808@gmail.com>
In-Reply-To: <cover.1554628807.git.akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Apr 2019 23:31:41 +0200
Message-ID: <CA+chaQd2dqK4LyTeKRwROvSwtwFC23GO9fWB3GpFTwGz91ytMQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] thud-next patch review
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
X-List-Received-Date: Tue, 09 Apr 2019 21:31:50 -0000
Content-Type: multipart/alternative; boundary="000000000000600c0705861faecc"

--000000000000600c0705861faecc
Content-Type: text/plain; charset="UTF-8"

Please don't forget to include:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280094.html
and similar one for sumo:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280093.html
in the next pull.

I don't see them included in any thud-next/thud-nmut branches.

On Sun, Apr 7, 2019 at 11:24 AM Armin Kuster <akuster808@gmail.com> wrote:

> There are the commit I intend on sending a pull request for in two days.
> Tuesday my timezone (IST)
>
> Please provide feedback by then if there are any issues. This is mostly
> OEQA changes. They have been througt the AB a-full and passed.
>
> The following changes since commit
> 45032e30be70503faeee468159b216031b729309:
>
>   build-appliance-image: Update to thud head revision (2019-03-27 23:22:49
> +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/thud-nmut
>   http://cgit.openembedded.org//log/?h=stable/thud-nmut
>
> Armin Kuster (1):
>   Revert "boost: update to 1.69.0"
>
> Chen Qi (1):
>   pkgdata.py: avoid target-sdk-dummy-provides to mess things up
>
> Mazliana (1):
>   oeqa/manual/bsp-hw.json: add non-IA tests
>
> Richard Purdie (2):
>   resulttool: Allow store to work on single files
>   resulttool: Allow extraction of ptest data
>
> Sudhir Sharma (1):
>   oeqa/manual: Add manual runtime 'compliance' testcases to json
>
> Yeoh Ee Peng (6):
>   oeqa/manual/toaster: transfer manual toaster test cases to oeqa
>   oeqa/manual/toaster: updated test id naming
>   resulttool/manualexecution: Standardize input check
>   resulttool/manualexecution: Enable display full steps without press
>     enter
>   resulttool/manualexecution: Fixed step sorted by integer
>   resulttool/manualexecution: Refactor and simplify codebase
>
> sangeeta jain (4):
>   oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
>   oeqa/manual/bsp-hw.json: test id updated and obsolete test cases
>     removed
>   oeqa/manual/compliance-test.json: test id updated and missing test
>     cases added
>   oeqa/manual/kernel-dev.json: test id updated
>
>  meta/lib/oeqa/manual/bsp-hw.json                   |  264 +-
>  meta/lib/oeqa/manual/compliance-test.json          |  194 ++
>  meta/lib/oeqa/manual/kernel-dev.json               |   36 +-
>  meta/lib/oeqa/manual/sdk.json                      |   14 +-
>  meta/lib/oeqa/manual/toaster-managed-mode.json     | 2572
> ++++++++++++++++++++
>  meta/lib/oeqa/manual/toaster-unmanaged-mode.json   | 1170 +++++++++
>  meta/lib/oeqa/selftest/cases/pkgdata.py            |    1 +
>  ...bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} |    0
>  .../boost/{boost-1.69.0.inc => boost-1.68.0.inc}   |    4 +-
>  meta/recipes-support/boost/boost.inc               |    1 +
>  ...-arch-instruction-set-flags-we-do-that-o.patch} |   23 +-
>  ...ucibility-add-file-directive-to-assembler.patch |  243 ++
>  .../boost/{boost_1.69.0.bb => boost_1.68.0.bb}     |    6 +-
>  scripts/lib/resulttool/manualexecution.py          |   61 +-
>  scripts/lib/resulttool/resultutils.py              |   39 +-
>  scripts/lib/resulttool/store.py                    |   23 +-
>  16 files changed, 4467 insertions(+), 184 deletions(-)
>  create mode 100644 meta/lib/oeqa/manual/compliance-test.json
>  create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json
>  create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json
>  rename meta/recipes-support/boost/{bjam-native_1.69.0.bb =>
> bjam-native_1.68.0.bb} (100%)
>  rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.68.0.inc}
> (85%)
>  rename
> meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> => 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
>  create mode 100644
> meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
>  rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.68.0.bb}
> (56%)
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

--000000000000600c0705861faecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Please don&#39;t forget to include:<div><=
a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2019-Ma=
rch/280094.html">http://lists.openembedded.org/pipermail/openembedded-core/=
2019-March/280094.html</a><br></div><div>and similar one for sumo:</div><di=
v><a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2019=
-March/280093.html">http://lists.openembedded.org/pipermail/openembedded-co=
re/2019-March/280093.html</a></div><div>in the next pull.</div><div><br></d=
iv><div>I don&#39;t see them included in any thud-next/thud-nmut branches.<=
/div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Apr 7, 2019 at 11:24 AM Armin Kuster &lt;<a href=3D"mail=
to:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">There are the commit I intend =
on sending a pull request for in two days. Tuesday my timezone (IST)<br>
<br>
Please provide feedback by then if there are any issues. This is mostly OEQ=
A changes. They have been througt the AB a-full and passed.<br>
<br>
The following changes since commit 45032e30be70503faeee468159b216031b729309=
:<br>
<br>
=C2=A0 build-appliance-image: Update to thud head revision (2019-03-27 23:2=
2:49 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> stable/thud-nmut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org//log/?h=3Dstable/thud-nmut" =
rel=3D"noreferrer" target=3D"_blank">http://cgit.openembedded.org//log/?h=
=3Dstable/thud-nmut</a><br>
<br>
Armin Kuster (1):<br>
=C2=A0 Revert &quot;boost: update to 1.69.0&quot;<br>
<br>
Chen Qi (1):<br>
=C2=A0 pkgdata.py: avoid target-sdk-dummy-provides to mess things up<br>
<br>
Mazliana (1):<br>
=C2=A0 oeqa/manual/bsp-hw.json: add non-IA tests<br>
<br>
Richard Purdie (2):<br>
=C2=A0 resulttool: Allow store to work on single files<br>
=C2=A0 resulttool: Allow extraction of ptest data<br>
<br>
Sudhir Sharma (1):<br>
=C2=A0 oeqa/manual: Add manual runtime &#39;compliance&#39; testcases to js=
on<br>
<br>
Yeoh Ee Peng (6):<br>
=C2=A0 oeqa/manual/toaster: transfer manual toaster test cases to oeqa<br>
=C2=A0 oeqa/manual/toaster: updated test id naming<br>
=C2=A0 resulttool/manualexecution: Standardize input check<br>
=C2=A0 resulttool/manualexecution: Enable display full steps without press<=
br>
=C2=A0 =C2=A0 enter<br>
=C2=A0 resulttool/manualexecution: Fixed step sorted by integer<br>
=C2=A0 resulttool/manualexecution: Refactor and simplify codebase<br>
<br>
sangeeta jain (4):<br>
=C2=A0 oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato<b=
r>
=C2=A0 oeqa/manual/bsp-hw.json: test id updated and obsolete test cases<br>
=C2=A0 =C2=A0 removed<br>
=C2=A0 oeqa/manual/compliance-test.json: test id updated and missing test<b=
r>
=C2=A0 =C2=A0 cases added<br>
=C2=A0 oeqa/manual/kernel-dev.json: test id updated<br>
<br>
=C2=A0meta/lib/oeqa/manual/bsp-hw.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 264 +-<br>
=C2=A0meta/lib/oeqa/manual/compliance-test.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 194 ++<br>
=C2=A0meta/lib/oeqa/manual/kernel-dev.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A036 +-<br>
=C2=A0meta/lib/oeqa/manual/sdk.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +-<br>
=C2=A0meta/lib/oeqa/manual/toaster-managed-mode.json=C2=A0 =C2=A0 =C2=A0| 2=
572 ++++++++++++++++++++<br>
=C2=A0meta/lib/oeqa/manual/toaster-unmanaged-mode.json=C2=A0 =C2=A0| 1170 +=
++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/pkgdata.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0...<a href=3D"http://bjam-native_1.69.0.bb" rel=3D"noreferrer" target=
=3D"_blank">bjam-native_1.69.0.bb</a> =3D&gt; <a href=3D"http://bjam-native=
_1.68.0.bb" rel=3D"noreferrer" target=3D"_blank">bjam-native_1.68.0.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
=C2=A0.../boost/{boost-1.69.0.inc =3D&gt; boost-1.68.0.inc}=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 4 +-<br>
=C2=A0meta/recipes-support/boost/boost.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0...-arch-instruction-set-flags-we-do-that-o.patch} |=C2=A0 =C2=A023 +=
-<br>
=C2=A0...ucibility-add-file-directive-to-assembler.patch |=C2=A0 243 ++<br>
=C2=A0.../boost/{<a href=3D"http://boost_1.69.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">boost_1.69.0.bb</a> =3D&gt; <a href=3D"http://boost_1.68.0.bb=
" rel=3D"noreferrer" target=3D"_blank">boost_1.68.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 6 +-<br>
=C2=A0scripts/lib/resulttool/manualexecution.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A061 +-<br>
=C2=A0scripts/lib/resulttool/resultutils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A039 +-<br>
=C2=A0scripts/lib/resulttool/store.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A023 +-<br>
=C2=A016 files changed, 4467 insertions(+), 184 deletions(-)<br>
=C2=A0create mode 100644 meta/lib/oeqa/manual/compliance-test.json<br>
=C2=A0create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json<br>
=C2=A0create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json<b=
r>
=C2=A0rename meta/recipes-support/boost/{<a href=3D"http://bjam-native_1.69=
.0.bb" rel=3D"noreferrer" target=3D"_blank">bjam-native_1.69.0.bb</a> =3D&g=
t; <a href=3D"http://bjam-native_1.68.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">bjam-native_1.68.0.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-support/boost/{boost-1.69.0.inc =3D&gt; boost-1.6=
8.0.inc} (85%)<br>
=C2=A0rename meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instr=
uction-set-flags-we-do-that-o.patch =3D&gt; 0003-Don-t-set-up-arch-instruct=
ion-set-flags-we-do-that-o.patch} (93%)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/boost/reproducibility-a=
dd-file-directive-to-assembler.patch<br>
=C2=A0rename meta/recipes-support/boost/{<a href=3D"http://boost_1.69.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">boost_1.69.0.bb</a> =3D&gt; <a href=
=3D"http://boost_1.68.0.bb" rel=3D"noreferrer" target=3D"_blank">boost_1.68=
.0.bb</a>} (56%)<br>
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

--000000000000600c0705861faecc--
