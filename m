Return-Path: <yozhao@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0E0C4727C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.16111.1650503793460493795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 18:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=cSGbPIKT;
 spf=pass (domain: google.com, ip: 209.85.208.42, mailfrom: yozhao@google.com)
Received: by mail-ed1-f42.google.com with SMTP id v15so4495200edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIWwti5ZToPEvlJ9HqbDVer0fJJk8fc5ls5LCEfctQk=;
        b=cSGbPIKTAjj/ljaw50WT8A3vheqIqiFA01J8v0cDnAfLLCAFC6IbyCvpmvTj1NNT4t
         12W0uL87nbNrtBc0+5GM2+Yv7Dn9Iehy8/zCyjjNQHOSD1cK4awsL5sVUQ+tdcvKpsP/
         2lv8/YflllEQqYKrQHYYoq12dYyJpl/BwYFpj8c8ELbt9I5gTtyDlDi/nOmE5riorBuL
         YR45S0NkEbWrnx+EVKcs3lNWHstSHe8Dl7tI9jliNBY6F3ZtFJRKUcnxQeiHwJHxZmVH
         WEo0IkD1AHXFKGDf743YrPJ3IlJLD7D96Ys4YEsC0AiUJM+mBNYRX/dGTmtkMfXVqOsK
         I02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIWwti5ZToPEvlJ9HqbDVer0fJJk8fc5ls5LCEfctQk=;
        b=ERqfYayB/ehuY6RjjFVMO0PjdTD6hRJEadDi2cJMPNnWBg85wUfnLotaxTYYARP+vx
         A/3oIwh4DxRYKDdK0BBA5Y9C6lJrgx6ptLN2jAJi4ciwj75JJAetgi0sC2N1xLqItz6N
         2OQwayWyCJOQsW7kNscJJYalgQtsvmhsjaqiwK0YVuIOX6a6/b4Mj4OZHDAYHHbypTT7
         MDb99LRCyG1SYUo2XDevlpwB2U7teTi6iuPTLhsV5HwmQ78y0vhjKKXgk9nGVptkj4cd
         W8kFNaxznjpV/tankhsW4l2/yuEBj2pV3woTKx7QniCWfqBqC223YqYM/D1ftEUYcHaf
         GD8g==
X-Gm-Message-State: AOAM533VeSOkXIcm6GJIuO3/XctMqyta5u3mQ58H5ZTy3ihdjJf3o1Gf
	80nXDphySvcZ7BeF6gT0hspnTL05cVe8f7DDMe4nNQ==
X-Google-Smtp-Source: 
 ABdhPJwb5tr2vMIKwTxecHX2OfXDrLeFZECiOQ46/qhx2iGMrlJGr71+3KhvvapnfDjwReDKRUvjwkmCz6C4txTTiYM=
X-Received: by 2002:a05:6402:438d:b0:424:775:27e8 with SMTP id
 o13-20020a056402438d00b00424077527e8mr3379101edc.80.1650503791746; Wed, 20
 Apr 2022 18:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220407013959.929748-1-yozhao@google.com>
 <YlZxziZLkT5LLhhq@mail.local>
In-Reply-To: <YlZxziZLkT5LLhhq@mail.local>
From: Yong Zhao <yozhao@google.com>
Date: Wed, 20 Apr 2022 18:16:20 -0700
Message-ID: 
 <CAGvvyt5cM5vfbpgT8LsL8y8FUqQP9MOWHq_sKFCyEr=FeaLdNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel_configcheck should be run for SRCTREE
 linux
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000035baa205dd1fdc16"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164740

--00000000000035baa205dd1fdc16
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

Thanks for the info. I think the failure happened because the config files
did not pass do_kernel_configcheck. My patch is intended to catch those
errors. I don't know how to access those test results and how to reproduce
the issue at my side. As this patch is only an improvement, I can hold this
patch back unless you can help fix those config file issues.

Regards,
Yong

