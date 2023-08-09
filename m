Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA12AC0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 08:55:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.84002.1691571301906160497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 01:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oNItJlbi;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe58faa5cfso8199177e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691571300; x=1692176100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=adzpJqwCsp0kXZjbahx3TkPids2dp8kYr4pENPMpGeA=;
        b=oNItJlbiZFYK4x52nnRzOVsuGAbpDPo8mUyIy4HzKTSc0Qu7tTbzwS/L3VCGieqYQJ
         aV+0F1tFp8AQitd9ZQ5REeYxk2SDd0651hmfdmgHZYTxorEwzKySfAgv3qLJubWXmbOr
         pY/nr69ot+i8990SEXscVb3GP1rKFdoVVJBV03UVbh3wgq+4E5qoirDYMZWGUMqmpPpa
         /SDJ6sK3hDhFfMYOCdZ6+4/ptykzNMqn57xQDYZkIp8euy1XTau5BwbIACa+BFj7UBvt
         5J3rXZsOlCJ2jTl9c4KgKl19q0xfrK9es8WFNc5QE2RQ7zpFmoGcRDlzynN+NDuOXExe
         rVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691571300; x=1692176100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adzpJqwCsp0kXZjbahx3TkPids2dp8kYr4pENPMpGeA=;
        b=HxWlvLoo4i2LXodZn8RpTdf6xst8qNWUSXCqxTHlX/SyRdDON+m7hGt2Bmnpbo+NxY
         I+qQjZXjv+xGnavnsog41KxMiiTOmI+vzzdXpAkhxkeaufD8kwvoU7Ek+SRQdu1Z5wxz
         jXOGKV2024LZ9K+vVvIJHJphckJyl/FHMxAAV6aiPkbIHVW+Cp3oK9wTVe373NJK9kBP
         ygjVW5QK4gj+d0mePyZ5givLHD9IROMIeWK1bLdyxEtZ0lrFoB7fG6ijr7N/Lcteqxth
         sIRb4GIJQChJstM00WIZoIKY9LBtFpwoTZ8thlVmNbKjClNVq5zNRdZalHQOXYSrnoWA
         cLTw==
X-Gm-Message-State: AOJu0YzMeWbP8J6bmGnwYzRr8riecKWgNo0jmasZHo4xAk2J66ldvZIR
	3bc8bBdgGSu20LuoZPLtOcK8ihF3imyxHtJ3jpY=
X-Google-Smtp-Source: AGHT+IFg0umCvfvtXtiRVFZwwIjxhmvH8v2Nr2bOoQpJ/AguRYsp7AV3wFLxKVJNcLLTd5mXqOTSn0gdAwLorWz0YXQ=
X-Received: by 2002:a05:6512:31c8:b0:4fb:7c40:9f95 with SMTP id
 j8-20020a05651231c800b004fb7c409f95mr1282852lfe.47.1691571299329; Wed, 09 Aug
 2023 01:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Aug 2023 10:54:48 +0200
Message-ID: <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185692

On Wed, 9 Aug 2023 at 10:45, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
>  .../kea/{kea_2.2.0.bb => kea_2.5.0.bb}        |  5 +-

2.5.0 is a development series. The update should be to 2.4.x instead
which is stable.
https://kb.isc.org/docs/aa-00896#kea-updated-as-of-122022

Please always verify the latest version with 'devtool latest-version kea' first.

> +New version of Kea has started using path of build-dir instead of
> +src-dir which results in reproducible builds failure.
> +Use src-dir as is used in v2.2.0
> +
> +Upstream-Status: Inappropriate [oe-core specific]

Reproducibility fixes are always eligible for upstream submission,
please do so and include the link. Even if the patch is unsuitable for
direct upstream merge, at least it alerts maintainers to the problem.

Alex

