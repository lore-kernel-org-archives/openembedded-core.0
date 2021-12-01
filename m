Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29444C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:26:36 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.93955.1638375995005658860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ifCRpb6e;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id j1so16538008vkr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYKjlsenuq7spMNvgvxAOTdLFuvmqY2n99z2KB01ydQ=;
        b=ifCRpb6e57w7FcB80WfasfiMX24P2RMDCbCu9dG0+9cjLAu/odLpgZvm7GQ9TekXFw
         2H6GupBlpmikqhbrCprCeGX/XbTN0ux6gMsxEZqFJgTXiywpFYZIC7VQfcVZ2D/mGdn1
         cpPVbEy2g57eyJjipXWwUxVjo7cPypP6XCbKqtkBJS46N+EbrsivUN8Z760Y6MGMQotZ
         FlLu2HNGRKQhB1f/rKDbB00Vc0nAQ81b2V29UjnNzv3jUy4P4GlTEVXLpCxw3/+4i5KF
         5+0hog7AB/xIhWED3XbQoUvaCVi2hASFAaDnrDly+VuuUFCKRu+/CVo6j9kr9LOUdgpb
         T3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYKjlsenuq7spMNvgvxAOTdLFuvmqY2n99z2KB01ydQ=;
        b=HquLNMKngf/7b32M64CH4911Qkybw5RapaNZMRXrVg9C0UQCxOpWqpO8aZ/G4e1UJY
         2qbb6ahIz93Clb7b4n3Zyut+ph0FhtaW0PSh4hZam55FfpSIcHESyWAmi+r4SbPmPBvP
         f1jwAX4pVGwQWU7wDqQsiw9fYNt+KQ2kxhjaap3iQRuPeDGunPV53fX6xtKRCPqCjyEy
         NvG2LiFpD9gzsxBFbyXJdZl17+0MSSMeLi0wwFquWvqRMe1Vzl3+QC+cy0jSWRPmuHrg
         QFZEGg6bzIL2pbK5EfXQlquSqJin99VT/zWzzC1ETXm0yiJ/DVjIXT1LLSlcl62JqoGU
         IqCw==
X-Gm-Message-State: AOAM532OoDOXNoJ7DEzznt2z3k9LM6JrZpxUwY2giyeX9bQFNP4Qnunk
	YNvjW3duM8yUK4bPHPKRDPuwNxIFwQVI0wIO78Q=
X-Google-Smtp-Source: 
 ABdhPJwM1EiOTqn2XfLGszSPJyy3oovR2nMcnP/FFxRsrbrUBq0Mp5B2evJVPwrdUwjTh6AJYXuuOREbySewjdHkgbk=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr8863999vkd.4.1638375993907;
 Wed, 01 Dec 2021 08:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211201141543.32206-1-pavel@zhukoff.net>
 <CANNYZj_dYZ5i+rT-VnKMh-VOd3UizYDQTag7PNOJvWc3CgxO+g@mail.gmail.com>
 <544821638374351@mail.yandex.ru>
 <CANNYZj86nfibg13xfktVTndiE0cZVvQrfaZPYix+KWS7XEe6GA@mail.gmail.com>
 <441851638375270@mail.yandex.ru>
In-Reply-To: <441851638375270@mail.yandex.ru>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 17:26:22 +0100
Message-ID: 
 <CANNYZj9fXtO1ZksY1Jox2REAz-EmmfhrfBRgo_4u7TMReZ5z0w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] patch.py: Initialize git repo
 before patching
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000201cb405d21823f8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159045

--000000000000201cb405d21823f8
Content-Type: text/plain; charset="UTF-8"

Not seeing that in v4 :)

Alex

On Wed, 1 Dec 2021 at 17:14, Pavel Zhukov <pavel@zhukoff.net> wrote:

