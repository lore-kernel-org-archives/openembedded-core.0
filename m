Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.257.1792430889264033173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 10:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dhDetQPA;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: oo.hehir@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so2417529e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430888; cv=none;
        d=google.com; s=arc-20260327;
        b=bLnYL9f0u+ic0C24MhR8YcI4o6UPEDgpL3KHwI9nQTrcN/fgmZR3uMgiFqVFkU5nIo
         YaMapx413q/tZg5/1sFav7IIeU8kM/qiXbsC+4CT7BPwGdP78fULenTpByujIdy01B8h
         04OtA1VBHa5JdEHicLX88HFwNr3pxnWU1souvV7yPjVUOG/JAxi/6q6oT8Ws1BIXZSFx
         5pWQ9fY9KuxWusW+ZpBouSFk8PvE/yb3/MkP4D/p+MsozJgMpDZsUuPnFm47d8VwMxcF
         mWp6BUjI8mfJZZVXRtssHqZ5VAQ8bjAfyjyNGyRgXyq9VgEZI5PsWW+UxKCdK/28ZYVT
         0JsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9IuCZdyMF/cAqJiAcFpF3pkuqmuUE6PqmtSOPQ8assQ=;
        fh=Xu0a7lQs1UuDIseMFvlT8K6O8QT1LmIXr2okJu0W0yk=;
        b=fqf2rRvvxJ3aGhQZBJbESvABSbBMvceGHDEqiBaWqhatLtbMCLQtVm/UMaTIWVf7A2
         ToWjiMOkYsNs2a7Zi/XKhtmxV/ZDKeGuZMzycmPqAzyPe8zcby2RGMwyRMDKKDNkOQPZ
         boukQ2A2ZqTc+qENw0j/XoMEchsLg2Ubw9Gt7Qt75G+KGfEV932GmBlVySiKdVD83YNk
         iOGmtjiC+3dKupHohlUeUaikgZgkMHv1uaTIifyYgXelw3MG9zz7pGv+fxMId1xP/iIL
         XocnV/7sOd4Z6rHYa2QKecs/P31FRgrLgZwCXt0jUjA+P1lMGvwnQoJGfa3gfIsEQ4pi
         dEvQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430888; x=1793035688; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IuCZdyMF/cAqJiAcFpF3pkuqmuUE6PqmtSOPQ8assQ=;
        b=dhDetQPAygchydoI325bqNZK4FyimBQH9B840sLxcgN+o6KnsuBi/uqJHgDFKw8vuu
         BOOv5m716LIy8l/wYoe+YTvi7Sx9brakr/uJy/k4uFnEr5wGPiP3Q/B38TKe0/iu3ttB
         bWw9ydh6DV3xjspicyO9WSVYCVdmdUBgiiDei59Vt3xaAKNpXXhLlqwKa+M5HpeLi2dK
         BuxJgZv/zLs0MmXaLvREhFij19fW0CrYsLjM5P/qaUghNOQl/T/I9oQPffLb86aI5qqo
         9gObJuZclPENINWMTaWq7bBhTDEGKgYWXFZ3fnE/K1gjplGI3hdw7rCeU42OPX64Uksj
         65ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430888; x=1793035688;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9IuCZdyMF/cAqJiAcFpF3pkuqmuUE6PqmtSOPQ8assQ=;
        b=XQlLoDhv92Im/U4OFwHswaKiBe/+7xdI6tsQk1IJJneCuz7zp/axQYjNjjXpFBBMZ1
         iENifWRb9Nh45qe7JKSBfA/Xt0Y25lsIFJUCkAWxPMF8Ncex17gEHPSx9UzplZ4AfTtn
         3DYIbxCCRBDrwc51j5S5PEN0nDgU3jHwuDkLzC+BEu/zUsvQ4clV1pTp6300PNuFgJ40
         pVlC46iZ6x+Zzo+Rv7ywtIqUX3J3pi/C8QMXbOdSkiNoZkFeMkdSLcxSer7slkS9UwaG
         bgEF+Sb3CbO/7QPwUQtZo7Tf/kh2oG1ll+ekN8ynDXURqcrJFuwsLfiCvfP66s3k6LaZ
         c4tQ==
X-Gm-Message-State: AFq9FYIQrIyB6DERmGoqIiSNoqw1bCYJhOuzuWts0d+l0YEIXGDy9aWX
	mG9QmxJ1r7rx87Mkit8NjwFdIs6Yaa1nuvVzeFsnNoom58o7D+OXT3ariNJ3ZpBTFyk3DEe5iOf
	96/i02w5GH8+2TlyXpoQaDgG8k4+EASDsqRZj0h+D1w==
X-Gm-Gg: AYBFou2lRInCdsdO/wnZYVoxNY2yjzh2x5q4DU33b7Mr6p3m1kJ8zekVIJSHlOBaz8e
	mG7OK/Sn9+S5D1GI3IeiJde6EOFzAOMRCov1xL835BgcXme8g65OK/rmAJMgjaxXv3werVaZVS5
	CHYh4WumkVhXSHlsLfduYCqYRvsStTMsHnLauma8CV9xzPuvVpqSBOkLicaZCCvClDiJCx3R8Go
	yRngiRKobGJp58jDMwVXcC6LrsfOnHsMJjNYaXPgzkWa2D7w2SuTzpmrD9VIlotHhYRWQmeVyZO
	nDAkxaJW877wO3a+Ht8JrbHqeJp51T7h6qBcsiRzd4se4E71RVCD
