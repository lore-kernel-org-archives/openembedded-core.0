Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501F7C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 13:57:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.12454.1742306249190217465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 06:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aO6r8ww9;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: makchrbiz@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeec07b705so889719366b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306247; x=1742911047; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxKuQzAFo8PvmX/UZEZmoPA06KLWjggsj2Mmnc7itcw=;
        b=aO6r8ww9jsyb08beoCY4/fvitD7s3Mlt/c2vT30BSTbDWmvKOdaXKirlxt9yhBAwNg
         zrjFFEaB8Ymd42UomWm52d5rC00Slc3WhlLEZW3+/ZOLmz2nOTVNsDJNPZLSCHNY8vfE
         PwjfD7C8axpXdG3gdcxXEfCBt/ZjheCJHA5QuXNqjFL3nO3WvWz0D0GQbDpTlWWn7V7x
         FGZYvjRLtklitQTzSF9wM7sX3TWn8USfUA2BNIISz6KwXmOyPUcI2l9u0PxQwGa0z761
         U039e4h6s1u+M6bbXsg0hhWmKGtoT+debvsU+QPHbvgKZcl9csxDDxGIsrnejIH3iByy
         HVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306247; x=1742911047;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxKuQzAFo8PvmX/UZEZmoPA06KLWjggsj2Mmnc7itcw=;
        b=M96mx8ZtnWO0Xsz9WVCwsqPKYBaOy70qQJCUXYK1wdDXLUmOtPQgb5JSQyXG8r09H5
         MfPK2PRsjE9gP0nOjGthVK31wEW0YTLGvwDNWF9NnOFB0Ro6tWKw44CnkrZzAKb/4y22
         1OviUVnqBDsFA1TtgtAv07b+Yl+u+4rBuJKhF3Zf+AU5N0IyfmOjlM3Y2aZacOL8Z0Zi
         ZDR1gpOpkffypvTcF8cCtbdI7Sr7ApztwNQZcqgitlHZRiivhypzvv85zlWe+2eyVq47
         2pujTZ7YtZxxF17HU/USMcGuZFPqEnu8NAYDi9qzNKoekbzwVA1JT/9FIaqRz/6l9hla
         vYKg==
X-Forwarded-Encrypted: i=1; AJvYcCUhwEbBM0PSrPBHsvQG6APO14Z/iSJ4yivWBMiJf2w9TSIsBqbR2BU7rpHza+2RaMygjyaT3nkJtwkQU0cobG4YUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIdLrbmRl8p/f9DdRsuzIltyUS++BzvXR4pOzIWG03Xfg7cGUN
	Cm0pXxTgrZNXSkrTS52hilVrEPUYmjNFVQsI7BTQ3KZPEvEkauZlluvvsAEl4Ho85iNXT/BOGIX
	1ZdFpEUwinbx7DhhoZAOYQ4NP768=
X-Gm-Gg: ASbGncvteOloR6IWVRi7wKTrCPtBkQMvuZMVzOUzJypmOZT9cj20Q8joTBlMHU8szeE
	O+8m7mBHIAvrbmNTvM1ThPjJjMXYJ4VTt1MVulOUoP0/efDCyDKZ30Bi+qKhxfIq3JuwBocCjga
	m2pZ/h3twRvtbsUF24xHpKIJm0zTc7jld1E3XN
X-Google-Smtp-Source: AGHT+IFGr7VbLUWBxgcGAMkSp4gxBMfmTMyDZdlTWe+rs/D45pGYhntqZPt2i0qa2zMBBlMauOXKBidJ4U7FdzmXx4s=
X-Received: by 2002:a17:907:1b02:b0:abf:7776:7e0c with SMTP id
 a640c23a62f3a-ac38d45b9a4mr418860466b.33.1742306247069; Tue, 18 Mar 2025
 06:57:27 -0700 (PDT)
MIME-Version: 1.0
From: Makarios Christakis <makchrbiz@gmail.com>
Date: Tue, 18 Mar 2025 15:57:15 +0200
X-Gm-Features: AQ5f1JoYX9ESkw1U8gSHSzHGFQDrLGG80icNmHyQCL0Vtx_6WQKq23vl3Z47YgY
Message-ID: <CANpL8Ovos0fzR1eWiDiqURHsQe6WYTeHDgw5MpdqRXh9_qf0yw@mail.gmail.com>
Subject: [BACKPORT] icu: Adjust ICU_DATA_DIR path on big endian targets
To: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 13:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213211

Hello Steve,

I would like to backport this bugfix from master to Styhead and Scarthgap.

Bug description:
https://lists.openembedded.org/g/openembedded-core/topic/patch_icu_adjust/111744704

oe-core master ref: 28cdc0110def011e3d690da1d591076385267ef7

Let me know if this is not the proper way to request this.

Thanks for your efforts,

Makarios Christakis

