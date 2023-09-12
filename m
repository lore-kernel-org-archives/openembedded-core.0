Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D38CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:12:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.22250.1694517128329212714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CPVJMjxo;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bceb02fd2bso91605691fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694517126; x=1695121926; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jepUbfI5HdDjXYK1lnqUs1KMDOZwxRSpRO+FR3wYb+g=;
        b=CPVJMjxo6NgM807RPdB/APKFofc5Hq+IH3x8auamPFPSNpBZ9osMPYirRkzben5cr8
         BEywfZQrIuclgr4AquwUvzgs1gOoUONMyY6QCVBoIhoA+1wP7023AMFILGNjDPqweeLQ
         z87P9/9n8Eo5qaNuhtES7Gzy+HHfZmu+dEsjv8WDhF6Bm+n3bjO1BAODeS4A80/A8VwA
         yzDRYfrRoL+vPtroKJrnDO+DPmCUiChzEbn4ocRqbi2HEMSCIUTgFXOysmdK2WBzArtj
         mBLUGHhS2Hhn91dUFCKodb3cpcv5FBw0oA00r5WCrzICfTFOMdqPOvFzNiXl17STz37d
         +lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694517126; x=1695121926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jepUbfI5HdDjXYK1lnqUs1KMDOZwxRSpRO+FR3wYb+g=;
        b=ur5TDsrgdiXl1In4tHaHjnniMggftN1YJRiXF413aLHnpeM62W8uUvVVp247Qr5TNR
         V8HCQQhNawKKa9JONOhkliAQAqGVN9PEB6VWkVZ7DoIgspFjQIp2Xm/E2VDyDy/DkG/A
         /zhzxWFL6ZEOc4JLV1IMq+Gm7GBbWUSjJmgd1ZDjnU0kqs/1BEhgTWGAkB8NrgunvIFz
         ezMcGvXwu2sKLuhDlzjRxFD+ilbEQd9ErjbWcxd936BB9+EOKhQIvtL0EcBuz7Cav/kf
         QulPx0RptYjruTu0qqRx8yYIGhdMTuy4trKYjfaxwrErvecwU0AjWMvCerLVGjiTpSD9
         kh6Q==
X-Gm-Message-State: AOJu0YwVKPSpDg9zi7IOEOU8VmuKnCsqeA3fteudkH1pa0UWWL/f3PnQ
	fbFdV8l3XI0itq95ZJBtmfwCMP7p3JoVTPOzwDWUCmkV
X-Google-Smtp-Source: AGHT+IGlGnTvlE+I+zk75F+ZMJ2AhCCoEsqEAsnpV2J8AIuofzJigvFWJguYQVn1EKfJtfQcHcUBtZWCzQ30Gjxh5Tg=
X-Received: by 2002:a2e:8613:0:b0:2b6:fa71:5bae with SMTP id
 a19-20020a2e8613000000b002b6fa715baemr10392136lji.12.1694517126238; Tue, 12
 Sep 2023 04:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230830141512.656130-1-alex@linutronix.de> <082C37B7-684B-49F1-BF8E-A0891EACABF6@arm.com>
 <CANNYZj_5terzF7i0VZjXgi+iHmLMBsZZNmHOeUE-rsnnY7YMeQ@mail.gmail.com>
In-Reply-To: <CANNYZj_5terzF7i0VZjXgi+iHmLMBsZZNmHOeUE-rsnnY7YMeQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Sep 2023 13:11:55 +0200
Message-ID: <CANNYZj_zv=8gTYSeinPggogekVNHRKj+BSSZ+EDjxpfpcdNN1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/conf/templates/default/conf-description.txt:
 add a template description
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187503

On Tue, 12 Sept 2023 at 13:10, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> When a user needs to select a config template or get an overview of
> them, oe-setup-build (or other similar tooling) would show the notes,
> but not the description.

Got this backwards of course :)

Alex

