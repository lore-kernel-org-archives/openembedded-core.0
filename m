Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5347C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 13:55:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.87182.1718718936904363133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 06:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pt9zC/pO;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f6a837e9a3so34410535ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718718936; x=1719323736; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n4JRaF92J1f1fxbL73pE64mhVl1rRqbjel/800F0ibM=;
        b=Pt9zC/pOig64X/pBwpLVV8p4YKtdNykwdjfnBDfJdkTrpU8tTEQiU1M3t+ZWX0NMFw
         fWSiTj3Op6sWt6ZSlaGiam5KI0/CXkGZhxfKfYPga9gqvVuF3RPxjgj9dwfcLy0TCBeB
         8S4Es9SnpihVSl5mwDIX3dyzaLr3q6I7JeVS8LVIC25sITZiVUqqZePSfCT0LHvDRbHE
         pg076B3Qfth0yeFO/jY6TRi9hMPOUvkIvR60I+o6d/VdRVXcWofOxvkbfRta+H1TtCfG
         gp0ApQY4Cz6Fl2LAa41V8y/Bamk0HXgtCnGYarXVf0C9IzEXD5LxaZSmp/NCBkQOuFyb
         dHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718936; x=1719323736;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4JRaF92J1f1fxbL73pE64mhVl1rRqbjel/800F0ibM=;
        b=pxVTWpR/hQ7HsgmT3IPPVBNsZeagmvBWzjErNUILus5E7w5B1xhdsw/vujHgpCj/e+
         1yMs07iDyJBM+JVekMP7Xd+z7fCKozM5SLPbgwT1HRg9iv4KxNc5oIfEQdNyfTfD+ghn
         lSL/VvWy7aQtNMXGOwrnJ+Nf6KYBZBfxOZxDzqDmC6iAoS+RUXxjaIsPP3yGuDpnizDU
         cYxkEgfdN34TYQIqbbjfebuBHF5avaIh2g5h3oGBhsXGnWGT96mKOH6Kqg7Gah1au6pA
         aRvj9aOxOdqQvtNsMtGbERa1oV1VoKiH2pcrgPQweO9H2XKFD4z9UaI+gmWxn69LCB9p
         AZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbEwuSwDmR13sBHiLw5zUaPhcJGFT2jUqyqIQD3UuoPnxfQ3+aHzKnp2Br8PQtbS4+e3ZnzWiswRAPsNP21FpuyahTp85cCKRm1DngiUR5ZOXkJp9qTj7g
X-Gm-Message-State: AOJu0Yys/ER7u0xSNW/L7wgU4mQTfiNxq6mTtds26WPgLzGxOrL6O33t
	EWOO022zYVh1/lIYSNPzKc6RMxZZAxDE5wXA8B3TSyW5dUKrHFrp1hXfDTl0B7Fk/8RdfPJ+Wu8
	s+NtVqIzZOVNxmV2d5e4zXiGCwgI=
X-Google-Smtp-Source: AGHT+IG62XLHNXBovDiVXvDR+1DtrZXAztXKbAsMoCiJ56nDGmes75SPw6gidTZOS3Df8RkLoTqH0j+AT1C9uXThcfM=
X-Received: by 2002:a17:902:d482:b0:1f7:1b92:6e7c with SMTP id
 d9443c01a7336-1f862a0b0eamr134066005ad.67.1718718936250; Tue, 18 Jun 2024
 06:55:36 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Jun 2024 15:55:25 +0200
Message-ID: <CAApg2=Se=zVM47pFHWfMsNpKJ++L9tAbihFNkER-wS3ZadxfZg@mail.gmail.com>
Subject: The future of meta/conf/distro/include/cve-extra-exclusions.inc
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000aa0455061b2a6ff4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200871

--000000000000aa0455061b2a6ff4
Content-Type: text/plain; charset="UTF-8"

Hello all,
During the cve-check work, the cve-extra-exclusion.inc file is causing
difficulties. It is a global place for all CVEs, without linking them to
the recipe or package affected. When we do not generate the CVE data at
build, we have no information which of those ignores apply to each recipe -
and we get the whole list for every single package...

What about suggesting everyone to put CVE_STATUS by default in the affected
recipe, and not in that file? When we have agreed on the place to put
overrides, they need to store which recipe/package the override applies to.
And then remove that file if possible.

Opinions?

Kind regards,
Marta

--000000000000aa0455061b2a6ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>During the cve-check work, the c=
ve-extra-exclusion.inc file is causing difficulties. It is a global place f=
or all CVEs, without linking them to the recipe or package affected. When w=
e do not generate the CVE data at build, we have no information which of th=
ose ignores apply to each recipe - and we get the whole list for every sing=
le package...</div><div><br></div><div>What about suggesting everyone to pu=
t CVE_STATUS by default in the affected recipe, and not in that file? When =
we have agreed on the place to put overrides, they need to store which reci=
pe/package the override applies to. And then remove that file if possible.<=
br></div><div><br></div><div>Opinions?</div><div><br></div><div>Kind regard=
s,</div><div>Marta<br></div></div>

--000000000000aa0455061b2a6ff4--

