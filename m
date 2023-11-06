Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D80C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:26:10 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.52984.1699273567391343238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxNltzhW;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so62094631fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 04:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699273565; x=1699878365; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0YCUYdbG5hAA16cdRLjApxu4Pq/1Gof0w2aFtf2clo8=;
        b=RxNltzhW40dc+7UdbuM/94N5mZ02EsEB4hHviGMZ9DUJ/4opxh9voph4SiFHVzgRQR
         x0KQEWKPVWmC52Vx3dKXBv4a9gf4hyobypHbWLli1Gxz4Jo4JIai6U8Yryv2vWkfmLFS
         h3rT1FVzptBJOqng11LIN3cY/gIra4T2DzFYOs+RnG9SKKv3L7bGJYtwriMSIGGPrJNy
         gWtUzzef/0gQYHtH+EgspJAZucQGkEJwPFy0XBNOR5jRudoXtPx8MXpRCbOOUSxNui8B
         cl4AvtAQ2MYkO2K8I6B0Nc2rl3e/rQs9u89jjebUrc0jxJCX80c6e5LodYrQaVCAdYYJ
         Bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699273565; x=1699878365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YCUYdbG5hAA16cdRLjApxu4Pq/1Gof0w2aFtf2clo8=;
        b=eyrN74D8wfsYfgETLUM5VvSELi1cHIFe2xiQgh2L36CO8CcyXtxzlTtVaQrKNPqtQW
         nJwK7BU16Nky7/TP0MuHvS0OcF4/fAzJYby+Fstqv3dqK4Sk6LlnMGto7wg/x+le8Zc+
         qV1tBVBULI40TXlLHg7ToUuN/Jr1xYkJILMJltpy30MwxOQycn5rxLXx9zM0c72ovXSW
         s7D5M8SQFVNPOwcZFoKqhINJj7A3rHE4tpjwlSSpckLUBfD8LY42QYEDLxOJK8Yw2YTf
         64KJCYjAiCW2Uh/edNrNslox4qSwPmDTVvP6JApggH5Il/4y6vafURe+6cDAvVUWb8Il
         zYEw==
X-Gm-Message-State: AOJu0YxPhFBaclAScdpz5lfgDpaey91v2ZZWfh1vV2pBi+S9B/JE3yxk
	YyZpFaNk651wkv4eXmkfJgKgkxuvmZWqHzuIfNc=
X-Google-Smtp-Source: AGHT+IF+C/eDEZ/+230O1Aiu7CWc1UwBhFSUeRB6cGUnFakOMlACLHDyU+YoaA5gh9lI2gEg/0gjCr/9q/v/BL4mKSg=
X-Received: by 2002:a2e:9852:0:b0:2bf:f6f6:9fd9 with SMTP id
 e18-20020a2e9852000000b002bff6f69fd9mr21662798ljj.0.1699273565456; Mon, 06
 Nov 2023 04:26:05 -0800 (PST)
MIME-Version: 1.0
References: <0101018ba28d50b5-31bd6f92-16b0-443a-b238-0e8143dd0ea4-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018ba28d50b5-31bd6f92-16b0-443a-b238-0e8143dd0ea4-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Nov 2023 13:25:54 +0100
Message-ID: <CANNYZj_cfDiPZQsZQv88XsS8AqSVRanefc1ZNbi-ZrfacOurcw@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH] cairo: upgrade 1.16.0 -> 1.18.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: qiutt@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190207

On Mon, 6 Nov 2023 at 03:54, Patchtest
<patchtest@automation.yoctoproject.org> wrote:
> Testing patch /home/patchtest/share/mboxes/cairo-upgrade-1.16.0---1.18.0.patch
>
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

This doesn't seem correct, as the patch doesn't touch LIC_FILES_CHKSUM.

Alex

