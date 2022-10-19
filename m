Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F736C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 05:58:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4677.1666159110357981552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 22:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4lx+Rpq;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bk15so27252553wrb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BLJAt3lROpy1iDKLdiQbST8T6Y4xM/LvuRbWltoRhhE=;
        b=S4lx+RpqiOC9Ji5mXNbPUoIRmZNwiYtSBmNoF/GKtjccWHYiS+7ISAh3oVBU+A3EOG
         j2DheG979+3Ex4qfooAfBqzTXZRwP7PiXzCmrJ8G6iM2PQltaHXnqyJ8a6zcfB6bimE4
         iUOLwJIA0a+xdCBUREzXrgeGIqtJn36XwSwTlpR9xHRIMJrQQXAEmP3nHeP5ox/QEEF7
         PA1sNX8BeJ2F47xYc/YWA2rFl7ICcexMjN3CC8LdEC3Pk7Yj0NNx0wnP1E/ucZZCRo5K
         NFJQJdaVEsq8dybmaCXtjEoGYUaSuK3BkLIJJf5n4BEQzhavpM7NDU3Ueo1ooTh2a4VV
         0JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLJAt3lROpy1iDKLdiQbST8T6Y4xM/LvuRbWltoRhhE=;
        b=wkNl/uvXLuO3VwHEH7RxoFGQICJD4cOeiSfJwp9QVqUaYK4AADZ6pW+vfY2+kOHma0
         ombJ3oqsD30spd5ka3OGpusGrBEqDHXUWky1EAXK+gwo01pB1uc9VeKWliJ6jFmfpWrS
         lOY9nlq53/Pxh5nqVB72BjtPneBM9XsR00iyYWNaXcaWY4Ovl8AsmAj1eAeq3GhIIe7T
         kRmnM+nMfeLu6iI4h+2cVoTwEHyiq4a31tor4kwX5L/ThLjZInj0uhWz06X1tQkHXHjO
         xxqS7W2Ocy/ZELMy3st4y7f22M/L3BGiSfC4fx2292TDgzi8KYOIuk5KaYZLf2pICUhW
         5SZw==
X-Gm-Message-State: ACrzQf3LY0Jw/0lSzk1G0jyHB7xApodLqMPSb4/0LhokLQZl9nZuii/L
	lrviHQT0CQhrGkRbxFSfmxtFN/rJiu7poP9yxO8=
X-Google-Smtp-Source: AMsMyM7m0/tTYfe5Ey2TU2ioppk7KWDO4AG11qd/Fch99HZ9WfuNh9r/4cSAncz/OwehSUQnO8X98jIgeOpvPx3SMGk=
X-Received: by 2002:a5d:64e2:0:b0:22e:7060:b4a7 with SMTP id
 g2-20020a5d64e2000000b0022e7060b4a7mr3628464wri.129.1666159108610; Tue, 18
 Oct 2022 22:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <171F61FEE1540458.9064@lists.openembedded.org>
 <CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvrjhTyFYPn-hub0eSUC2PA@mail.gmail.com>
In-Reply-To: <CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvrjhTyFYPn-hub0eSUC2PA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Oct 2022 07:58:12 +0200
Message-ID: <CA+chaQequ9-t1p8TUazdytCehxozdU1Vnp2MyC8mNb9JfXiNdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ceddcd05eb5ce5d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 05:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171957

--000000000000ceddcd05eb5ce5d4
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 7:51 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Come to think of it, the right thing to do is to actually not do anything
> at all, just adjust the patch explaining that it is needed on 18.04 hosts.
> Is there a problem when it is applied for the target?
>

Yes, it causes build to fail when DEBUG_BUILD is enabled.

--000000000000ceddcd05eb5ce5d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 19, 2022 at 7:51 AM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"auto">Come to think of it, the rig=
ht thing to do is to actually not do anything at all, just adjust the patch=
 explaining that it is needed on 18.04 hosts. Is there a problem when it is=
 applied for the target?</div></blockquote><div><br></div><div>Yes, it caus=
es build to fail when DEBUG_BUILD is enabled.</div></div></div>

--000000000000ceddcd05eb5ce5d4--

