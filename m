Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.9398.1619604022622884542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 03:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mNhUizcd;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id q136so41942864qka.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ICbO7wKbiXUekiWfrq8CTIJ4JH3UmAIXPQ0Iyy18j+I=;
        b=mNhUizcdDRLONB/DH9LUMVNH+rcjjpiZZXXeXunnF+PnEEqkr4gLK+PCllUXz2uwnq
         h8yKsRdFy/bzYh4XzftpfuHjxnha7ZVApO1ajIUgV2uMkOyE2m4Z9m1nb4oT1xPZVao/
         oK0MWf9gqdmvo+lYShQgHv1D9tGT8kPXOTBKZ3ZccP1tUDtZwDOBKJLPOw8G+lJAGrQQ
         bbgIiaZhLZd+Ik3dn3TXd4Ycn8VlkRQN5+hbMLJ9pHOUox7acEDx1r9++doio5B8s4wb
         gWMzJochgCwTR2Dz0uEjmVToS3bEaXewToVMepbjMqGSf9MDiFkrMIM0mLLlULnRwn+5
         mDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ICbO7wKbiXUekiWfrq8CTIJ4JH3UmAIXPQ0Iyy18j+I=;
        b=Izt7/9eWHH9Pqg5Ql7Q2QhfqqwbD0srttcM8OT0w7uhorIJxhCo1fbq3UggaQCcDPs
         sbTz0jwEIAkRRS1zwqgJ4U+jmWUd07SUIr7KZqvu6EzUE+/BqxBM2SrUCymwjhoZlWT5
         elcHys82ts06bR0TMLHiF1HMS5ekMEUTFC9WLtdjEVIZyVsArLiFBfnAl9a4Id75xbZL
         FNS3JxarmmvGehGEbIwCdRs6v+wGR39+Q9ijpkQ1V/h1we/0pB3u/TtPiwLA5AVVsCZF
         61MK7MaDiRVS6Me+z82TU/cbTafikkrXyd/BPKckZBQSpOt/HwT7PdPbj5IotsZdgGFU
         MgSQ==
X-Gm-Message-State: AOAM533N2Zny+AEI7YBqxVAnYLnbFdePRvvo60gJ9TFdPNfyulVhAjIF
	aWicUUMNxwOMCqvw592gB8E=
X-Google-Smtp-Source: ABdhPJzj0Xkshrxb7RJ8TTalPduOqcM0IgqS7yFHPBKnqIsdsSGr0LIIXqqdd/o0t9IicXAfUxWzXg==
X-Received: by 2002:a37:897:: with SMTP id 145mr9374178qki.46.1619604021779;
        Wed, 28 Apr 2021 03:00:21 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:3c62:f961:ae7b:57a? ([2804:14d:5487:a7d6:3c62:f961:ae7b:57a])
        by smtp.gmail.com with ESMTPSA id i2sm4673896qkk.102.2021.04.28.03.00.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 03:00:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
Date: Wed, 28 Apr 2021 07:00:17 -0300
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <42E76009-F583-4E55-BA29-1C989B25BD73@gmail.com>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
 <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
 <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The gist of it is that Docker uses the overlay2 storage driver by =
default, previously it used aufs. Both drivers have the same limitation =
in rename, where file rename across layers is handled by moving, but =
directory rename across layers results in error EXDEV. It is up to user =
space to handle the error.

> On 27 Apr 2021, at 19:53, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
> Looks like an old issue with overlayfs - =
https://github.com/moby/moby/issues/25409.
>=20
>> On 27 Apr 2021, at 19:44, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>>=20
>> You=E2=80=99re absolutely right - I=E2=80=99ll investigate whether =
this is something the container overlay filesystem should be handling. =
Thanks!
>>=20
>>> On 27 Apr 2021, at 19:39, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> On Tue, 2021-04-27 at 11:59 -0300, Devendra Tewari wrote:
>>>> I suspect this is an issue in upstream createrepo_c tool, which has =
code that does not work across overlay
>>>> file systems
>>>>=20
>>>>   if (g_rename(out_repo, old_repodata_path) =3D=3D -1) {
>>>>       g_debug("Old repodata doesn't exists: Cannot rename %s -> %s: =
%s",
>>>>               out_repo, old_repodata_path, g_strerror(errno));
>>>>   } else {
>>>>       g_debug("Renamed %s -> %s", out_repo, old_repodata_path);
>>>>       old_repodata_renamed =3D TRUE;
>>>>   }
>>>>=20
>>>> I=E2=80=99ll try patching and report an issue to upstream project.
>>>=20
>>> I'm starting to worry that you're going to have this problem with =
many tools doing=20
>>> renames. It does sound like something the container filesystem =
should be handling rather
>>> than exposing as a difference in behaviour. I suspect it becomes =
hard to see
>>> predictably since builds writing in the same build instance are =
probably fine
>>> and it only likely happens for files created in one instance and =
then later
>>> renamed in another...
>>>=20
>>> Given the breadth of build systems we run, I'm not sure we want to =
try and
>>> support this?
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>>=20
>>=20
>=20

