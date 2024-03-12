Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DBEC54E60
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:04:02 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.158.1710259438756034482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 09:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lo3NKGIR;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d33986dbc0so64716691fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710259437; x=1710864237; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+CgFj5Dvji7jb4/EP9NRuMFZddnqGMhdZtJUObgM3Y=;
        b=Lo3NKGIRxrbvnOWcdVsmb8BEIR2yPQasY3L0S/F6kMf3g5c7+a8yaG3tCptoBEkbGF
         HvTINjG2L1T+ZIf5V+cAOo500vSoBa/eRHteVtjxzZqmPl1n594cjSwu2/PUfm8r9u1X
         sj56nZ2ILZLC2at235JXykFKjT7xIbQuR8aey/9jqLu6PrzPB+hw45hZYijmBa1yKRC5
         UlgPUw/J1z3oSGAG6REQDGA5kTIxTiC8ibQ8i51ql/IxAF1aKzseu6H1AaLdBqOCjzne
         Gg9DYU646dhGfidRnYjKIDf7dlK4/wkroX+65LL5gH1rhXE2BQ6qnsEu4ryKJE+WTADf
         ekuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710259437; x=1710864237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+CgFj5Dvji7jb4/EP9NRuMFZddnqGMhdZtJUObgM3Y=;
        b=UUkoKUyp1P20sAE2r/YS9EDlfxacPTz2L/B7wM5iYYL2B3w+W2Lvvidik7N2A8W44D
         WIFe/bjCJiaFhg2Xh9GbZkhmpOR+xkrmPmf4dS6SDXNzAwCUTNb+SO9tKfpmCYDMLfyh
         NWAMJ9TtxajEWLL6syftftc3RJLcyghEg5OdHF7QPpRWjJLdrSuebFxAIUSTuv4hS8lz
         WY/HFFiJIbsAOZpwMr/tyiRiEdvVFXgEq6U9yL7h0kLPtev61G8whdafPolxQimdpbng
         G8SgPoJ5Q/bvhm8CCkXwxnTXB26uSxYPUwD05ILB1MVuUquNCDYztUKAJgXwJ1A1H62B
         iV0w==
X-Gm-Message-State: AOJu0YyuYwBNtoyFHns/Qy98eVRkGeOn3xGa/FSljnqUieYdiicocRDp
	2TJHlVIZxmO0OHo+p21S6Zr40yBb6z5vTPKlvfX2tG6jezq1jB2nDYlmTk9u9QS2qGJTRz9ig8a
	zboxknUxIdWhIEqifPea+OFnWBbU=
X-Google-Smtp-Source: AGHT+IEuMZgWOCFUYQnjBvjs0mo3Ou7gjhH7THAK01JUIMF22SejU91r35gxe1u7SFwzVeB6p+YRFZS9gXRofS0uSUM=
X-Received: by 2002:a2e:a9ac:0:b0:2d4:22d1:d96c with SMTP id
 x44-20020a2ea9ac000000b002d422d1d96cmr1871284ljq.25.1710259436389; Tue, 12
 Mar 2024 09:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-rUZzdqbXD4yoHiF5V-L2sOg1DVWMEsDGXWk36F2cexQ@mail.gmail.com>
In-Reply-To: <CAK5yBb-rUZzdqbXD4yoHiF5V-L2sOg1DVWMEsDGXWk36F2cexQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Mar 2024 17:03:44 +0100
Message-ID: <CANNYZj9q5baYcA1AZ6UkqL+E+Z=H+4aJ3iAeD9SuCB7SoktX5g@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 12 March 2024 (WW11)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196996

On Tue, 12 Mar 2024 at 15:45, Stephen Jolley <sjolley.yp.pm@gmail.com> wrot=
e:
> We are seeing issues with devtool tests changing metadata and causing rac=
e issues. It is unclear why we=E2=80=99re seeing these now.

I'd like to see the issue, as one recent change in devtool tests was
in the minicom version update commit.

Alex

