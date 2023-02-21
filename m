Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C22BC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:20:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.41545.1676985627508839191
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 05:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ozF/fdxt;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id n2so2425615lfb.12
        for <Openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 05:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=glZzDKUsPyEIy5BW65wO+4K6ziltHwNkKj1yaAE189M=;
        b=ozF/fdxt+KzFShkIBoGOaNy7dicnVJa7cLgwGO+IcJ+JmUaBtIRnvDw/iw85AhTeqG
         i1vcxSJBNxM0RkBFHP655mH0rIvEWuhMaLKd5z/xvxW/K16yS2iF/swXQyw/NydqgIzt
         6Q34cgChi3/iX+h4QLBdOXernV2JKcFyb71Re0FmaUGTXy/AwSxonsnHURPH0Ww/W0PF
         H2HfRbsmAFT1khvJpULOVW8RN+rHdJ74BaHrg4c2nMDiKojj6D/BYyXYUVsyBSqVFHVO
         JmmxuOPiqbPcwAXF3he8QymPRyU4As9BKgV3P57d9jDAVatS5ru8OE8+eve5JEiNqJkx
         wi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=glZzDKUsPyEIy5BW65wO+4K6ziltHwNkKj1yaAE189M=;
        b=M5fNPrvCwlnFJTU/BOdOyFpdfWnuyMBJDIaVeKC8U9tfimgunJfLy8YOf46qtMTSi0
         yxrbOFDlM5CDfRIBm/RCu+moNF5+3elW3slJDbyPq3udSUWexxVkIlZRHHFpOiCWAWl4
         Rbl7UctIY2dlJkSQTRqMZjMeBV/Zthz4UyKA/alMcsci2K+mnsbPd1fssMYBbrnT25XW
         DA/1ChVsitelekKm6iq7CjSWZDL848RT7UcP4OHth20WL9PDNH6A1W8H9QAHzR5knKfj
         /8r4loMTBDjSVHPFg0A2tkJimm0XkFvjnAtN2zeMPTKEJD0NZ1ip+famzgcjCCI/v2Ls
         gPgQ==
X-Gm-Message-State: AO0yUKUFEn8IEzxKb8ANx3oGTWJdbtXijxUu2SA9KDtQLPyerlyDCFUo
	KNdfCMPeQvaAMrUFa8qa8n3UWLc+iZW638VMDX7My7Kx
X-Google-Smtp-Source: AK7set//Gq2GhNcYeWn2HUNh4fuuHGvf0/c/8CyCrahr7gv+3ATfva3sSIdrgdy8lpQZ4JWJbpFuhjkTk61jn0xh4rE=
X-Received: by 2002:ac2:568a:0:b0:4db:1a09:a674 with SMTP id
 10-20020ac2568a000000b004db1a09a674mr1760044lfr.6.1676985625092; Tue, 21 Feb
 2023 05:20:25 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 21 Feb 2023 14:20:13 +0100
Message-ID: <CAApg2=SJRjhc5SGEoBYfKb6PkMqRW21ED8Bv1v-+QTSASCsQ4g@mail.gmail.com>
Subject: Cve fetcher update
To: OE-core <Openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007a25c505f535a44f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177495

--0000000000007a25c505f535a44f
Content-Type: text/plain; charset="UTF-8"

Hello all,
I'm finishing the new fetcher for cve check using the 2.0 NVD API. Will
need testers to check as many configurations as possible before we switch
the format.

The current estimate is this week, hoping that the real life doesn't
interfere.

Good news for all users is that nothing changes for you. Results should be
compatible. The one noticeable thing is that the complete fetch is longer
than before.

Kind regards,
Marta

--0000000000007a25c505f535a44f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello all,<div dir=3D"auto">I&#39;m finishing the new fet=
cher for cve check using the 2.0 NVD API. Will need testers to check as man=
y configurations as possible before we switch the format.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">The current estimate is this week, hoping=
 that the real life doesn&#39;t interfere.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Good news for all users is that nothing changes for you.=
 Results should be compatible. The one noticeable thing is that the complet=
e fetch is longer than before.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Kind regards,</div><div dir=3D"auto">Marta</div></div>

--0000000000007a25c505f535a44f--

