Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD8C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:02:50 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.119971.1669647764367057839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UTzb/FeT;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: max.oss.09@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id y17so2505193plp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mq9KvI1Tv+QWzMBEs6dUguYJ8keMOI11twRVAf2ljKA=;
        b=UTzb/FeT6kAzHwd+y3hwGG9JXMEUw5AjeHvrLAp9ChWcNvC7VV8cH6ShXsP06SiOY6
         8sVV+UK5AGNXh11uy4awGpKmEOKEK01HdO3IrAI/morGKYXVE8XsAvzW9fXXWe2GqtSM
         ez9sVrf8yF3e4RovUEE0UZU7lyQWX70Mh7b9nSoVOjORZPXYZqb8JPBgwrw/N7BZHrGd
         pr66XBVGQeXEopw8JBYkA1eNoIVWB5c/uEVk2d2AfiS319cS5CnvKtxMb3NkPiJ123pM
         Wz1He0VsqQtL2CdscGVDHDm1jo7SCX4CWXqxg3QwcH6y3MZ04v3DFY1kM4tMWpYwRKE+
         YKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mq9KvI1Tv+QWzMBEs6dUguYJ8keMOI11twRVAf2ljKA=;
        b=ga1NtUNEalZI1bUH72iJxTBXXKBGMJ6zBXjQOUyC/kcATPYTPif/McottF6slbLlkL
         dC1sfIG7eZangkOXu6yrBL1G8KyF7ldXHdEbi6DmCn+SvAKWaeBbj6NffrvMCCnhjeof
         cEdcil3MhSqiBvCNDCA4iFpC3FpzW2TV4Q2DKV0R+3UU9ptDEGnMk/dT0ySF4PwSYPZ4
         WkElYvLyl2Lpf8tyMFOFMZKvVOUeE3WX37PZKz6rQfnDfKWfJm5WR9ElrOgjavkUgol3
         OYvR0d0ad0M1kdnA0imbDGlA26AHQ5zBcVs4Huaa19bXbOM5Ck0iW8ARQgjYMHUrsXKy
         rFiQ==
X-Gm-Message-State: ANoB5pmveocq/HIGaJdhk2HXNHcNSFrdzP5VVYJGWUAfaZ9gx7OrCNVI
	qysg1dRhqZdIJJwuB4e1gEHaq95GF2vmIJ0wuTY1p667
X-Google-Smtp-Source: AA0mqf56lTtbAJasU2swfml+CGX20byr5tqYJVvfc6gO7jJ3wVfTbnXshcLH7sTQwLYojDhPPA1GHxQf8RCt+Tp8TRQ=
X-Received: by 2002:a17:90a:d510:b0:219:2f88:ae3a with SMTP id
 t16-20020a17090ad51000b002192f88ae3amr7330654pju.106.1669647763369; Mon, 28
 Nov 2022 07:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20221121180529.3358952-1-max.oss.09@gmail.com>
In-Reply-To: <20221121180529.3358952-1-max.oss.09@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 28 Nov 2022 16:02:32 +0100
Message-ID: <CAEHkU3Xyhuuk7YkBDwxc7T6o6igC5Dak=0=D9o95p-8SgRn=Pw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] opencv: follow changed name license_flags_accepted
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173921

Wrong mailinglist for a meta-openembedded batch.
I resent it to the correct ML.

