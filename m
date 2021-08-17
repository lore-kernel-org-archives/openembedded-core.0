Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.36086.1629183710683652015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 00:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mI7h2rCN;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id 90so6974242uax.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=GeHf/mz4F1AqIVqS3qtpf1RgGVxw/yNFyijufv6/m30=;
        b=mI7h2rCNVNgAdMXtssG9s+kv21poi3/BhwobadNxNYu9d4RywvLsDDrPaqVWS5Mc4i
         ImvNWU895FOpCLyHUltDJOqa3rGXjCAZHLKpYWJ0ICpDiVblS3Dx/cw9bICOMMpitl2d
         y03zx2F6ncBtRBaU8qMzP0kFr9XqYNrQFt0iDoQnJa7gdvJtipjnXCL7eks0YJ1fri06
         FuPuu31Id9BlxhvGXv8E38orj3lIEQPwCdW5qTC8KF79C/fBA3lnHNJpi4RAzkV0lMpP
         sI14u7Re/VI7oUTooBC2jEslWhGJwBDGluA/rkqbul5dQGZmJvFv9mKIF2cd2lZ9hqwr
         kUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GeHf/mz4F1AqIVqS3qtpf1RgGVxw/yNFyijufv6/m30=;
        b=EU7sD1DDsDZLi7zR/xO/nN6K3lZ4ulU4jeiK4hXnPlM0HkMbRIyKiebVR6KQbxGhdm
         OzDB3r7+cpudLNZBrJxx7OOD39q0ulLY0dE/aZrxbkI1RWKqhbBhpGnrKvN1z9irWrB8
         qh+44QaWOd2jgr/eHVDWABGaDn6Nyjp028Q73zQIdpkeGIAzE/R7zNuZzXej7hQb3APd
         FIWh1AIqoyjjSMUQX5YbTzIE1X7Rb6ZdaJXj/ySV/3u1Prj6ZIu7NC5C2jmay4eBN6e0
         YOH2wcyu6SziE1PqnJTsl7eFpCFQpJQJtpcU505UPUOcHJK7aLmC+QVWJTyMv3iTUtIQ
         IT5Q==
X-Gm-Message-State: AOAM530NiFWED8coTk8LGcCMicB57VfvkbOeju3qUIoc9fjaqxHxmK3M
	QOKkpAUmyus1NGqE5ZytNr+sYRgQPUqO/WPLU+0=
X-Google-Smtp-Source: ABdhPJz7aUYsNfS82WdEyThX/+f8JF6UmOO7TDliUtuTg/aQTxgv+JGLXluYAJ1mMLJcrL0Dzxb1QwqIGdth04Ouhvo=
X-Received: by 2002:ab0:3314:: with SMTP id r20mr989184uao.89.1629183709829;
 Tue, 17 Aug 2021 00:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <60fd58d6.1c69fb81.aba65.176aSMTPIN_ADDED_MISSING@mx.google.com>
 <CANNYZj8RqniPmbYKPyOEQoL2E-s2LK_H4-D2VfxcCKEqHGu4uw@mail.gmail.com>
 <CADfgfoZ-keaKUxmWYbL-P5HNti46-Sm+X+u6trARUrSSyXmOnw@mail.gmail.com> <CANNYZj972nj6jgFdmeDtnS4J4WefMx9Xtb=oc4c3NamKvMBBLw@mail.gmail.com>
In-Reply-To: <CANNYZj972nj6jgFdmeDtnS4J4WefMx9Xtb=oc4c3NamKvMBBLw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Aug 2021 09:01:38 +0200
Message-ID: <CANNYZj__mHY2ZoG=C6dsVOLz13xi0zqQRPdyoU9FZAPOgObWmg@mail.gmail.com>
Subject: AUH mails not delivered to oe-core list
To: Michael Halstead <mhalstead@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004c5ed805c9bbe4d2"

--0000000000004c5ed805c9bbe4d2
Content-Type: text/plain; charset="UTF-8"

Hello Michael,

the problem (AUH mails not making it to the mailing lists) still goes on.
Has there been any progress with the ticket? Should we think of possible
workarounds?

Alex

