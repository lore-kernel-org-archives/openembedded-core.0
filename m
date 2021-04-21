Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.13334.1619016204772769579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 07:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=imb4jJa5;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id z25so8654949qtn.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=GEDglUbzed1RoaoWXbXWbpO3pHHhcaM6q0uEso48mSo=;
        b=imb4jJa5If3hcxOsLp8MW+nO8GGik0MG2J/AiUcWFNY6d79dkeLy7WCnm0R38xdqmx
         68BY3DE6OPu5IP6PiO8NmGqKmuFeDH2qZ6Pwgpy0NKpXeYO1VIovc8LF90uAhfRMxblK
         Fp5QEFEP2W9Xzl1FKdat0y+JRbnBuiG9EYG40Akh80Q/a+dsZ26QpKdgoAEvW7wDkCFp
         rILehRupv8U17yRFLovDGPkV2WzJJASQQ7GKA80a8b9j5Msigd1WTYRF4/XWdj3dDqiH
         5Ja3VTe7N9Wfa6G67A4mzfAXyoaFHo5hErPSM4AwWQN9kVlj9qOOFmiSRdNUglGvUkB5
         uoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=GEDglUbzed1RoaoWXbXWbpO3pHHhcaM6q0uEso48mSo=;
        b=dT1NXsH/kzyAMTRroi1dAUH2BFSzbgrHkKXNtycYeFIS8+w6B/EVC9Nm3vvNYVkm3M
         KYGd6FRfCYPGht1nA8f4ugJqQ0O2xxp3b4cs/1NPd8tc04UQvNrgAXRyjFg4KiQwuOhr
         KcfK7DS6xlr8Lnho9fedCqB9a0ymDzbL5+k2rVIfVGXztbFNfPR8Cskb61FFGQVHLmWE
         vszeMQlQp56wtoPvY5etzIA9xW3+xay89gZucaN/r8Q5+Zu3q6g9N/M3PyoPvhRu9DkK
         n2Kl56/sJ+TOzNxRwOFm7ZqZg5Xk3EN7iwjJjIu2lM75odGvL4DOrxMRS9NoU74oFx+q
         U79A==
X-Gm-Message-State: AOAM533ZlkPB6suMsb47P8rMKk34BpZrzIEGI9EJ5oPyOfqvak461dOo
	BVbI9NMjir2MueRebPw3WQI=
X-Google-Smtp-Source: ABdhPJxKzQSJr1THbfgHNLryQuQ64Rfn10kRQw7pVimRPx/ip840sGc2lP292pxKz8/GpM8gsH/snQ==
X-Received: by 2002:a05:622a:100e:: with SMTP id d14mr5078739qte.143.1619016203879;
        Wed, 21 Apr 2021 07:43:23 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:5a6:d70e:b7c1:9e86? ([2804:14d:5487:a7d6:5a6:d70e:b7c1:9e86])
        by smtp.gmail.com with ESMTPSA id j185sm2300774qke.1.2021.04.21.07.43.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 07:43:23 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Message-Id: <F23C2F80-7F48-4384-A946-34152D4FCBDD@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Wed, 21 Apr 2021 11:43:18 -0300
In-Reply-To: <CAMKF1sqYpfoFeThNAJDyhH5KZgpbBS2TRj8CSmiiyK_edqBkJw@mail.gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1sqYpfoFeThNAJDyhH5KZgpbBS2TRj8CSmiiyK_edqBkJw@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AF545DA3-A70C-465D-A8A8-56DA9E7C59E7"

--Apple-Mail=_AF545DA3-A70C-465D-A8A8-56DA9E7C59E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I created an image for Raspberry Pi Zero W from code at https://github.com/=
tewarid/docker-meta-raspberrypi/tree/sstate <https://github.com/tewarid/doc=
ker-meta-raspberrypi/tree/sstate>, using Docker for macOS, and on Ubuntu 20=
.04-LTS, and wrote it out to an SDCard using bmaptool. Booted and checked t=
hat busybox symlinks in rootfs look all right.