On Tue, Apr 12, 2022 at 11:46 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> I believe this has introduced a race condition and is the cause of those
> two failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3442/steps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3399/steps/14/logs/stdio
>
> 2022-04-12 22:43:44,845 - oe-selftest - INFO - FAIL:
> devtool.DevtoolUpgradeTests.test_devtool_virtual_kernel_modify
> (subunit.RemotedTestCase)
> 2022-04-12 22:43:44,845 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2022-04-12 22:43:44,845 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py",
> line 1911, in test_devtool_virtual_kernel_modify
>     runCmd('devtool build %s' % kernel_provider)
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py",
> line 207, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'devtool build linux-yocto' returned non-zero exit
> status 1:
>
> ERROR: linux-yocto-5.15.32+git999-r0 do_kernel_configcheck: config
> analysis failed:
> ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-3540668/tmp/work/qemux86_64-poky-linux/linux-yocto/5.15.32+git999-r0/temp/log.do_kernel_configcheck.342487
> NOTE: recipe linux-yocto-5.15.32+git999-r0: task do_kernel_configcheck:
> Failed
> ERROR: Task
> (/tmp/devtoolqasd4ey4qf/core-copy/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
> failed with exit code '1'
>
> I tried to get the logs from the autobuilders but the
> linux-yocto/5.15.32+git999-r0/ directory was not present anymore...
>
> On 06/04/2022 18:39:59-0700, Yong Zhao via lists.openembedded.org wrote:
> > The task is useful for a SRCTREE linux. Because it won't modify the
> > SRCTREE, it does not hurt to run it by default.
> >
> > Signed-off-by: Yong Zhao <yozhao@google.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 +-
> >  scripts/lib/devtool/standard.py   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > index 1d5a8cdf29..56ba340c1b 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -1,5 +1,5 @@
> >  # remove tasks that modify the source tree in case externalsrc is
> inherited
> > -SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck
> do_kernel_checkout do_fetch do_unpack do_patch"
> > +SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_checkout
> do_fetch do_unpack do_patch"
> >  PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
> >  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
> >
> > diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> > index 01fb5ad96f..35cea6f320 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -949,7 +949,7 @@ def modify(args, config, basepath, workspace):
> >
> >              if bb.data.inherits_class('kernel', rd):
> >                  f.write('SRCTREECOVEREDTASKS = "do_validate_branches
> do_kernel_checkout '
> > -                        'do_fetch do_unpack do_kernel_configcheck"\n')
> > +                        'do_fetch do_unpack"\n')
> >                  f.write('\ndo_patch[noexec] = "1"\n')
> >                  f.write('\ndo_configure:append() {\n'
> >                          '    cp ${B}/.config ${S}/.config.baseline\n'
> > --
> > 2.35.1.1094.g7c7d902a7c-goog
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164095):
> https://lists.openembedded.org/g/openembedded-core/message/164095
> > Mute This Topic: https://lists.openembedded.org/mt/90304701/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000035baa205dd1fdc16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexandre,=C2=A0<div><br></div><div>Thanks for the=C2=
=A0info. I think the failure happened because the config files did not pass=
 do_kernel_configcheck. My patch is intended to catch those errors. I don&#=
39;t know how to access those test results and how to reproduce the issue a=
t my side. As this patch is only an improvement, I can hold this patch back=
 unless you can help fix those config file issues.=C2=A0</div><div><br></di=
