Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8743C63713
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.31148.1649694163289845567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rp6rAvPa;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id z15so7422059qtj.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Alk1WvSFSz0k291bRapsYHACujTJTGSgjuIFN0mYIdI=;
        b=Rp6rAvPaw+ySa+z/lXZg/QI1fDVhj1VcNm6hoP//Qy0c3sO1CVg6rWKqyF9537K/C0
         tmoJnADQmc6oYCXTWEbtg2HctnzP4NBE2mjtZuOOphr5eeoVwMzRiPkUqk3Gc6IKpLmw
         O7W1B/rKPY/cV/jc8s4YOeqiKAl9Nt4kKMRc2r4DVUNFhVIRQ60OUi+XTXQVyhLmZx/0
         JsLykn5V3TkW6qDf8fyHN+Ze+Y0HHHE2QLMg1OYI1H7ij+H+ukYarnNfVJ91BkXgrpbx
         gI6tW/flbXn0ZjVennCBNAWTwyk9U12f8hww7YDg0aav6wnTFPBhFm3NXsxO4eydO0xw
         DHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Alk1WvSFSz0k291bRapsYHACujTJTGSgjuIFN0mYIdI=;
        b=ajiQLOKyF8kuZaTOC3QEh87FSND2Ipwvgu8vhvF86EpPhmZoZePYuLhQ6RLpRqxAXn
         D5DlXuzo08mkGvZK8pNIStKhcuvqr9uqIXXTPyCgtYxb/jNvFGtAXilWcfRfmkJvSUm/
         7LQ7rDaukKXMkW2Q3M3/KcAY8SP6mIk5G+yqt6pGUKMncueSHd4qu2L3UalS7S+mGlY6
         O1WRwuThw5/ajlgUA/wkjqsKV5pUtQdu7HGiVpfAibx5BqvsQuXgudFwztjNlcjUtuFR
         9dVqdYJGsZO1gIF7geVPqF0nbZL9aS6yFmw7389pfdVH9jZmNxSUW71BJ6iuMaUv9elH
         sKpA==
X-Gm-Message-State: AOAM533wobwb3Rsvlzc3l/t+/TbYb7eJp1J2A/rCH8Hg+2j/trSLlezp
	fGqB/twcpwD7QgKquYJBHukDFsxRUOHGCNIx764=
X-Google-Smtp-Source: 
 ABdhPJzaP4q/nB5Q00/cKB8qFn4WY25/NcyNH/uC1iL9medEzrJMrwRNRfF6u5IJpqf3gy/7ifvZcGm2xw3/q2G6p0U=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr106694qtx.634.1649694162256; Mon, 11 Apr
 2022 09:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <14c57054-5488-6419-ab60-ee1592ffa799@theobroma-systems.com>
 <9262.1649682111837352203@lists.openembedded.org>
In-Reply-To: <9262.1649682111837352203@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Apr 2022 09:22:16 -0700
Message-ID: 
 <CAMKF1sq7-33dnNGAgwqX7=qFwKwSpiu=VofmqYKqXdrTrN6aNg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH v2] libarchive: backport patch to fix
 CVE-2022-26280
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164232

On Mon, Apr 11, 2022 at 6:01 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Hi Quentin,
>
> I just missed the release so I'm going to send a v3 patch now, thanks!

This patch is perhaps still valid for kirkstone. For upgrading to
3.6.1 I already sent a patch yesterday [1]

[1] https://lists.openembedded.org/g/openembedded-core/message/164210

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164223): https://lists.openembedded.org/g/openembedded-core/message/164223
> Mute This Topic: https://lists.openembedded.org/mt/90393740/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

