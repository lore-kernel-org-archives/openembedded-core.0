Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF4DC64ED6
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:49 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.4482.1648845562901163018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 13:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=op3AuSAN;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id w123so2037797vkg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHWuQwWt7T+E+w2MUlDfeFs3ZzPfhSQIogz8r9AWTPE=;
        b=op3AuSANkCHvwB3MYoJkYppTFHkY0RIgQ00ZosdDwJdFbJZrWob1Jt77ObJMO0SZm6
         +4rJ58/v2kEXVtwL2Zz9kPyCUjK5VqIebxj5zf/QozXBqES8ADw0Tb8Ldpz6F24CrR+M
         ROvqfCpTP+fC4ClYmDDIhXXDXmpiePHZwR10nTX7SggOfsCBlsL+AIvdKGY8ekxIS3yM
         3l+2/aG3zeAl3k2o81CYd+SjCCLn+lHHKu+PnkWWN1L75pJBKuzGOl4xbjNlbc412fSp
         ldIyjR2unlaE5aFJhUt4uz84aM4g8BAZhQYNsLFYNafn48jXRJUR2q6lxrSCAbGv/TxP
         TLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHWuQwWt7T+E+w2MUlDfeFs3ZzPfhSQIogz8r9AWTPE=;
        b=YbfgrBrjwM6akPVxoUnmdC9SlOgYEWl6n9xAJiDK+iMazUJQ//S+6D90vnHR6tpipN
         VPhKj0l787kd9YDkH03sr1LuKRfHNHnqVIQaKrCMewZGgFfue18PgF0V5AzM5RioY9rg
         WHa7HnRYkao1NW+4ybvuTk3jt6Hh66W2pw192QNp0SDdvacIEIl3RkNwX7aEOvV9+J3d
         UmPY9rH//IGReJj+SAxZGEgSBk0FeRXyU54ChPGXzfKI09gZgiiyaOTr9uXCYI6NQLcx
         /jkW+FA4QAZe94SvRE7qVrd2Q3W6aoE4pC2N17bl4+Y69+6bTWxHfBp2UQprGWsepPcf
         FsZw==
X-Gm-Message-State: AOAM531jNmylRTTtpYtP4PRyuAL6QCXh9J0k+3PC0SGX920tjTmv0fc0
	pOnTrHVznkE4IS4tJzOOFaY9T1c9KGzYADgawho=
X-Google-Smtp-Source: 
 ABdhPJw7DIgQcBR9GHPsvpcjgr6BvmRvYoMQ1bj8dHT6hgVatOGu1nt/tvt6v/JPQG540bR1Yg6nUGCnpO/PksmJshc=
X-Received: by 2002:a05:6122:88a:b0:332:6a9c:902b with SMTP id
 10-20020a056122088a00b003326a9c902bmr21664737vkf.40.1648845561898; Fri, 01
 Apr 2022 13:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220317164434.387779-1-ross.burton@arm.com>
 <20220317164434.387779-2-ross.burton@arm.com>
In-Reply-To: <20220317164434.387779-2-ross.burton@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Apr 2022 22:38:35 +0200
Message-ID: 
 <CA+chaQcSsAXe3o4TCdnUninmB8RPEMOzNe1EvsZ50JCRhT0qjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical
 version for -cryptography-vectors
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000001a97605db9dc63c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163945

--00000000000001a97605db9dc63c
Content-Type: text/plain; charset="UTF-8"

Not sure if this is working correctly, with opkg
and python3-cryptography-ptest included in the image I get:

 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - conflicting requests
 *   - nothing provides python3-cryptography-vectors = 36.0.2 needed by
python3-cryptography-ptest-36.0.2-r0.0.qemux86_64
 *
 * Solution 1:
 *   - do not ask to install a package providing python3-cryptography-ptest

even when I do have
python3-cryptography-vectors_36.0.2-r0.0_qemux86_64.ipk and
python3-cryptography-ptest_36.0.2-r0.0_qemux86_64.ipk

