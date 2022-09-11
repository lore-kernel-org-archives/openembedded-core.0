Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66132C6FA82
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 01:01:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5779.1662858072041847214
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 10 Sep 2022 18:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ij9BSPSa;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dv25so12480470ejb.12
        for <Openembedded-core@lists.openembedded.org>;
 Sat, 10 Sep 2022 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=aIAeZsG5eHbIopwxGTAsKX3zqs0X8npyiNIkJNJZkK8=;
        b=ij9BSPSa7h6lQP4bHIYfW7jqrs4Ga83m9rOZRfYsgx1D4Ba6gB8eGRUzes37a/Xe6A
         +pC3yPzF5RHS9eXJ1f/eaP5C7SWMm9j2dYdOicwSO6skU2NqvmfRcT7Id6DEVmzC1q35
         u4/Wqe662NNobm0EHj4rWnVe/SKAkqGUEZcgo/SaTfBszBcQZl7ybtTnggqb9FAnhYWN
         +Adbg03YpMEQfcz7Aw52NaPGBVMhddscy51ZMB8F9H8JgyHGS5HNk2okNl/8iyShCDmE
         EtpTDwZxs7k4vA9GpE+Wpxr2/mzycHv/UcXpC8AaZkm3iL0lVlc4o98rjwakr+oT6voh
         397Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=aIAeZsG5eHbIopwxGTAsKX3zqs0X8npyiNIkJNJZkK8=;
        b=ak+yhPevzL8GVf5p9v5ztXmLrCPRsExJhw4LQQ52Gf8UUcJ8Foanbz8FmYS9wRcPh9
         jWfKIqznaLhNu3AjXr+BKhuv+h375J4Ba0u78VR7FsaGRhbcp+utsLnHkb/1n1wE9501
         NuNLm2Np6qxB5NAS8KF8JtTIkez7W2G/cA6oUTcT+Zzr0szcq00M67IanRJ3ZOdRapNk
         7GTViWmFBu+ZA6sKOEL3mYDO8QOlR2oxV5ae+rhTtUB7beHEzbnS9hvNjRBUfRabmy7Y
         C3et1Gq2KjJ1enAniIAfwNQd7dNBVIw2jnoHcN0HBz/UsB24kBbIuIInEZv3lNKnd4mz
         ye9g==
X-Gm-Message-State: ACgBeo1qYHzbhO9AlmUNi4utlSSlDycp+cCxzQbWGuaHJ+DOjHrR3y+2
	wTJYPL+ETLPkoyDPfrXWhc/+t4Lby0eU6UlGIkAbo9uGqYU=
X-Google-Smtp-Source: 
 AA6agR5Ejz+9Gz7wywx0M4KsQZLNFCrQ6oLrdHW6dNLQL3IhS/8sjf+uygpes/QKnp6SUasZe25Z8NTTyIvhlVd5Dhs=
X-Received: by 2002:a17:907:94c2:b0:73d:c534:1ac0 with SMTP id
 dn2-20020a17090794c200b0073dc5341ac0mr14489638ejc.461.1662858070289; Sat, 10
 Sep 2022 18:01:10 -0700 (PDT)
MIME-Version: 1.0
From: Joel Winarske <joel.winarske@gmail.com>
Date: Sat, 10 Sep 2022 18:00:59 -0700
Message-ID: 
 <CABKMkP+m5xNYv5aDL-YM=xbaOx+dnYEiZQbMm4wFmk=FTB+M1Q@mail.gmail.com>
Subject: Kirkstone Rust - native only error
To: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000097713905e85c5065"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 01:01:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170514

--00000000000097713905e85c5065
Content-Type: text/plain; charset="UTF-8"

I'm putting together a recipe that requires two passes, native, then
target.  I'm hitting a python error only in the native pass.  I can cross
compile the tool without error, so the problem is  isolated to native.  Any
ideas?

Recipe is progress:
https://github.com/meta-flutter/meta-flutter/blob/jw/membrane/recipes-devtools/membrane/membrane-example_git.bb

Thanks,
Joel

| error: linking with
`/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-
rust-ccld` failed: exit status: 1
528
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:529>|
|
529
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:530>|
= note:
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-
rust-ccld"
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.0.rcgu.o"
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.1.rcgu.o"
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.10.rcgu.o"
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/tar...

530
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:531>|
= note: Traceback (most recent call last):
531
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:532>|
File
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-
rust-ccld", line 6, in <module>
532
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:533>|
os.execvp(binary, args)
533
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:534>|
File
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py",
line 574, in execvp
534
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:535>|
_execvpe(file, args)
535
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:536>|
File
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py",
line 616, in _execvpe
536
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:537>|
raise last_exc
537
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:538>|
File
"/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py",
line 607, in _execvpe
538
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:539>|
exec_func(fullname, *argrest)
539
<https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:540>|
FileNotFoundError: [Errno 2] No such file or directory

