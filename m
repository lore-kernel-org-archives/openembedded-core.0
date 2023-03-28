Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916BCC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:28:14 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.60404.1679988488069550259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DKvcR7oQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id a21so4314075ljq.10
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679988486;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J4DuUJFusZsCjJLgl0cj6txxnLGkBL7QPRfyinwgfc0=;
        b=DKvcR7oQoqar8GahdJFWzsPEWSiMChGOn5KkW2evE6w1Rhtrlx/Avqlvdwo1b91sQt
         Hw3+ohBMRt09YZTXbjkCOGJ2pWwVZFQoNoTvt13B2zJPoL2//OliOoJ2A02vJyUJsriC
         OYwNWojpVOe4GXrZl9618ED208XOuxMEZQ/7F39P3TxfJqGtbkUhiL4MPe4b5ONtsDLi
         GErN4V0QX89oYqa5GnPzMgDs40va8jdRMCXT8ZMthxJC5h8RDBt0gucfeTG6udOs4aJu
         Nw5xJuSivSkxSoSrkr+v8vf/PoGBCEH7T4ZAPVJCvDYT77GNx9vihMsFnW3wAoBwjsfS
         XNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679988486;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4DuUJFusZsCjJLgl0cj6txxnLGkBL7QPRfyinwgfc0=;
        b=jxNc64pjFRNhiySHw4Nz0OY0V+q6xL8WlQ4VA0f5VfcIbmwP7Z7Csv6EYEjOG602Gu
         0KMR4/czIU3B5WllCs29Pm65OSSVUDPZ3kAOLv3/MFoPicol1GZvExwZ73kqczQOCGIg
         2bcr6asq7La7tagpNjh3/QjNYl5PNkUSIigOxHeK6oACXj/vHOBAA504/MJxjCWBAHSO
         gaJWGKFFPwkKUBYBBxLt9DJ1he8+KrEkEiKbSUfJYMS9f5kdUYq3DW7MsKcGe+47TTZB
         Yr++JxR8WY9psDa0Ixrj8QhpHzjykbUdvcjLzjkBZPloxwXn74abpF99r4s1v07gRzM9
         4a+Q==
X-Gm-Message-State: AO0yUKWLbuME7hWB8bxgUPmyUXnnHADUAPozIqLUNp75E5PIRJEu74cX
	5JTdDuLGHtzlGS3j3tUGwfP71VOR+VWwSplcfE1ab51M84Q=
X-Google-Smtp-Source: AK7set+KKV12JTAsCijHuYbcCQ3ETU5iyla5JVykZQBjsB7vOB1PY0XGWiiTvI0sEVPIsSBTI0iKboqwgPgCk7cKd+Y=
X-Received: by 2002:a2e:5710:0:b0:2a2:35dd:4b30 with SMTP id
 l16-20020a2e5710000000b002a235dd4b30mr7282265ljb.3.1679988485458; Tue, 28 Mar
 2023 00:28:05 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 28 Mar 2023 09:27:54 +0200
Message-ID: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
Subject: oe-selftest for devtool failed
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e70fb805f7f0cc36"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179206

--000000000000e70fb805f7f0cc36
Content-Type: text/plain; charset="UTF-8"

Hello,

in the course of building tests around this patch:
https://patchwork.yoctoproject.org/project/oe-core/patch/855931994ea68c0691d0a67ce2ccad947e77229f.1679904677.git.frederic.martinsons@gmail.com/

I tried to run oe-selftest with the current poky master
(e3afe166940686b05626c3298bc4369296b7d8a3) and I didn't manage to have
the test_devtool_modify and test_devtool_modify_git worked.

First, I was not aware of oe-selftest to be impacted by my previous build ,
I had issues some devtool but even if there was no more active devtool, the
tests failed with the following
error:

ERROR: Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check
bblayers.conf or layer.conf to fix it.
Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf
or layer.conf to fix it.
Traceback (most recent call last):
  File
"/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/scripts/lib/devtool/__init__.py",
line 109, in setup_tinfoil
    tinfoil.prepare(config_only)
  File
"/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/tinfoil.py",
line 417, in prepare
    self.run_actions(config_params)
  File
"/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/tinfoil.py",
line 432, in run_actions
    raise TinfoilUIException(ret)
bb.tinfoil.TinfoilUIException: 1


After removing my $BDIR/workspace , the test got further but ends in
strange failure (for test_devtool_modify):

NOTE: recipe shadow-native-4.13-r0: task do_install: Failed
ERROR: Task
(virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extended/shadow/shadow_4.13.bb:do_install)
failed with exit code '1'
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-native-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gmp-native-6.2.1-r0: task do_compile: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+gitAUTOINC+d97db4fae4-r0: task
do_configure: Succeeded
NOTE: recipe cross-localedef-native-2.37-r0: task do_configure: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_configure: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task
do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 799 tasks of which 99 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extended/shadow/shadow_4.13.bb:
do_install
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
----------------------------------------------------------------------
2023-03-28 07:16:21,876 - oe-selftest - INFO - Ran 1 test in 911.101s
2023-03-28 07:16:21,876 - oe-selftest - INFO - FAILED
2023-03-28 07:16:21,877 - oe-selftest - INFO -  (failures=1)
2023-03-28 07:16:29,802 - oe-selftest - INFO - RESULTS:
2023-03-28 07:16:29,803 - oe-selftest - INFO - RESULTS -
devtool.DevtoolModifyTests.test_devtool_modify: FAILED (905.11s)
2023-03-28 07:16:29,808 - oe-selftest - INFO - SUMMARY:
2023-03-28 07:16:29,808 - oe-selftest - INFO - oe-selftest () - Ran 1 test
in 911.105s
2023-03-28 07:16:29,808 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=0, skipped=0, failures=1, errors=0)

