Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.1149.1617143943971038847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 15:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GR5inUrD;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id u8so13101187qtq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 15:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=13UWOv8Hwz/cG9OCdqYSfTeMG25eUUcQYTY3x+OOJ30=;
        b=GR5inUrDCY/+1aNGj2R3OTNdWR4GVN78yqAcqzpqf6q/hYcewnlISv4ymAWGmPMPf8
         vmKZtqiy4EKySZ/tXYamuz05h1hEKk9tL6js9sVT0x6365DQ+lOXCQ/839PwXa/9h8Qz
         HUMM0rEZ5i37g+WQJWx3pblQE7h3vrw60gvwq1NkNLm7kCs5N/CyjmlRb0Yx39uheTae
         JTc0Jqg1NBUDWBhlya+cbmREVPBtN1kfpo9eOFoH0O/G+YeW8K2isIqYBd57W0v54Uuz
         I0LpgFxiPy3kRL5iYIGDK4HvqzNWmkJpjbxshon5rSUiSKQtYWl+MlHRri4YFCs6ji3m
         WoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=13UWOv8Hwz/cG9OCdqYSfTeMG25eUUcQYTY3x+OOJ30=;
        b=RJ30LupygK3iAOtJwlpy3C77/+ufNYhE+3BJ5O+vuxJOr3z9OQ+Axj/Pu+4z7UXVI0
         GYgF2UgQJZzwCvLHEh2oZPJtNjKw1K+pgXqyFEljAEg1+KfuVX0p1J2QBeABua9+8fTL
         2x+q4OWSeGXBAzVe3hyQ0zCSCrvGcgZGmCShxVuy2I1A34czyIo6pOLxsivjDyAXIQ8R
         UX87e/xDNb4EXW5dm4lHv/L+3twE9wQf2+yzU5gsoydd9zgwJH1guFOQmBCIHqrig2ZR
         utMYW/n65XR+WyLWkm91/F38OenmW9z4iQJQ7A73zJb7zwdZ9POy+Ok/1ug9owjsmo6e
         dvWg==
X-Gm-Message-State: AOAM533GIADrhHP46I0beu6ZKQ7tSnJ72WlwIjpmf+euIEbzsNC0hpch
	vtfwi6Pr05OEXaU4dT5CA1o=
X-Google-Smtp-Source: ABdhPJxUu2aBKxD2bSgrONub99Ua3S8IYkfDCSv3h0NLUZ3Idxi7vpDZE//Hzg4aBFqG643jVXLTGg==
X-Received: by 2002:ac8:72c5:: with SMTP id o5mr45948qtp.279.1617143943063;
        Tue, 30 Mar 2021 15:39:03 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:8c90:735:f245:a57b? ([2804:14d:5487:a7d6:8c90:735:f245:a57b])
        by smtp.gmail.com with ESMTPSA id m25sm257632qtq.59.2021.03.30.15.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 15:39:02 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Tue, 30 Mar 2021 19:38:59 -0300
Message-Id: <3FA0EC13-0FC5-4E14-AC33-731A23F515F9@gmail.com>
References: <20210330215941.GD23013@denix.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
In-Reply-To: <20210330215941.GD23013@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: iPhone Mail (18D70)
Content-Type: multipart/alternative; boundary=Apple-Mail-396BF139-96C4-4DEE-9F8B-98C9A5C8630E
Content-Transfer-Encoding: 7bit

--Apple-Mail-396BF139-96C4-4DEE-9F8B-98C9A5C8630E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Here's the correct link https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14301. I'll resubmit the patch referencing the bug in the commit message. Th=
anks.