> Em 21 de abr. de 2021, =C3=A0(s) 02:22, Khem Raj <raj.khem@gmail.com> es=
creveu:
>=20
> =EF=BB=BFNone of my images are bootable when this patch is applied, beca=
use
> symlinks that busybox should provide arent created in the image. This
> patch should be looked into a bit further,  how was it tested ?
>=20
>> On Mon, Apr 19, 2021 at 11:43 AM Devendra Tewari
>> <devendra.tewari@gmail.com> wrote:
>>=20
>>=20
>>=20
>>>> On 30 Mar 2021, at 08:55, Devendra Tewari <devendra.tewari@gmail.com>=
 wrote:
>>>=20
>>> I understand that parallel tasks can result in such issues, but would =
expect some kind of dependency graph that would prevent them from happening=
. I wish I had more time to understand the issue fully.
>>>=20
>>> Here=E2=80=99s the last version of my patch that still uses os.rename,=
 and on error uses shutil.move, with the reasoning explained in the commit =
message. There are tons of os.rename in code elsewhere, and I=E2=80=99ve en=
countered similar issues when doing incremental builds, but I=E2=80=99ll le=
ave fixing them to those with more time at hand. Cheers.
>>=20
>> Here=E2=80=99s a patch that catches error with all os.rename in the cod=
e, and retries with shutil.move when that happens.
>>=20
>>=20
>>>=20
>>> From aeba1f9728f69cdf2ce4ba285be86761d8024f9d Mon Sep 17 00:00:00 2001
>>> From: Devendra Tewari <devendra.tewari@gmail.com>
>>> Date: Tue, 30 Mar 2021 08:27:40 -0300
>>> Subject: [PATCH] Use shutil.move when os.rename fails
>>>=20
>>> Incremental build in Docker fails with
>>>=20
>>> OSError: [Errno 18] Invalid cross-device link
>>>=20
>>> When source and destination are on different overlay filesystems.
>>>=20
>>> This change handles error with os.rename and retries with shutil.move.
>>> The reason os.rename is still used is because shutil.move is too slow
>>> for speed sensitive sections of code.
>>> ---
>>> meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
>>> 1 file changed, 18 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>> index f579168162..301dfc27db 100644
>>> --- a/meta/classes/sstate.bbclass
>>> +++ b/meta/classes/sstate.bbclass
>>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>> def sstate_installpkgdir(ss, d):
>>>   import oe.path
>>>   import subprocess
>>> +    import shutil
>>>=20
>>>   sstateinst =3D d.getVar("SSTATE_INSTDIR")
>>>   d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>>> @@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
>>>=20
>>>   for state in ss['dirs']:
>>>       prepdir(state[1])
>>> -        os.rename(sstateinst + state[0], state[1])
>>> +        try:
>>> +            os.rename(sstateinst + state[0], state[1])
>>> +        except OSError:
>>> +            shutil.move(sstateinst + state[0], state[1])
>>>   sstate_install(ss, d)
>>>=20
>>>   for plain in ss['plaindirs']:
>>> @@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
>>>       dest =3D plain
>>>       bb.utils.mkdirhier(src)
>>>       prepdir(dest)
>>> -        os.rename(src, dest)
>>> +        try:
>>> +            os.rename(src, dest)
>>> +        except OSError:
>>> +            shutil.move(src, dest)
>>>=20
>>>   return True
>>>=20
>>> @@ -638,6 +645,7 @@ python sstate_hardcode_path () {
>>>=20
>>> def sstate_package(ss, d):
>>>   import oe.path
>>> +    import shutil
>>>=20
>>>   tmpdir =3D d.getVar('TMPDIR')
>>>=20
>>> @@ -664,7 +672,10 @@ def sstate_package(ss, d):
>>>                   continue
>>>               bb.error("sstate found an absolute path symlink %s point=
ing at %s. Please replace this with a relative link." % (srcpath, link))
>>>       bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1],=
 sstatebuild + state[0]))
