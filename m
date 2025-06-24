Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24602C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:50:58 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.5442.1750762249047065627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdj0FmxK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so54597366d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750762248; x=1751367048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nSkPzXZndTvtfW/KiO5N11VEaYyBy5n7b/dVv9E/Rj4=;
        b=gdj0FmxKp8z4VFuqpS2WqTna0yI5OVTNeHgNQstB0Y0Y5q3ZxEeWtgGqt96U1Vbh4x
         IusdoXk5cAvrUB3BpV8iGOXTgfOHthsM/8vBVWfxiqqXorFdxga5NNRqGL30sFJL9yjl
         X7MziZvow1VjFUY8ey8dVcfsQPlbgPizREV7Ds9TIsJAsHjT2pnLV/8yIqkM+1lOMVVd
         yFUjeI0q8SPhxXNLZt99CfANgLyTkBoMy0q3ljolMeIbk24Xixp0qMbF7SbFH+RLy+C3
         s6MrlHr7P51gBATln9HBqxr4vIjPhdN/nYMMhHEfI+NCBhu/tF+CExkJPilcOb3wlZKJ
         0gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750762248; x=1751367048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSkPzXZndTvtfW/KiO5N11VEaYyBy5n7b/dVv9E/Rj4=;
        b=l06BOWGWo7sHis/GkBWDCu0ZtKQruDrFm/Gt2s8Dfs9Gwb687sm1PTXfdgF/KMukHA
         pR+R9JPzg5XM1fr0g4gqKX4AHsjklEZ46jBOJq2XiKqGqB57j01XOSQGCgMCkaj/7AxI
         iGS7fLIXxWLKRWIKOlEDEjMX6nd+hDZOOgaZUWFYVMu2fCmGZB49brXDrU3f6qV/4ezm
         dMYXxIU4zBOI+NtqQXalVbWT1RO6WWtSAYBMEgc/FntnuJoqggMxB6xhiEEAtMomtWhO
         PL4Sgimz4lSOPJaJMDHRFE+tiEXY6dVemfU9K18H9eJ9o2Bc6hm0idnpq3+Pje33wWhf
         Ibvw==
X-Gm-Message-State: AOJu0YyBEYa3xa6xo2iPiP0S7RrGLCY+mXmbMBMJ2MOInlFgjDuG8Yrk
	jAUGbriWN+Lq/ML3QJupzjH6z3GBJqQDnHkuij4TaEJH7Wf0KMnATrFjlrWjdqz0hgpvqnHIvP2
	T83htxcxhzgM3aU7+I2KVfj57U2ICbF/5dQ==
X-Gm-Gg: ASbGncvievyeSpinRzLqdyCaKWxKDbuh/MLhzYpVuFJgoRuNr464gNFr5tcXDZpsBsv
	93c0X+aRx2g0B0E0HIAxqYhtzxoIXA2DAex1EXTScBAbs+Us2pHr6Vp/rCCUfYuOvPO2LQohiHQ
	bWZkkCnHqtO2uRDcroRQFUANXHNw8uf8EdPwgz4g+4220loFdLna9biQqIuxa/OnNpW3+/drPcX
	eJk0w==
X-Google-Smtp-Source: AGHT+IHNRXAWr41dM15TBz5dm9jPFsLBuxQLeZZ2248qO4MaZAY1GRjDlIvdDEWR/iWdVjA1l6F+H+ejA4O0WcslCHs=
X-Received: by 2002:a05:6214:212d:b0:6fb:4fdc:dd83 with SMTP id
 6a1803df08f44-6fd0a5b4846mr217269226d6.40.1750762248089; Tue, 24 Jun 2025
 03:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250624104155.559827-1-yi.zhao@windriver.com>
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Jun 2025 12:50:35 +0200
X-Gm-Features: Ac12FXzXemeU4CB15Q2pjpPurrrjGxsSAaRcslRFjfItxDMwFMuThf8Yb1lHhPM
Message-ID: <CANNYZj82+jT8iUCnSdXdD17hGf_O0b3iXzFhxx+mHGcdQs6L-Q@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH 0/8] fix runtime versions
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219250

On Tue, 24 Jun 2025 at 12:42, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
> This series of patches was sent in April. Ross suggested discussing this
> with upstream to see if they could update the scripts to address the
> issue. I talked to upstream and they declined because they believed that
> "autoreconf may result in different built source code than what has been
> distributed"[1].

Is there a benefit of carrying these patches in core to the broader
community? I don't think anyone's particularly confused or misled by
'unknown' reported by executables at runtime, we have procedures to
verify that what we build is exactly what upstream has released, and
various built time reporting mechanisms to see the versions.

Wind River obviously has invested a lot of time and effort into this,
presumably because it has a paying customer that is obsessed about
what executables on target say, but I do struggle to justify carrying
and maintaining these fixes.

Alex

