Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A821C77B74
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:59:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.14489.1681221563915272983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=g65+BmK+;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id gw13so4602130wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681221562; x=1683813562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU1jwzGWaWX5XEXTjX2HLmjsvkoGVimVeOCoEcHLlao=;
        b=g65+BmK+vBP3ssF1YtU4RL0qKigmPCwfZdX37YanNdjCt4z1V07RVEvhDuz01xaqVJ
         eROJ8ZCxYj4zuF0t7ZOvjCzCYfs13Jd3xk+mFhlBu+e/vmSdniJjjET5jfq5yi2VG5xP
         K/0vZguZCU+lIR76Z2TeLNi4H0Bqn/XuywrgHtoU4W9U1IxGavfWJplNMz6+pLxHqJ2F
         IAfWKg4xcl6ueFwup/8IoV8HPONMRjb4n8Mha0CywrJY/4hw3rUPv+AhbOa8GTXGctcH
         FhjgkgcQjI6DxthWPhxMB2xi4CJ3hLOlqh0UL898AGNq5/E/asga9uFi/eXwmlWNSulE
         deVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681221562; x=1683813562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZU1jwzGWaWX5XEXTjX2HLmjsvkoGVimVeOCoEcHLlao=;
        b=mAv0jN8wpC6IX4YgwkaT/Y5h25EReUgVFfq+krxqhIxUfmQY+n2dOMHySMgispptLj
         +kDVktExKjC0FWUIT2TSbp81d0Ymugniw7bXOk3jhPuNKNL0NYNzDlW6rBGkBpw6biZv
         wMuGl1YR6lf0Iu/Lpf7PMssdYWv+ohNVrY5r6HRhO2P/lFubs2pWxxStD2TEzOAVVnv5
         nZ5mGotQ7YO4dLfFjugiIQSKrN8tOR/P90uy4lW8AIbhUwtm/5f6yUazwzteQroWzFvZ
         dWeE+8sQRfCUDdIW1IH3t2cfbagUtxnHsEV3mxkJp0QEsQ2yHegdkZZaWrMa/eHbfvhQ
         cbbg==
X-Gm-Message-State: AAQBX9dwu3SYSSryf4NyFey8scS5vtFrKW9UuLzhGykxFMFcisraSTkn
	Xu5JJA9Xmq4FFDyPvo1IGa5UYzRj3TIfDn9fJ4k=
X-Google-Smtp-Source: AKy350Y6TGkquC6xU2WxcJY4FnPT6GMfyaFzFW3riZ7/G0I9PZ2fYPJrpQiIpSLHB+1hlszXwK3mjaP3c48lWZvSZnA=
X-Received: by 2002:a1c:f20b:0:b0:3df:97b0:ba02 with SMTP id
 s11-20020a1cf20b000000b003df97b0ba02mr2889078wmc.3.1681221562182; Tue, 11 Apr
 2023 06:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
 <20230411090348.2434686-3-Martin.Jansa@gmail.com> <20230411142819.0f58a868@booty>
In-Reply-To: <20230411142819.0f58a868@booty>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Apr 2023 15:59:03 +0200
Message-ID: <CA+chaQfT+zoPR-H50sAqRF6AOpMpLwqgOY1e6att98ZQxG_r2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] oeqa: print stderr in the AssertionError as well
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000ae7205f90fe6f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 13:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179919

--00000000000000ae7205f90fe6f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Luca,

I'm sorry, I've updated the runcmd.RunCmdTests.test_result_assertion test
case to pass with this change just to realize that:
"stderr": subprocess.STDOUT
in self.defaultopts does work and even the stderr output is ending in
stdout, so this change isn't very useful (as I don't see any runcmd users
passing different options than defaultopts).

Please drop 3/3 other 2 changes are independent on it.

I have one more change in this area which is the real fix for esdk tests
with uninative disabled, but that has some weird side-effect which is
triggering:

NOTE: Running task 3807 of 3809
(/OE/build/poky/meta/recipes-core/images/core-image-minimal.bb:
do_populate_lic_deploy)
ERROR: When reparsing
/OE/build/poky/meta/recipes-core/images/core-image-minimal.bb:do_populate_s=
dk_ext,
the basehash value changed from
8249821d6529e111a2f7f1101632fe140639df54a700e2c604a99ea150541a6d to
86086c51c409799a0d4d2a4fcac9e7e245cb36d86f236dcf7093e428a7c37ac9. The
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake core-image-minimal -cdo_populate_sdk_ext -Snone
ERROR: Then:
ERROR: $ bitbake core-image-minimal -cdo_populate_sdk_ext -Sprintdiff