Does this ring a bell to someone ? How can I manage to make these tests
succeed ?

--000000000000e70fb805f7f0cc36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>in the course of building tests =
around this patch:=C2=A0<a href=3D"https://patchwork.yoctoproject.org/proje=
ct/oe-core/patch/855931994ea68c0691d0a67ce2ccad947e77229f.1679904677.git.fr=
ederic.martinsons@gmail.com/">https://patchwork.yoctoproject.org/project/oe=
-core/patch/855931994ea68c0691d0a67ce2ccad947e77229f.1679904677.git.frederi=
c.martinsons@gmail.com/</a></div><div><br></div><div>I tried to run oe-self=
test with the current poky master (e3afe166940686b05626c3298bc4369296b7d8a3=
) and I didn&#39;t manage to have the=C2=A0test_devtool_modify and=C2=A0tes=
t_devtool_modify_git worked.</div><div><br></div><div>First, I was not awar=
e of oe-selftest to be impacted by my previous=C2=A0build , I had issues so=
me devtool but even if there was no more active devtool, the tests failed w=
ith the following</div><div>error:</div><div><br></div><div>ERROR: Found du=
plicated BBFILE_COLLECTIONS &#39;workspacelayer&#39;, check bblayers.conf o=
r layer.conf to fix it.<br>Found duplicated BBFILE_COLLECTIONS &#39;workspa=
celayer&#39;, check bblayers.conf or layer.conf to fix it.<br>Traceback (mo=
st recent call last):<br>=C2=A0 File &quot;/var/lib/jenkins/YOCTO_POKY_MAST=
ER_TEST/poky/scripts/lib/devtool/__init__.py&quot;, line 109, in setup_tinf=
oil<br>=C2=A0 =C2=A0 tinfoil.prepare(config_only)<br>=C2=A0 File &quot;/var=
/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/tinfoil.py&quot;, l=
ine 417, in prepare<br>=C2=A0 =C2=A0 self.run_actions(config_params)<br>=C2=
=A0 File &quot;/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/=
tinfoil.py&quot;, line 432, in run_actions<br>=C2=A0 =C2=A0 raise TinfoilUI=
Exception(ret)<br>bb.tinfoil.TinfoilUIException: 1<br></div><div><br></div>=
<div><br></div><div>After removing my $BDIR/workspace , the test got furthe=
r but ends in strange failure (for test_devtool_modify):</div><div><br></di=
v><div>NOTE: recipe shadow-native-4.13-r0: task do_install: Failed<br>ERROR=
: Task (virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extend=
ed/shadow/shadow_4.13.bb:do_install) failed with exit code &#39;1&#39;<br>N=
OTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot: Succeeded<br>N=
OTE: recipe file-native-5.44-r0: task do_populate_sysroot: Succeeded<br>NOT=
E: recipe gmp-native-6.2.1-r0: task do_compile: Succeeded<br>NOTE: recipe p=
kgconfig-native-0.29.2+gitAUTOINC+d97db4fae4-r0: task do_configure: Succeed=
ed<br>NOTE: recipe cross-localedef-native-2.37-r0: task do_configure: Succe=
eded<br>NOTE: recipe libunistring-native-1.1-r0: task do_configure: Succeed=
ed<br>NOTE: recipe bison-native-3.8.2-r0: task do_configure: Succeeded<br>N=
OTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do=
_fetch: Succeeded<br>NOTE: Tasks Summary: Attempted 799 tasks of which 99 d=
idn&#39;t need to be rerun and 1 failed.<br><br>Summary: 1 task failed:<br>=
=C2=A0 virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extende=
d/shadow/shadow_4.13.bb:do_install<br>Summary: There was 1 WARNING message.=
<br>Summary: There was 1 ERROR message, returning a non-zero exit code.<br>=
----------------------------------------------------------------------<br>2=
023-03-28 07:16:21,876 - oe-selftest - INFO - Ran 1 test in 911.101s<br>202=
3-03-28 07:16:21,876 - oe-selftest - INFO - FAILED<br>2023-03-28 07:16:21,8=
77 - oe-selftest - INFO - =C2=A0(failures=3D1)<br>2023-03-28 07:16:29,802 -=
 oe-selftest - INFO - RESULTS:<br>2023-03-28 07:16:29,803 - oe-selftest - I=
NFO - RESULTS - devtool.DevtoolModifyTests.test_devtool_modify: FAILED (905=
.11s)<br>2023-03-28 07:16:29,808 - oe-selftest - INFO - SUMMARY:<br>2023-03=
-28 07:16:29,808 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 911.=
105s<br>2023-03-28 07:16:29,808 - oe-selftest - INFO - oe-selftest - FAIL -=
 Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D=
0)<br></div><div><br></div><div>Does this ring a bell to someone ? How can =
I manage to make these tests succeed ?</div></div>

--000000000000e70fb805f7f0cc36--

