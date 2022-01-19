Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A62C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 15:58:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.8077.1642607891760348252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 07:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o1oUQvdV;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id p12so14117982edq.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=fSvu0rnGx3G5V9vD8O3m8u7eNhxdSTDBgQhdu3sOE6k=;
        b=o1oUQvdV56FsU0Q6IQfwmMTpy4sJvHNP04O2sqLb3ouOPiaDVhrwd+aIllvKjPFlcP
         S/zEXWacYrRtbIR+U5jrZwE+nCbNi2IBjFJno9YInDdIFHxfQdfuQNvGXWY/Pp9P/+S8
         5VugTGML/Ra+a2yP/aEKK7LUEuyFAccZp0wydnTFkxIcp+opsDy340fsBQyHNedFy3ov
         3UNfiNdlpEKW//xSqlLTna/j2NEM3dYBLTbLTURuhIzcdUQUsdZ5pAPoVyndVDLBoN/S
         nqdL28m3SM8LHxECWdYKjQmd/f7/ApxqYC92MHiPr//7O3xQgpvPIuf9+S9LTYVC9K0+
         6RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fSvu0rnGx3G5V9vD8O3m8u7eNhxdSTDBgQhdu3sOE6k=;
        b=t+K31OKEdr/ARd3+gGd0gMyNTlSoGHRzcM7D97fMJAyoYmgMYU9E33R+uY5vT3SZi8
         5ngINBuk1CmHQ0fHGXcmLq5w5L25U9apqfSdSlvr60w1J5hclH0r4pzykFRZ2g2Zb5VJ
         L9aXhoElyx6EXNUocivH0K+5q5NdZ/iNCRN9tHTRd7GwXqguDe1NgkD0ljNoHfM5WNrE
         jzIWQYfTxs3kHvGehdqvhFWh5pU0/KPssBj+XkaBTQNbbZQNsACa2IQQN3lKx7rbRDyF
         +pRD5DivbezUVYvsSjz9pgqyRqjdFyN2uVaN/VPxQjGK6/FDDoF/Q5rZNcqaRWiZlGc4
         84ug==
X-Gm-Message-State: AOAM532gzQoNRndyVYqkA5PcF3ZCYGOeLRPRBS8K6ZxUKLAkY7VlXk2p
	Yt7Ym2FAofcdsz8ilm01S6TyucH0izEZmJDQSY62RdDWxcUtvSkDq9c=
X-Google-Smtp-Source: 
 ABdhPJziohYUFIv7o/vVjHoxSESmAM3tpqWK2/b7iJV0WQWj3wKruvl6R5KUJPfUh6dxkkiWFipJnjUC1rqTjXxF7SQ=
X-Received: by 2002:a17:907:6e25:: with SMTP id
 sd37mr24490259ejc.246.1642607889392;
 Wed, 19 Jan 2022 07:58:09 -0800 (PST)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Jan 2022 05:57:58 -1000
Message-ID: 
 <CAOSpxdYPJFUwvuzdyeKL_uNAit1-oOCCs+w6+1ggkdFF69H5WQ@mail.gmail.com>
Subject: [OE-core][dunfell] expat CVE "heads up"
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 15:58:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160740

I currently have CVE fixes under test for expat CVE-2021-45960,
CVE-2021-46143, and CVE-2022-22822 through CVE-2022-22827

Just wanted to make sure no one else wastes time working on these!

Steve

