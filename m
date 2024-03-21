Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3C7CD11DC
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 16:37:53 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.1749.1711039072200569931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 09:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WRFdw7W1;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609408d4b31so11973827b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711039071; x=1711643871; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YP9bGrZurov2CH5OtO/1LwWDWjXcCEdzRRgFA9iHgS4=;
        b=WRFdw7W1SqdRUQ8RVUryz2EhjO4kaIOgH+HljtXNM3v8H5/KmDtRssjLS5yvcmrXG7
         a1U+xfKo3LS0cpWAPNmNikjGaOWY/8xe3/p0g5p+kyojicMCBEOGp0bUAm0LEq9ABpw/
         a5sVbKdgPuZk3RslBqaAvE2Wos7wpOL203QAr1/Xns7eGMMU7BrNTdTMIpGFTdG6IpkO
         WJayqo9BSKppr3nJ092SPiZegiuIf4IjIXc2/7HmIBPiVTtWUYFWKrLYxvFDz0pETkHK
         K+CROc4JF2x2Bw5YwKVlbfDW2unA4LuZ4NdzW1v+qRNvQa7SbUAb2GpMkl6S7pvMBUI/
         0big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039071; x=1711643871;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YP9bGrZurov2CH5OtO/1LwWDWjXcCEdzRRgFA9iHgS4=;
        b=Xxvxd8B0pGep3qdboO8PUmJFA/ndFVQKKLDhdhAVeY6J89FBDLPiDoM/uwo58Z/LB/
         S8YNF2kkevxjlJN5PMvAStOue7xLLRAQOxkbkEBUgVJAZ80u7AwIOrOfBe39QSQUzSkg
         o6DNJWQJmP/qnIqQU+E0OJxEr1yR4eAZvSTS9dCAm6wzoqOepA3EUjAycxc45tvBYtJZ
         UEcLp0ZKcveD40jijroxny20l0fxf0baUU5uJWAIaZDhkJf/o2jVJTtJMM7Jb03SBcqd
         fOIENwXvQO1OX1fSk87G+wrKWeei23BLqPc7vvMST4K7fIVb8wigXuQ62L23WSq9tu5D
         eMcw==
X-Forwarded-Encrypted: i=1; AJvYcCVCQ98maNc3jRnJAhasGDw34uaffCgu22nTwkTUlqO0iWMc9XCUrEL/BMQLFrli8T4SwJW97mNCkO9RehZBv9yaFgBsMbYdiORz3TfQyR++ndHmc6v2bawP
X-Gm-Message-State: AOJu0YzN1X1/mtIgdAmE5F0Nq4a0f4sjbWo79XeVRqcBWKdBgGUEmOYO
	HQdTQiTK3SNWUIonLm3Gt8m1JYNjraBBxoS6h4J/VF8BO0HSxirWqfTzQdRJJRUfYPxIYfwpGvG
	ps1QxQbYG1a3eBrrjALgtzny+zIi+rnoss8VdJA==
X-Google-Smtp-Source: AGHT+IHsuqmWK1BiHDbggK7JBKdh8tvmuWEJ6bIn/BBPj1Sg/EYFgi2jiy9cZ2ZlMeAdMx+halJm4l+3ABSDxeaLuPI=
X-Received: by 2002:a0d:dd14:0:b0:610:ecf0:a170 with SMTP id
 g20-20020a0ddd14000000b00610ecf0a170mr5580692ywe.5.1711039071259; Thu, 21 Mar
 2024 09:37:51 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 21 Mar 2024 06:37:40 -1000
Message-ID: <CAOSpxdb=_8337e_QyL_mgMdXKgAjEkp3W5VxEK_kk+p+7ZGzaA@mail.gmail.com>
Subject: Final dunfell release build on April 15, 2024
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 16:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197417

If you have any patches you would like to submit for dunfell before
it goes EOL, please do so now!

I'll be taking patches until around April 8 in preparation for an
April 15 build.

Steve

