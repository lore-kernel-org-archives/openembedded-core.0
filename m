Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EA3CCF9E2
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:15:48 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.18767.1727277345657250621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GC/lXWov;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5e5568f1b6eso3271081eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277345; x=1727882145; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIlFdh7FZRuKjBrPg3nMkbwsSrZ2+gjFr4N0feqwcO4=;
        b=GC/lXWovhejn4986d2gUQwDsFsaQaMFVmbh2C9C2PSjbsmn/tzyEHmT99xYoyrzIHk
         pbIbxT8LHog7K8iE1pUKpwKFV0rGavCqoeArBMJ5rKRp5cUWXXNAWpLQmNytiJ/WsJ0C
         nvn6CIpBbH9KZy1Lkhe1l25xFcr8vcbgpZBwcrB2Z6Jnbhnm9YTSpg+NBXTPSKH+qEaQ
         c/UVhNyy+y8CXMJ61tyCR7xwJpvOaBxTNvi281OP5zkC7RcAFYDQQBhwDZ886dhszIgR
         kJmHAG+sPQaAp6sp5FXfT8HeFXS3QLGVt/b7zgnKnk5iDQCmxAwGxBC7++WmiIzY3QAj
         4mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277345; x=1727882145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIlFdh7FZRuKjBrPg3nMkbwsSrZ2+gjFr4N0feqwcO4=;
        b=VOlq5UhwhSHdIUxPF0A6ZXPDxN4sGH2JfFhNMcTOz5bwN22Y1DO525n/sn5KosSdx/
         d5HmBbn2IVwpHX18XPC23hbQTktHF0mPZfAJMIlnTZw5RLCIXPwUEjqv1tHuV4bHQ+2F
         zpNtUFPdZFBcojcs4U21W2TAcOrLD/OgGmJtRfD1upE5xuPQD7t6+vR9ypXM7dYySMG9
         0AuDjwMZSyU+ub1bUWPGcCKBTF8ljG/NwkDq8dsDPYsYl+RLtCPO9ouBLU1jdwjmKZ51
         EDFCAE9bRVEXrSFAF834yxbJPEXzS7XISiTuxmA8sEhYKKuSkr4O/A1fL6MesiVB7T8G
         xgIA==
X-Gm-Message-State: AOJu0YymefkQfBbBwnf5zghL0jnMMe6JDkG/+O6uIJcSYGaHXI6RT3kO
	7G8lkFzeCV3A4fjtDGhjWHIp7kMGUlgILoltjtrg3UuWY3CS3GhDB1SN9asXYrWEV8EKBbrW0h7
	L4HtNoxQNWF3CW5kv10lEMMe5Rd7usFVu
X-Google-Smtp-Source: AGHT+IHOs7FMLj1DlQgkUSxQHd20YN1fSCG/SCYcxLUZoT94rj9PLNg3eH2au2DCCbmwaYp0QahHdvIxmldVnG0452k=
X-Received: by 2002:a05:6820:1b0b:b0:5e5:c0a0:2b53 with SMTP id
 006d021491bc7-5e5c68fab27mr2202592eaf.0.1727277344938; Wed, 25 Sep 2024
 08:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soqCDcC3VKcR9tGV8dPpfByxv-s=UKAmtZDJ-6BrdRkgw@mail.gmail.com>
 <20211.1727269562780495516@lists.openembedded.org>
In-Reply-To: <20211.1727269562780495516@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2024 08:15:18 -0700
Message-ID: <CAMKF1soz6mBG3GiGkT9mRcvVu9+sXpU_gA-vm+zPnK9LEsKeKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.40 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204961

On Wed, Sep 25, 2024 at 6:06=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Testing was done and below are the results
> After update
> PASS - 4945
> FAIL - 224
> XPASS - 4
> XFAIL - 16
> UNSUPPORTED - 229
>
> Before update
> PASS - 4924
> FAIL - 223
> XPASS -4
> XFAIL - 16
> UNSUPPORTED - 229
>
> Below is the new failure:
> FAIL: malloc/tst-free-errno

Is this passing in the existing version ?

>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204952): https://lists.openembedded.org/g/openembedde=
d-core/message/204952
> Mute This Topic: https://lists.openembedded.org/mt/108643422/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

