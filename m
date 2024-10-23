Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9827FCF5399
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:51:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11147.1729695063392200763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ocm+e6St;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e7e73740so6219937e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729695061; x=1730299861; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Di9yEt7fNJAfVZp1UQZGNLiB/b4VOey0GbibaQ8kwwE=;
        b=Ocm+e6StSm1f1ouGznUOjK/JnHLDX+Ir0VO30L0u7wAD6XFgsy/ZCVmBlheTz3z4xk
         7SmfrXlhrr6XSI3OgEI888drk+/eXAfFzT+o/b7Zx/sWxpwlRqMB4yf0sF0UdZpI9sgZ
         iDrRxy0VJvM7eueWYAWsYpjaYwmu+zAlKDgONY0u2sSZOukH0YXf/HQauc+iBABj3n6a
         jyqSQQuBTEQGoK84GRjvhFfOlo9ORU7Z0D5KZxu7XCLLcUlEmoHVKyWjUOCo6BiUDyvN
         V8y2D1dI8XenUyoglASlCjYWdv/99dHAh1a/A8yFXLqX+aOeK8nhXK68nKsXtN2jb0oL
         FNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695061; x=1730299861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di9yEt7fNJAfVZp1UQZGNLiB/b4VOey0GbibaQ8kwwE=;
        b=DmibzBCV4JbL7WBWK6Faq1rDByRALt4NfuX88B02T+Xo96UU40D3oi1SA9DEstKA5T
         kHbgEV2uDyE96FAavqJ/FISjfuEYPxcaVCpsIpDMwUtTedt3btn+qG9hms8u5HLCmlnY
         K8q1iGtpC1PMg61v5XtvluhQpALc8KERBkbk0kaIlUKLn4IlBlfNMz3SXQ2hF9IBoP4l
         rKKpuYv4aXzvKcrWx4F1p7CMCC6+cd3HQGfCutCWSbozD+kDq5kfqwwkGR491ODSDLYR
         cnrEEuR9S7pi6wb/UAAAiQtfjU6+WGje2Y13ot+aRfaj/JDAqEr67VGeqDxZiFl6wvtY
         Um5Q==
X-Gm-Message-State: AOJu0Yyt3nIX6xip6+WQDyMz1w2YldiOCIRyBD5RxM+Q5MGGA5JNOqxX
	pwdEkb5cUeDC5uaJPqjfXioqSzp3ydLCrB6YQ7ZKsTsJRVHPGZU4jpP7E18W3y1xlX3goZgfO8b
	YSlDN13stpUd8n37u+nqg3dkVHJY=
X-Google-Smtp-Source: AGHT+IHJttNlGuPZhTVIO12wS1V6FMVPV7oTtU+10qXEBd4ZN7dAmHFAGUvDCb3GD72ef88M3fZk1n01Q5E6ZDM9SIo=
X-Received: by 2002:a05:6512:159d:b0:53a:1488:b45f with SMTP id
 2adb3069b0e04-53b1a36c4a7mr1687895e87.41.1729695061327; Wed, 23 Oct 2024
 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241023142730.477569-1-bhargav_das@mentor.com>
In-Reply-To: <20241023142730.477569-1-bhargav_das@mentor.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Oct 2024 16:50:49 +0200
Message-ID: <CANNYZj_R3aNU=j8QLmoJkSc-AaJLh8-bK+3nvvsTP6ksbKahaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: Add runtime dependencies for
 'libinput measure' command
To: bhargav_das@mentor.com
Cc: openembedded-core@lists.openembedded.org, 
	Bhargav Das <bhargav.das@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206243

On Wed, 23 Oct 2024 at 16:31, Bhargav Das via lists.openembedded.org
<bhargav_das=mentor.com@lists.openembedded.org> wrote:
> +RDEPENDS:${PN} = "python3 python3-libevdev python3-pyudev"

This will add python dependency to a very core package, and in
embedded context we cannot do that.

Rather, the real issue is that libinput component is incorrectly
packaged: library and items in /usr/libexec go to libinput, executable
in /usr/bin using those items goes to libinput-bin. Instead, libexec
items should be moved to libinput-bin, and then that package should
gain the python dependency.

Alex