v><div>Regards,</div><div>Yong</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 12, 2022 at 11:46 PM Alexan=
dre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.=
belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hello,<br>
<br>
I believe this has introduced a race condition and is the cause of those<br=
>
two failures:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/3442/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3442/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/3399/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3399/steps/14/logs/=
stdio</a><br>
<br>
2022-04-12 22:43:44,845 - oe-selftest - INFO - FAIL: devtool.DevtoolUpgrade=
Tests.test_devtool_virtual_kernel_modify (subunit.RemotedTestCase)<br>
2022-04-12 22:43:44,845 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2022-04-12 22:43:44,845 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/met=
a/lib/oeqa/selftest/cases/devtool.py&quot;, line 1911, in test_devtool_virt=
ual_kernel_modify<br>
=C2=A0 =C2=A0 runCmd(&#39;devtool build %s&#39; % kernel_provider)<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/met=
a/lib/oeqa/utils/commands.py&quot;, line 207, in runCmd<br>
=C2=A0 =C2=A0 raise AssertionError(&quot;Command &#39;%s&#39; returned non-=
zero exit status %d:\n%s&quot; % (command, result.status, exc_output))<br>
AssertionError: Command &#39;devtool build linux-yocto&#39; returned non-ze=
ro exit status 1:<br>
<br>
ERROR: linux-yocto-5.15.32+git999-r0 do_kernel_configcheck: config analysis=
 failed: <br>
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selfte=
st-ubuntu/build/build-st-3540668/tmp/work/qemux86_64-poky-linux/linux-yocto=
/5.15.32+git999-r0/temp/log.do_kernel_configcheck.342487<br>
NOTE: recipe linux-yocto-5.15.32+git999-r0: task do_kernel_configcheck: Fai=
led<br>
ERROR: Task (/tmp/devtoolqasd4ey4qf/core-copy/meta/recipes-kernel/linux/lin=
ux-yocto_5.15.bb:do_kernel_configcheck) failed with exit code &#39;1&#39;<b=
r>
<br>
I tried to get the logs from the autobuilders but the<br>
linux-yocto/5.15.32+git999-r0/ directory was not present anymore...<br>
<br>
On 06/04/2022 18:39:59-0700, Yong Zhao via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; The task is useful for a SRCTREE linux. Because it won&#39;t modify th=
e<br>
&gt; SRCTREE, it does not hurt to run it by default.<br>
&gt; <br>
&gt; Signed-off-by: Yong Zhao &lt;<a href=3D"mailto:yozhao@google.com" targ=
et=3D"_blank">yozhao@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 2 +-<br>
&gt;=C2=A0 scripts/lib/devtool/standard.py=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-y=
octo.bbclass<br>
&gt; index 1d5a8cdf29..56ba340c1b 100644<br>
&gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # remove tasks that modify the source tree in case externalsrc i=
s inherited<br>
&gt; -SRCTREECOVEREDTASKS +=3D &quot;do_validate_branches do_kernel_configc=
heck do_kernel_checkout do_fetch do_unpack do_patch&quot;<br>
&gt; +SRCTREECOVEREDTASKS +=3D &quot;do_validate_branches do_kernel_checkou=
t do_fetch do_unpack do_patch&quot;<br>
&gt;=C2=A0 PATCH_GIT_USER_EMAIL ?=3D &quot;kernel-yocto@oe&quot;<br>
&gt;=C2=A0 PATCH_GIT_USER_NAME ?=3D &quot;OpenEmbedded&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/sta=
ndard.py<br>
&gt; index 01fb5ad96f..35cea6f320 100644<br>
&gt; --- a/scripts/lib/devtool/standard.py<br>
&gt; +++ b/scripts/lib/devtool/standard.py<br>
&gt; @@ -949,7 +949,7 @@ def modify(args, config, basepath, workspace):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_cl=
ass(&#39;kernel&#39;, rd):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(=
&#39;SRCTREECOVEREDTASKS =3D &quot;do_validate_branches do_kernel_checkout =
&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;do_fetch do_unpack do_kernel_configcheck&quot;\n&#39;)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;do_fetch do_unpack&quot;\n&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(=
&#39;\ndo_patch[noexec] =3D &quot;1&quot;\n&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(=
&#39;\ndo_configure:append() {\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0 cp ${B}/.config ${S}/.config.baseli=
ne\n&#39;<br>
&gt; -- <br>
&gt; 2.35.1.1094.g7c7d902a7c-goog<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#164095): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/164095" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/164095</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90304701=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90304701/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000035baa205dd1fdc16--

