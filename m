Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF638C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:48:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.26459.1644414484743238485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pywl1w/l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id r131so1526399wma.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jK55uPgztxVNleZ5TBB8ZxkEbjX9MBlj45xiZ3aAjUU=;
        b=Pywl1w/lM3ntWiLjUr5UKmgK+ZRLPap8T9W4iI9U44WqvCHX1YH74+wxtUorHh969t
         OwXYcNZND5xh4AZpJ3cfCaKFIfS3suWCuV3NRqHXgHMY8g1IUSaKWJwQ2Iv8J/Z6gDID
         vfjuQSy5fQtQgNb0cdNCw+zkTYTeM0KJOda+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jK55uPgztxVNleZ5TBB8ZxkEbjX9MBlj45xiZ3aAjUU=;
        b=tcRJDpnRm2ocBXjhArDaOBMeu0wX+oXSNWOeaonTL6UJvrQMV34eCbS0R2/oMicDgu
         eOd/quZpPQKSyDa1dZgb78/g8YpdoZGOUPNMUr12g6j7fb+7cyX5/FMj8L6ma6XgVaa/
         ePOkpzDQ2Xu/oLq/oxbi9R/Otyaq/8H0UqWGRPG5ZEHlNs0GcO1kPl1fVLq3Gq7FXKzd
         vAisVaiLSW4ZuTGZU2sFPKgb1m3D4FX60RqtLEj4GbspE5KwG/Fsgo9UaJI4l6wEbGAy
         wkdoSiYcuNUdE4RGVLSVzAlTRG9F+3Em+Xbp2ijQLjvJmKCl9vI6fAXTHOExkLQFw7li
         KnJw==
X-Gm-Message-State: AOAM5318bQ+Aq7dD8DqWfdobTUHRELr90g/458zWeT+WMmpKgx1pQd+w
	mJx2oI1WCn8bdHKHwtrjX/qmyA==
X-Google-Smtp-Source: 
 ABdhPJyRN/VfcPyOnDIQBfpD8wrvcY0YM5S+0HJXU5OOzlJtiDzAKZVNurLs+FsnjD2kd8q5bkucNQ==
X-Received: by 2002:a05:600c:4195:: with SMTP id
 p21mr2582492wmh.130.1644414483302;
        Wed, 09 Feb 2022 05:48:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2250:1cae:83bc:d91f?
 ([2001:8b0:aba:5f3c:2250:1cae:83bc:d91f])
        by smtp.gmail.com with ESMTPSA id
 r2sm18716633wrz.76.2022.02.09.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 05:48:02 -0800 (PST)
Message-ID: 
 <038723a3f16f3260abafc5e6f60bc780f91b5328.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 09 Feb 2022 13:48:01 +0000
In-Reply-To: <20220208225310.1685131-1-raj.khem@gmail.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:48:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161561

On Tue, 2022-02-08 at 14:53 -0800, Khem Raj wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Package /usr/bin/ld.so in a separate package
> 
> ld.so is a new tool which is added as a symlink to original dynamic
> linker so make it available with same name across architectures which is
> useful to leveral features like  --preload, --audit, and --list-diagnostics
> more accessible to end users
> 

There is still a QA error with this for multilib:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4735/steps/11/logs/stdio

Cheers,

Richard





