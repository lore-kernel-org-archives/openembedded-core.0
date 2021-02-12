Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.2444.1613105651086209474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 20:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nfNzmpWq;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id h8so7681073qkk.6
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 20:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBAmI/JWbrX7O/y1E1xwgAxoGwjWRpWAuiZ3CfefTqg=;
        b=nfNzmpWqlrlMBFhfcjNDvpratuCh3dCBbMFMyZXeh3tIJIvDuM9zBKqhebp2ubU0Me
         aKSKI09C0iAiGMY8cMxPcE5A5Pun036k7vsrV6PMFTkcbv3OwOaOG7J7UWyOeaykl+Pd
         wuI2bdxJq+q9bit/cYskj4gXMgcNAH2Ws40AbGb4SQE6zJ4BtGRKFxZgVPOUdpDCE0iG
         KTDWov6Ymu3dZe6H7K9dv3zmEnQ7A+xiWF3haW0z55Ns+FwsOuVYbg1rxgOMJtYfGCpg
         32qACLfO3OMzbq+5rr6LB4gcO5cDuICS5oks287MdEiIRTmP79jcdWQFK45c+4w+KzPg
         wUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBAmI/JWbrX7O/y1E1xwgAxoGwjWRpWAuiZ3CfefTqg=;
        b=dgJUoSK6rTkEiWxw0CqSaWNwF8st//cH3gv/C249D9rbMqw6WFYSHXUq9HG7EAjpJ2
         SteDvRvHCZPhxZWeSMt87/Hq0G6y+tEJTqlRmlYW+mrg9P+N0hoFRY2GlAqNS9Fcqddw
         rPVH/rRaPNHdgMnlbfb2CsQ4EAQQu6Xm9A+4+oO+qczrPUKGnKGFpp9mAGnsn/luM35e
         JA+AokhUs/0vm1RhAs6yx1lb22u8iBYg6ZfNB5mjX+0NG6EQkQ06Fg9G7pcs3d21q8IX
         NvL71ArRGZx6VN4yZqdCRRKhIXTQKOvXnDwI/QH29D2DhTer196YTEIOw+BBZBjrg64+
         nAZQ==
X-Gm-Message-State: AOAM530+oL7qr/Xf1jvDJJdJT+ESf1psvyxICKEv1s7UBxRvWg62dEPw
	kDyYD+76YI487le59kPwnlEWpmuFBqQ=
X-Google-Smtp-Source: ABdhPJxBZlbKvtVB3OrR/DhZJXwhDQ5VVNDE2F4E6OkJebyXDA9upQXqd2lLZTE9UxOdMHxCeoRowA==
X-Received: by 2002:a37:490c:: with SMTP id w12mr1158342qka.156.1613105650228;
        Thu, 11 Feb 2021 20:54:10 -0800 (PST)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id i6sm4992703qti.30.2021.02.11.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 20:54:09 -0800 (PST)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 0/2] replace qemuboot.conf by qemuboot.json
Date: Thu, 11 Feb 2021 23:53:33 -0500
Message-Id: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes bug #12503. Sending this as an RFC since I'm not sure what to
do with autobuilder-worker-prereq-tests. It fetches a qemuboot.conf from
yoctoproject.org, but this cannot be changed yet to qemuboot.json since
it doesn't exist on there.

A patch is also sent to the docs mailing list to update references to
qemuboot.conf in the documentation.

Guillaume Champagne (2):
  runqemu: replace qemuboot.conf by qemuboot.json
  baremetal-image: change comment to qemuboot.json

 meta/classes/baremetal-image.bbclass    |  2 +-
 meta/classes/qemuboot.bbclass           | 18 +++++------
 meta/lib/oeqa/selftest/cases/runqemu.py |  6 ++--
 scripts/runqemu                         | 40 ++++++++++++-------------
 4 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.20.1