> Thanks. Done in v4.
>
> --
> Pavel
>
>
>
> 01.12.2021, 17:08, "Alexander Kanavin" <alex.kanavin@gmail.com>:
>
> Thanks :) You can add the failure into the commit message.
>
> Alex
>
> On Wed, 1 Dec 2021 at 17:00, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> without change in patch.py:
> ERROR: man-db-2.9.0-r1 do_patch: Applying patch
> 'man_db.conf-avoid-multilib-install-file-conflict.patch' on target
> directory
> '/mnt/builds/oniroproject/builds/build-oniro-linux-st/tmp/work/core2-64-oniro-linux-musl/man-db/2.9.0-r1/man-db-2.9.0'
> Command Error: 'git rev-parse --show-toplevel' exited with 0  Output:
> fatal: not a git repository (or any of the parent directories): .git
> ERROR: Logfile of failure stored in:
> /mnt/builds/oniroproject/builds/build-oniro-linux-st/tmp/work/core2-64-oniro-linux-musl/man-db/2.9.0-r1/temp/log.do_patch.21491
> NOTE: recipe man-db-2.9.0-r1: task do_patch: Failed
> ERROR: Task
> (/mnt/builds/oniroproject/sources/oe-core/meta/recipes-extended/man-db/man-db_2.9.0.bb:do_patch)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 102 tasks of which 0 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /mnt/builds/oniroproject/sources/oe-core/meta/recipes-extended/man-db/man-db_2.9.0.bb:
> do_patch
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> ----------------------------------------------------------------------
> 2021-12-01 15:11:56,184 - oe-selftest - INFO - Ran 1 test in 147.083s
> 2021-12-01 15:11:56,184 - oe-selftest - INFO - FAILED
> 2021-12-01 15:11:56,184 - oe-selftest - INFO -  (failures=1)
> 2021-12-01 15:11:58,721 - oe-selftest - INFO - RESULTS:
> 2021-12-01 15:11:58,722 - oe-selftest - INFO - RESULTS -
> bbtests.BitbakeTests.test_git_patchtool: FAILED (145.51s)
> 2021-12-01 15:11:58,724 - oe-selftest - INFO - SUMMARY:
> 2021-12-01 15:11:58,724 - oe-selftest - INFO - oe-selftest () - Ran 1 test
> in 147.084s
> 2021-12-01 15:11:58,724 - oe-selftest - INFO - oe-selftest - FAIL -
> Required tests failed (successes=0, skipped=0, failures=1, errors=0)
>
>
> with change in patch.py:
> 2021-12-01 15:12:20,910 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /mnt/builds/oniroproject/builds/build-oniro-linux-st/conf/local.conf
> 2021-12-01 15:12:20,911 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
> 2021-12-01 15:12:20,911 - oe-selftest - INFO - test_git_patchtool
> (bbtests.BitbakeTests)
> 2021-12-01 15:15:30,540 - oe-selftest - INFO -  ... ok
> 2021-12-01 15:15:31,717 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2021-12-01 15:15:31,717 - oe-selftest - INFO - Ran 1 test in 192.371s
> 2021-12-01 15:15:31,717 - oe-selftest - INFO - OK
> 2021-12-01 15:15:34,523 - oe-selftest - INFO - RESULTS:
> 2021-12-01 15:15:34,524 - oe-selftest - INFO - RESULTS -
> bbtests.BitbakeTests.test_git_patchtool: PASSED (189.63s)
> 2021-12-01 15:15:34,526 - oe-selftest - INFO - SUMMARY:
> 2021-12-01 15:15:34,526 - oe-selftest - INFO - oe-selftest () - Ran 1 test
> in 192.372s
> 2021-12-01 15:15:34,526 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=1, skipped=0, failures=0, errors=0)
>
>
> --
> Pavel
>
>
>
> 01.12.2021, 16:56, "Alexander Kanavin" <alex.kanavin@gmail.com>:
>
> Does the test fail without the change in lib/oepatch.py? Can you show how?
>
> Alex
>
> On Wed, 1 Dec 2021 at 15:17, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
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
>

--000000000000201cb405d21823f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not seeing that in v4 :)</div><div><br></div><div>Ale=
x<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, 1 Dec 2021 at 17:14, Pavel Zhukov &lt;<a href=3D"mailto:=
pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div>Thanks. Done in v4.</div><div>=C2=
=A0</div><div>--=C2=A0</div><div>Pavel</div><div>=C2=A0</div><div>=C2=A0</d=
iv><div>=C2=A0</div><div>01.12.2021, 17:08, &quot;Alexander Kanavin&quot; &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt;:</div><blockquote><div><div>Thanks :) You can add the fa=
ilure into the commit message.</div><div>=C2=A0</div><div>Alex</div></div>=
=C2=A0<div><div>On Wed, 1 Dec 2021 at 17:00, Pavel Zhukov &lt;<a href=3D"ma=
ilto:pavel@zhukoff.net" rel=3D"noopener noreferrer" target=3D"_blank">pavel=
@zhukoff.net</a>&gt; wrote:</div><blockquote style=3D"border-left:1px solid=
 rgb(204,204,204);margin:0px 0px 0px 0.8ex;padding-left:1ex"><div><div>with=
out change in patch.py:</div><div>ERROR: man-db-2.9.0-r1 do_patch: Applying=
 patch &#39;man_db.conf-avoid-multilib-install-file-conflict.patch&#39; on =
