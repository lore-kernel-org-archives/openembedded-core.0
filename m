Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33104C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:29:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1177.1715794165079657123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKIDrz0z;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b4a7671abaso5527287a91.0;
        Wed, 15 May 2024 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715794164; x=1716398964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CgU1hV5oT7MaceuX9yRQpcWJslIoFt+xok8YbMTx4tk=;
        b=ZKIDrz0zSzlVfKlem5I8TGJGhds+NLxMxYIABPVNv3CN0xmIyEkJIfDZkWPZFhNo4J
         JQ3FfYAyDuiB9WpZUz7OOT8Wq5igJ/FXJ3SQAhkxPIvadtB60MfAme4dGmc1d0N+tny2
         L9F/uLuGa9VT3PTkpnSVLSwwpaQr/WpmuC3tsEHCigctabS6USdqkTUkTtN4Kv6WeWAj
         0aBdAEGHs/vVax4IUiAp38M3Ajrw1NPKpvcHhguFD8M5/C47KDUYVka5t5+YCOKO3huj
         Mj2NAwAZYg0Vdj5CvxAhtdcezm5+Ek0Z1YMpK7gcb6MTT2WZ9Wk1bqnNwYqeZWh3d+cV
         Pmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715794164; x=1716398964;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgU1hV5oT7MaceuX9yRQpcWJslIoFt+xok8YbMTx4tk=;
        b=NbRGaPijfcpt8H/GoqpW86G09zoPjddrHCMumKNonadgw/Fw9dFBPcwtzsQlUP7aWE
         tCitjwkA8XjEdUeJTSEyfFYU4/jR5JEFGWeem/jRq7BxpK4UwfdVBbgVOLFnODBC0QTy
         u1ucSe8ut848uYJ7fHHNlwvnG04ad2EePjUL//6xgPHWsN8VmNJLYGfHHS6JgvLoxRXm
         2EtbUMltvDAR5V4Rh+SPVS2b2gyaoEoKN5knKfs0PB8ZUDm1AhB+GcNdeCl//DqxYZZu
         vTB0mflW+T86vuwvhgPQ3/v1ZiDnlJuqxJUT/ayz+WF/2LI8Z8vVNXQaECClcjs5SvDO
         UndQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvV7P4DGOb5gz/bnOux73v/NucAKoorE/2f58E1AWHhSF2bu8vbxNNqTF0IBVvhzxb451Jfn6FdCSsPt8+0H2Zm6LtIePG9EkjiS/ZT9PQt0c1+ZYF41q1HTG3zvLNs7s=
X-Gm-Message-State: AOJu0YzdPQcHmMwtPSYB0NOVc4SHnj9rbn1hhvNPzmPEvU2f3KVKF+RL
	QUsA724VPSqaFxTP5tYpS4Ny1KuG7Krcnm4ELoiAyzrTZyx24zqNwuSf8Wv/avgl23/U15utxdC
	i/7/eNmAm4gFMzNbbAXkXwKwABKK7FpNL
X-Google-Smtp-Source: AGHT+IF79MynSTZwDJIImqhH/yA1WNAzbGHDYD7qQlXNziG2ko7UYKQ3UzjVwVse4wrp95IdHdU4QithtwHFRtowOP4=
X-Received: by 2002:a17:90a:296:b0:2b3:463d:992b with SMTP id
 98e67ed59e1d1-2b6ccef6431mr14269533a91.42.1715794163933; Wed, 15 May 2024
 10:29:23 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 15 May 2024 19:29:12 +0200
Message-ID: <CAApg2=Q4APgxqsEYKSswn4duCDbU_MYX9YR0FZGoOt6G_scC6w@mail.gmail.com>
Subject: VEX work status
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Steve Sakoman <steve@sakoman.com>, Mark Hatle <mark.hatle@kernel.crashing.org>, 
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a62e090618817587"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199295

--000000000000a62e090618817587
Content-Type: text/plain; charset="UTF-8"

Hello all,
We're close to the point to post RFC patches of the VEX work. As a
reminder, we're working on storing SBOM/CVE information for later use and
be able to re-run the cve-check in the future.

To do that, we split out the nvd fetcher and cve-check from the YP builds
to a separate tool. This tool can be used manually or integrated into the
YP build system. To be able to generate that information, we needed to
extract more data that was done previously, including package versions,
CPE, any manual attestations from CVE_STATUS and related variables,
detailed reasons for attestations and so on.