--00000000000097713905e85c5065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m putting together a recipe that requires two p=
asses, native, then target.=C2=A0 I&#39;m hitting a python error only in th=
e native pass.=C2=A0 I can cross compile the tool without error, so the pro=
blem is =C2=A0isolated to native.=C2=A0 Any ideas?<br></div><div><br></div>=
<div>Recipe is progress:</div><div><a href=3D"https://github.com/meta-flutt=
er/meta-flutter/blob/jw/membrane/recipes-devtools/membrane/membrane-example=
_git.bb">https://github.com/meta-flutter/meta-flutter/blob/jw/membrane/reci=
pes-devtools/membrane/membrane-example_git.bb</a><br></div><div><br></div><=
div>Thanks,</div><div>Joel</div><div><div><br></div><div><div style=3D"box-=
sizing:border-box;color:rgb(201,209,217);font-family:ui-monospace,SFMono-Re=
gular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monosp=
ace;font-size:12px"><div class=3D"gmail-js-check-step-line gmail-CheckStep-=
line gmail-d-flex gmail-log-line-plain" style=3D"box-sizing:border-box;line=
-height:20px;display:flex"><span class=3D"gmail-CheckStep-line-content gmai=
l-d-inline-block gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" st=
yle=3D"box-sizing:border-box;overflow-x:auto;white-space:pre-wrap;margin-le=
ft:16px;display:inline-block"><span class=3D"gmail-" style=3D"box-sizing:bo=
rder-box">| error: linking with `/__w/meta-flutter/yocto-kirkstone/build/tm=
p/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapp=
er/target-<span class=3D"gmail-dt-fm" style=3D"box-sizing:border-box;paddin=
g-top:2px;padding-bottom:1px;border-radius:2px">rust</span>-ccld` failed: e=
xit status: 1
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:529" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">528</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|   |
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:530" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">529</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|   =
=3D note: &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-lin=
ux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-<span c=
lass=3D"gmail-dt-fm" style=3D"box-sizing:border-box;padding-top:2px;padding=
-bottom:1px;border-radius:2px">rust</span>-ccld&quot; &quot;/__w/meta-flutt=
er/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.=
AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c=
0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.0=
.rcgu.o&quot; &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64=
-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug=
/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65=
d.build_script_build.c34fd75e-cgu.1.rcgu.o&quot; &quot;/__w/meta-flutter/yo=
cto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOI=
NC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d=
/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.10.rcg=
u.o&quot; &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-lin=
ux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/tar...
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:531" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">530</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|   =
=3D note: Traceback (most recent call last):
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:532" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">531</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
         File &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64=
-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-<sp=
an class=3D"gmail-dt-fm" style=3D"box-sizing:border-box;padding-top:2px;pad=
ding-bottom:1px;border-radius:2px">rust</span>-ccld&quot;, line 6, in &lt;m=
odule&gt;
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:533" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">532</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
           os.execvp(binary, args)
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:534" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">533</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
         File &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64=
-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-nat=
ive/usr/lib/python3.10/os.py&quot;, line 574, in execvp
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:535" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">534</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
           _execvpe(file, args)
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:536" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">535</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
         File &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64=
-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-nat=
ive/usr/lib/python3.10/os.py&quot;, line 616, in _execvpe
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:537" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">536</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
           raise last_exc
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:538" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">537</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
         File &quot;/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64=
-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-nat=
ive/usr/lib/python3.10/os.py&quot;, line 607, in _execvpe
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:539" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">538</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
           exec_func(fullname, *argrest)
</span></span></div></div><div style=3D"box-sizing:border-box;color:rgb(201=
,209,217);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px"><div class=
=3D"gmail-js-check-step-line gmail-CheckStep-line gmail-d-flex gmail-log-li=
ne-plain" style=3D"box-sizing:border-box;line-height:20px;display:flex"><a =
class=3D"gmail-CheckStep-line-number gmail-d-inline-block gmail-text-mono g=
mail-text-normal gmail-flex-shrink-0" href=3D"https://github.com/meta-flutt=
er/meta-flutter/runs/8288580694?check_suite_focus=3Dtrue#step:9:540" style=
=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:hidden;t=
ext-align:right;text-overflow:ellipsis;white-space:nowrap;display:inline-bl=
ock">539</a><span class=3D"gmail-CheckStep-line-content gmail-d-inline-bloc=
k gmail-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizi=
ng:border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display=
:inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">|    =
       FileNotFoundError: [Errno 2] No such file or directory</span></span>=
</div></div><div><br></div><div><br></div></div></div></div>

--00000000000097713905e85c5065--

