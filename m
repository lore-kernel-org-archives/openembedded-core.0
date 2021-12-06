Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAABC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 23:31:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.59873.1638833485143043341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OEyDsXa5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a9so25610695wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EmBZ9n+LaB1YYZXehMm6LKLAv8QtzS2eIMM68dqjS9k=;
        b=OEyDsXa5pIQ0zIoucHN35QkBtHBKZ/vT0EYZWXIKJSFRr4eN6bnDZJKS4UwsQE/TWH
         U3IiU8C3sNwQWGpVoCbSlRANlbkckGt45Ze4NhlgqNxU/cUcoywlAbFxqxCbn7f7oxGi
         nu6pFsj20aPLNamVX1PrYsi7gemWH4ymZ0Enw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EmBZ9n+LaB1YYZXehMm6LKLAv8QtzS2eIMM68dqjS9k=;
        b=t1wdTzEmDm1CHEC04G7I87SW7XWYK0k1ZA1JlYlHMMG5SfYnTsTlFXcIr0fOzRWAlX
         QHTdooVgtrELpJylk51p/eAiLGfavRSoFVnxtHU39YpLLFTfVlKxzUqZKuvSs93lj9e5
         umIutJ2tlrwzbidzbtsY1ezpyr7ZJPk5h7GcKGmU61681IHijn9p8sYLmB95h1eK+rgX
         yk/bJrotAOez3kWYvLUOzB1U5SSPSBgoijS/SUjIV45TMiVTu/OliTmdCtP6jwsJ5J3W
         sXYZU7cNAWtuunFaftlXx+vnVbolAsskQ28wvGcIzmD5wo1AhHs7K+CGuyaSPB/w1NOO
         kSJA==
X-Gm-Message-State: AOAM531yjyzylorYxeCpaWTBn47umoyPkC6MIJD7Fep0e4gHtG7jzQnd
	d+1OgkaqLuloTcGh8V0w9LaoPg==
X-Google-Smtp-Source: 
 ABdhPJymFjvt0LgAGTGUPuYYf4Py+c0RvLq3Xwh9FCo7yJ4YXGVeltuYAt523jpYt+5gIyrMLp6zSw==
X-Received: by 2002:a5d:64ed:: with SMTP id
 g13mr47192971wri.439.1638833483494;
        Mon, 06 Dec 2021 15:31:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 4sm16011420wrz.90.2021.12.06.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:31:23 -0800 (PST)
Message-ID: 
 <34cfb0378a0168756a1ce573b11b292618be2aad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] core: udev: udev-extraconf: rename
 mount.blacklist* to mount.blocklist.*
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 06 Dec 2021 23:31:22 +0000
In-Reply-To: <20211206153511.34838-5-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
	 <20211206153511.34838-5-foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 23:31:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159277

On Mon, 2021-12-06 at 16:35 +0100, Quentin Schulz wrote:
> blocklist has a more obvious meaning than blacklist and is also not an
> issue wrt inclusivity, so let's use that naming instead.

A "blocklist" with a filesystem is unfortunately confusing (a list of block
numbers on the filesystem?). "ignorelist" or even "ignore-devices" may be
better? (or skip)

Cheers,

Richard



