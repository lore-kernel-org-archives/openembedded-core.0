Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D45C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 15:55:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.17352.1749743711314232818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 08:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jsO4et3d;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e740a09eae0so1059710276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749743710; x=1750348510; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MxqVkheS1QAGiR0Fnf2Q0wD3LJBLZAHLShuOwIIkCk=;
        b=jsO4et3dNR9FY5hSCEYJtCJ4L5uwj8aTwAlhs+f2D8UM4fDfyyXh6uo+0JaumjUWlK
         rkQOjdqa3k7jwIph5lDFVfK21JPj0//BYqTLdCEZeUWhe684QLnZaE2hzt1Hx3ZeXl+V
         4iOzGynBr9+/BhGOI0dPS5ve9/S678twGi0As+aL29qRPYPABw1NgCcrv0bCDsxX1rxJ
         Ee/yGy4SDpmvkA7y1N6HlX4qQV94dM5a2KPqKmUE1GpZOA0aDx+T2mG6XJ1D7yPg3e+G
         38X9dp3ugXL2B1IuZZLJGQKE1wlZC5WsH5SXMFpvtz2NKUMqeUg7hrwWIc68uzMGUX/+
         B3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743710; x=1750348510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MxqVkheS1QAGiR0Fnf2Q0wD3LJBLZAHLShuOwIIkCk=;
        b=T3h1WR+scpIlADPGdg1SJ/PLBdHAuz6abGa+vUHVOVSaQ8aAgxQOwqAtRzfUESKRZv
         0uXB8J38AORSNkHfHEo+bMi3KYoSZHjI7gt2YzEyy/eH7+SK/8Y+rXp/znACb+r6tMox
         Oi5TvgBK/cEyy7z1dJ4/7ftKpZf3p2jqOJGoXbFLwroZt38h9LLdqaZs6fXp7GrZWKnl
         xC2ZwKb1TTeQT9PslzzJhlY9mMEkb0462rHd9bjka2bb2FW+7wb2CTjPrcbwL0J5Y//Y
         MkW0rGpzhdSQAFTvS7UKCQwd8GVtxD9Q/nPRTsYxj3Puv6Xo1R8LMl0NLn63QKxcuJrg
         CouA==
X-Gm-Message-State: AOJu0YzrbIfSFAsjnaH9laGTSLdeLRNuB8SxmI+rxy1QrMpi3A13qr1Q
	lcNj6vnjf15bZAkYopP+gtcQValbGNK2Wb421FRC7NIhSzWCCnDnGMbIY3Z8LlS6hyIPcivgl2r
	pqnnP0onHYSLEAaAEa4LytEws/TPg3lFq5x2M3ZRo6A==
X-Gm-Gg: ASbGnctIDvnoFyd/3FvLaFMmqLUG4BSKLTYZhVM/j6/BdHUaG1JBqGqZ/vcpKitGcs8
	VDx6/9muy55FVaQyuKULD12CTn6Yhe6QEVgbhDVyZJseKCuyhhkeaua4IOum1HjLIyLxTAFgoP0
	6RQvi3yU+Ty9peCEOdJARMFYPZy849jSgU5vGGjqXzJXe7OUVc/Mm9BZ8l8D6ZKxvvPDlOoa6im
	P4=
X-Google-Smtp-Source: AGHT+IGSVoQc0q5ZEq4Rjr9GBFuvmrF/EPeYBewZJRrPbdOWLFZczyj3I5nPBT+k8ams0BJaSiUnEJk7qN09oL9AsEY=
X-Received: by 2002:a05:6902:2e09:b0:e81:b843:43f6 with SMTP id
 3f1490d57ef6-e81fe6a7d3fmr9782883276.21.1749743710412; Thu, 12 Jun 2025
 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250612044316.1385701-1-archana.polampalli@windriver.com> <1a24c39e-3b84-45b1-95e3-ca0c269442f2@gmail.com>
In-Reply-To: <1a24c39e-3b84-45b1-95e3-ca0c269442f2@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Jun 2025 08:54:59 -0700
X-Gm-Features: AX0GCFuyFSnHVh13j_Tsf9fz9D62IYXPaT1Z7tE54w7u-8NkdfOkJCL_sS6cLho
Message-ID: <CAOSpxdauU8yoNCsnq+nHWwL8BBwu9anNKTAjmCk15=9_oGNimQ@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH V2 1/1] python3-cryptography: fix
 ptest failure caused by CVE-2024-26130 fix
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org, skandigraun@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 15:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218531

On Wed, Jun 11, 2025 at 11:37=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 6/12/25 06:43, Polampalli, Archana via lists.openembedded.org wrote:
> > ---
> >  ...st_pkcs12.py-correct-the-Indentation.patch | 62 +++++++++++++++++++
>
> Alternatively you could also just fix CVE-2024-26130.patch itself
> instead of patching the patch.

Yes, please send a V3 with this approach.

Thanks,

Steve

