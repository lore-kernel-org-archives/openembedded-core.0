Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3B2C4332F
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 16:36:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.46847.1635784569488468822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=x9cu2KVm;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id m22so29052975wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WHRqWM7xrnukGX99UqWzi8J69SsIL0Vp1/sRhvk0biQ=;
        b=x9cu2KVmD17l+lD+7sWfdRF6+sStubByjlpSJnCFlCvyG+XvwPf7Rb+Q57SYuID1Y6
         VMuhulsYqCLvo70rDOe4jVI3dRLuAwKeTqiqwB4da1TeZezgZc6IEbYd0n/sS8heozWB
         pNF42oG3VbWpb+Z4vE7Z2pO6ZXgibtzPOHTdf2w3V8pzE/QoYZUxp0PH7ZtWnbeO++Po
         oc6yysSSC1Yc9jSOM8InH57Og9U6eS3IzHGultMCUhyhXhuGF3uYwt/9Iq/Tj9KoS5r2
         JRCHInNrCy5cTd6vIwWwcedzqDX0Py7Y6A4R/dMMJ2k7t6/2f+2TS6/rTYnSGBTYkwZl
         rmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WHRqWM7xrnukGX99UqWzi8J69SsIL0Vp1/sRhvk0biQ=;
        b=40CulfpZYtyYXm4wZFbPF7MvDlH8XuIUNzXihScXwobmUb5tFjjRrvXNneMB8IXKLQ
         Ihk1XNSuKKUDguGInp8pNFMjKoadMYB3rK+eU21IQTkkKrPrpm6MXV0es7CW5AzeGkLl
         XE9l/MTVGAs183gLgoSrXbhszKLvsuzXbiVi1JhaxYo6Em3MNFt2ujc3i+HV/0Rc5/p3
         aKuQucEkoaoI9hhm8pcvi2wNd5xh5w5grmldGeqw/fP+QwU2yEjSjr46PSiP80YhXhJn
         k4Sf0ycoBJjYLynjzvIwCWAuoG9ntWoGL63e/6sMFrDoKrRpaeyetnnBiLpprH9xg2oX
         binQ==
X-Gm-Message-State: AOAM531Uy7wimfmr5BDGCYhXeJKToFn9IRRlxpXHzmTa2ing/RKu+jsb
	rZ+0BUmsDX5FQcv5S0QvdZ/3ptVEcCaH/ltFoVDvIw==
X-Google-Smtp-Source: 
 ABdhPJwJ5kiYhMSmYgAGpIGXCAXUieacCHZ3CyTXo1I4jQM6dhjz2wUwjl3hln9zkCE0B8dFp9zQQ6M11k5Tm3QmQxQ=
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr24750034wrn.49.1635784567836;
 Mon, 01 Nov 2021 09:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 1 Nov 2021 16:35:57 +0000
Message-ID: 
 <CAAnfSTupP0wSXysHKN-CwhWuzwBasFR6cqKV=autMU2zicTGug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta: Add explict branch to git SRC_URIs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 16:36:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157726

On Fri, 29 Oct 2021 at 13:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -657,7 +657,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
> -GNOME_GIT = "git://gitlab.gnome.org/GNOME"
> +GNOME_GIT = "git://gitlab.gnome.org/GNOME;branch=master"

Late, as usual.  I think this should be dropped, people may well
(they're not, but they could) be using this as
${GNOME_GIT}/modulename, which this breaks.

Ross

