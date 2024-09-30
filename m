Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA55CEBF74
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 20:34:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.65749.1727728436221835524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 13:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gWAVIC5l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso39113025e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727728434; x=1728333234; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ53zI/SIzlYObIb4+l9vtQkGc/0UcWECZRJJDtxfNU=;
        b=gWAVIC5l2UNUdXU7pYkZhyMf/8MO1nay4t6RxxOmQxnhwgtryIunk7sepHwBMsWQOr
         y95VTayCf+SyVRoZ78t/M0Cy68gW27haqrZOhY0xtzYD6peCx5rsOMud8dE9AnYONHoZ
         5tHG3gU1dmUkAazkbY9oitvHsoAtZHlQbJWlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727728434; x=1728333234;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ53zI/SIzlYObIb4+l9vtQkGc/0UcWECZRJJDtxfNU=;
        b=P6g09mc3ajau0O7huBd0S/3HIyJwabzeP6kduWldPsL+VPPR0IBED9a2d+JRgSnAtF
         bulynOfQLVRzqoaGR8vONIurgUtbfmL6fmhZDvCETZzHR0zQb3B+WKin081AlXqePG+e
         yMAWoec5quUmHOzEyBR19Fg1S4SgxL8bUS1ro1KlOqFIdp2SM7vVNLcJNRxGlphXSPvZ
         0J7xIkpA7Q93/+S+c6YFv1PuOaiDlS3usqKXeOpe7g0YCk69ARNckNENGHSMyQK4oUHG
         H7L6jF+zVqvTMxOPtGS3eFCrqhBFPvxGFv0kVM9FqNmeHLlgyUjJQqQNwJOeQzjSth7H
         ZeJQ==
X-Gm-Message-State: AOJu0YzzLMztK68Tf3fbF6HEq+VQngDfwJRSEKG3p1EpDABOQ4V6b+Wv
	mWVWXBtl3zKEEOgLQhuMhJP7vVXvW8Lgox4bszdVhj20Upp4RJvzkZH4xeO6+Kg4LUa/JeGLJ/u
	s
X-Google-Smtp-Source: AGHT+IFT2Jq1oL2MFj+Zsq419JReYNDRvtnhVNsCTTqNDRFBKzyM0J7I/+njAckvIBX1wEn++m1wRA==
X-Received: by 2002:a05:600c:1c23:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-42f5840e8a9mr109785895e9.7.1727728434353;
        Mon, 30 Sep 2024 13:33:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:196f:13d7:e9b3:eba1? ([2001:8b0:aba:5f3c:196f:13d7:e9b3:eba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e138f4sm115042775e9.34.2024.09.30.13.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 13:33:53 -0700 (PDT)
Message-ID: <97a01f7e4ca0ce655789522f2fe965586ae03fee.camel@linuxfoundation.org>
Subject: release notes in commit messages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 30 Sep 2024 21:33:51 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 20:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205125

Hi All,

I wanted to highlight to people that cut and pasting release notes into
commit messages is annoying a few people:

https://github.com/openembedded/openembedded-core/commit/51fb98c6da61ad4faf=
5b00316e7075f3bbee9bc7#commitcomment-147394200

The issue is that usernames get pinged on the references when this gets
into github.

There are a number of different perspectives on this but if people
could trim the usernames out of such commit messages it would be
helpful. It might be something to teach patchtest?

Cheers,

Richard