Following other discussions and taking into account the NVD situation,
we're integrating the "raw" CVE check using MITRE data (with possible
overrides, some other repositories like the CISA one could be added with
minimal effort). There will be two backends for the CVE check: the NVD
backend and the "cve.org" backend.

In the process, we also gain VEX support. The format resembles OpenVEX.
However, the format does not support all the attestation types that we need
so we add some, to avoid losing data. The file could be easily
post-processed to remove the additions, but subsequent checks might be less
accurate.

Good news is, that the change surface is quite limited, so backports to LTS
branches should be quite easy. It will be also possible to keep both the
old and new code (there's an additional 'vex' class).

If you have any questions, let me know. I expect the first RFC by the end
of the month, if there are no last minute difficulties.

Kind regards,
Marta

PS. There will be a more detailed status on the raw CVE check tomorrow. You
can have a look atthe first POC showing how to do a CVE check using MITRE
data directly (not using the data from the standalone tool in this version)
in https://github.com/mrybczyn/cvelistv5-tools-poc/ and the corresponding
overrides repo https://github.com/mrybczyn/cvelistV5-overrides

--000000000000a62e090618817587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>We&#39;re close to the point to =
post RFC patches of the VEX work. As a reminder, we&#39;re working on stori=
ng SBOM/CVE information for later use and be able to re-run the cve-check i=
n the future.=C2=A0</div><div><br></div><div>To do that, we split out the n=
vd fetcher and cve-check from the YP builds to a separate tool. This tool c=
an be used manually or integrated into the YP build system. To be able to g=
enerate that information, we needed to extract more data that was done prev=
iously, including package versions, CPE, any manual attestations from CVE_S=
TATUS and related variables, detailed reasons for attestations and so on.<s=
pan style=3D"font-family:monospace"><br></span></div><div><span style=3D"fo=
nt-family:monospace"><br></span></div><div><font face=3D"arial,sans-serif">=
Following other discussions and taking into account the NVD situation, we&#=
39;re integrating the &quot;raw&quot; CVE check using MITRE data (with poss=
ible overrides, some other repositories like the CISA one could be added wi=
th minimal effort). There will be two backends for the CVE check: the NVD b=
ackend and the &quot;<a href=3D"http://cve.org">cve.org</a>&quot; backend.<=
br></font></div><div><font face=3D"arial,sans-serif"><br></font></div><div>=
<font face=3D"arial,sans-serif">In the process, we also gain VEX support. T=
he format resembles OpenVEX. However, the format does not support all the a=
ttestation types that we need so we add some, to avoid losing data. The fil=
e could be easily post-processed to remove the additions, but subsequent ch=
ecks might be less accurate.<br></font></div><div><font face=3D"arial,sans-=
serif"><br></font></div><div><font face=3D"arial,sans-serif">Good news <spa=
n class=3D"ng" style=3D"background:none!important">is, that</span> the chan=
ge surface is quite limited, so backports to LTS branches should be quite e=
asy. It will be also possible to keep both the old and new code (there&#39;=
s an additional &#39;vex&#39; class).</font></div><div><font face=3D"arial,=
sans-serif"><br></font></div><div><font face=3D"arial,sans-serif">If you ha=
ve any questions, let me know. I expect the first RFC by the end of the mon=
th, if there are no last minute difficulties.</font></div><div><font face=
=3D"arial,sans-serif"><br></font></div><div><font face=3D"arial,sans-serif"=
>Kind regards,</font></div><div><font face=3D"arial,sans-serif">Marta<br></=
font></div><div><font face=3D"arial,sans-serif"><br></font></div><div><font=
 face=3D"arial,sans-serif">PS. There will be a more detailed status on the =
raw CVE check tomorrow. You can have a look <span class=3D"ng" style=3D"bac=
kground:none!important">atthe</span> first <span class=3D"ng" style=3D"back=
ground:none!important">POC</span> showing how to do a CVE check using MITRE=
 data directly (not using the data from the standalone tool in this version=
) in </font><a href=3D"https://github.com/mrybczyn/cvelistv5-tools-poc/">ht=
tps://github.com/mrybczyn/cvelistv5-tools-poc/</a> and the corresponding ov=
errides repo <a href=3D"https://github.com/mrybczyn/cvelistV5-overrides">ht=
tps://github.com/mrybczyn/cvelistV5-overrides</a></div></div>

--000000000000a62e090618817587--

