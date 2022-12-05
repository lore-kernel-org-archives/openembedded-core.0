Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F01C4708C
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 22:31:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.30903.1670279512018098145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 14:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZAwV+YRs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id m14so20995723wrh.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAbAg1C8FbubzgBecwNH3MBVzT6fS9RfMM3sgzD1ht8=;
        b=ZAwV+YRsxgxI1rNTA4a7LrsSGnHbVooeRVFc3m0gdYocrB8XwMWBWrHe2lDwazuQBk
         G6saEj93BLFXnzOZgaYoMntiqGL5ZQ3PXd9bAyZppLPTAcBugZThwe1v8xey/RUns/oH
         23UWKGvBxOJ1kqivHRTdPzVXaMXb2vWCULk9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SAbAg1C8FbubzgBecwNH3MBVzT6fS9RfMM3sgzD1ht8=;
        b=jZWXJ37nGRAF/8UnFRFn0RiSyWvbfUN/gTFIIPoGkisu8RmBPcHPAtkq2JTsNEYLvE
         mKBy1N9W0+mVngKYGIPWm3zejM3hjCifn7iYJ/JaWU3OO5BUqFRM3O3rrPgqqKvuXDRJ
         chQcklOPfl5pfzzbTJidi1nMgsiQ8Kz60dw5Lmilv9xSjBckJz+l25UuJoCPlpdIkLAR
         f7kliTbbNYicQiy9Ur6fW3JSGGFgNORJJcIdVwVVloz29r/lg8y1QMahukNCfhYtb+nb
         ZfzW8yI6exkHLnY6o3cGEB7FG0FvTsHf8mgAu6An9QR1mIGQ6gubS91ZxRCRgHH65skh
         szRA==
X-Gm-Message-State: ANoB5pkQcZHHVP/Q4yfDiDBzNkf50LKAw5IyHrQYAsCI0DXALfaGJr9Y
	iUWLV1iuS7SUkfSHzKVAUfedxQ==
X-Google-Smtp-Source: AA0mqf7UKdDbwLQsrdkTfGgw6XkaInebg+bwc/TfxzhQIpJP0SlFbGuR+iioPkSVtLBSW4r1ql8IIg==
X-Received: by 2002:a05:6000:602:b0:241:c70a:d370 with SMTP id bn2-20020a056000060200b00241c70ad370mr27465764wrb.105.1670279510407;
        Mon, 05 Dec 2022 14:31:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6:2c80:98d5:dc63? ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b003b4868eb71bsm24822095wmq.25.2022.12.05.14.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 14:31:49 -0800 (PST)
Message-ID: <54b30a2174816d5688d72c535b2e47015e58937d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3][master] go: Update reproducibility patch
 to fix panic errors
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 05 Dec 2022 22:31:47 +0000
In-Reply-To: <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
References: <172C139C5D52718E.368@lists.openembedded.org>
	 <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 22:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174309

On Mon, 2022-12-05 at 13:49 -0600, Ryan Eatmon via
lists.openembedded.org wrote:
> This might have gotten lost in the fun of the YPS and the many=20
> discussions around the previous versions of then patch.  Was there any=
=20
> more feedback or changes that folks want me to make for this patch, or=
=20
> is it good to go?  Just curious if there was more that you needed from me=
?

I've merged it but I am worried there is a deeper problem here we could
really do with solving properly. We should probably at least have an
open bug about resolving the issue the patch addresses in a better way.

Cheers,

Richard