> Em 30 de mar. de 2021, =C3=A0(s) 18:59, Denys Dmytriyenko <denis@denix.org=
> escreveu:
>=20
> =EF=BB=BFThe link is for a 10-year old bug, probably not what you wanted.
> Also, if a patch fixes existing bug in bugzilla, it needs to reference it i=
n=20
> commit message as well - [YOCTO#1234567]
>=20
>=20
>> On Mon, Mar 29, 2021 at 12:37:45PM -0300, Devendra Tewari wrote:
>> Also, this is due to https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
1430.
>>=20
>>>> On 29 Mar 2021, at 12:35, Devendra Tewari <devendra.tewari@gmail.com> w=
rote:
>>>=20
>>> Sure.
>>>=20
>>> Would the following commit message be sufficient?
>>>=20
>>>   Use shutil.move when os.rename fails
>>>=20
>>>   Incremental build in Docker fails with
>>>=20
>>>   OSError: [Errno 18] Invalid cross-device link
>>>=20
>>>   When source and destination are on different overlay filesystems.
>>>=20
>>>   This change handles the error with os.rename and retries with shutil.m=
ove.
>>>=20
>>> Thanks,
>>> Devendra
>>>=20
>>>> On 29 Mar 2021, at 12:23, Konrad Weihmann <kweihmann@outlook.com> wrote=
:
>>>>=20
>>>> Yes please quote a bit from the python manpage [1] - I certainly see th=
e difference (and the edge cases where os.rename might fail), but that shoul=
d be documented as part of the commit message
>>>>=20
>>>> [1] https://docs.python.org/3/library/shutil.html#shutil.move
>>>>=20
>>>> On 29.03.21 17:21, Bruce Ashfield wrote:
>>>>> Can you document the cases that os.rename() is failing ? And also why
>>>>> would we expect the shutil.move() to work in those cases ?
>>>>> If a change like this cases issues in the future, we need that extra
>>>>> information in the commit head for proper triage.
>>>>> Bruce
>>>>> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
>>>>> <devendra.tewari@gmail.com> wrote:
>>>>>>=20
>>>>>> ---
>>>>>> meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>>>>>> 1 file changed, 22 insertions(+), 4 deletions(-)
>>>>>>=20
>>>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclas=
s
>>>>>> index f579168162..f94aa96d70 100644
>>>>>> --- a/meta/classes/sstate.bbclass
>>>>>> +++ b/meta/classes/sstate.bbclass
>>>>>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>>>>> def sstate_installpkgdir(ss, d):
>>>>>>    import oe.path
>>>>>>    import subprocess
>>>>>> +    import shutil
>>>>>>=20
>>>>>>    sstateinst =3D d.getVar("SSTATE_INSTDIR")
>>>>>>    d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>>>>>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>>>>>>=20
>>>>>>    for state in ss['dirs']:
>>>>>>        prepdir(state[1])
>>>>>> -        os.rename(sstateinst + state[0], state[1])
>>>>>> +        try:
>>>>>> +            os.rename(sstateinst + state[0], state[1])
>>>>>> +            break
>>>>>> +        except OSError:
>>>>>> +            shutil.move(sstateinst + state[0], state[1])
>>>>>>    sstate_install(ss, d)
>>>>>>=20
>>>>>>    for plain in ss['plaindirs']:
>>>>>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>>>>>>        dest =3D plain
>>>>>>        bb.utils.mkdirhier(src)
>>>>>>        prepdir(dest)
>>>>>> -        os.rename(src, dest)
>>>>>> +        try:
>>>>>> +            os.rename(src, dest)
>>>>>> +            break
>>>>>> +        except OSError:
>>>>>> +            shutil.move(src, dest)
>>>>>>=20
>>>>>>    return True
>>>>>>=20
>>>>>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>>>>>>=20
>>>>>> def sstate_package(ss, d):
>>>>>>    import oe.path
>>>>>> +    import shutil
>>>>>>=20
>>>>>>    tmpdir =3D d.getVar('TMPDIR')
>>>>>>=20
>>>>>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>>>>>>                    continue
>>>>>>                bb.error("sstate found an absolute path symlink %s poi=
nting at %s. Please replace this with a relative link." % (srcpath, link))
>>>>>>        bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1=
], sstatebuild + state[0]))
>>>>>> -        os.rename(state[1], sstatebuild + state[0])
>>>>>> +        try:
>>>>>> +            os.rename(state[1], sstatebuild + state[0])
>>>>>> +            break
>>>>>> +        except OSError:
>>>>>> +            shutil.move(state[1], sstatebuild + state[0])
>>>>>>=20
>>>>>>    workdir =3D d.getVar('WORKDIR')
>>>>>>    sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>>>>>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>>>>>>            pdir =3D plain.replace(sharedworkdir, sstatebuild)
>>>>>>        bb.utils.mkdirhier(plain)
>>>>>>        bb.utils.mkdirhier(pdir)
>>>>>> -        os.rename(plain, pdir)
>>>>>> +        try:
>>>>>> +            os.rename(plain, pdir)
>>>>>> +            break
>>>>>> +        except OSError:
>>>>>> +            shutil.move(plain, pdir)
>>>>>>=20
>>>>>>    d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>>>>>    d.setVar('SSTATE_INSTDIR', sstatebuild)
>>>>>> --
>>>>>> 2.29.2
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>=20
>>=20

