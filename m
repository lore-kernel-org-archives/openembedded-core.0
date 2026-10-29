Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6419.1793258141952590577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 00:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20260707.gappssmtp.com header.s=20260707 header.b=QD2jdd0m;
 spf=neutral (domain: theyoctojester.info, ip: 74.125.82.171, mailfrom: jester@theyoctojester.info)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so584055eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 00:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793258141; cv=none;
        d=google.com; s=arc-20260327;
        b=V0Q7Xws9h0ht91UEUEmwfyaxpS35lzOfklJO1tiexAz+o+VXTsAzxdwMrp5Vsp+wzf
         M0la7siX0/gmsPiL27HG9vgAmYCZHPgXWsD1qccnGoYXpxoNmowkEK1OnoaZXXsvbJY5
         k8TM1RexE1wDz4eyW1xHhOANo81QiXYPSGfbl28JobCQSHoowcVEQmUho96uMn0/bUYh
         g4fELQad0nQXbk+HN5HCyEbWpWBy4A99vd9FXr7Puzil83u5MZT3yadCmNyaKOOUMvd/
         bfRpSa+32xPZxZTXEkI1tSuGL+SNTAwUf9hLyKWVCfRByiWrLg1aY1WZGLbAht3MC6YI
         poRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        fh=5uybVxwWXG3OlmpyxpA0Woniuw6GlFc6uI7a5+AG/kk=;
        b=EnFu0TdnjGp8V95K+gobRO0ik0/AuU4csQE2a9wWZE3rVcxzy/dL1xFAlugzscD6D8
         bVpTQbjiiw55fWi/p/DDUSDjeuUN4HzdOwf8rOY8bgMi6tgNR758JBSy4EQxOR4UfXSw
         WWKcFJEK3RKzzP+i10DnZthF0w6HNdNXbOPctme2kW1Y5W7qa85MvoIZ0oNkwJlk9Unb
         qFMT9Zq8nBTXY2mhcxF4bcEpNQOUo3iN36VF8JfiMN2JpDZZ2QeOyAZ1DNDYIlL+e8Zh
         IpfhgXX+xJtDFuSO+/e9LCAXLJsjYtF3svzBTzs8NpaZS84sP9PtsGYqLDZbPT/eH0cN
         k7Mg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20260707.gappssmtp.com; s=20260707; t=1793258141; x=1793862941; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        b=QD2jdd0mDSYrrG1ufMqXyAz8GAXXSgK83iXpD1BR10dliBvvckPOXbo1FSBRqdOIvd
         qFMKN9ogU53tBtv8fsKUW3plIr+w51M8w9yjtl8bFSSdBAA5ksh6tTcTLGZBqe13kUo2
         DnKMUU5rLIemYeIoFah3DU4Z6M4blEqs+wD42Ji1LvEo6/NqEx1wfV7Lc54xaTwLk49z
         1IuO/40b7eSoZxKBDElcqAA4vODQBBAaxDu5BsAKE03Wkfl/Sx2GSzvI33Aclp4WEXvK
         QNVktZPVnKmM35bozVu+Tjqy9Aub+tDIx47jOM9DudO1XGtIJCqTE/nEZOmkVoP5aCnJ
         sRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258141; x=1793862941;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        b=VP/Xjva24TxjpBSLxzXUXNyMHjEW4lthBcBb06cE10Yik2g7+YUNONK0bGqLgjl8A6
         GfMcXqllsXSfSfgLInq0Vfu2UUtky5xztlcqdPq9e1ciYKpV1ieEJAux370DjQUfi/ag
         hFNgguDugHlFJPWxxBvnpvqW5VvbgO/9RTvDMRiEiWTfQuoCBUpKcDg532YSSYO2EgLB
         bSnZFiI3Hd7w0Xuv+00VZ0fLItKjPTD3Hb12MNJBqxfQ/cLiN7NkKeilGUoDdxAi7Njb
         orAcVOVeCPGPJOlCnl8JHcC9HJuJ7lhX4xPBqu+NtmEFPH8kUZ7DJoF2adu++cQWiwY5
         XTJA==
X-Forwarded-Encrypted: i=1; AKwUvBwNANXyJUqRhwxzRUv7DTz24IlBW7Pw/h+lZh8gvt4ZVrk8CHpRL/uqgsLHrFc+NEaA7eYyi2mZ7Uxau81rfix63w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ4BW131GVYQFXGMMx9RDOLNHs7DMQzQ+mt0mACcfr4VI8NE8rD
	1AYX9DJF4IEsuj0Ii0XbrawDCETr2Y5l5Ksm6lMMRtGwvBtPjS5bi34IOkmSMpsn4A+4BUSSpOQ
	S36u3fcu8YzNAoHB4hxQGqqWEhXEJKe7/evn7snt6bQ==
X-Gm-Gg: AYBFou1ZoYkCbUb9xAc9JhjovUSHATj7v9b5ql+3i8VOfWAZ9T1IV/mvxtTtjPjdZPp
	VMax3SkyN42x2tFgfyklZz8Oh+YM2JS6Wq4zr7+8z7kHcejEO/fxJi1fm+XFtT7yqdZRnr8Lkyt
	G5w7BShjOvEW9u/M1bpwlSarxvXOBOuUrsRtpYT6nrGx9oiyxSerL4emelkwq68oyklzJ/RloGj
	PxgvawGtRX5DwqkOoKnMMo+9N+3PgDRT25jdv1Ebg96gtvFIxvp4PxrWJWx620Fx95AqVTqc3V/
	5ctAlTMwVlPFm2aMrkxpCstwpBZG3NULo1RrRovK0FbAwVXqaGtm5G2xkM5W8yos1lqidyhfB8+
	2EZAbasjO5w1zzf6WIlPSBv7HmsHZ2dv5wQhSps40PEWF97jLWqqEHKXoGmtfjlxz+ITNIa/9Wg
	651GMWQfF1IoxPexLSsLLg
X-Received: by 2002:a05:7300:7aa7:b0:359:fb64:11d7 with SMTP id
 5a478bee46e88-36a2fe8578amr2433458eec.11.1793258140955; Thu, 29 Oct 2026
 00:15:40 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 29 Oct 2026 08:15:14 +0100
X-Gm-Features: AclHuK8dAGreQ0uhIsCfVfsWrSo4kT4A4MWOJFJY99_BlMByixxvMM1rOP4O7xM
Message-ID: <CAEt6Nwq=_BWSu+UCVS2zYMOHbKaNa5OM0RXZ5gcaonJpowYzvw@mail.gmail.com>
Subject: Yocto Project Summit 2026.12 CFP, closes after Halloween weekend!
To: Josef Holzmayr <jester@theyoctojester.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Bcc: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248906

Hi all,

Quick reminder: the CFP for Yocto Project Virtual Summit 2026.12 (Dec
1=E2=80=933, 12=E2=80=9318:00 UTC) wraps up Monday, Nov 2nd, 23:59 UTC, rig=
ht after
you've finished spooking (and stuffing yourself with candy). If you've
been hiding a talk idea on security/CRA, YP & AI, reproducibility,
containers, DevOps, or just something you've built with the Yocto
toolbox that doesn't involve trickery, now's the time.

Submit here: https://pretalx.com/yocto-project-summit-2026-12/cfp

Tricks are forbidden, treats are encouraged.

Greetz,
Josef (on behalf of the usual event pumpkinheads)
