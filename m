Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CDCCD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 09:29:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.131862.1712654979148890552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 02:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmD6EVQx;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d886f17740so22795461fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712654977; x=1713259777; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NOGAueXQQmEcfVHujOk6FNvveW54zKFERLOat1BlgZY=;
        b=lmD6EVQxOWAig+eESwoILG1v1Q6z7w2aHTH5HPMtEXd5PqqFHg46KuHFw3KtNb/68J
         oxjCPuD8u4YFu8COtwbjRG5FPjYaIp+JV+v1gj0wQJokOEY32Hlg9zN0cjmEkF5W8vqw
         Bbx9xsT2y5QOKMTg+PvkXxqXkenqSilNj2abPQqTmAtotvtmAl481qo3OdMdZwZupNop
         Y/P0jBXz3q5ShTfVet/iLZ+KJIGFJyYTW7zsLqpbbAfpHf3WmnubkZVjHiE0k3QqChSP
         ALK5/5rgBWKdfPA3Pljm+DDMgKICY7eZpg8S00aDCTD6hiZaidZBKMf51p6eyubBiIPh
         TlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712654977; x=1713259777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOGAueXQQmEcfVHujOk6FNvveW54zKFERLOat1BlgZY=;
        b=YVIsVBIWqNS9EZ4+TNIYwWMXFKIxSImV9sz8fe3Neavf16njqxtNV7+qFak9WReHyz
         ponmKvcrwggzXrktXoT1YxzUCSQc1QrEs1aULiHdbSr4OzXvdvHFe97vqavZgP++Wd4V
         PveNBgYAk2KBEO5MqjbVh+E2ojMwjZrcXIKqbG3GttonLqZFNXNER5B6+0UvEINZ0Cnn
         pdPW8M2Bv5qC4j8VgAPNsl9+DYdeGtzJv/BmZKB/V6pgkm92inyUiOsr8MSk9edhW34s
         CvP98wLjvQU07+PP4Rmb1hhto20QN1kfP3n1MP/ZgHVTugeLoU5d/XSIfciOXAFavJIf
         qqtw==
X-Gm-Message-State: AOJu0YxKhfggsVdRlDQV7KaL7gBWo8AWVa5YXGCGeOODwbyLk9YZIPRQ
	tnVt1n0iMzXcJ+6Yq9MQRhhCx+NcQIEQAhpfs+pvhV2StrED8gz6bLAhE94A9ey4MCg5rRPLG9c
	vHwQEoLvV/vXYyWxVhLCpVYUDrAk=
X-Google-Smtp-Source: AGHT+IEHF3ezDVsZbxamF/2JNCNrLZ02GNNOwCeVwWVJwFEYm4SQFXuhb1XpVvbDsjtQNK/M67vGd51TpdADwpJm2i8=
X-Received: by 2002:a05:651c:19ab:b0:2d6:f17f:f975 with SMTP id
 bx43-20020a05651c19ab00b002d6f17ff975mr844367ljb.2.1712654976968; Tue, 09 Apr
 2024 02:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com> <1712646620-16608-28-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1712646620-16608-28-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Apr 2024 11:29:25 +0200
Message-ID: <CANNYZj-FKvirKBxqGRX3j0OmDG5=uhbEtn1j1uKAXjWzJuqPog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 28/33] python3-pycparser: upgrade 2.21 -> 2.22
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198059

On Tue, 9 Apr 2024 at 09:11, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"

License checksum change should be explained.

Alex

