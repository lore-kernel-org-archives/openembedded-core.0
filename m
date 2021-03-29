Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.23822.1617032270119638715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IFzvyqE9;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id l13so9581577qtu.9
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BE5LD9WgXUd+/EPu2QVKbha7LKhn7ldaqnMZ80kDrXw=;
        b=IFzvyqE9iJgJPyokx/WcBaREMqoB0G+zTYckocMuPt689KouWTM8ljE8Gt4XkqJ4Ad
         RuokT+flW/IaoZVe0wv9/cbea39e0MnNtHtNdLD8+61XPRiUJeVq40iOXzQ4tGL55/nQ
         lRlwW0pQzoPChWZNNCnmUR2HQZ0tVtP/ZCRXACG9ATYfjcFfvtL8DlSbKaBB5FqBwP9Q
         Rrl3B2kBu376O6Ovv9t4qyUKT2Kmnfx+wdViNyelaopQbekDGSDkUB/I0OCymI4osjPq
         7Vb0nTTYv0I/dSaGJnUFlEC3keS6HXGriTLqwDBE1AvnZIr8Mg8dZQDwztcEcIUv7/G+
         aV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BE5LD9WgXUd+/EPu2QVKbha7LKhn7ldaqnMZ80kDrXw=;
        b=fMKjw0OFn61dyiXrXyagVm8loneM2L90NA0sjioa5vGzliVA1bM1yJCvTeH3fvuHWA
         zNQDjl+o8ZTrB4E8N35jm4pPHxFbMNq6LL2US4ACP4ucPZmQE3oMkJ6vj/Yt1u4pg9/7
         UJHMG16ENi1FeISCbU36jBoHIbdL6iJKSLMp0kvMH2DA8npS++oNlY2xdJS4LEc8qwOX
         aFL0VDwezDqWu33dBIYoEsdzwbhH9xKFjSMgyEN6sibMP8oIgRfOw8Ykv3SYCCgiZokX
         9lXp7CYLYtfOrDpK5QpF1UNeWn0txpmycv9VySTDe/z21MVAMnppE1BSHs/3QkdnVC23
         Rk1g==
X-Gm-Message-State: AOAM533HUcUieo9zd56AGK/zbW/NmQq/EqzGZxM7BdKyYqC5KwUWya/3
	++xXS0TtwfUG6RkiWzBHZMg=
X-Google-Smtp-Source: ABdhPJxuW6XtcMriJtyBQvZ8bGW1672tYFHmGTV0VzLA/qVK388NmyBUg9nRXlK5/MmlmBbqsvHwDg==
X-Received: by 2002:ac8:5e0b:: with SMTP id h11mr23197078qtx.194.1617032269228;
        Mon, 29 Mar 2021 08:37:49 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:396d:ff4d:53f0:c610? ([2804:14d:5487:a7d6:396d:ff4d:53f0:c610])
        by smtp.gmail.com with ESMTPSA id t2sm11148653qtd.13.2021.03.29.08.37.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:37:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <BB675BE1-5F64-495F-98DA-8A2A3D857691@gmail.com>
Date: Mon, 29 Mar 2021 12:37:45 -0300
Cc: openembedded-core@lists.openembedded.org
Message-Id: <70419FA6-9CA2-4B42-B4A2-6CC264DE163E@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
 <AM9PR09MB464265DE482819EB7D2B92C7A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <BB675BE1-5F64-495F-98DA-8A2A3D857691@gmail.com>
To: Konrad Weihmann <kweihmann@outlook.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Also, this is due to https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
30.

