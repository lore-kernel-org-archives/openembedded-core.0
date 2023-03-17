Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFC5C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 08:00:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.14142.1679040040699745968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 01:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KAMA1AyT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id v16so3635356wrn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679040039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCaidoUx0kRii+93dnnJAzzhOgcxpw9x7p6qJAleY20=;
        b=KAMA1AyTKlSdMeRAnHzowQ8qsf1m78V9KId6F78BQt26hifGgGznvz1kJIFxSh4c4U
         1TWuc74XQJjckqekAKdQQjU+YRMqbash5dRQXQs/9sWfBSRWLoyp9bTUQw5+AZoJOuWg
         MbbwJRwEMHWawWd7rzUq3V1Mn2WUDHUOgkV5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679040039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCaidoUx0kRii+93dnnJAzzhOgcxpw9x7p6qJAleY20=;
        b=fIdpG1wZiwZOj61pC3Rlw0qZ/+j3trebFcm4wp5o1FYNodlEB/d8o9FyK7jNaIazfO
         i2Ju/OCdZB80pAKokmCrkMyUf1tQPG+pgsdaudB9uVbolOIIxSLWGtkNlHBkBcQoCrO0
         sGgfgceGgFTx3FzZ6xWYhk6fKcILlzDK+wCMYm4SZ69selDaxK82l8IMTW5C6apYBZsO
         w9iXohEyDqLGfPVxeJWibyItzp0Gj6hxaP/wmGxr5FpQ9mUU7JQYOBzbUXUwOQ1xSMv0
         NLR8Z5ja7fodk465kmBNkaPIcnZld5M1SHezsJLcu3/rYYwVc9ZCh1TrfqvoaptrxQR7
         HLYw==
X-Gm-Message-State: AO0yUKX6qPfnxL73eQSGUwUbNAXNNOC/5dIC/SfMR6F2jVNbJ70BrP7H
	JEjazOhAPiCN+sv9A5xlTtzpYg==
X-Google-Smtp-Source: AK7set9U1ZaSowvN0En/62Jq5LpJDRc7kqkIDla5FDN8fVaScqApYKr9xvmcLMJo+OgHh5sxucivNQ==
X-Received: by 2002:a5d:4382:0:b0:2cd:ddd6:c215 with SMTP id i2-20020a5d4382000000b002cdddd6c215mr6677346wrq.52.1679040039098;
        Fri, 17 Mar 2023 01:00:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e? ([2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d6dc6000000b002c53f6c7599sm1326279wrz.29.2023.03.17.01.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 01:00:38 -0700 (PDT)
Message-ID: <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2023 08:00:37 +0000
In-Reply-To: <20230317060202.385862-1-f_l_k@t-online.de>
References: <20230317060202.385862-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 08:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178744

On Fri, 2023-03-17 at 07:02 +0100, Markus Volk wrote:
> Currently /tmp is a link to /var/tmp which breaks glib-2.0 ptest
> Systemd documentation describes tmpdir usage as follows:
>=20
> /tmp/ and /var/tmp/ are two world-writable directories Linux systems prov=
ide for temporary files. The former is
> typically on tmpfs and thus backed by RAM/swap, and flushed out on each r=
eboot. The latter is typically a proper,
> persistent file system, and thus backed by physical storage.
>=20
> By default, systemd-tmpfiles will apply a concept of =E2=80=9Cageing=E2=
=80=9D to all files and directories stored in /tmp/ and
> /var/tmp/. This means that files that have neither been changed nor read =
within a specific time frame are auto-
> matically removed in regular intervals.
> (This concept is not new to systemd-tmpfiles btw, it=E2=80=99s inherited =
from previous subsystems such as tmpwatch.)
> By default files in /tmp/ are cleaned up after 10 days, and those in /var=
/tmp after 30 days.
>=20
> This commit tries to align tmpdir to what systemd expects.

This changes the system layout to what systemd wants but what happens
to sysvinit or anything else though? Some systems won't have systemd-
tmpfiles and so on present. The commit message above makes it sound
like systemd is the only thing that exists/matters.

Cheers,

Richard