target directory &#39;/mnt/builds/oniroproject/builds/build-oniro-linux-st/=
tmp/work/core2-64-oniro-linux-musl/man-db/2.9.0-r1/man-db-2.9.0&#39;</div><=
div>Command Error: &#39;git rev-parse --show-toplevel&#39; exited with 0 =
=C2=A0Output:</div><div>fatal: not a git repository (or any of the parent d=
irectories): .git</div><div>ERROR: Logfile of failure stored in: /mnt/build=
s/oniroproject/builds/build-oniro-linux-st/tmp/work/core2-64-oniro-linux-mu=
sl/man-db/2.9.0-r1/temp/log.do_patch.21491</div><div><div><div>NOTE: recipe=
 man-db-2.9.0-r1: task do_patch: Failed</div><div>ERROR: Task (/mnt/builds/=
oniroproject/sources/oe-core/meta/recipes-extended/man-db/man-db_2.9.0.bb:d=
o_patch) failed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: A=
ttempted 102 tasks of which 0 didn&#39;t need to be rerun and 1 failed.</di=
v><div>=C2=A0</div><div>Summary: 1 task failed:</div><div>=C2=A0 /mnt/build=
s/oniroproject/sources/oe-core/meta/recipes-extended/man-db/man-db_2.9.0.bb=
:do_patch</div><div>Summary: There was 1 ERROR message shown, returning a n=
on-zero exit code.</div><div>----------------------------------------------=
------------------------</div><div>2021-12-01 15:11:56,184 - oe-selftest - =
INFO - Ran 1 test in 147.083s</div><div>2021-12-01 15:11:56,184 - oe-selfte=
st - INFO - FAILED</div><div>2021-12-01 15:11:56,184 - oe-selftest - INFO -=
 =C2=A0(failures=3D1)</div><div>2021-12-01 15:11:58,721 - oe-selftest - INF=
O - RESULTS:</div><div>2021-12-01 15:11:58,722 - oe-selftest - INFO - RESUL=
TS - bbtests.BitbakeTests.test_git_patchtool: FAILED (145.51s)</div><div>20=
21-12-01 15:11:58,724 - oe-selftest - INFO - SUMMARY:</div><div>2021-12-01 =
15:11:58,724 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 147.084s=
</div><div>2021-12-01 15:11:58,724 - oe-selftest - INFO - oe-selftest - FAI=
L - Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=
=3D0)</div></div><div>=C2=A0</div><div>=C2=A0</div><div>with change in patc=
h.py:</div><div><div>2021-12-01 15:12:20,910 - oe-selftest - INFO - Adding:=
 &quot;include selftest.inc&quot; in /mnt/builds/oniroproject/builds/build-=