On Mon, 2 Aug 2021 at 14:42, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Hello Michael,
>
> unfortunately the problem persists - no AUH emails in the latest round
> either.
>
> Alex
>
> On Mon, 26 Jul 2021 at 23:36, Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
>> That server is having trouble delivering email to Groups.io. I have a
>> support request open with Groups.io about it.
>>
>> On Sun, Jul 25, 2021 at 7:13 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> The latest round of upgrade helper emails didn't make it to oe-core list
>>> (but I did get ones that were also CCd to me directly) - can you please
>>> check?
>>>
>>> Here's the log:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/112/builds/37/steps/11/logs/stdio
>>>
>>> Alex
>>>
>>> On Sun, 25 Jul 2021 at 14:28, <auh@auh.yoctoproject.org> wrote:
>>>
>>>> Hello,
>>>>
>>>> this email is a notification from the Auto Upgrade Helper
>>>> that the automatic attempt to upgrade the recipe *meson* to *0.59.0*
>>>> has Failed (devtool error).
>>>>
>>>> Detailed error information:
>>>>
>>>> Running 'devtool upgrade' for recipe meson failed.
>>>> NOTE: Starting bitbake server...
>>>> NOTE: Reconnecting to bitbake server...
>>>> NOTE: Retrying server connection (#1)...
>>>> Loading cache...done.
>>>> Loaded 1459 entries from dependency cache.
>>>> INFO: Extracting current version source...
>>>> Removing 1 recipes from the x86_64 sysroot...done.
>>>> NOTE: Resolving any missing task queue dependencies
>>>>
>>>> Build Configuration:
>>>> BB_VERSION           = "1.51.0"
>>>> BUILD_SYS            = "x86_64-linux"
>>>> NATIVELSBSTRING      = "universal"
>>>> TARGET_SYS           = "x86_64-poky-linux"
>>>> MACHINE              = "qemux86-64"
>>>> DISTRO               = "poky"
>>>> DISTRO_VERSION       =
>>>> "3.3+snapshot-0421d4df954a35ad0176a12db1060e52115b14b1"
>>>> TUNE_FEATURES        = "m64 core2"
>>>> TARGET_FPU           = ""
>>>> meta
>>>> meta-poky
>>>> meta-yocto-bsp       =
>>>> "tmp-auh-upgrades:0421d4df954a35ad0176a12db1060e52115b14b1"
>>>> workspace            = "master:982f98f721af11b5698be8fe959058823d1de0d3"
>>>>
>>>> Initialising tasks...done.
>>>> Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0%
>>>> match, 100% complete)
>>>> NOTE: Executing Tasks
>>>> NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be
>>>> rerun and all succeeded.
>>>> NOTE: Writing buildhistory
>>>> NOTE: Writing buildhistory took: 1 seconds
>>>> INFO: Extracting upgraded version source...
>>>> INFO: Fetching
>>>> https://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.gz.
>>>> ..
>>>> Loading cache...done.
>>>> Loaded 1459 entries from dependency cache.
>>>> Parsing recipes...done.
>>>> Parsing of 822 .bb files complete (820 cached, 2 parsed). 1460 targets,
>>>> 35 skipped, 0 masked, 0 errors.
>>>> NOTE: Resolving any missing task queue dependencies
>>>>
>>>> Build Configuration:
>>>> BB_VERSION           = "1.51.0"
>>>> BUILD_SYS            = "x86_64-linux"
>>>> NATIVELSBSTRING      = "universal"
>>>> TARGET_SYS           = "x86_64-poky-linux"
>>>> MACHINE              = "qemux86-64"
>>>> DISTRO               = "poky"
>>>> DISTRO_VERSION       =
>>>> "3.3+snapshot-0421d4df954a35ad0176a12db1060e52115b14b1"
>>>> TUNE_FEATURES        = "m64 core2"
>>>> TARGET_FPU           = ""
>>>> meta
>>>> meta-poky
>>>> meta-yocto-bsp       =
>>>> "tmp-auh-upgrades:0421d4df954a35ad0176a12db1060e52115b14b1"
>>>> workspace            = "master:982f98f721af11b5698be8fe959058823d1de0d3"
>>>>
>>>> Initialising tasks...done.
>>>> Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0%
>>>> match, 0% complete)
>>>> NOTE: No setscene tasks
>>>> NOTE: Executing Tasks
>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be
>>>> rerun and all succeeded.
>>>> NOTE: Writing buildhistory
>>>> NOTE: Writing buildhistory took: 1 seconds
>>>> DEBUG 5 [Errno 25] Inappropriate ioctl for device
>>>> Adding changed files:   0% |                                   | ETA:
>>>> --:--:--
>>>> Adding changed files:   0% |                                   | ETA:
>>>> --:--:--
>>>> Adding changed files:  15% |#####                               | ETA:
>>>> 0:00:00
>>>> Adding changed files:  30% |##########                          | ETA:
>>>> 0:00:00
>>>> Adding changed files:  45% |################                    | ETA:
>>>> 0:00:00
>>>> Adding changed files:  60% |#####################               | ETA:
>>>> 0:00:00
>>>> Adding changed files:  75% |###########################         | ETA:
>>>> 0:00:00
>>>> Adding changed files:  90% |################################    | ETA:
>>>> 0:00:00
>>>> Adding changed files: 100% |####################################| Time:
>>>> 0:00:00
>>>> INFO: Rebasing devtool onto c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda
>>>> WARNING: Command 'git rebase c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda'
>>>> failed:
>>>> Rebasing (1/8)
>>>> Rebasing (2/8)
>>>> error: could not apply 7f3dc56... native_bindir
>>>> Resolve all conflicts manually, mark them as resolved with
>>>> "git add/rm <conflicted_files>", then run "git rebase --continue".
>>>> You can instead skip this commit: run "git rebase --skip".
>>>> To abort and get back to the state before "git rebase", run "git rebase
>>>> --abort".
>>>> Could not apply 7f3dc56... native_bindir
>>>> Auto-merging mesonbuild/dependencies/base.py
>>>> CONFLICT (content): Merge conflict in mesonbuild/dependencies/base.py
>>>>
>>>> You will need to resolve conflicts in order to complete the upgrade.
>>>> INFO: Upgraded source extracted to
>>>> /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/meson
>>>> INFO: New recipe is
>>>> /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/meson/
>>>> meson_0.59.0.bb
>>>>
>>>>
>>>>
>>>>
>>>> Please review the attached files for further information and
>>>> build/update failures.
>>>> Any problem please file a bug at
>>>> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>>>>
>>>> Regards,
>>>> The Upgrade Helper
>>>
>>>
>>
>> --
>> Michael Halstead
>> Linux Foundation / Yocto Project
>> Systems Operations Engineer
>>
>