which I haven't resolved yet, so it might be a while before I send this 4th
change.

Regards,

On Tue, Apr 11, 2023 at 2:28=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> Hello Martin,
>
> On Tue, 11 Apr 2023 11:03:48 +0200
> "Martin Jansa" <Martin.Jansa@gmail.com> wrote:
>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/lib/oeqa/utils/commands.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/utils/commands.py
> b/meta/lib/oeqa/utils/commands.py
> > index c1f533802e..7b2f6ec124 100644
> > --- a/meta/lib/oeqa/utils/commands.py
> > +++ b/meta/lib/oeqa/utils/commands.py
> > @@ -209,7 +209,7 @@ def runCmd(command, ignore_status=3DFalse,
> timeout=3DNone, assert_error=3DTrue, sync=3DT
> >                  exc_output =3D "\n... (last %d lines of output)\n" %
> limit_exc_output + \
> >                               '\n'.join(split[-limit_exc_output:])
> >          if assert_error:
> > -            raise AssertionError("Command '%s' returned non-zero exit
> status %d:\n%s" % (command, result.status, exc_output))
> > +            raise AssertionError("Command '%s' returned non-zero exit
> status %d:\nstderr: %s\nstdout:\n%s" % (command, result.status,
> result.error, exc_output))
>
> Testing with this series produces errors on the selftest builds:
>
> ---------------------------------8<---------------------------------
>
> AssertionError: Command 'echo foobar >&2; false' returned non-zero exit
> status 1:
> stderr:
> stdout:
> foobar
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/self=
test/cases/runcmd.py",
> line 61, in test_result_assertion
>     self.assertRaisesRegexp(AssertionError, "Command 'echo .* false'
> returned non-zero exit status 1:\nfoobar",
>   File "/usr/lib/python3.9/unittest/case.py", line 1329, in deprecated_fu=
nc
>     return original_func(*args, **kwargs)
>   File "/usr/lib/python3.9/unittest/case.py", line 1276, in
> assertRaisesRegex
>     return context.handle('assertRaisesRegex', args, kwargs)
>   File "/usr/lib/python3.9/unittest/case.py", line 201, in handle
>     callable_obj(*args, **kwargs)
>   File "/usr/lib/python3.9/unittest/case.py", line 239, in __exit__
>     self._raiseFailure('"{}" does not match "{}"'.format(
>   File "/usr/lib/python3.9/unittest/case.py", line 163, in _raiseFailure
>     raise self.test_case.failureException(msg)
> AssertionError: "Command 'echo .* false' returned non-zero exit status 1:
> foobar" does not match "Command 'echo foobar >&2; false' returned non-zer=
o
> exit status 1:
> stderr:
> stdout:
> foobar"
>
> ---------------------------------8<---------------------------------
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5002/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5044/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5053/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5083/st=
eps/15/logs/stdio
>
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000000ae7205f90fe6f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Luca,<div><br></div><div>I&#39;m sorry, I&#39;ve upd=
ated the=C2=A0runcmd.RunCmdTests.test_result_assertion test case to pass wi=
th this change just to realize that:</div><div>&quot;stderr&quot;: subproce=
ss.STDOUT<br></div><div>in=C2=A0self.defaultopts does work and even the std=
err output is ending in stdout, so this change isn&#39;t very useful (as I =
don&#39;t see any runcmd users passing different options than defaultopts).=
</div><div><br></div><div>Please drop 3/3 other 2 changes are independent o=
n it.</div><div><br></div><div>I have one more change in this area which is=
 the real fix for esdk tests with uninative disabled, but that has some wei=
rd side-effect which is triggering:</div><div><br></div><div>NOTE: Running =
task 3807 of 3809 (/OE/build/poky/meta/recipes-core/images/core-image-minim=
al.bb:do_populate_lic_deploy)<br>ERROR: When reparsing /OE/build/poky/meta/=
recipes-core/images/core-image-minimal.bb:do_populate_sdk_ext, the basehash=
 value changed from 8249821d6529e111a2f7f1101632fe140639df54a700e2c604a99ea=
150541a6d to 86086c51c409799a0d4d2a4fcac9e7e245cb36d86f236dcf7093e428a7c37a=
c9. The metadata is not deterministic and this needs to be fixed.<br>ERROR:=
 The following commands may help:<br>ERROR: $ bitbake core-image-minimal -c=
do_populate_sdk_ext -Snone<br>ERROR: Then: <br>ERROR: $ bitbake core-image-=
minimal -cdo_populate_sdk_ext -Sprintdiff<br></div><div><br></div><div>whic=
h I haven&#39;t resolved yet, so it might be a while before I send this 4th=
 change.</div><div><br></div><div>Regards,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 11, 2023 at 2:2=
8=E2=80=AFPM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com"=
>luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hello Martin,<br>
<br>
On Tue, 11 Apr 2023 11:03:48 +0200<br>
&quot;Martin Jansa&quot; &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/utils/commands.py | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/com=
mands.py<br>
&gt; index c1f533802e..7b2f6ec124 100644<br>
&gt; --- a/meta/lib/oeqa/utils/commands.py<br>
&gt; +++ b/meta/lib/oeqa/utils/commands.py<br>
&gt; @@ -209,7 +209,7 @@ def runCmd(command, ignore_status=3DFalse, timeout=
=3DNone, assert_error=3DTrue, sync=3DT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc_outp=
ut =3D &quot;\n... (last %d lines of output)\n&quot; % limit_exc_output + \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;.join(split[-limit_exc=
_output:])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if assert_error:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(&quot;=
Command &#39;%s&#39; returned non-zero exit status %d:\n%s&quot; % (command=
, result.status, exc_output))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(&quot;=
Command &#39;%s&#39; returned non-zero exit status %d:\nstderr: %s\nstdout:=
\n%s&quot; % (command, result.status, result.error, exc_output))<br>
<br>
Testing with this series produces errors on the selftest builds:<br>
<br>
---------------------------------8&lt;---------------------------------<br>
<br>
AssertionError: Command &#39;echo foobar &gt;&amp;2; false&#39; returned no=
n-zero exit status 1:<br>
stderr: <br>
stdout:<br>
foobar<br>
<br>
During handling of the above exception, another exception occurred:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-debian/build/met=
a/lib/oeqa/selftest/cases/runcmd.py&quot;, line 61, in test_result_assertio=
n<br>
=C2=A0 =C2=A0 self.assertRaisesRegexp(AssertionError, &quot;Command &#39;ec=
ho .* false&#39; returned non-zero exit status 1:\nfoobar&quot;,<br>
=C2=A0 File &quot;/usr/lib/python3.9/unittest/case.py&quot;, line 1329, in =
deprecated_func<br>
=C2=A0 =C2=A0 return original_func(*args, **kwargs)<br>
=C2=A0 File &quot;/usr/lib/python3.9/unittest/case.py&quot;, line 1276, in =
assertRaisesRegex<br>
=C2=A0 =C2=A0 return context.handle(&#39;assertRaisesRegex&#39;, args, kwar=
gs)<br>
=C2=A0 File &quot;/usr/lib/python3.9/unittest/case.py&quot;, line 201, in h=
andle<br>
=C2=A0 =C2=A0 callable_obj(*args, **kwargs)<br>
=C2=A0 File &quot;/usr/lib/python3.9/unittest/case.py&quot;, line 239, in _=
_exit__<br>
=C2=A0 =C2=A0 self._raiseFailure(&#39;&quot;{}&quot; does not match &quot;{=
}&quot;&#39;.format(<br>
=C2=A0 File &quot;/usr/lib/python3.9/unittest/case.py&quot;, line 163, in _=
raiseFailure<br>
=C2=A0 =C2=A0 raise self.test_case.failureException(msg)<br>
AssertionError: &quot;Command &#39;echo .* false&#39; returned non-zero exi=
t status 1:<br>
foobar&quot; does not match &quot;Command &#39;echo foobar &gt;&amp;2; fals=
e&#39; returned non-zero exit status 1:<br>
stderr: <br>
stdout:<br>
foobar&quot;<br>
<br>
---------------------------------8&lt;---------------------------------<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/5002/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5002/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/5044/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5044/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/5053/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5053/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/5083/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5083/steps/15/logs/=
stdio</a><br>
<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000000ae7205f90fe6f7--

