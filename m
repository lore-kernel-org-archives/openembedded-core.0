Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E21C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:34:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.2289.1686029650612882507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gZ5nodzS;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4effb818c37so7031544e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 22:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686029649; x=1688621649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J44YZSaEeQfhIj8HinT2oD3ZFC3Ryk6H6oZb5sf0CQc=;
        b=gZ5nodzSljVguUw2b+qaCkBRqkMl5s/5RYSkSMysiBYMx5iNJz8cUkdUtU4Ht4KsbX
         b8l7u2S/GkJIpwyAbV4ylu2053vZwaW/uNh0tV17aiNsiXAwtjKQwBcvrLlxXh/HonXS
         PueC1WzVrh8k7nSXb3IGt3DZA7x6aEmc49/+Caf3NlgvPapOltWLF6FbifX2aoc2c+z9
         ArHPXrJiHrjlUOllFOjBllOcrsH7m6HxbctlA98tn3lRDoMeJCrnEW0j10P4LKueWkb4
         r6L/v7Yc40V/0CFvMW8eht33W6dHVNFlBVShuvfW88LiHtcXBVittAp51g4h2S4S53Yk
         qD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029649; x=1688621649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J44YZSaEeQfhIj8HinT2oD3ZFC3Ryk6H6oZb5sf0CQc=;
        b=H0mLXPFMkUY7RRcnKUEud3YGGnKN693BjvSvOgLa+4z6UvwR+rixp/nO/2Q0Zgk7mJ
         FxlIPAX0qdMjhd+FoFqcfrkCgY8VyszNnLnGnm2/mBZFdRFVy0/qiwCSj35WSUDH0d/5
         wg6Y5coavTImniWTXpzjrGuyMG8aRjdCOehiRdK+E5osGQE/WZq6bARzzfKv6Jebjmxt
         Gkym8BUMNb6LNAY7ksx1zC7yMLjJMas1IhQ/yaYSGdXxH38UBrvYUD1X0a7+uDXMW968
         m29m8gn2sK/1RmEUgLm3UkJjdZ/5l02u3uxPG9/J0RQbekfc3yLS7XNvqmlFlYt7a41Q
         Iy4w==
X-Gm-Message-State: AC+VfDzCOJk3XhzUy5BvV9Jsmyl51/pEXpWlD/mj3rPn2bDLErReTqSl
	uxl4t13nTjp7rXI4yDM0XxdelKhG2gbD4eLFvGM=
X-Google-Smtp-Source: ACHHUZ76G+3Avqwaav/C1sf+My+gkoDuyODwfqRVMN8ZOq24x5xIJVhr+VghoA+v1la1sWVsNz1qQuwVQ8jSL5uAidk=
X-Received: by 2002:a2e:95cf:0:b0:2b1:b301:e650 with SMTP id
 y15-20020a2e95cf000000b002b1b301e650mr725526ljh.1.1686029648435; Mon, 05 Jun
 2023 22:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
In-Reply-To: <20230227110027.804671-1-geoffrey.giry@smile.fr>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Jun 2023 07:33:55 +0200
Message-ID: <CAApg2=TLNBWVgS9_KdjhA1kDrio34i4st6mkthSErihXkkNvjg@mail.gmail.com>
Subject: Clarifying CVEs for NVD (Was: Re: [OE-core] [PATCH]
 cve-extra-exclusions: ignore inapplicable linux-yocto CVEs)
To: Geoffrey GIRY <geoffrey.giry@smile.fr>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000469c5905fd6f5ed7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182410

--000000000000469c5905fd6f5ed7
Content-Type: text/plain; charset="UTF-8"

Hello all,
I'm in process of clarifying entries for NVD to have them fixed in the
sources. The comments in the patch linked do not include all the needed
information, however.

Let's take this one:

+# https://nvd.nist.gov/vuln/detail/CVE-2022-1462
+# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
+# Patched in kernel since v5.19 a501ab75e7624d133a5a3c7ec010687c8b961d23
+# Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df132
+# Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e225c
+# Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d29
+CVE_CHECK_IGNORE += "CVE-2022-1462"

We need to write a set of rules on which versions are vulnerable, like this:
[v2.6.12 - v5.4.208]
[v5.5.0 ??? -  v5.10.134]
[v5.11.0 ??? - v5.15.58]
[v5.16.0 ??? - v5.19.0]

The values with ??? are uncertain. Geoffrey, Yann, as it was scripted out
according to one of the discussions, are you able to confirm those
"starting" versions ?

Kind regards,
Marta

--000000000000469c5905fd6f5ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>I&#39;m <span class=3D"ng" style=
=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">in process=
</span> of clarifying entries for NVD to have them fixed in the sources. Th=
e comments in the patch linked do not include all the needed information, h=
owever.</div><div><br></div><div>Let&#39;s take this one:</div><div><br></d=
iv><div>+# <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-1462" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022=
-1462</a><br>
+# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2<b=
r>
+# Patched in kernel since v5.19 a501ab75e7624d133a5a3c7ec010687c8b961d23<b=
r>
+# Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df132<=
br>
+# Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e225c=
<br>
+# Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d29<=
br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2022-1462&quot;</div><div><br></div><div>W=
e need to write a set of rules on which versions are vulnerable, like this:=
</div><div>[v2.6.12 - v5.4.208]</div><div>[v5.5.0 ??? -=C2=A0 v5.10.134]</d=
iv><div>[v5.11.0 ??? - v5.15.58]</div><div>[v5.16.0 ??? - v5.19.0]</div><di=
v><br></div><div>The values with ??? are uncertain. Geoffrey, Yann, as it w=
as scripted out according to one of the discussions, are you able to confir=
m those &quot;starting&quot; versions ?</div><div><br></div><div>Kind regar=
ds,</div><div>Marta<br></div></div>

--000000000000469c5905fd6f5ed7--

