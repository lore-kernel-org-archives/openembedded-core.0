Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.23263.1617032128686277837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sH3oc8gH;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id g20so12815018qkk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TkPr1yWEW5zy3iVohG9H4quyAUZPXDizRMoNZ6gJZLo=;
        b=sH3oc8gHWU5kVWl6Yp71uSQv7tGaQP4RrM/djT6NRj+LIFl7xE9jc/WD01wC/9N9bH
         2ZEUiuuWeId6GFkwwDqul+LDIPmydeRUpzDdd1MYZvKbK3Hw5o4ANtsFBkjbFhMpXbmA
         7cCbIwragsj9C2Ak/AhJ15ko450ohnyzz/vyCL0rMLKM+WdmkndnrS+AO7X0IWanH3Wz
         QXSu+cN5ZBhPq7Th7txXuONe6yXckBmmViHGPzH/N92jGUOdWxxouzWmS3s5xE4i0APP
         NN94p9qtnSIElrOVjZuQjO0v3AwFy3a7BWsgIvTaqxMJD20+qGIJJj+RgNQJNMR6MElb
         N8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TkPr1yWEW5zy3iVohG9H4quyAUZPXDizRMoNZ6gJZLo=;
        b=TmIYogzR03pqjGfWS1rTfx6iKkdVABfmCYRHGoPmDoQeTNbBlEQ3zyPy/pzjn0TVwT
         UJXHmiUZg0G8E/W6C/dCAqq8nepEEocQAvgiIwlgo/9yESRz+tLOXbQsaV8cGjyYlUAl
         KAm7Uoh53MOHmerYs9fvqEfj+od8ASl7LYrQKdIwjpHZFC3eBP5Ru5Crm8y9qOhf3F29
         r9thbfI28LadeaXMmFp9tl5mJ7rKUI4L09S/n/AMWnjeZ/+VPG48C0o3NLYrTPFczIhQ
         bmfhgcYe9HlpVDw9CIcEObHFdt7D1VBxOjP4PXdjXuUncQW7T0EeAUzw0Ld3oachg4aE
         Ul9w==
X-Gm-Message-State: AOAM532C87urWECPyrCy8HJYY/NxZlwYMPTX8rAKExvQg5CFh+BTl2ZW
	hwPKyoCpmeKYWo6/J8GcKjo=
X-Google-Smtp-Source: ABdhPJzUOPHRJMO5P5Ik4QVa6eta0plac0kABIKEJ9klX4yrF6vEqW1vszfaQnZMgQ0mj3msMn2GNA==
X-Received: by 2002:a05:620a:525:: with SMTP id h5mr26167433qkh.100.1617032127711;
        Mon, 29 Mar 2021 08:35:27 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:c0bd:9fb5:3b:e2c2? ([2804:14d:5487:a7d6:c0bd:9fb5:3b:e2c2])
        by smtp.gmail.com with ESMTPSA id j3sm13810755qki.84.2021.03.29.08.35.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:35:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <AM9PR09MB464265DE482819EB7D2B92C7A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 29 Mar 2021 12:35:22 -0300
Cc: openembedded-core@lists.openembedded.org
Message-Id: <BB675BE1-5F64-495F-98DA-8A2A3D857691@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
 <AM9PR09MB464265DE482819EB7D2B92C7A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
To: Konrad Weihmann <kweihmann@outlook.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Sure.

Would the following commit message be sufficient?

    Use shutil.move when os.rename fails
    
    Incremental build in Docker fails with
    
    OSError: [Errno 18] Invalid cross-device link
    
    When source and destination are on different overlay filesystems.
    
    This change handles the error with os.rename and retries with shutil.m=
ove.

Thanks,
Devendra

> On 29 Mar 2021, at 12:23, Konrad Weihmann <kweihmann@outlook.com> wrote:
>=20
> Yes please quote a bit from the python manpage [1] - I certainly see the=
 difference (and the edge cases where os.rename might fail), but that shoul=
d be documented as part of the commit message
>=20
> [1] https://docs.python.org/3/library/shutil.html#shutil.move
>=20
> On 29.03.21 17:21, Bruce Ashfield wrote:
>> Can you document the cases that os.rename() is failing ? And also why
>> would we expect the shutil.move() to work in those cases ?
>> If a change like this cases issues in the future, we need that extra
>> information in the commit head for proper triage.
>> Bruce
>> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
>> <devendra.tewari@gmail.com> wrote:
>>>=20
>>> ---
>>>  meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>> index f579168162..f94aa96d70 100644
>>> --- a/meta/classes/sstate.bbclass
>>> +++ b/meta/classes/sstate.bbclass
>>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>>  def sstate_installpkgdir(ss, d):
>>>      import oe.path
>>>      import subprocess
>>> +    import shutil
>>>=20
>>>      sstateinst =3D d.getVar("SSTATE_INSTDIR")
>>>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>>>=20
>>>      for state in ss['dirs']:
>>>          prepdir(state[1])
>>> -        os.rename(sstateinst + state[0], state[1])
>>> +        try:
>>> +            os.rename(sstateinst + state[0], state[1])
>>> +            break
>>> +        except OSError:
>>> +            shutil.move(sstateinst + state[0], state[1])
>>>      sstate_install(ss, d)
>>>=20
>>>      for plain in ss['plaindirs']:
>>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>>>          dest =3D plain
>>>          bb.utils.mkdirhier(src)
>>>          prepdir(dest)
>>> -        os.rename(src, dest)
>>> +        try:
>>> +            os.rename(src, dest)
>>> +            break
>>> +        except OSError:
>>> +            shutil.move(src, dest)
>>>=20
>>>      return True
>>>=20
>>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>>>=20
>>>  def sstate_package(ss, d):
>>>      import oe.path
>>> +    import shutil
>>>=20
>>>      tmpdir =3D d.getVar('TMPDIR')
>>>=20
>>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>>>                      continue
>>>                  bb.error("sstate found an absolute path symlink %s po=
inting at %s. Please replace this with a relative link." % (srcpath, link))
>>>          bb.debug(2, "Preparing tree %s for packaging at %s" % (state[=
1], sstatebuild + state[0]))
>>> -        os.rename(state[1], sstatebuild + state[0])
>>> +        try:
>>> +            os.rename(state[1], sstatebuild + state[0])
>>> +            break
>>> +        except OSError:
>>> +            shutil.move(state[1], sstatebuild + state[0])
>>>=20
>>>      workdir =3D d.getVar('WORKDIR')
>>>      sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>>>              pdir =3D plain.replace(sharedworkdir, sstatebuild)
>>>          bb.utils.mkdirhier(plain)
>>>          bb.utils.mkdirhier(pdir)
>>> -        os.rename(plain, pdir)
>>> +        try:
>>> +            os.rename(plain, pdir)
>>> +            break
>>> +        except OSError:
>>> +            shutil.move(plain, pdir)
>>>=20
>>>      d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>>      d.setVar('SSTATE_INSTDIR', sstatebuild)
>>> --
>>> 2.29.2
>>>=20
>>>=20
>>>=20
>>>=20
>>=20

