Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED1AD2FFE3
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 09:53:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.18842.1729245233786575093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 02:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3n53mzi;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e8586b53so2505897e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729245232; x=1729850032; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2rsyX+sVJH+iNjkKEkLk62pWNWfnScq37kO6Q8wGBg=;
        b=O3n53mzi8kcp4CCGIv2V8ATt5P4i0S5V13+edRj0mmTAFXAUSInBGRtQwcu6dYfsr3
         qEZnNFyoR1YcwrNQ7ezM2Zz2E3CUw+MldBeKVDsIziFzmtJPYn3zsh0mHmDIy/dOSMJk
         wvOaLWYwfdL5QjEunbX0CKcLZZ0CvoubZ/AAtBJi/VIdfESzYmp9gvxDrVZhiQBPtzYQ
         ZYA6Eut7UPmqzYuHI8nnPLhkwYJeSexNQfO2PVF6fZIrjxLUgd/bqiOWCTLmAqo7Halj
         ztdvlahigHbVVjloRUGfD6766sONjcS2fVIRwLOISZLh9hTC5Rn7nhHFFiqrC3PXu6uh
         iQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245232; x=1729850032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2rsyX+sVJH+iNjkKEkLk62pWNWfnScq37kO6Q8wGBg=;
        b=RiAuQc62bbPQ3b7bo+5AvqhbGMZRi/PYhswQewrfncE0nOSt2JQy9ZgYGkllRKlQ3o
         HsGa1UP3/5Lu4TBHDTtppKrKR47hGjHnBsvTHX8WfGzQepuja/dWCYuLZoqDG1gp0zX6
         mIq6qPNLycOGt1t7sFz3pvCiXMQKneOsoBOZ+rqQbWWg/dvJsd1v9sSXE9+CLocr12GN
         0CAzRAZUtPQsDd7Vj5VOciYjJU9a2JFww2I/sIYvMYF86vcUdYAVPKCydLNi9j0C8GGd
         /eyWkxj5AMOvBSaTuIK+gc7JTN20Y81lnH9QCFcSyzGdVH7jTcW5vRFxQ6aTuFdbUTE/
         OKkg==
X-Gm-Message-State: AOJu0YzhLVROWMLcelpD9DzWRYPI3mf2Ksd+CHOtTVwmEc/HfAE+9+bW
	atkfpvm5wfg35lJJpiFieSAqdzo2tUKCY3pvj/PhgRzZlx6NBF1GCbyz97NiBMkCY+839oKKDBW
	eCPGUF4NkfXWBnZ+wgPmNk4r9EzveEw==
X-Google-Smtp-Source: AGHT+IGyq5T+y6UM40xqFe/Ki3VY7oDOj9LlOAofAhAku+4+sgLUTUl3AoRWn9nZRRAF0cam7+oUb7k27UKvcFUmAFk=
X-Received: by 2002:a05:6512:3e1e:b0:539:e3a2:3a25 with SMTP id
 2adb3069b0e04-53a158625d8mr569994e87.18.1729245231337; Fri, 18 Oct 2024
 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240517064329.796326-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240517064329.796326-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Oct 2024 11:53:39 +0200
Message-ID: <CANNYZj-DbpyYbV7XqpsZoSx9ps25-9p_VVA4FcFMYW33FPJ5Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/cases/runtime_test: Exclude centos-9
 from virgl tests
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 09:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206044

On Fri, 17 May 2024 at 08:43, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Similarly to centos 8, centos 9 doesn't support the render device we need
> for this test.

I've submitted a merge request to enable vgem on
centos/RHEL/derivatives in addition to Fedora:
https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3449

Alex