is rpm parsing the version differently or is the issue somewhere else?

I guess forcing identical EXTENDPKGV (instead of PV) between
python3-cryptography and python3-cryptography-vectors would be too much
(especially for people with PRserv enabled).

Cheers,

On Thu, Mar 17, 2022 at 5:44 PM Ross Burton <ross@burtonini.com> wrote:

> python3-cryptography and python3-cryptography-vectors are actually the
> same project but are on Pypi as two separate modules.
>
> The test suite validates that they're the same version and fails if they
> are not:
>
> FAIL: tests/test_utils.py::test_vector_version
>     def test_vector_version():
> >       assert cryptography.__version__ == cryptography_vectors.__version__
> E       AssertionError: assert '36.0.2' == '36.0.1'
>
> Catch this slightly earlier by mandating that python3-cryptography-ptest
> pulls in an identically versioned python3-cryptography-vectors.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-cryptography_36.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> index 940df60d44..cb3acdf7e2 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> @@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target = " \
>
>  RDEPENDS:${PN}-ptest += " \
>      ${PYTHON_PN}-bcrypt \
> -    ${PYTHON_PN}-cryptography-vectors \
> +    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
>      ${PYTHON_PN}-hypothesis \
>      ${PYTHON_PN}-iso8601 \
>      ${PYTHON_PN}-pretend \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163426):
> https://lists.openembedded.org/g/openembedded-core/message/163426
> Mute This Topic: https://lists.openembedded.org/mt/89849717/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000001a97605db9dc63c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure if this is working correctly, with opkg and=C2=A0=
python3-cryptography-ptest included in the image I get:<div><br></div><div>=
=C2=A0* Solver encountered 1 problem(s):<br>=C2=A0* Problem 1/1:<br>=C2=A0*=
 =C2=A0 - conflicting requests<br>=C2=A0* =C2=A0 - nothing provides python3=
-cryptography-vectors =3D 36.0.2 needed by python3-cryptography-ptest-36.0.=
2-r0.0.qemux86_64<br>=C2=A0*<br>=C2=A0* Solution 1:<br>=C2=A0* =C2=A0 - do =
not ask to install a package providing python3-cryptography-ptest<br></div>=
<div><br></div><div>even when I do have python3-cryptography-vectors_36.0.2=
-r0.0_qemux86_64.ipk=C2=A0and python3-cryptography-ptest_36.0.2-r0.0_qemux8=
6_64.ipk<br></div><div><br></div><div>is rpm parsing the version differentl=
y or is the issue somewhere else?<br></div><div><br></div><div>I guess forc=
ing identical EXTENDPKGV (instead of PV) between python3-cryptography and p=
ython3-cryptography-vectors would be too much (especially for people with P=
Rserv enabled).<br></div><div><br></div><div>Cheers,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 17, 2=
022 at 5:44 PM Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@b=
urtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">python3-cryptography and python3-cryptography-vectors are actua=
lly the<br>
same project but are on Pypi as two separate modules.<br>
<br>
The test suite validates that they&#39;re the same version and fails if the=
y<br>
are not:<br>
<br>
FAIL: tests/test_utils.py::test_vector_version<br>
=C2=A0 =C2=A0 def test_vector_version():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert cryptography.__version__ =3D=3D crypt=
ography_vectors.__version__<br>
E=C2=A0 =C2=A0 =C2=A0 =C2=A0AssertionError: assert &#39;36.0.2&#39; =3D=3D =
&#39;36.0.1&#39;<br>
<br>
Catch this slightly earlier by mandating that python3-cryptography-ptest<br=
>
pulls in an identically versioned python3-cryptography-vectors.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
36.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_36.0.2.bb</a><br>
index 940df60d44..cb3acdf7e2 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
@@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-bcrypt \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors (=3D ${PV}) \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-hypothesis \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-iso8601 \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pretend \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163426): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163426" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163426</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89849717/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89849717/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000001a97605db9dc63c--

