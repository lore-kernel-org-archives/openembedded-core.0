Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEAAC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 05:47:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4714.1741326453517890777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 21:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PwC787PW;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22403cbb47fso27651205ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741326453; x=1741931253; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4xqFiZJvW/K/QOU+CWcXe3YsAk58SPKfvEke0j8t624=;
        b=PwC787PWPGxXACneBOytRBv9DpmIt5tjVpP/ITGts67P0QpsEhPPgouXnH+VdTSBPu
         JVqsi4x3odwrZ7mkA0Lk4d/ZtNjj2szptVRF9l+8HTfTcpXaEU57iSUSwS98r1ATNrN5
         ExKxb5pMb+cUi4hOkKO/qjOcyRTrl0hXyb2Lki/ClM/nNRMjPxm+NOeAgT/veQxA9NPY
         9Ic4fgWRs2EgXwz86aoYYOQXkyGizhmuLvrMdAH9AMJMflvQGBSLwP1NfthMSjBT1zWs
         r3P9GvPWmz42ca7NERVNw+PzNrlrJScDvJ/2W6S5hmJlIUTkhq/BZyQKj+cCcY7gXdoP
         apdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326453; x=1741931253;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xqFiZJvW/K/QOU+CWcXe3YsAk58SPKfvEke0j8t624=;
        b=jNV2JmKI2RpbgyuOk32+nDCzVECTX4oCYvbTGXvPrVfUSyqzDzXDHsdlI6IGy0eDRI
         TznigUQigIyVWQXgqdIJxieES8YUi6W0c0kzDJ+tnnpCIjTScEMh587kk1BTjVNA9qxB
         mYd/QRZIkQ12RZEN58vzIGIORsBsvrSKXCDsHnzbLH4FAk8xf61q0UchPij65D4tMxp9
         qRnyy0AEvWfWhE+5TDGa10GvcEynXKLi1ll3GW1RMygxkoYFmwVkIM3DmGoEq/GkeXIk
         R50RYT9Y0SSfHCngAVMoJ2IRPuvV1ITbSDAlCLjU/sVzqFmdLhATSanggDtzptbDAOcy
         0UOg==
X-Forwarded-Encrypted: i=1; AJvYcCX0FS6PH3wMS1Tuy9PFhcszL8PyTho0KTqwNhPxS4jr1ktUifpDvTWja7v1YfMQTc3cgKD/UbAxenuo0VjEnrT3nA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsIfUMBSiIhWp7+FXexWw9JTbSVyWQEEmj31N7rwfChuFzs+o4
	Fyls/l80IOMIBTBkeWgvWH0co8ZyIiPTtaUa4VtD3axbRcMDIRNHsHxX9OmnIWDQ2Zg8B8HCDrn
	4P/PH4LK6T9icaJgu6uC+VSOhqpJVfzm9
X-Gm-Gg: ASbGncuDwo5lAqHq1dIYnvexpDLpJdWPLm78ln8BQOrWtd43xiUuu89e/qmRHI5kA/i
	lFXHCg22AMwdHm07XT5lkMg/G6t3+OPt9E3g54dxgfKyC4cuu/OXXbkkjKqvYC/9tnZR5NO2Psi
	0n+L7u+foaxg3QaPr9Z1qEaz/E4zc=
X-Google-Smtp-Source: AGHT+IHSxzFReyk42eRrJby+o5i2NN41g8LljNBt3d/WJz6rHthcf0cg/X5R/XWw4fpiIpNg8Ekn9rhE+mEL26b5In4=
X-Received: by 2002:a17:902:cf0d:b0:224:a74:28cd with SMTP id
 d9443c01a7336-22428a9d1admr31552425ad.31.1741326452622; Thu, 06 Mar 2025
 21:47:32 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 7 Mar 2025 06:47:20 +0100
X-Gm-Features: AQ5f1JqXJiqDjonoE_WsHf0Hjq6bhwqhqb8Xu4aQ9WKnpayCZ0Wrw-Cg8yU8apE
Message-ID: <CAApg2=SEGPm6ne=yxB9E_U=je_A4x7brancJF2BZ3nY01aS0qw@mail.gmail.com>
Subject: NVD feeds update
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a58fd3062fba288a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212410

--000000000000a58fd3062fba288a
Content-Type: text/plain; charset="UTF-8"

Hello all,
This has come somewhat unnoticed, but NVD has changed their mind about API
usage vs feeds. In short, they plan to bring back bulk downloads.

As a reminder, the old plan was to move all access to the NVD database to
an API. The migration to their API increased download times of the database
by a factor of N.

Now https://nvd.nist.gov/General/News/change-timeline they are saying that
they will remove the legacy feeds only when bulk downloads are available
(likely in a different format). With no timeline.

That raises a question about what to put as the default feed. I _think_
that the FKIE feed might be a safe default.

What do you think?

Kind regards,
Marta

--000000000000a58fd3062fba288a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>This has come somewhat unnoticed=
, but NVD has changed their mind about API usage vs feeds. In short, they p=
lan to bring back bulk downloads.<br></div><div><br></div><div>As a reminde=
r, the old plan was to move all access to the NVD database to an API. The m=
igration to their API increased download times of the database by a factor =
of N.</div><div><br></div><div>Now <a href=3D"https://nvd.nist.gov/General/=
News/change-timeline">https://nvd.nist.gov/General/News/change-timeline</a>=
 they are saying that they will remove the legacy feeds only when bulk down=
loads are available (likely in a different format). With no timeline.</div>=
<div><br></div><div>That raises a question about what to put as the default=
 feed. I _think_ that the FKIE feed might be a safe default.</div><div><br>=
</div><div>What do you think?</div><div><br></div><div>Kind regards,</div><=
div>Marta<br></div></div>

--000000000000a58fd3062fba288a--

