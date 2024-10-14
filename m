Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F634D1624E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:02:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.53323.1728907317113423441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vtj/c4+E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cea34cb57so2785397f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728907315; x=1729512115; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsKuK5mpE9oAEoPeTbp3X7BQaiCit/eq8HPgWcfawj0=;
        b=Vtj/c4+E+469NmjAWktdHGQv93j6/8+zhQrusbKOImc8t1oXLRhzWyrmzysoKYg4D5
         FOeTmph+NjiFog62WzlY3MVJvTLRMH3+I3tsxoed9Ga1KG4SUHOjK7haFT3LQsbyILHG
         nMdHaf0c8UDRIIO8ePU87fplSQ0aPLgWqLHMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907315; x=1729512115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsKuK5mpE9oAEoPeTbp3X7BQaiCit/eq8HPgWcfawj0=;
        b=paMt46cnLbvLdbxbpbMFQ39CMeujW9wJJAjfszehiu8HY+Epkt0k9K/+VaXEBvkmNu
         bQVOLzrt+iu8zBVrxNzIdasJ1oq5+Xd4cQF+vOrA0s6JBosR/G6YBEVA8nQJROUAR5pn
         v6FSD1ZsJqs2uFoDuwi2c6AWLd9JCL4gwxxXGE2Vm4N0q0vzRAjpdAFeyTWssGun8iJn
         NxC2baKucFzL/W6J3H5on/0Dw7jdRLsqwdltlXX/LBHws/Nev5NaKcBsRNpjUUJf2lSW
         wEZf/4lElNlg/oIPRBDXtYxyTJgNMF4Z10z0PDBYTrTF7rQSAmCJUjpU6MRNBUO/Zbvr
         ktvw==
X-Gm-Message-State: AOJu0YzHanE/ZO3ATSeXsKog/OYNkdJLdhABLqaoZ9THBeI59DPe3LqX
	Ir9+cILUNTwW9lainDiFy374hq3Y/yvwzKGdjP/Npno7JXAZu33pDGAlgGDPsYM=
X-Google-Smtp-Source: AGHT+IG+Ke8QsfV14Cm0cEC1VMHiMYZg4Xz6KwW3LfRolH+/8NuBlkMz5UFtiNLSoo7p0PySPMk5Iw==
X-Received: by 2002:a5d:4fc6:0:b0:37d:453f:4491 with SMTP id ffacd0b85a97d-37d5518f628mr6612957f8f.8.1728907315198;
        Mon, 14 Oct 2024 05:01:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ffd14sm117984495e9.18.2024.10.14.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:01:54 -0700 (PDT)
Message-ID: <047b9ddb6f1aa89eab94c5d36262a8dfb081525e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2024 13:01:54 +0100
In-Reply-To: <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
	 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205760

On Mon, 2024-10-14 at 13:05 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> This doesn't quite make sense. Why is the problem specific to .pyc
> files and not other files ovmf installs?

If it helps, I do roughly understand what is happening here and I
believe this is the right fix.

Cheers,

Richard