>>> -        os.rename(state[1], sstatebuild + state[0])
>>> +        try:
>>> +            os.rename(state[1], sstatebuild + state[0])
>>> +        except OSError:
>>> +            shutil.move(state[1], sstatebuild + state[0])
>>>=20
>>>   workdir =3D d.getVar('WORKDIR')
>>>   sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>>> @@ -674,7 +685,10 @@ def sstate_package(ss, d):
>>>           pdir =3D plain.replace(sharedworkdir, sstatebuild)
>>>       bb.utils.mkdirhier(plain)
>>>       bb.utils.mkdirhier(pdir)
>>> -        os.rename(plain, pdir)
>>> +        try:
>>> +            os.rename(plain, pdir)
>>> +        except OSError:
>>> +            shutil.move(plain, pdir)
>>>=20
>>>   d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>>   d.setVar('SSTATE_INSTDIR', sstatebuild)
>>> --
>>> 2.29.2
>>>=20
>>>=20
>>>> On 30 Mar 2021, at 08:10, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
>>>>=20
>>>> On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
>>>>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
>>>>> <devendra.tewari@gmail.com> wrote:
>>>>>>=20
>>>>>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
>>>>>>=20
>>>>>> Here=E2=80=99s the updated patch (or should I submit it again via g=
it send-email?)
>>>>>=20
>>>>> It would be better to use shutil.move unconditionally in all cases,
>>>>> rather than have a separate shutil.move code path which only gets
>>>>> tested by people doing incremental builds in docker.
>>>>=20
>>>> This is a speed sensitive section of code and shutil has traditionall=
y proved
>>>> to be slow so I disagree with that, rename is very much preferred her=
e where
>>>> we can.
>>>>=20
>>>> Cheers,
>>>>=20
>>>> Richard
>>>>=20
>>>>=20
>>>=20
>>=20
>>=20
>>=20
>>=20

--Apple-Mail=_AF545DA3-A70C-465D-A8A8-56DA9E7C59E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><div>I created an image f=
or Raspberry Pi Zero W from code at&nbsp;<a href=3D"https://github.com/tewa=
rid/docker-meta-raspberrypi/tree/sstate" class=3D"">https://github.com/tewa=
rid/docker-meta-raspberrypi/tree/sstate</a>, using Docker for macOS, and on=
 Ubuntu 20.04-LTS, and wrote it out to an SDCard using bmaptool. Booted and=
 checked that busybox symlinks in rootfs look all right.</div><div><br clas=
s=3D""><blockquote type=3D"cite" class=3D"">Em 21 de abr. de 2021, =C3=A0(s=
) 02:22, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.=
khem@gmail.com</a>&gt; escreveu:<br class=3D""><br class=3D"">=EF=BB=BFNone=
 of my images are bootable when this patch is applied, because<br class=3D"=
">symlinks that busybox should provide arent created in the image. This<br =
class=3D"">patch should be looked into a bit further, &nbsp;how was it test=
ed ?<br class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On M=
on, Apr 19, 2021 at 11:43 AM Devendra Tewari<br class=3D"">&lt;<a href=3D"m=
ailto:devendra.tewari@gmail.com" class=3D"">devendra.tewari@gmail.com</a>&g=
t; wrote:<br class=3D""><br class=3D""><br class=3D""><br class=3D""><block=
quote type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">On 30 M=
ar 2021, at 08:55, Devendra Tewari &lt;<a href=3D"mailto:devendra.tewari@gm=
ail.com" class=3D"">devendra.tewari@gmail.com</a>&gt; wrote:<br class=3D"">=
</blockquote><br class=3D"">I understand that parallel tasks can result in =
such issues, but would expect some kind of dependency graph that would prev=
ent them from happening. I wish I had more time to understand the issue ful=
ly.<br class=3D""><br class=3D"">Here=E2=80=99s the last version of my patc=
h that still uses os.rename, and on error uses shutil.move, with the reason=
ing explained in the commit message. There are tons of os.rename in code el=
sewhere, and I=E2=80=99ve encountered similar issues when doing incremental=
 builds, but I=E2=80=99ll leave fixing them to those with more time at hand=
