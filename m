Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB88C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 21:37:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.4487.1659994669301980528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 14:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EmrEvHzI;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso820584wmb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SwsVCVV+vM/RGyJH2vuOBlvrtYxmG7O+iqMauyLjwIQ=;
        b=EmrEvHzIuNcbwMHXy7ZLZ9odMZwIwxNXvqVrr45Z+rMApA1rHtzBX8p33Q8Z9VF6yL
         HWDEVQp5oUEDEqQ3DX3EG/2bTPi8AXq1ZzJ6EgD76wxXu3E4T7yqaA0paGxJsOJ1Xo+P
         xHHKhX0Tm76nUqz/9ytaQeAb2wayM/DC39fXgktSo9T4ujd647c6rpSmRSdI36TdZfkk
         AJFYkqluqQFzsWVQC6STIK55vSOdDjOJJ2ZC7MVw0fPE2D5ZEvgm9uXZJSqVtT0jU9XO
         ZHgGf7mZi8B+d+pekEJLNozMyhkDkU/UikLlCnT9WrH5eN8pJYgwulHClXBBHGgsuYcq
         zNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SwsVCVV+vM/RGyJH2vuOBlvrtYxmG7O+iqMauyLjwIQ=;
        b=PtNmOXLEQqaUBaMN0alHoIEic1nruwfb612n5SjmmRQk8jcgPkeM/j1yxRhvAblMkZ
         kQxsKdFLxXyOgEcb8//LSOY7aivIpC+QXJtSwgpwJwrKsSldrrLua384Zxxhb1HvvX6j
         oZ3polE1ifh6BfssoAoF9OcvR9np/11qOCp3Wwuw0R0i+IvMNIdvnYPNcKTsXXHpkFr5
         9JiNBBdrAYSZ3N0uzXdNiDvSPYYFDmyvFz0DU6cRTpokKehSdiUnbC2onvanI/zvfH5r
         KsHvNLuQlkGCLggJXLTiNhafan7GBOh3talLUmCQm9Y5csXvrwyyneOVuNVMWsnKUPkB
         qpSA==
X-Gm-Message-State: ACgBeo0p1+OM7oOTOiFLKuyDcRPKXHTwUcFhbZ7RyPFrDI/ZZkgttF8A
	XOKWRLRhzG1UhlSJlv0Xngzu6iH/n7Yezi1Lv0s=
X-Google-Smtp-Source: 
 AA6agR4W8/IsDjEFVRlIre8RzypFOfI3Hv0n97DzlYJ9owVzN06cVc0CHVCRR7suZ18qZKu4iH90EKLLMU92qWv4Ak0=
X-Received: by 2002:a7b:cc0d:0:b0:3a5:1eae:3948 with SMTP id
 f13-20020a7bcc0d000000b003a51eae3948mr11144223wmh.32.1659994667631; Mon, 08
 Aug 2022 14:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <17097BD4A7B99188.24862@lists.openembedded.org>
In-Reply-To: <17097BD4A7B99188.24862@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Aug 2022 23:37:01 +0200
Message-ID: 
 <CA+chaQdQDsV-rSL8F3L4JyKn0QKhaz-0N-4ti7GixhZX1OxDGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] libxml2: Port gentest.py to Python-3
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="0000000000007e4bbf05e5c1a0ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 21:37:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169118

