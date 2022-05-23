Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CFFC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:55:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.26232.1653306949403571593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A9cm83zk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id s28so20871774wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=x9H5siZZnaXSB7HnirDLDWW7jboYV2HFDij6m2cxQ5w=;
        b=A9cm83zkFTpaopcZiNrpfQNISp7D6U9VrNw+eHAlaPKZ7K14hcAv9lMRxdHsRL4Rm7
         GyHPtcDVbXQ0L00b636fO3uFtC9mvlpGSQqPKXYlpF9+l5mm+eaDOs4Q0NHm+EbbimcQ
         XOoVfoEEazVv5CUYtXP+hXoG2zz3G0HusVcnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=x9H5siZZnaXSB7HnirDLDWW7jboYV2HFDij6m2cxQ5w=;
        b=3i+ndus1i/uSVaZ0CQjfG78ikSx6X7p827ddOIl4CtkX7tJUZZG5lA9lwQNuJDYY/b
         OW1ij/Pe8PHtv5mLW21WEBQSd5CUFIIR4UbIkCfa+gOE6JmsqxUcZsF7k/aY46/CIE+S
         hvvzPMhS9QKCthz+bs20lh2/ZYWepcUrfHXtX4lASWh4uTaekxRLx/iYNphLIdin6Bu/
         i9w4gUJou5NHRBzJ7aR+XdgUjB/0tXp/5bKJaDI2bq1bzza65eTIROQeP0ihjjJOCpFi
         cCyTSkrHVk2tu3fOhr2eZ2UIajSQp7p9AZO/p1YPXQHarjCcBYnho3wNvxPQVpq6vtrt
         6Ung==
X-Gm-Message-State: AOAM5333A7wwd+OxEV4fJHwk3UQ3ekZkFTbYgpq1sMuXUSTmSMosf2nY
	6H33mxnAfVuaP8WVdYJ4mIbIVQ==
X-Google-Smtp-Source: 
 ABdhPJxHyuS+vZ8F+mdVAPeDBIK46b6O9ILkJCkqw6j/tp8tvJynfl7D+FGI3MQEGYIvAlW6hoAkwQ==
X-Received: by 2002:a05:6000:1d93:b0:20c:58f8:f530 with SMTP id
 bk19-20020a0560001d9300b0020c58f8f530mr18832747wrb.254.1653306947637;
        Mon, 23 May 2022 04:55:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24?
 ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 q22-20020adfb196000000b0020c5253d8dbsm9499302wra.39.2022.05.23.04.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 04:55:47 -0700 (PDT)
Message-ID: 
 <293e61dfb2844b274e56a910fdca471868e1d8e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC,
 BSD-3-Clause, ISC to LICENSE
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2022 12:55:46 +0100
In-Reply-To: 
 <CA+chaQdRxAuQTgdiuQC5im5FSKy=8JHsvnOtVZZaFEZFRJZTfw@mail.gmail.com>
References: <20220523112433.383046-1-Martin.Jansa@gmail.com>
	 <18e8883e3582f2d8057f0608a6edab4a0837f031.camel@linuxfoundation.org>
	 <CA+chaQdRxAuQTgdiuQC5im5FSKy=8JHsvnOtVZZaFEZFRJZTfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 11:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166009

On Mon, 2022-05-23 at 13:43 +0200, Martin Jansa wrote:
> The LICENSES file is already in LIC_FILES_CHKSUM.
>=20
> Unfortunately the files themselves usually don't have clear license
> headers, but at least there is Copyright in them, so it might be
> possible to map the LICENSES files sections to actual source files
> (in cases where it's not explicitly mentioned) and then map these
> source files to package names and set the LICENSE:<pkg> to match.
>=20
> I was waiting for an agreement that this is really needed as BSD is
> quite permissive and it would be surprising if LGE was the only
> company which had to fix this LICENSE issue (in long forgotten
> bbappend from 2014), so maybe someone else have already better
> upstream-able change handy (and this e-mail would be just a reminder
> to upstream it - my over-optimistic self said).

What I was meaning is for example the file inet/rcmd.c has an example
of one of the difference licenses so we could add that to
LIC_FILES_CHKSUM.

Since LICENSES does cover them, I guess that isn't strictly needed and
your patch is probably correct.

Cheers,

Richard


