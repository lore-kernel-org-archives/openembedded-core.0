Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20280C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 15:56:42 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web09.94099.1638374201152775815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 07:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hzEblAx4;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id s17so16466042vka.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 07:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgSJOVl8wTW/xRqoRcvFrzx9ntkmtTlttb3dZPQTRfg=;
        b=hzEblAx40SP10FZCeMCHJ7z+obRcNJghaoI41niKSXQpafIaeOLepams9GYGzZFSHt
         yH5pIxkvNhCW9gL/1Z3qPQBL7JXiH8BNwR1TOFhWS/lIwZEOWb4Gil7b2CyWyCLZ0eHb
         gDJIeqlYGEYs8d8jtFBOleia5UcxzDKMFTjRT7dwCeAjecGizMxnT8ldNiV+TuUIm0ne
         xSxhOXy7D4tOzcwyCSC6Q4jdB6dlf1TrPD7Wd5svrXJdEsnu/vRqBMMR+jB0XtWT3Dmr
         xwfxgF5+G4ypYh8z+eOURwizd7rVsjJ/d/cyt3cJuRt+DuUOltnbargFIBaszWEuRc5A
         ZDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgSJOVl8wTW/xRqoRcvFrzx9ntkmtTlttb3dZPQTRfg=;
        b=VBH3zpofsu4WJIFG6zJW2e+038BAcRebKWpKltz9nimi5sapIiWUAG/AwxjX8Cmr9g
         27Mz6OuiD/SojvM4rBPNwLNUGvVGs+b2aiEJ2O5lD6rsyYp03oS6eXpqX5WjfQgQ+3vZ
         cUsa633/pvkudh9IpipO5LpdQP/s/1X49xufiVGmpfMqHZK8VhxfnhR7sM0Tm4TCw1MQ
         5zvCAX46VuD8yXXiuLwaMq9Iy8PPK+r+313/6s2zg0yOKb4SALEtLqDSyTyO/HHm7jAb
         3FrOBTaishN588F+zUL8Nf1n7idk76Kt/yDSLKsQQA2QwKXR0DRCWmUpI7XkDAY5W4ZT
         NcZw==
X-Gm-Message-State: AOAM532pV3mOisC3DxW8O21JKeqiCTYfxSo/Ck04ST+JJGjvm9Po8H2q
	UZiwihhCp1JVzUFiBeGQ63RNEFfX9OpZGbb+a7s=
X-Google-Smtp-Source: 
 ABdhPJyFZtWtp1z/gZG3cH/rFcMS8ZzjaUSsEDtR8F8j0cq0QYpPW0JUQTcA8yYYzElJkfvVnIDSouX4sekrHmWM9ls=
X-Received: by 2002:a05:6122:114c:: with SMTP id
 p12mr8316029vko.21.1638374200378;
 Wed, 01 Dec 2021 07:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20211201141543.32206-1-pavel@zhukoff.net>
In-Reply-To: <20211201141543.32206-1-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 16:56:29 +0100
Message-ID: 
 <CANNYZj_dYZ5i+rT-VnKMh-VOd3UizYDQTag7PNOJvWc3CgxO+g@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] patch.py: Initialize git repo
 before patching
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000039068c05d217b88b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 15:56:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159038

--00000000000039068c05d217b88b
Content-Type: text/plain; charset="UTF-8"

Does the test fail without the change in lib/oepatch.py? Can you show how?

Alex

On Wed, 1 Dec 2021 at 15:17, Pavel Zhukov <pavel@zhukoff.net> wrote:

> From: Pavel Zhukov <pavel.zhukov@huawei.com>
>
> If PATCHTOOL="git" has been specified but workdir is not git repo
> bitbake fails to apply the patches. Fix this by initializing the repo
> before patching.
> This allows binary git patches to be applied.
>
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  meta/lib/oe/patch.py                    | 17 +++++++++++++++++
>  meta/lib/oeqa/selftest/cases/bbtests.py |  6 ++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 7cd8436da5..720c6f663c 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -52,6 +52,10 @@ def runcmd(args, dir = None):
>          if dir:
>              os.chdir(olddir)
>
> +def getstatusoutput(cmd):
> +    import subprocess
> +    return subprocess.getstatusoutput(cmd.split())
> +
>  class PatchError(Exception):
>      def __init__(self, msg):
>          self.msg = msg
> @@ -294,6 +298,19 @@ class GitApplyTree(PatchTree):
>          PatchTree.__init__(self, dir, d)
>          self.commituser = d.getVar('PATCH_GIT_USER_NAME')
>          self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
> +        if not self._isInitialized():
> +            self._initRepo()
> +
> +    def _isInitialized(self):
> +        cmd = "git rev-parse --show-toplevel"
> +        (status, output) = getstatusoutput(cmd)
> +        ## Make sure we're in builddir to not break top-level git repos
> +        return status == 0 and os.path.samedir(output, self.dir)
> +
> +    def _initRepo(self):
> +        runcmd("git init".split(), self.dir)
> +        runcmd("git add .".split(), self.dir)
> +        runcmd("git commit -a --allow-empty -m Patching_started".split(),
> self.dir)
>
>      @staticmethod
>      def extractPatchHeader(patchfile):
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py
> b/meta/lib/oeqa/selftest/cases/bbtests.py
> index d4f6a08991..8c046074f6 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -294,3 +294,9 @@ INHERIT_remove = \"report-error\"
>
>          test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
>          self.assertEqual(expected_recipe_summary,
> test_recipe_summary_after)
> +
> +    def test_git_patchtool(self):
> +        self.write_recipeinc('man-db', 'PATCHTOOL=\"git\"')
> +        result = bitbake('man-db -c patch', ignore_status=False)
> +        self.delete_recipeinc('man-db')
> +        bitbake('-cclean man-db')
> --
> 2.34.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159031):
> https://lists.openembedded.org/g/openembedded-core/message/159031
> Mute This Topic: https://lists.openembedded.org/mt/87428914/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000039068c05d217b88b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Does the test fail without the change in lib/oepatch.=
py? Can you show how?<br></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 =
Dec 2021 at 15:17, Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net">pa=
vel@zhukoff.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei=
.com" target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
<br>
If PATCHTOOL=3D&quot;git&quot; has been specified but workdir is not git re=
po<br>
bitbake fails to apply the patches. Fix this by initializing the repo<br>
before patching.<br>
This allows binary git patches to be applied.<br>
<br>
Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei.com" =
target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/patch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/bbtests.py |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 23 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
index 7cd8436da5..720c6f663c 100644<br>
--- a/meta/lib/oe/patch.py<br>
+++ b/meta/lib/oe/patch.py<br>
@@ -52,6 +52,10 @@ def runcmd(args, dir =3D None):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chdir(olddir)<br>
<br>
+def getstatusoutput(cmd):<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 return subprocess.getstatusoutput(cmd.split())<br>
+<br>
=C2=A0class PatchError(Exception):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, msg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.msg =3D msg<br>
@@ -294,6 +298,19 @@ class GitApplyTree(PatchTree):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PatchTree.__init__(self, dir, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.commituser =3D d.getVar(&#39;PATCH_G=
IT_USER_NAME&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.commitemail =3D d.getVar(&#39;PATCH_=
GIT_USER_EMAIL&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._isInitialized():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._initRepo()<br>
+<br>
+=C2=A0 =C2=A0 def _isInitialized(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;git rev-parse --show-toplevel&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D getstatusoutput(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ## Make sure we&#39;re in builddir to not brea=
k top-level git repos<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return status =3D=3D 0 and os.path.samedir(out=
put, self.dir)<br>
+<br>
+=C2=A0 =C2=A0 def _initRepo(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git init&quot;.split(), self.dir)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git add .&quot;.split(), self.dir=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git commit -a --allow-empty -m Pa=
tching_started&quot;.split(), self.dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@staticmethod<br>
=C2=A0 =C2=A0 =C2=A0def extractPatchHeader(patchfile):<br>
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selfte=
st/cases/bbtests.py<br>
index d4f6a08991..8c046074f6 100644<br>
--- a/meta/lib/oeqa/selftest/cases/bbtests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py<br>
@@ -294,3 +294,9 @@ INHERIT_remove =3D \&quot;report-error\&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_recipe_summary_after =3D get_bb_var(=
&#39;SUMMARY&#39;, test_recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(expected_recipe_summary,=
 test_recipe_summary_after)<br>
+<br>
+=C2=A0 =C2=A0 def test_git_patchtool(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(&#39;man-db&#39;, &#39;PA=
TCHTOOL=3D\&quot;git\&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D bitbake(&#39;man-db -c patch&#39;, =
ignore_status=3DFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.delete_recipeinc(&#39;man-db&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-cclean man-db&#39;)<br>
-- <br>
2.34.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159031): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159031" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159031</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87428914/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87428914/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000039068c05d217b88b--

