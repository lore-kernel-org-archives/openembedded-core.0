Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D75AC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:41:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.4090.1681983697201893160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 02:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=XSMJHqu0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2febac9cacdso271337f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681983695; x=1684575695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7RkeGZX/rEvc3Ok0R+fuMAyxWgcfW9iB5nO7ScE37E=;
        b=XSMJHqu0a9Fh5tWvMqAoChXAFY3mpw+hc2vsSJLVtmZzWWYXdOdQ9D09Ua/501L6ME
         ZrMauRHeXDolijP7TCrCMHFWWAAGqwMGCCSNej1GqEuc+QjdwmWXuTC/DzMulFY6yClR
         ifPW+ZP+6pZlXFM0KF4XTRxZI0QpB/eWiQ15g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983695; x=1684575695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7RkeGZX/rEvc3Ok0R+fuMAyxWgcfW9iB5nO7ScE37E=;
        b=Vk5nLwnyW/N20laixqPVdzv4mwe+eDp765EKS+hYhAjjiYHTVklLoxSLeToUP2aa1B
         x3XLlODLhHnS5APGXaYe3ZxF7t4w87stemZjtW49HAn/lublgi5aJkcaKaliJmHidBfX
         yogE1zdns/FW6lsatGjJECb72qGPoNkfcC5BJNfKBsYa/tpVBvEFCBnkjW9nMr9qXgvA
         guhy+AZA773wVItnnHo34hjM5gsQfnQKR2IqA9VMVmS+G8ZUkrXT26V45iy+2Rvpfgkn
         w3ZN24q2eaXhbKHnOre0ztIUMWCgrVhG9/K1nI3+/I5pf/N4bxKjF1uLlxfFvFpRkmEU
         3tGA==
X-Gm-Message-State: AAQBX9fYcDgwb1nQLQHYpMzyF3QyAa4E3ve4qE+zok/uAxSCLBc/D0Ly
	CEbG1IO3cobg4BmmUKX/HrC48A==
X-Google-Smtp-Source: AKy350aELkSBcaxhYc+qWpgBwRnLq9K8scoLTTNj9xCVLRPe83LyW7gpQjVn8ph5dRNg4f2a15FJtg==
X-Received: by 2002:a5d:470d:0:b0:2f7:8faf:f993 with SMTP id y13-20020a5d470d000000b002f78faff993mr742259wrq.50.1681983695568;
        Thu, 20 Apr 2023 02:41:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce55:21b0:963b:173c? ([2001:8b0:aba:5f3c:ce55:21b0:963b:173c])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6e01000000b002fa834e1c69sm1479470wrz.52.2023.04.20.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:41:35 -0700 (PDT)
Message-ID: <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
Subject: Re: [OE-core] Cargo and ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2023 10:41:34 +0100
In-Reply-To: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
References: 
	<CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 09:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180245

On Thu, 2023-04-20 at 09:27 +0200, Frederic Martinsons wrote:
> Hello,
>=20
> I would like to build and ship tests for recipes which uses cargo and
> in the process, three questions arose (maybe more when I will
> progress).
> I would like to have your opinions on them.=C2=A0
>=20
> 1) should we ship cargo-native in ptest images or should we just
> build and ship test binaries alone ?=C2=A0

ptests run in target images so they'd depend on "cargo" and cargo-
native wouldn't be appropriate.

> 2) should we place the cargo ptest specifics in a dedicated class
> (e.g ptest-cargo.bbclass, like already existing ptest-gnome or ptest-
> perl) or put this in cargo.bbclass itself ?

If ptests for cargo all follow a common format and a class can enable
them for a large set of recipes, a class is appropriate.

If would only be in cargo.bbclass itself if all cargo recipes had
standard ptests.


> 3) should we embed all kind of tests (unit, integration and doc
> tests, see
> https://doc.rust-lang.org/book/ch11-03-test-organization.html) or
> just the unit tests ?

I don't know about the rust specific details but unit and integration
tests are both appropriate. I've no strong opinion on doc tests.
They're probably fine if they don't add large dependency chains and run
quickly.

Cheers,

Richard

