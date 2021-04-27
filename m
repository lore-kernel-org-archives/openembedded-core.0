Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.4025.1619563501496565610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 15:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGmsva/i;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z2so24763641qkb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=K3N1v9xTXr1wn1IJjKOGnxpEMWQF2U3hsau5U+WDNBM=;
        b=RGmsva/i24np4fxafqtadWVy5sQ8XX9gulvhVOnGIQm7Hk3Vq09viTMiyfBmKX+fi9
         J5fNvQ6ozqtD2iM8AIHj2N6H9yAoDfrtWw0UcVCs9cRvBP+IMcsQtMDhwMmevOW+LAiX
         gFHmWgHXKWQ5hpiflftHfL/aFWdaKRxGMwUbjRqf2t2n3q7bTkXEDiPD9X+DpcibsqWw
         4ReNtPLRroZAggjUMD7SWn29WtzdPfaI4zhLEB+942yfOA9CRDSwnBa01yr18gZ5c/ao
         WkVZ89Vcs9Ek9CvrClJPQ2xD2NMlJxgNArWjuJYmzjTs+wIZ7b80ZrKaTVeTk5IUjb3n
         +HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=K3N1v9xTXr1wn1IJjKOGnxpEMWQF2U3hsau5U+WDNBM=;
        b=YSIR3kpG6FYVLlYyyoW0j/ACKowylx7I/lVWq4ZJcWOcaQFkbLYPifJ3tHN72zDiyf
         h5vmlx0RJrktUejjTIBCIcWI91mnPJ9tcrqgqMtDZxjg1hqolptd8ipB4lP5Wgdq1u/7
         3xs0FlsCf0Dxb8lwPlPY7Or2oeAQiNcnHd5oRcg0yMMTCPQWSU9Zvja9a2x+Uj9yiaR7
         xTgQg1kqF7uugYkkxQiR41QrP7RO2uBPG+x18X3SYDgPg3G63r+fc4+aE0PKp9hcoLSY
         Bwcl6b3vdIImSWjaVH7x8EVnBLC78ONBO1Pl4M3QBffmPdWXmfi2K1+vnc8EP1UJr05j
         kLfg==
X-Gm-Message-State: AOAM531iFOPrHhRmijtL886+m08Q7IbFsFu8VnfaR2kkw/pSWaMqbvyy
	BM93bbRDGhwe4EdXNzlPBos=
X-Google-Smtp-Source: ABdhPJyICzaKIgVJvdsISnamqEpM7OAZO2ZJ3iUwZMHHrm6doHGtot1I+W4eFCSy7/T/wHr/5Vlbtg==
X-Received: by 2002:a05:620a:133c:: with SMTP id p28mr12765497qkj.3.1619563500678;
        Tue, 27 Apr 2021 15:45:00 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:3c62:f961:ae7b:57a? ([2804:14d:5487:a7d6:3c62:f961:ae7b:57a])
        by smtp.gmail.com with ESMTPSA id v4sm894699qto.50.2021.04.27.15.44.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 15:45:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
Date: Tue, 27 Apr 2021 19:44:53 -0300
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

You=E2=80=99re absolutely right - I=E2=80=99ll investigate whether this =
is something the container overlay filesystem should be handling. =
Thanks!

> On 27 Apr 2021, at 19:39, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2021-04-27 at 11:59 -0300, Devendra Tewari wrote:
>> I suspect this is an issue in upstream createrepo_c tool, which has =
code that does not work across overlay
>> file systems
>>=20
>>     if (g_rename(out_repo, old_repodata_path) =3D=3D -1) {
>>         g_debug("Old repodata doesn't exists: Cannot rename %s -> %s: =
%s",
>>                 out_repo, old_repodata_path, g_strerror(errno));
>>     } else {
>>         g_debug("Renamed %s -> %s", out_repo, old_repodata_path);
>>         old_repodata_renamed =3D TRUE;
>>     }
>>=20
>> I=E2=80=99ll try patching and report an issue to upstream project.
>=20
> I'm starting to worry that you're going to have this problem with many =
tools doing=20
> renames. It does sound like something the container filesystem should =
be handling rather
> than exposing as a difference in behaviour. I suspect it becomes hard =
to see
> predictably since builds writing in the same build instance are =
probably fine
> and it only likely happens for files created in one instance and then =
later
> renamed in another...
>=20
> Given the breadth of build systems we run, I'm not sure we want to try =
and
> support this?
>=20
> Cheers,
>=20
> Richard
>=20

