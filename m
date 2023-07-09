Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375B7EB64DC
	for <webhook@archiver.kernel.org>; Sun,  9 Jul 2023 15:42:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.19500.1688917324206324411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 08:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Hhez8lb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.179, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57023c9be80so44072707b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688917323; x=1691509323;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7INfHLPRPDiPI+XHlqY3KWsz7vMWD7JXEmiLXQ81OLk=;
        b=Hhez8lb/Mb6etim9gbWZXHbpyT7nLYVBLck8kVZFUUHyQe2n/HUEKDVwEtjR4weXD2
         f936QwOJ3+LTCK/AmRdXw+Dqn1oCIeLnueot+PWS3vnERaZ/cnbGMmWGCePf1xrin7SY
         u1cVquek3FxmkTpRG8G59pkRGY+xIomhMSDrrbpAMxfRdUaOSzW2y4hkCTEbz3j1kCzm
         ktm+qTHgyh8CxuERoD+v7K9R0PsxXBQyXi1h1874MceuxV6f+aPwq3YddwnRP/2pgBkN
         2pOLiyydm9FJ06Oh2t8UAiBMnVTOxpswRKvs7khRvjpKOfI5t3Z/rXLmvOWDV6jYRMsZ
         dkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688917323; x=1691509323;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7INfHLPRPDiPI+XHlqY3KWsz7vMWD7JXEmiLXQ81OLk=;
        b=D9FGaddHX6NaS0i6QKX44XrMIQJQP1g8Om+wtNbxCfi9s1Gwu178+jtABdQCD/bvGm
         EjaZVwPPpkpc5XQY/OBh6j/yMkg75iklcznlg6byLwmCWWgyY8y4UMbr97DZpjC+dHit
         y/0j0e0uMHKV6bSqXlr2oqF/UHzQ2jUcbdOUGi+cujRwShx75nzYBIwXOVaMPO3MvuKq
         houKhXmtN1lDQoNOCvMxaST7cBa14aZcNQEqpYLaaduPg6Zp644J7GRWPrxHiAxjnbWx
         m7VI7bsSchqtcWWUVRs5bmXawcyElWAtKYsDwHXDHH5am2D4DXGX6zpoGg/qB5NCRBBd
         Isgw==
X-Gm-Message-State: ABy/qLbROCWHOslXs4FqrzMfsKkUvvbmXwCZgfcZie9Cj9sFyuGJX5uW
	YRKpilNBl0QYZgee/9y8GI+r2urFf7w20DG2umJyY2v3pl339qKEmY8=
X-Google-Smtp-Source: APBJJlF238u5Rp03fAzEOrOqy27uh168vZI8B7W4UN0XmTJZjY0GGaRsjho75bgedBmXzMI2FT5dqpUoKy8evkM8+O4=
X-Received: by 2002:a0d:e295:0:b0:579:e606:6ce2 with SMTP id
 l143-20020a0de295000000b00579e6066ce2mr9307016ywe.40.1688917322614; Sun, 09
 Jul 2023 08:42:02 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 9 Jul 2023 05:41:51 -1000
Message-ID: <CAOSpxdZMUVVPuRrzXTLHrcSmH=CZTruuPo5ey3nXgsHAi9JDHA@mail.gmail.com>
Subject: Weekly CVE metric reports delayed
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 15:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184041

Unfortunately the CVE report script is failing with
"urllib.error.HTTPError: HTTP Error 503: Service Unavailable" errors.

I see the same issue with my local machines here in Hawaii, as well as
a server in Vancouver B.C. so I suspect that the upstream database
server is the culprit.

Hopefully this will get fixed soon.  I'll keep trying manually ...

Steve