X-Received: by 2002:a05:693c:2415:b0:363:a45d:10b1 with SMTP id
 5a478bee46e88-363a45d1b0fmr5603541eec.5.1792430455617; Mon, 19 Oct 2026
 10:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261016204547.2328847-1-oo.hehir@gmail.com> <20261017112358.77434-1-oo.hehir@gmail.com>
 <20261017112358.77434-6-oo.hehir@gmail.com> <DC649D85-F711-414E-92D2-0A00E3D0099E@arm.com>
In-Reply-To: <DC649D85-F711-414E-92D2-0A00E3D0099E@arm.com>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 19 Oct 2026 13:20:43 -0400
X-Gm-Features: AclHuK8TJQLDJClLitqN3cm8rDtMvs6IhxBKw8TRdTtXMeic_jeBqxpQH1_m6eg
Message-ID: <CALp3LZ4dAnw5bHvnjCzZoHTL3-yoBN2WSWoN3rFj=_FkLu9aeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/8] tcl, tcl8: anchor the musl unixInit-3 skip to top-level SKIP lines
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000977ddf065e34bc10"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 20:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248208

--000000000000977ddf065e34bc10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross,

Ok, I'll take a look & hopefully have something in a day or two.

Regards,

Owen

On Mon 19 Oct 2026, 13:07 Ross Burton, <Ross.Burton@arm.com> wrote:

> Hi Owen,
>
> On 17 Oct 2026, at 12:23, Owen O'Hehir via lists.openembedded.org
> <oo.hehir=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On musl, do_install_ptest adds the unixInit-3 skip after every line of
> > run-ptest containing SKIP=3D"$SKIP.
>
> That=E2=80=99s=E2=80=A6 not the intended behaviour.
>
> The intention was to add it once, but obviously the sed wasn=E2=80=99t co=
nstructed
> correctly.  A better solution here would be to add a variable to the reci=
pe
> (say SKIPPED_TESTS) which we sed into the run-ptest.  We can keep the bul=
k
> of the entries in the run-ptest, but this would let the recipe add
> overridden skips too.
>
> Something like:
>
> In run-ptest:
>
> SKIP=3D=E2=80=9C"
>
> Then in the recipe:
>
> SKIPPED_TESTS =3D =E2=80=9C=E2=80=9D
> # comment about why this is needed
> SKIPPED_TESTS:append:musl =3D =E2=80=9C unixInit-3*=E2=80=9D
> # another comment
> SKIPPED_TESTS:append:riscv64 =3D =E2=80=9C binary-40.3*=E2=80=9D
>
> do_install_ptest:append () {
>   sed -i -e "s|SKIP=3D=E2=80=9C"|SKIP=3D\"${SKIPPED_TESTS}\"|"
> ${D}${PTEST_PATH}/run-ptest
> }
>
> For an example, see the python3 recipe.
>
> Ross

--000000000000977ddf065e34bc10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div>Ross,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ok, I&#39;ll take a look &amp; hopefully have something in a day =
or two.</div><div><br></div><div data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br><br></div>Owen</div></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
 19 Oct 2026, 13:07 Ross Burton, &lt;<a href=3D"mailto:Ross.Burton@arm.com"=
>Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hi Owen,<br>
<br>
On 17 Oct 2026, at 12:23, Owen O&#39;Hehir via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> &lt;oo.hehir=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org=
</a>&gt; wrote:<br>
&gt; <br>
&gt; On musl, do_install_ptest adds the unixInit-3 skip after every line of=
<br>
&gt; run-ptest containing SKIP=3D&quot;$SKIP. <br>
<br>
That=E2=80=99s=E2=80=A6 not the intended behaviour.<br>
<br>
The intention was to add it once, but obviously the sed wasn=E2=80=99t cons=
tructed correctly.=C2=A0 A better solution here would be to add a variable =
to the recipe (say SKIPPED_TESTS) which we sed into the run-ptest.=C2=A0 We=
 can keep the bulk of the entries in the run-ptest, but this would let the =
recipe add overridden skips too.<br>
<br>
Something like:<br>
<br>
In run-ptest:<br>
<br>
SKIP=3D=E2=80=9C&quot;<br>
<br>
Then in the recipe:<br>
<br>
SKIPPED_TESTS =3D =E2=80=9C=E2=80=9D<br>
# comment about why this is needed<br>
SKIPPED_TESTS:append:musl =3D =E2=80=9C unixInit-3*=E2=80=9D<br>
# another comment<br>
SKIPPED_TESTS:append:riscv64 =3D =E2=80=9C binary-40.3*=E2=80=9D<br>
<br>
do_install_ptest:append () {<br>
=C2=A0 sed -i -e &quot;s|SKIP=3D=E2=80=9C&quot;|SKIP=3D\&quot;${SKIPPED_TES=
TS}\&quot;|&quot; ${D}${PTEST_PATH}/run-ptest<br>
}<br>
<br>
For an example, see the python3 recipe.<br>
<br>
Ross</blockquote></div></div></div>

--000000000000977ddf065e34bc10--
