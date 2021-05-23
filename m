Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.7481.1621751963631622799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 23:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WfUL9UAv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id o5so19173114edc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XQWX07DGWBp+qAY14frGEwJRc43zOzdehFRa1u7GmM=;
        b=WfUL9UAvANViKW3VP62krsBvh58qgrc5HSRFfo0s92ZBQXTID0prXL+LEwSAe0yB72
         25yG95UpjIuFHEfT/8ews4E3hnLsXlhYl5eTm4tKBUhmy+AHHqhy2/itQsaaPSPdfjbY
         rH6fQpqW6Yxi5/y7DVcUFSZcy+qyHYM+mcwq05/mdMftiFT4/JDGUSK3dBtzrh9e+oM1
         Bx1WDl+hcm5CmaVCwG7MqHNt0YK6qIec3WSlHh6IOOQiOvLfjiPl3auojeonW0gqa2cY
         CfDh0ZRdiuucQGaDoXy03C73l+/yO8T/cjcfoJb1SkLU/XVAMXwqXoLu2Qb9LqQ1JHld
         oHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XQWX07DGWBp+qAY14frGEwJRc43zOzdehFRa1u7GmM=;
        b=AfRzXfXp32OeLfEMm/Uqr0SJrBcRBPAaW1mxtsqvNyP9/uLcraaqGE48LMRqZKx78j
         ctFFaLNBkOlr1j6WycgR9TqdpvTEECFFLW4NYlBDdP/8nyyjNCa77IXkRBzKjbxJcv2l
         vyFccGLw2FdWX18yoVQIXxCs5ZXqjpzJuNA0M42XBrwLIwPcsga17bqJKDqk63QArUgQ
         Vg9dhutT0uB7Nv/hMmwWJGXa39Z8yQlKFP5UMobjtyJuobKXeJcgIAq8ClDd/5cgDmo3
         CAE4f1hSCSKzbXykA2yXH3b2MFbn4dnaZfRlTzKifIDAqJAsKVRGW8W37l0eYNdr13Us
         rVOA==
X-Gm-Message-State: AOAM531YUl3DbUl3BlGihEXOKG8FLAbv+UQzhtathxfvU5s5ChXPzR7w
	XdbUGtM0ODM7oBTJcVjyc5mfiE6ks2ngzGL0CZk=
X-Google-Smtp-Source: ABdhPJyemVz/J+rAqQ8iuo7GT6dSOF22g76mG2cL7BzI5b7/y7Fr4V9Ggw8ero/9bO4zSNalsqyX8t42meMQad0XmZQ=
X-Received: by 2002:aa7:d74a:: with SMTP id a10mr18946708eds.311.1621751961873;
 Sat, 22 May 2021 23:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210430065946.1475-1-qiang.zhang@windriver.com>
In-Reply-To: <20210430065946.1475-1-qiang.zhang@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 23 May 2021 08:39:10 +0200
Message-ID: <CA+chaQdUUJUWO3KR53KMhS+Z0awz3pdeGNFaOcK+VTaBQ487pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rt-tests: Update rt-tests
To: "Zhang, Qiang" <qiang.zhang@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000099f1d305c2f98dfe"

--00000000000099f1d305c2f98dfe
Content-Type: text/plain; charset="UTF-8"

Hi,

this SRCREV no longer exists in rt-tests repo:
rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable to find revision
6af88067da16c6e69243b376c3b6454ec694460b in branch unstable/devel/latest
even from upstream

rt-tests$ git branch -a --contains 6af88067da16c6e69243b376c3b6454ec694460b
error: no such commit 6af88067da16c6e69243b376c3b6454ec694460b

the old v1.10 SRCREV still exists in defined branch:
rt-tests$ git branch -a --contains 32819581cc0509c9d58c33c3061f57abe0c40c88
  remotes/origin/unstable/devel/latest
  remotes/origin/unstable/devel/no-numa-runtime

rt-tests$ git show-ref -d v1.10
d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10
32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}

Can you please fix PV to indicate that it doesn't match with 1.10 version
anymore and update the SRCREV to something which exists now?

Regards,

On Fri, Apr 30, 2021 at 8:59 AM Zhang, Qiang <qiang.zhang@windriver.com>
wrote:

> From: Zqiang <qiang.zhang@windriver.com>
>
> When run cyclictest, the parameter enable NUMA. but in some BSP
> which not support NUMA, will causes the test program to exit
> directly and does not carry out subsequent operations, the
> latest changes have fixed this problem. so update to the
> latest branch to resolve.
>
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
> b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 9358f13d06..0c89bad91f 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
>  # Version 1.8
> -SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
> +SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
>  PE = "1"
>
>  SRC_URI = "git://
> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
> "
> --
> 2.17.1
>
>
> 
>
>

--00000000000099f1d305c2f98dfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>this SRCREV no longer exists in rt-=
tests repo:</div><div>rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable =
to find revision 6af88067da16c6e69243b376c3b6454ec694460b in branch unstabl=
e/devel/latest even from upstream<br></div><div><br></div><div>rt-tests$ gi=
t branch -a --contains 6af88067da16c6e69243b376c3b6454ec694460b<br>error: n=
o such commit 6af88067da16c6e69243b376c3b6454ec694460b<br></div><div><br></=
div><div>the old v1.10 SRCREV still exists in defined branch:</div><div>rt-=
tests$ git branch -a --contains 32819581cc0509c9d58c33c3061f57abe0c40c88<br=
>=C2=A0 remotes/origin/unstable/devel/latest<br>=C2=A0 remotes/origin/unsta=
ble/devel/no-numa-runtime<br></div><div><br></div><div>rt-tests$ git show-r=
ef -d v1.10<br>d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10<br>=
32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}<br></div><div><=
br></div><div>Can you please fix PV to indicate that it doesn&#39;t match w=
ith 1.10 version anymore and update the SRCREV to something which exists no=
w?</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 8:59 AM Z=
hang, Qiang &lt;<a href=3D"mailto:qiang.zhang@windriver.com">qiang.zhang@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Zqiang &lt;<a href=3D"mailto:qiang.zhang@windriver.com" t=
arget=3D"_blank">qiang.zhang@windriver.com</a>&gt;<br>
<br>
When run cyclictest, the parameter enable NUMA. but in some BSP<br>
which not support NUMA, will causes the test program to exit<br>
directly and does not carry out subsequent operations, the<br>
latest changes have fixed this problem. so update to the<br>
latest branch to resolve.<br>
<br>
Signed-off-by: Zqiang &lt;<a href=3D"mailto:qiang.zhang@windriver.com" tar=
get=3D"_blank">qiang.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-te=
sts/rt-tests.inc<br>
index 9358f13d06..0c89bad91f 100644<br>
--- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Version 1.8<br>
-SRCREV =3D &quot;32819581cc0509c9d58c33c3061f57abe0c40c88&quot;<br>
+SRCREV =3D &quot;6af88067da16c6e69243b376c3b6454ec694460b&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/uti=
ls/rt-tests/rt-tests.git;branch=3Dunstable/devel/latest" rel=3D"noreferrer"=
 target=3D"_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branc=
h=3Dunstable/devel/latest</a>&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000099f1d305c2f98dfe--