--Apple-Mail-396BF139-96C4-4DEE-9F8B-98C9A5C8630E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">Here's the correct link&nb=
sp;<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14301">htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14301</a>. I'll resubmit th=
e patch referencing the bug in the commit message. Thanks.</div><div dir=3D"=
ltr"><br><blockquote type=3D"cite">Em 30 de mar. de 2021, =C3=A0(s) 18:59, D=
enys Dmytriyenko &lt;denis@denix.org&gt; escreveu:<br><br></blockquote></div=
><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>The link is for a=
 10-year old bug, probably not what you wanted.</span><br><span>Also, if a p=
atch fixes existing bug in bugzilla, it needs to reference it in </span><br>=
<span>commit message as well - [YOCTO#1234567]</span><br><span></span><br><s=
pan></span><br><span>On Mon, Mar 29, 2021 at 12:37:45PM -0300, Devendra Tewa=
ri wrote:</span><br><blockquote type=3D"cite"><span>Also, this is due to htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1430.</span><br></blockquot=
e><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>On 29 Mar 2021, at 12:35, Devendra Te=
wari &lt;devendra.tewari@gmail.com&gt; wrote:</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>Sure.</span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>Would the following commit=
 message be sufficient?</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;Us=
e shutil.move when os.rename fails</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nb=
sp;&nbsp;Incremental build in Docker fails with</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span> &nbsp;&nbsp;OSError: [Errno 18] Invalid cross-device link</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span> &nbsp;&nbsp;When source and destination are on=
 different overlay filesystems.</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
&nbsp;This change handles the error with os.rename and retries with shutil.m=
ove.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>Thanks,</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Devendra=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 29 Mar 20=
21, at 12:23, Konrad Weihmann &lt;kweihmann@outlook.com&gt; wrote:</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>Yes please quote a bit from the python manpage=
 [1] - I certainly see the difference (and the edge cases where os.rename mi=
ght fail), but that should be documented as part of the commit message</span=
><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>[1] https://docs.python.org/3/library/shut=
il.html#shutil.move</span><br></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
></span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 29.03.21 17:21=
, Bruce Ashfield wrote:</span><br></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>Can you document the cases that os.rename() i=
s failing ? And also why</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>would we expect the shutil.move=
() to work in those cases ?</span><br></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>If a change like this cases i=
ssues in the future, we need that extra</span><br></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>information in t=
he commit head for proper triage.</span><br></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>Bruce</span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>&lt=
;devendra.tewari@gmail.com&gt; wrote:</span><br></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>---</spa=
n><br></blockquote></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>meta/classes/sstate.b=
bclass | 26 ++++++++++++++++++++++----</span><br></blockquote></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>1 file changed, 22 insertions(+), 4 deletions(-)</span>=
<br></blockquote></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>diff --git a/meta/classes/sstate.bbclas=
s b/meta/classes/sstate.bbclass</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>index f579168162..f94aa96d70 100644</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>--- a/meta/classes/sstate.bbclass</span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>+++ b/meta/classes/sstate.b=
bclass</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -384,6 +=
384,7 @@ def sstate_installpkg(ss, d):</span><br></blockquote></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>def sstate_installpkgdir(ss, d):</span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;import oe.path</span=
><br></blockquote></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;imp=
ort subprocess</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &=
nbsp;&nbsp;&nbsp;import shutil</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &n=
bsp;&nbsp;&nbsp;sstateinst =3D d.getVar("SSTATE_INSTDIR")</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;d.setVar('SSTATE_FI=
XMEDIR', ss['fixmedir'])</span><br></blockquote></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>@@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):</span><br></bl=
ockquote></blockquote></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;for state in ss['dirs']:</sp=
an><br></blockquote></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;prepdir(state[1])</span><br></blockquote></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.renam=
e(sstateinst + state[0], state[1])</span><br></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(sstateinst + state[0], s=
tate[1])</span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break</span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;except OSError:</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;shutil.move(sstateinst + state[0], state[1])</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;sstate_install(ss, d)</s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;for plain in ss['p=
laindirs']:</span><br></blockquote></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -4=
13,7 +418,11 @@ def sstate_installpkgdir(ss, d):</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d=
est =3D plain</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.utils.mkdirhier(src)</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;prepdir(dest)</span><br></blockquote></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(src, dest)<=
/span><br></blockquote></blockquote></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;try:</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;os.rename(src, dest)</span><br></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;break</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSError:</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(src, dest)</span><br></blockquote></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span></span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> &nbsp;&nbsp;&nbsp;return True</span><br></blockquote></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>@@ -638,6 +647,7 @@ python sstate_hardcode_path () {</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>def sstate_package(ss, d):</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;import oe.path</sp=
an><br></blockquote></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=
import shutil</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;=
tmpdir =3D d.getVar('TMPDIR')</span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -=
664,7 +674,11 @@ def sstate_package(ss, d):</span><br></blockquote></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue</=
span><br></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.=
error("sstate found an absolute path symlink %s pointing at %s. Please repla=
ce this with a relative link." % (srcpath, link))</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild=
 + state[0]))</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(state[1], sstatebuild + s=
tate[0])</span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:</span><br></blockquote></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.rename(state[1], sstatebuild + state[0])</span><br></bloc=
kquote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSErro=
r:</span><br></blockquote></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(state[1], s=
statebuild + state[0])</span><br></blockquote></blockquote></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span></span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbs=
p;&nbsp;workdir =3D d.getVar('WORKDIR')</span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span> &nbsp;&nbsp;&nbsp;sharedworkdir =3D os.path.join(d.g=
etVar('TMPDIR'), "work-shared")</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>@@ -674,7 +688,11 @@ def sstate_package(ss, d):</span><br></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pdir =3D plain.replace(sharedworkdir, sst=
atebuild)</span><br></blockquote></blockquote></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.utils.mkdirhier(plain)</span><br></bl=
ockquote></blockquote></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;bb.utils.mkdirhier(pdir)</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(pla=
in, pdir)</span><br></blockquote></blockquote></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;os.rename(plain, pdir)</span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;break</span><br></blockquote></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSError:</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(plain, pdir)</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;d.setVar('SSTATE_BUILDDIR'=
, sstatebuild)</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &=
nbsp;&nbsp;&nbsp;d.setVar('SSTATE_INSTDIR', sstatebuild)</span><br></blockqu=
ote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>--</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>2.29.2</span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><span></span><br></blockquote></div></blockquot=
e></body></html>=

--Apple-Mail-396BF139-96C4-4DEE-9F8B-98C9A5C8630E--