--0000000000004c5ed805c9bbe4d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Michael,</div><div><br></div><=
div>the problem (AUH mails not making it to the mailing lists) still goes o=
n. Has there been any progress with the ticket? Should we think of possible=
 workarounds?</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2 Aug 2021 a=
t 14:42, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div>Hello Michael,</div><div><br></di=
v><div>unfortunately the problem persists - no AUH emails in the latest rou=
nd either.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Jul 2021 at 23=
:36, Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org" =
target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">That server=
 is having trouble delivering email to Groups.io. I have a support request =
open with Groups.io about it.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Jul 25, 2021 at 7:13 AM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>The latest round of upgrade helper em=
ails didn&#39;t make it to oe-core list (but I did get ones that were also =
CCd to me directly) - can you please check?</div><div><br></div><div>Here&#=
39;s the log:</div><div><a href=3D"https://autobuilder.yoctoproject.org/typ=
hoon/#/builders/112/builds/37/steps/11/logs/stdio" target=3D"_blank">https:=
//autobuilder.yoctoproject.org/typhoon/#/builders/112/builds/37/steps/11/lo=
gs/stdio</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 25 Jul 2021 at =
14:28, &lt;<a href=3D"mailto:auh@auh.yoctoproject.org" target=3D"_blank">au=
h@auh.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *meson* to *0.59.0* has Fa=
iled (devtool error).<br>
<br>
Detailed error information:<br>
<br>
Running &#39;devtool upgrade&#39; for recipe meson failed.<br>
NOTE: Starting bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Retrying server connection (#1)...<br>
Loading cache...done.<br>
Loaded 1459 entries from dependency cache.<br>
INFO: Extracting current version source...<br>
Removing 1 recipes from the x86_64 sysroot...done.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.51.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.3+snapshot-0421d4df954=
a35ad0176a12db1060e52115b14b1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:0421d4d=
f954a35ad0176a12db1060e52115b14b1&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:982f98f=
721af11b5698be8fe959058823d1de0d3&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 1=
00% complete)<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn&#39;t need to be r=
erun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
INFO: Extracting upgraded version source...<br>
INFO: Fetching <a href=3D"https://github.com/mesonbuild/meson/releases/down=
load/0.59.0/meson-0.59.0.tar.gz." rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.g=
z.</a>..<br>
Loading cache...done.<br>
Loaded 1459 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 822 .bb files complete (820 cached, 2 parsed). 1460 targets, 35 =
skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.51.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.3+snapshot-0421d4df954=
a35ad0176a12db1060e52115b14b1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:0421d4d=
f954a35ad0176a12db1060e52115b14b1&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:982f98f=
721af11b5698be8fe959058823d1de0d3&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0%=
 complete)<br>
NOTE: No setscene tasks<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn&#39;t need to be rer=
un and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
DEBUG 5 [Errno 25] Inappropriate ioctl for device<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 15% |#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 30% |##########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:=
00:00<br>
Adding changed files:=C2=A0 45% |################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 60% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 75% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 90% |################################=C2=A0 =C2=
=A0 | ETA:=C2=A0 0:00:00<br>
Adding changed files: 100% |####################################| Time: 0:0=
0:00<br>
INFO: Rebasing devtool onto c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda<br>
WARNING: Command &#39;git rebase c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda&#=
39; failed:<br>
Rebasing (1/8)<br>
Rebasing (2/8)<br>
error: could not apply 7f3dc56... native_bindir<br>
Resolve all conflicts manually, mark them as resolved with<br>
&quot;git add/rm &lt;conflicted_files&gt;&quot;, then run &quot;git rebase =
--continue&quot;.<br>
You can instead skip this commit: run &quot;git rebase --skip&quot;.<br>
To abort and get back to the state before &quot;git rebase&quot;, run &quot=
;git rebase --abort&quot;.<br>
Could not apply 7f3dc56... native_bindir<br>
Auto-merging mesonbuild/dependencies/base.py<br>
CONFLICT (content): Merge conflict in mesonbuild/dependencies/base.py<br>
<br>
You will need to resolve conflicts in order to complete the upgrade.<br>
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/b=
uild/build/workspace/sources/meson<br>
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/work=
space/recipes/meson/<a href=3D"http://meson_0.59.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">meson_0.59.0.bb</a><br>
<br>
<br>
<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</di=
v><div>Systems Operations Engineer</div></div></div>
</blockquote></div>
</blockquote></div></div>

--0000000000004c5ed805c9bbe4d2--
