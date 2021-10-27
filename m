Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08881C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 00:39:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.5280.1635295188598576461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D/99eykk;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso4732381wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKcoWKiGDVCOqPoAUaJ65ASDj/Ig7MuhoxAAyebI8FU=;
        b=D/99eykki3iWPkyLzEYv+BwKNzf0bHEkgdQ0CiTaoIvI6AmxCerFTniC2h8lLir62B
         kwSujj4vnw4MFpm6NIbnAb6NN56WWHrKYS0YmWcvnwHWpbAByXyRzKXrjAeMOalaZxEX
         d6CbzhJKAl2N4/Ra9VOzxUGwMidS3Qa9oi7zJNkrtwCCF+D1PIU5O6BrF4a7bQ13jgRn
         Yp5CI8kywFPajj47uMBJiSa2Hp3r4y9pkdQDcdI8/rWcu3sQoo8BADrMo05X6nrDSjR7
         m2uqNA99B9WMxe8oY2QSfaab78A8iD1Nu3xC3eFUef2nerFPL/77PFDssVYvWi5iwJN/
         sgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKcoWKiGDVCOqPoAUaJ65ASDj/Ig7MuhoxAAyebI8FU=;
        b=c/byMzThEfFcpm37gCP8ZAo35zZA+9xvC1gnqRwHHuqbiKT0qpca7UM6VhxNpurRoM
         N9TBLHKjKksPw82Baa7XyFX4QmwJIT2sL//ZvYvoIbznU4B8wUj7MqPz1lmH31fjoM5W
         nslufuxVgjLmUAILN0KeRdq9gIVyCZy0DKflTBHjw45Zk3fK4TREzlsA83vTHPPhNiZK
         bAgQ3MEsu9sdiCxP1MYebzJwGskgRsNz+5CT2kh6mIYz738NgWATeoN8+RGhRhJPP2CB
         HUhqqI+dlnmtdiCSLBLslNy4E0D6JyHqJSEnWJofxBqfQjcybBPNUBzm8vpast3urMS9
         fn4A==
X-Gm-Message-State: AOAM531DjKMz0PAuWmVP+CFzXk5m8av9tPxty3EN4sQ2BH/kLUh/RzC5
	hOb4Gaeb5aw9yVK0+3a7Ax0fgC5Z5U2E7MHRkgC7VTxf
X-Google-Smtp-Source: 
 ABdhPJwHrGEd2wMev572zmBASr1EW8a01Ir5kFgrNb4Be5vHrxCV1+eZ/zcmWBkXlxN2Nvl73wj+YIRfKjD9/vFQT8Q=
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr2249403wmj.89.1635295187114;
 Tue, 26 Oct 2021 17:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211026233602.71762-1-saul.wold@windriver.com>
In-Reply-To: <20211026233602.71762-1-saul.wold@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 26 Oct 2021 19:39:36 -0500
Message-ID: 
 <CAJdd5GZ33bRsDPeQBz8CEiDC=WXaNfO+ZDH-aWeMS=qRg8ggww@mail.gmail.com>
Subject: Re: [PATCH 0/3] SPDX: Add annotations to relationship
To: Saul Wold <saul.wold@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 00:39:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157464

On Tue, Oct 26, 2021 at 6:36 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> Add annotations to relationships and refactor code to add
> create_annotation() function for code reuse.
>
> Ensure that "cross" recipes are factored into isNative also.

Other than the comment in the later patch, LGTM

>
> Sau!
>
> Saul Wold (3):
>   spdx.py: Add annotation to relationship
>   create-spdx: add create_annotation function
>   create-spdx: cross recipes are native also
>
>  classes/create-spdx.bbclass | 23 +++++++++++++++--------
>  lib/oe/spdx.py              |  6 +++++-
>  2 files changed, 20 insertions(+), 9 deletions(-)
>
> --
> 2.31.1
>

