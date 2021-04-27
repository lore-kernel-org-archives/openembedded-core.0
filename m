Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.3994.1619564044741430712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 15:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=id0i7bxf;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id k127so6158070qkc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gZBhZmCz3r5VVb9GfOBxhIy/WFXlFD1YUzOQfCB4bHg=;
        b=id0i7bxfvXJy/divOxYhYf4XhKEF8WV54MhhYY76sum+wsYlwOOHDp0gF5oPvUdcZK
         fBTcK2RKZ7WW8ucQZKVa+jYzDw62EFt20elP6f/9LOyu8LOCRnC7y+YpD4Jws8D62IYm
         ozqLs8AqCDNpjPRcnmVxI8phl774oQL3cdqImjWuprM+UjlfT/W/nEW89FPL1XllX5Nf
         3GKnYd3zMVgsWGaeoPFNKzu6wqhy6OPWcml15jvYoyf5EHh8uv0FFWoQ5j1Mp+QJmgID
         I3ByNOJZTrg2chpjO8Tt3VQ0AgdeQGEGJ51TcHrvfSrgduCjx2dqPJ9XrzF/IB8WhKqq
         Ri0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gZBhZmCz3r5VVb9GfOBxhIy/WFXlFD1YUzOQfCB4bHg=;
        b=fRKOl6g4YXpWeeuKnZ3uKPrboing0vDHdi2sXgxZKH7NYfjjj03mm/ANIWW4GJT/vA
         ltqfHE/bbhtzn4ge5PjQ5eQmLGlIUitbGfzPyppO5ZpCNbdr7t1MGwrdnU14yAcSVUGj
         OrCRFBGbncLRreTcWW6/T4nNS03CknhXr3eSCiZIIRtWsjX9/gW3lYdqL5NChTUY6s5a
         3q8mIiY4vvhx2WUNscMiSQTqWiB1mmCRS0Dzo0JQihCwocvdSW6jMYmH41Nyqaq5LqgG
         336jcMIHPZ7u2umqdC4ydIHaO9AlviyeKXCGJ/NS5cFFCFPKf4jgmlB/7qPsirJrWpqq
         sDmg==
X-Gm-Message-State: AOAM533bq3469F+CVTgPAHzpwuTNcGtH7VC9avKIInWGsXGXADYPOdi2
	vSHrKzb9iGCY141u3JfeRCo=
X-Google-Smtp-Source: ABdhPJxvd+k33fY6dn5Ogy6diNFclZUiU+XtOk7U6EMSwKLjUkqyfhsoxUh7uxc1u4wMHBgmlWntSQ==
X-Received: by 2002:a05:620a:e10:: with SMTP id y16mr25780282qkm.375.1619564043922;
        Tue, 27 Apr 2021 15:54:03 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:3c62:f961:ae7b:57a? ([2804:14d:5487:a7d6:3c62:f961:ae7b:57a])
        by smtp.gmail.com with ESMTPSA id c17sm3873120qke.40.2021.04.27.15.54.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 15:54:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
Date: Tue, 27 Apr 2021 19:53:58 -0300
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
 <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Looks like an old issue with overlayfs - =
https://github.com/moby/moby/issues/25409.

> On 27 Apr 2021, at 19:44, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
> You=E2=80=99re absolutely right - I=E2=80=99ll investigate whether =
this is something the container overlay filesystem should be handling. =
Thanks!
>=20
>> On 27 Apr 2021, at 19:39, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> On Tue, 2021-04-27 at 11:59 -0300, Devendra Tewari wrote:
>>> I suspect this is an issue in upstream createrepo_c tool, which has =
code that does not work across overlay
>>> file systems
>>>=20
>>>    if (g_rename(out_repo, old_repodata_path) =3D=3D -1) {
>>>        g_debug("Old repodata doesn't exists: Cannot rename %s -> %s: =
%s",
>>>                out_repo, old_repodata_path, g_strerror(errno));
>>>    } else {
>>>        g_debug("Renamed %s -> %s", out_repo, old_repodata_path);
>>>        old_repodata_renamed =3D TRUE;
>>>    }
>>>=20
>>> I=E2=80=99ll try patching and report an issue to upstream project.
>>=20
>> I'm starting to worry that you're going to have this problem with =
many tools doing=20
>> renames. It does sound like something the container filesystem should =
be handling rather
>> than exposing as a difference in behaviour. I suspect it becomes hard =
to see
>> predictably since builds writing in the same build instance are =
probably fine
>> and it only likely happens for files created in one instance and then =
later
>> renamed in another...
>>=20
>> Given the breadth of build systems we run, I'm not sure we want to =
try and
>> support this?
>>=20
>> Cheers,
>>=20
>> Richard
>>=20
>=20