> On 29 Mar 2021, at 12:35, Devendra Tewari <devendra.tewari@gmail.com> wr=
ote:
>=20
> Sure.
>=20
> Would the following commit message be sufficient?
>=20
>    Use shutil.move when os.rename fails
>=20
>    Incremental build in Docker fails with
>=20
>    OSError: [Errno 18] Invalid cross-device link
>=20
>    When source and destination are on different overlay filesystems.
>=20
>    This change handles the error with os.rename and retries with shutil.=
move.
>=20
> Thanks,
> Devendra
>=20
>> On 29 Mar 2021, at 12:23, Konrad Weihmann <kweihmann@outlook.com> wrote=
:
>>=20
>> Yes please quote a bit from the python manpage [1] - I certainly see th=
e difference (and the edge cases where os.rename might fail), but that shou=
ld be documented as part of the commit message
>>=20
>> [1] https://docs.python.org/3/library/shutil.html#shutil.move
>>=20
>> On 29.03.21 17:21, Bruce Ashfield wrote:
>>> Can you document the cases that os.rename() is failing ? And also why
>>> would we expect the shutil.move() to work in those cases ?
>>> If a change like this cases issues in the future, we need that extra
>>> information in the commit head for proper triage.
>>> Bruce
>>> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
>>> <devendra.tewari@gmail.com> wrote:
>>>>=20
>>>> ---
>>>> meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>>>> 1 file changed, 22 insertions(+), 4 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclas=
s
>>>> index f579168162..f94aa96d70 100644
>>>> --- a/meta/classes/sstate.bbclass
>>>> +++ b/meta/classes/sstate.bbclass
>>>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>>> def sstate_installpkgdir(ss, d):
>>>>     import oe.path
>>>>     import subprocess
>>>> +    import shutil
>>>>=20
>>>>     sstateinst =3D d.getVar("SSTATE_INSTDIR")
>>>>     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>>>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>>>>=20
>>>>     for state in ss['dirs']:
>>>>         prepdir(state[1])
>>>> -        os.rename(sstateinst + state[0], state[1])
>>>> +        try:
>>>> +            os.rename(sstateinst + state[0], state[1])
>>>> +            break
>>>> +        except OSError:
>>>> +            shutil.move(sstateinst + state[0], state[1])
>>>>     sstate_install(ss, d)
>>>>=20
>>>>     for plain in ss['plaindirs']:
>>>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>>>>         dest =3D plain
>>>>         bb.utils.mkdirhier(src)
>>>>         prepdir(dest)
>>>> -        os.rename(src, dest)
>>>> +        try:
>>>> +            os.rename(src, dest)
>>>> +            break
>>>> +        except OSError:
>>>> +            shutil.move(src, dest)
>>>>=20
>>>>     return True
>>>>=20
>>>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>>>>=20
>>>> def sstate_package(ss, d):
>>>>     import oe.path
>>>> +    import shutil
>>>>=20
>>>>     tmpdir =3D d.getVar('TMPDIR')
>>>>=20
>>>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>>>>                     continue
>>>>                 bb.error("sstate found an absolute path symlink %s po=
inting at %s. Please replace this with a relative link." % (srcpath, link))
>>>>         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[=
1], sstatebuild + state[0]))
>>>> -        os.rename(state[1], sstatebuild + state[0])
>>>> +        try:
>>>> +            os.rename(state[1], sstatebuild + state[0])
>>>> +            break
>>>> +        except OSError:
>>>> +            shutil.move(state[1], sstatebuild + state[0])
>>>>=20
>>>>     workdir =3D d.getVar('WORKDIR')
>>>>     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>>>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>>>>             pdir =3D plain.replace(sharedworkdir, sstatebuild)
>>>>         bb.utils.mkdirhier(plain)
>>>>         bb.utils.mkdirhier(pdir)
>>>> -        os.rename(plain, pdir)
>>>> +        try:
>>>> +            os.rename(plain, pdir)
>>>> +            break
>>>> +        except OSError:
>>>> +            shutil.move(plain, pdir)
>>>>=20
>>>>     d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>>>     d.setVar('SSTATE_INSTDIR', sstatebuild)
>>>> --
>>>> 2.29.2
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>=20
>=20