--0000000000007e4bbf05e5c1a0ce
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 11:28 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * but it still won't work well on hosts without libxml2, make
>   sure to use pre-generated testapi.c in do_compile_ptest
>
> * this is reproducible with SOURCE_DATE_EPOCH set to 0 which
>   e.g. meta-updater still sets by default for DISTROs which
>   use it :(, see https://github.com/uptane/meta-updater/pull/35


Still not sure why I've started to see this just today, maybe just
unfortunate filesystem ordering?

Might be similar to the issue shown in bc recently:
https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=400ed3bc77232b9d67594fa012b1278a6c8be3c6

but in this case we need to prevent the rebuild (as I don't see how python2
gettest.py could have worked in dunfell builds before)

Without meta-updater setting SOURCE_DATE_EPOCH to 0 and with libxml2/2.9.14
used in kirkstone I see usable timestamps:
-rw-r--r-- 3 bitbake bitbake 1448791 May  2 11:42
libxml2/2.9.14-r0/libxml2-2.9.14/testapi.c

-rwxr-xr-x 1 bitbake bitbake 30753 May  2 10:52
libxml2/2.9.14-r0/libxml2-2.9.14/gentest.py*
so this isn't needed in kirkstone.


> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> index b3ebf15751..d1c1f0884f 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> ...
>  do_compile_ptest() {
> +        # Make sure that testapi.c is newer than gentests.py, because
> +        # with reproducible builds, they will both get e.g. Jan  1  1970
> +        # modification time from SOURCE_DATE_EPOCH and then check-am
> +        # might try to rebuild_testapi, which will fail even with
> +        # 0001-Port-gentest.py-to-Python-3.patch, because it needs
> +        # libxml2 module (libxml2-native dependency and correctly
> +        # set PYTHON_SITE_PACKAGES), it's easier to
> +        # just rely on pre-generated testapi.c from the release
> +        touch ${S}/testapi.c
> +
>         oe_runmake check-am
>  }
>

--0000000000007e4bbf05e5c1a0ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 8, 2022 at 11:28 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">* but it still won=
&#39;t work well on hosts without libxml2, make<br>
=C2=A0 sure to use pre-generated testapi.c in do_compile_ptest<br>
<br>
* this is reproducible with SOURCE_DATE_EPOCH set to 0 which<br>
=C2=A0 e.g. meta-updater still sets by default for DISTROs which<br>
=C2=A0 use it :(, see <a href=3D"https://github.com/uptane/meta-updater/pul=
l/35" rel=3D"noreferrer" target=3D"_blank">https://github.com/uptane/meta-u=
pdater/pull/35</a></blockquote><div><br></div><div>Still not sure why I&#39=
;ve started to see this just today, maybe just unfortunate filesystem order=
ing?</div><div><br></div><div>Might be similar to the issue shown in bc rec=
ently:</div><div><a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?h=3Dkirkstone&amp;id=3D400ed3bc77232b9d67594fa012b1278a6c8be3c6">ht=
tps://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;id=
=3D400ed3bc77232b9d67594fa012b1278a6c8be3c6</a></div><div><br></div><div>bu=
t in this case we need to prevent the rebuild (as I don&#39;t see how pytho=
n2 gettest.py could have worked in dunfell builds before)</div><div><br></d=
iv><div>Without meta-updater setting SOURCE_DATE_EPOCH to 0 and with libxml=
2/2.9.14 used in kirkstone I see usable timestamps:</div><div>-rw-r--r-- 3 =
bitbake bitbake 1448791 May =C2=A02 11:42 libxml2/2.9.14-r0/libxml2-2.9.14/=
testapi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br></div><div>-rwxr-xr-x 1 =
bitbake bitbake 30753 May =C2=A02 10:52 libxml2/2.9.14-r0/libxml2-2.9.14/ge=
ntest.py*<br></div><div>so this isn&#39;t needed in kirkstone.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">diff --git a/=
meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">libxml2_2.9.10.bb</a> b/meta/recipes-core/libxml/<a=
 href=3D"http://libxml2_2.9.10.bb" rel=3D"noreferrer" target=3D"_blank">lib=
xml2_2.9.10.bb</a><br>
index b3ebf15751..d1c1f0884f 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.10.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.9.10.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.10.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.9.10.bb</a><br>...<br>
=C2=A0do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make sure that testapi.c is newer than gente=
sts.py, because<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with reproducible builds, they will both get=
 e.g. Jan=C2=A0 1=C2=A0 1970<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # modification time from SOURCE_DATE_EPOCH and=
 then check-am<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # might try to rebuild_testapi, which will fai=
l even with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 0001-Port-gentest.py-to-Python-3.patch, beca=
use it needs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # libxml2 module (libxml2-native dependency an=
d correctly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # set PYTHON_SITE_PACKAGES), it&#39;s easier t=
o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just rely on pre-generated testapi.c from th=
e release<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${S}/testapi.c<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake check-am<br>
=C2=A0}<br>
</blockquote></div></div>

--0000000000007e4bbf05e5c1a0ce--

