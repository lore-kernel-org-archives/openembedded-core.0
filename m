Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDEFC2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 17:03:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.18259.1660669410838743337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dr6AFNuN;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id v2so15742564lfi.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ITHgbIDU1alBccNGkVMyJPthlfGULYl4sfZOpPmstuc=;
        b=Dr6AFNuNF+sUvhm06Jeq4HdPhFxsYzV9OszrRzS0aPrPQWGdtI5hwjgbzz+Yw32Jch
         knPMWDMk7qLevL74kjt0J9YCzx/UQaRJWDRVmPRWr4gFeILulHTivITTxwEbgd2scaSp
         4k8ydrV9HgYP8SHeE8T0vz7MTukAlfTMNAzdX0eUmHU+joybpYu/0RESjrIlo+ORiTSk
         cGiAqbasuPpk15isL5O5zzn3D2T88FjDFRdgUGtMDxY9tvU/awf8flfzcUEyWX6tiFad
         xebT55pWOGu6jYHTcg6JaZ5a2ZCV0UhbPrfp96OxJLYMuBpKljAwxksiMKro6W7PhVG6
         JFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ITHgbIDU1alBccNGkVMyJPthlfGULYl4sfZOpPmstuc=;
        b=5MyxjZ3tx9XysBe8XdyaR8gwnIKTBcp2rzayfDtVPyVoGlGqKOidQgCrsWQRkvHS+x
         66TZovZMCJGpBxjhcbh10CPunuYMu2zUqpFt6XwhcCFK/cWHPOBD066iqa10kF1n164s
         NIfyCnwUBtptcPcQE0SQqTBSUEwakpFYIVBHrnI7TwgfOfGNGUJv0/WLLBYtPxh62QP8
         5SinILhBvNEz8dY2kpfb2lJLxxi80uq/QE/eHATt+DuPA4wJC8EPym8go7LJkrw127as
         +h3ZRqZNfPzNXILGfAdYs0Dkol1Jb+qSnHO/pMjY2AojdsJirncRB0MMVgeyRc69WtXv
         RFnw==
X-Gm-Message-State: ACgBeo0E7+KwOVa1b0kGuTtr9REGylOpo4YM2Fk5WT6U4wcLIP7aJ2wx
	pFFssCYpnrgCsWBiI39+Y94KPjjbkHD0ioa/2KU=
X-Google-Smtp-Source: 
 AA6agR5gBi7O3NrePDQcNBSahg8ifUt7+1qopdNBlZa/u7zK8eGIa1jEI0LejjqWOWj6+ILVPltxWB1vFu0eE67UHq0=
X-Received: by 2002:ac2:4832:0:b0:48b:1899:b364 with SMTP id
 18-20020ac24832000000b0048b1899b364mr7735127lft.534.1660669408918; Tue, 16
 Aug 2022 10:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220816165857.2342796-1-raj.khem@gmail.com>
 <20220816165857.2342796-7-raj.khem@gmail.com>
In-Reply-To: <20220816165857.2342796-7-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Aug 2022 19:03:17 +0200
Message-ID: 
 <CANNYZj8FU8wHYz8UaTYJcQZzC1ZxTVztWfuOistB+zY2kGRTPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] spirv-tools: Update to 1.3.224.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 17:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169449

On Tue, 16 Aug 2022 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"

Sorry but this does not address my previous feedback. There is no
1.3.224 version released so this is effectively a random development
snapshot, and vulkan items need to be all upgraded in lockstep to the
same version. If you need a clang fix, please backport it.

Alex