. Cheers.<br class=3D""></blockquote><br class=3D"">Here=E2=80=99s a patch =
that catches error with all os.rename in the code, and retries with shutil.=
move when that happens.<br class=3D""><br class=3D""><br class=3D""><blockq=
uote type=3D"cite" class=3D""><br class=3D"">From aeba1f9728f69cdf2ce4ba285=
be86761d8024f9d Mon Sep 17 00:00:00 2001<br class=3D"">From: Devendra Tewar=
i &lt;<a href=3D"mailto:devendra.tewari@gmail.com" class=3D"">devendra.tewa=
ri@gmail.com</a>&gt;<br class=3D"">Date: Tue, 30 Mar 2021 08:27:40 -0300<br=
 class=3D"">Subject: [PATCH] Use shutil.move when os.rename fails<br class=
=3D""><br class=3D"">Incremental build in Docker fails with<br class=3D"">=
<br class=3D"">OSError: [Errno 18] Invalid cross-device link<br class=3D"">=
<br class=3D"">When source and destination are on different overlay filesys=
tems.<br class=3D""><br class=3D"">This change handles error with os.rename=
 and retries with shutil.move.<br class=3D"">The reason os.rename is still =
used is because shutil.move is too slow<br class=3D"">for speed sensitive s=
ections of code.<br class=3D"">---<br class=3D"">meta/classes/sstate.bbclas=
s | 22 ++++++++++++++++++----<br class=3D"">1 file changed, 18 insertions(+=
), 4 deletions(-)<br class=3D""><br class=3D"">diff --git a/meta/classes/ss=
tate.bbclass b/meta/classes/sstate.bbclass<br class=3D"">index f579168162..=
301dfc27db 100644<br class=3D"">--- a/meta/classes/sstate.bbclass<br class=
=3D"">+++ b/meta/classes/sstate.bbclass<br class=3D"">@@ -384,6 +384,7 @@ =
def sstate_installpkg(ss, d):<br class=3D"">def sstate_installpkgdir(ss, d)=
:<br class=3D""> &nbsp;&nbsp;import oe.path<br class=3D""> &nbsp;&nbsp;impo=
rt subprocess<br class=3D"">+ &nbsp;&nbsp;&nbsp;import shutil<br class=3D""=
><br class=3D""> &nbsp;&nbsp;sstateinst =3D d.getVar("SSTATE_INSTDIR")<br c=
lass=3D""> &nbsp;&nbsp;d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])<br class=
=
=3D"">@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):<br class=3D"">=
<br class=3D""> &nbsp;&nbsp;for state in ss['dirs']:<br class=3D""> &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prepdir(state[1])<br class=3D"">- &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(sstateinst + state[0], state[1])<br=
 class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:<br class=3D"">=
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rena=
me(sstateinst + state[0], state[1])<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;except OSError:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(sstateinst + state[0]=
, state[1])<br class=3D""> &nbsp;&nbsp;sstate_install(ss, d)<br class=3D"">=
<br class=3D""> &nbsp;&nbsp;for plain in ss['plaindirs']:<br class=3D"">@@ =
-413,7 +417,10 @@ def sstate_installpkgdir(ss, d):<br class=3D""> &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;dest =3D plain<br class=3D""> &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;bb.utils.mkdirhier(src)<br class=3D""> &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;prepdir(dest)<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;os.rename(src, dest)<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;try:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(src, dest)<br class=3D"">+ &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSError:<br class=3D"">+ &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(src, =
dest)<br class=3D""><br class=3D""> &nbsp;&nbsp;return True<br class=3D""><=
br class=3D"">@@ -638,6 +645,7 @@ python sstate_hardcode_path () {<br class=
=
=3D""><br class=3D"">def sstate_package(ss, d):<br class=3D""> &nbsp;&nbsp=
;import oe.path<br class=3D"">+ &nbsp;&nbsp;&nbsp;import shutil<br class=3D=
""><br class=3D""> &nbsp;&nbsp;tmpdir =3D d.getVar('TMPDIR')<br class=3D"">=
<br class=3D"">@@ -664,7 +672,10 @@ def sstate_package(ss, d):<br class=3D"=
"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue<br class=3D""> &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.err=
or("sstate found an absolute path symlink %s pointing at %s. Please replace=
 this with a relative link." % (srcpath, link))<br class=3D""> &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;bb.debug(2, "Preparing tree %s for packaging at %s"=
 % (state[1], sstatebuild + state[0]))<br class=3D"">- &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;os.rename(state[1], sstatebuild + state[0])<br class=
=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:<br class=3D"">+ &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(st=
ate[1], sstatebuild + state[0])<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;except OSError:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(state[1], sstatebuild + s=
tate[0])<br class=3D""><br class=3D""> &nbsp;&nbsp;workdir =3D d.getVar('WO=
RKDIR')<br class=3D""> &nbsp;&nbsp;sharedworkdir =3D os.path.join(d.getVar(=
'TMPDIR'), "work-shared")<br class=3D"">@@ -674,7 +685,10 @@ def sstate_pac=
kage(ss, d):<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;pdir =3D plain.replace(sharedworkdir, sstatebuild)<br class=3D=
""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.utils.mkdirhier(plain)<br class=
=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.utils.mkdirhier(pdir)<br cla=
ss=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(plain, pdir)<=
br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:<br class=3D"=
">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.re=
name(plain, pdir)<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;except OSError:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(plain, pdir)<br class=3D""><br class=3D=
""> &nbsp;&nbsp;d.setVar('SSTATE_BUILDDIR', sstatebuild)<br class=3D""> &nb=
sp;&nbsp;d.setVar('SSTATE_INSTDIR', sstatebuild)<br class=3D"">--<br class=
=3D"">2.29.2<br class=3D""><br class=3D""><br class=3D""><blockquote type=
=3D"cite" class=3D"">On 30 Mar 2021, at 08:10, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" class=3D"">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br class=3D""><br class=3D"">On Mon, 2021=
-03-29 at 16:00 -0700, Andre McCurdy wrote:<br class=3D""><blockquote type=
=3D"cite" class=3D"">On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari<br cl=
ass=3D"">&lt;<a href=3D"mailto:devendra.tewari@gmail.com" class=3D"">devend=
ra.tewari@gmail.com</a>&gt; wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D"">Thanks! My bad. The example I looked up in Python=
 docs had a break and I just realized it was a looping example.<br class=3D=
""><br class=3D"">Here=E2=80=99s the updated patch (or should I submit it a=
gain via git send-email?)<br class=3D""></blockquote><br class=3D"">It woul=
d be better to use shutil.move unconditionally in all cases,<br class=3D"">=
rather than have a separate shutil.move code path which only gets<br class=
=3D"">tested by people doing incremental builds in docker.<br class=3D""><=
/blockquote><br class=3D"">This is a speed sensitive section of code and sh=
util has traditionally proved<br class=3D"">to be slow so I disagree with t=
hat, rename is very much preferred here where<br class=3D"">we can.<br clas=
s=3D""><br class=3D"">Cheers,<br class=3D""><br class=3D"">Richard<br class=
=
=3D""><br class=3D""><br class=3D""></blockquote><br class=3D""></blockquo=
te><br class=3D""><br class=3D""><br class=3D""><br class=3D""></blockquote=
></blockquote></div></body></html>

--Apple-Mail=_AF545DA3-A70C-465D-A8A8-56DA9E7C59E7--
