Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.5472.1589060086988975026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agw73LrW;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id k18so5561090ion.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 14:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyBdYdWv8TLvleEPPLqD/pTNMq574x9HulU4IPrlKEU=;
        b=agw73LrWPFw42DjNBNzoZbK1qEIDPJZUE1pvcHlfbCcv78hb36we9JLige8+hIEVQz
         g/3MoV/p6kVyycTnhPHqkIBv7PKwIf+kt5WNi2i339Pz+fTVUQqb3WDdqDgUqa8urayR
         XYwfUv2HnXuwerX7IveiBgwo0INJwBCgxXpc5DulWozF26YZ2myviG1vjKtLxHnw4XJS
         kir5YJW44PE6HcMmq22DIIuPtZCQQRIrtgZRaM1mbcxzUEDtxRj8M6WeDXc0UOgpelyJ
         hb7hZiE4wXb/4e2qpAAI7jNGXBSRDzbTd/c2CWIUqMIMm09pxPJ966+nPjOyLE0qeva8
         DwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyBdYdWv8TLvleEPPLqD/pTNMq574x9HulU4IPrlKEU=;
        b=d8VjpVwZjWVeZr1niRCcNunougIc28Mz/JY3NXzgHHL57AXiyybr1yqF6g6ewYCIYX
         K+Dzkn15/iCAcXY52plIKPOfeoSjt/QfIwVCzYmdhoyCTIGJVl6Yl1A9vIG4c+3mzkNL
         FJ7heOk3uYpVToIR47Obdaf2Lvvg9jrardQpo2pucyDYzsT5lOpLC7lc4j66I4qNtKsZ
         sv4qAVxmajq2ssdCCycdotDLNa47KC3AYmL8f1SMABCvHaLeH2r68b3JT6PQBxPHzR7Q
         6+tQNBhfIHqA7tWhYfmlx2Eda0Zsw3tZqF2Y5N5f0MPyjSuHqPSR5wEzSaQCz6f8bkDJ
         QW8Q==
X-Gm-Message-State: AGi0PuZWQghdf/FQ4LmTpmXR4LbrMp1TXxpDKhChB3QodcExqaWrKMkS
	ly0t+o+Hv+1VFG/bcgqSAD8OZPYuV0PVbL5FXBJgGBYl
X-Google-Smtp-Source: APiQypIt54t5BJ6qBp/Eiqln3ez4osU5zTGbYchbLdtf7wrP5HkzXNv8EsV0uI9Z1NTN9dTRV77WdlDdVOm6xIWe22g=
X-Received: by 2002:a05:6602:2d95:: with SMTP id k21mr852218iow.146.1589060086271;
 Sat, 09 May 2020 14:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200509212312.8023-1-timothy.t.orling@linux.intel.com> <20200509213254.2277.14643@do>
In-Reply-To: <20200509213254.2277.14643@do>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 9 May 2020 14:34:35 -0700
Message-ID: <CANx9H-CxdWjoHVqkoPf8P4aEFZsS5-mHMQkKsdEE_BWG=0FDzw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBweXBpLmJiY2xhc3M6IHVzZSBuZXcgcHlwaSBVUFNUUkVBTV9DSEVDS19VUkk=?=
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000f8135a05a53de153"

--000000000000f8135a05a53de153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As stated in comment to this patch, it applies on top of Konrad=E2=80=99s r=
egex
patch. So of course it fails patchtest.

On Sat, May 9, 2020 at 2:32 PM Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> =3D=3D Series Details =3D=3D
>
> Series: pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/24047/
> State : failure
>
> =3D=3D Summary =3D=3D
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at e496605ea1)
>
>
>
> If you believe any of these test results are incorrect, please reply to =
the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment t=
he
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] =
->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>=20
>

--000000000000f8135a05a53de153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">As stated in comment to this patch, it applies on to=
p of Konrad=E2=80=99s regex patch. So of course it fails patchtest.</div></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sat, May 9, 2020 at 2:32 PM Patchwork &lt;<a href=3D"mailto:patchwork=
@patchwork.openembedded.org">patchwork@patchwork.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">=3D=3D Series Details =3D=3D<=
br>
<br>
Series: pypi.bbclass: use new pypi UPSTREAM_CHECK_URI<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/240=
47/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.or=
g/series/24047/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<b=
r>
an automated response. Several tests have been executed on the proposed<br=
>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not app=
ly on top of target branch [test_series_merge_on_head] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted br=
anch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at e496605ea1)<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to th=
e<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a>) raising you=
r concerns.<br>
Otherwise we would appreciate you correcting the issues and submitting a n=
ew<br>
version of the patchset if applicable. Please ensure you add/increment the=
<br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2]=
 -&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Guidelines:=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.openembedded.org/wik=
i/Commit_Patch_Message_Guidelines" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patch=
test" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit=
/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit=
/cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoc=
toproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
<br>
<br>
</blockquote></div></div>

--000000000000f8135a05a53de153--