oniro-linux-st/conf/local.conf</div><div>2021-12-01 15:12:20,911 - oe-selft=
est - INFO - Adding: &quot;include bblayers.inc&quot; in bblayers.conf</div=
><div>2021-12-01 15:12:20,911 - oe-selftest - INFO - test_git_patchtool (bb=
tests.BitbakeTests)</div><div>2021-12-01 15:15:30,540 - oe-selftest - INFO =
- =C2=A0... ok</div><div>2021-12-01 15:15:31,717 - oe-selftest - INFO - ---=
-------------------------------------------------------------------</div><d=
iv>2021-12-01 15:15:31,717 - oe-selftest - INFO - Ran 1 test in 192.371s</d=
iv><div>2021-12-01 15:15:31,717 - oe-selftest - INFO - OK</div><div>2021-12=
-01 15:15:34,523 - oe-selftest - INFO - RESULTS:</div><div>2021-12-01 15:15=
:34,524 - oe-selftest - INFO - RESULTS - bbtests.BitbakeTests.test_git_patc=
htool: PASSED (189.63s)</div><div>2021-12-01 15:15:34,526 - oe-selftest - I=
NFO - SUMMARY:</div><div>2021-12-01 15:15:34,526 - oe-selftest - INFO - oe-=
selftest () - Ran 1 test in 192.372s</div><div>2021-12-01 15:15:34,526 - oe=
-selftest - INFO - oe-selftest - OK - All required tests passed (successes=
=3D1, skipped=3D0, failures=3D0, errors=3D0)</div><div>=C2=A0</div></div></=
div></div><div>=C2=A0</div><div>--=C2=A0</div><div>Pavel</div><div>=C2=A0</=
div><div>=C2=A0</div><div>=C2=A0</div><div>01.12.2021, 16:56, &quot;Alexand=
er Kanavin&quot; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"noope=
ner noreferrer" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;:</div><blo=
ckquote><div><div>Does the test fail without the change in lib/oepatch.py? =
Can you show how?</div><div>=C2=A0</div><div>Alex</div></div>=C2=A0<div><di=
v>On Wed, 1 Dec 2021 at 15:17, Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhu=
koff.net" rel=3D"noopener noreferrer" target=3D"_blank">pavel@zhukoff.net</=
a>&gt; wrote:</div><blockquote style=3D"border-left:1px solid rgb(204,204,2=
04);margin:0px 0px 0px 0.8ex;padding-left:1ex">From: Pavel Zhukov &lt;<a hr=
ef=3D"mailto:pavel.zhukov@huawei.com" rel=3D"noopener noreferrer" target=3D=
"_blank">pavel.zhukov@huawei.com</a>&gt;<br><br>If PATCHTOOL=3D&quot;git&qu=
ot; has been specified but workdir is not git repo<br>bitbake fails to appl=
y the patches. Fix this by initializing the repo<br>before patching.<br>Thi=
s allows binary git patches to be applied.<br><br>Signed-off-by: Pavel Zhuk=
ov &lt;<a href=3D"mailto:pavel.zhukov@huawei.com" rel=3D"noopener noreferre=
r" target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>---<br>=C2=A0meta/l=
ib/oe/patch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 17 +++++++++++++++++<br>=C2=A0meta/lib/oeqa/selftest/cases/bbt=
ests.py |=C2=A0 6 ++++++<br>=C2=A02 files changed, 23 insertions(+)<br><br>=
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>index 7cd8436da=
5..720c6f663c 100644<br>--- a/meta/lib/oe/patch.py<br>+++ b/meta/lib/oe/pat=
ch.py<br>@@ -52,6 +52,10 @@ def runcmd(args, dir =3D None):<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if dir:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0os.chdir(olddir)<br><br>+def getstatusoutput(cmd):<br>+=C2=A0 =C2=
=A0 import subprocess<br>+=C2=A0 =C2=A0 return subprocess.getstatusoutput(c=
md.split())<br>+<br>=C2=A0class PatchError(Exception):<br>=C2=A0 =C2=A0 =C2=
=A0def __init__(self, msg):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.msg =
=3D msg<br>@@ -294,6 +298,19 @@ class GitApplyTree(PatchTree):<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PatchTree.__init__(self, dir, d)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0self.commituser =3D d.getVar(&#39;PATCH_GIT_USER_NA=
ME&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.commitemail =3D d.getVar=
(&#39;PATCH_GIT_USER_EMAIL&#39;)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not sel=
f._isInitialized():<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ini=
tRepo()<br>+<br>+=C2=A0 =C2=A0 def _isInitialized(self):<br>+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cmd =3D &quot;git rev-parse --show-toplevel&quot;<br>+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (status, output) =3D getstatusoutput(cmd)<br>+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ## Make sure we&#39;re in builddir to not break top-le=
vel git repos<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return status =3D=3D 0 and os=
.path.samedir(output, self.dir)<br>+<br>+=C2=A0 =C2=A0 def _initRepo(self):=
<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git init&quot;.split(), self.=
dir)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git add .&quot;.split(), =
self.dir)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runcmd(&quot;git commit -a --allo=
w-empty -m Patching_started&quot;.split(), self.dir)<br><br>=C2=A0 =C2=A0 =
=C2=A0@staticmethod<br>=C2=A0 =C2=A0 =C2=A0def extractPatchHeader(patchfile=
):<br>diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/=
selftest/cases/bbtests.py<br>index d4f6a08991..8c046074f6 100644<br>--- a/m=
eta/lib/oeqa/selftest/cases/bbtests.py<br>+++ b/meta/lib/oeqa/selftest/case=
s/bbtests.py<br>@@ -294,3 +294,9 @@ INHERIT_remove =3D \&quot;report-error\=
&quot;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_recipe_summary_after =
=3D get_bb_var(&#39;SUMMARY&#39;, test_recipe)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self.assertEqual(expected_recipe_summary, test_recipe_summary_aft=
er)<br>+<br>+=C2=A0 =C2=A0 def test_git_patchtool(self):<br>+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.write_recipeinc(&#39;man-db&#39;, &#39;PATCHTOOL=3D\&quo=
t;git\&quot;&#39;)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D bitbake(&#39;=
man-db -c patch&#39;, ignore_status=3DFalse)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self.delete_recipeinc(&#39;man-db&#39;)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bitbake(&#39;-cclean man-db&#39;)<br>--<br>2.34.0<br><br><br>-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>Links: You receive all messages sent to=
 this group.<br>View/Reply Online (#159031): <a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/message/159031" rel=3D"noopener noreferrer"=
 target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/messa=
ge/159031</a><br>Mute This Topic: <a href=3D"https://lists.openembedded.org=
/mt/87428914/1686489" rel=3D"noopener noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/mt/87428914/1686489</a><br>Group Owner: <a href=3D"=
mailto:openembedded-core%2Bowner@lists.openembedded.org" rel=3D"noopener no=
referrer" target=3D"_blank">openembedded-core+owner@lists.openembedded.org<=
/a><br>Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/unsub" rel=3D"noopener noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" rel=3D"noopener noreferrer" target=3D"_blank">alex.kanavin@gm=
ail.com</a>]<br>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>=C2=A0</bl=
ockquote></div></blockquote></blockquote></div></blockquote></blockquote></=
div>

--000000000000201cb405d21823f8--

