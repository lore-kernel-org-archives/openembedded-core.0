Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFB2C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 13:26:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.42158.1660829200388297806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 06:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WZbxmIDh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k9so1769888wri.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=p0BVcWjzBDWVF96GxUcKAohPdC5UxcVO3RayTh/5C1E=;
        b=WZbxmIDhbF8xcHUlspE6DcbFcxiOIPakN1YAh59+WeEtUm69Uya/tFcnOUmufQXy0P
         UCb+VVPHOUJP2hzczV7VQPnm7oagEJv7DHYXoRQU9SAfE/E3+UX4MOzDlkhouw6eABDJ
         wCjwNUoIEl2vnJpNWaRA39rkDnh2d+P119nkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=p0BVcWjzBDWVF96GxUcKAohPdC5UxcVO3RayTh/5C1E=;
        b=1a2mNXblbSC8oyjS35azHNa5ORnvLn6k6zeiExmwS/imiTdMvm+jQ6WsEuT14AwYiD
         lcgimhwuNNbRMSWQDkKkBoZYxIY8qguragmSNtxD0xWkT8vWTME2bXedlannQ8Y6700d
         3L6dxaGWKvhDwYFZbrm3DED8r1y66omSIt6uuvZmBvKxgOMA71pdSMDBhKIoIPIhgQ8T
         na7h9SD6YfO2/nbQs8Smo5aM/CE2rIxFCfuCkKoyI/2Lrtl02QhgUly6m2G2ARBo1kLP
         0io3FMD0sFEzv4wnNhuZFyBf+l+cIoxllFsQqPoZ2gjrtvqgjc4oIckFO0awRUH1LIXM
         1KkQ==
X-Gm-Message-State: ACgBeo1AbmspuRloDCzTybHoIZts9DBmXLeNWKpnACY6MS7BFV1ok4P7
	ZRV/+GiQpN7EDF1WL6MSwZhAtw==
X-Google-Smtp-Source: 
 AA6agR4q32ODK5Z3W48d8H1Vi2yCMrx40QdLdPR8uLa0eiWZV3D0o3/RZVLeA1yy3VRUQIF+3A+P/A==
X-Received: by 2002:adf:ebd2:0:b0:222:cd3f:cf9 with SMTP id
 v18-20020adfebd2000000b00222cd3f0cf9mr1661741wrn.598.1660829198763;
        Thu, 18 Aug 2022 06:26:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975?
 ([2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975])
        by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b0021e4bc9edbfsm1434236wrm.112.2022.08.18.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:26:37 -0700 (PDT)
Message-ID: 
 <2940b1bf9287064f82deb04a121b5893b5029d58.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] distrooverrides.bbclass: use IMAGE_CLASSES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2022 14:26:37 +0100
In-Reply-To: <a7721619-50b8-8d35-b392-3fd5088ee5a8@windriver.com>
References: <20220816075432.22347-1-kai.kang@windriver.com>
	 <CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com>
	 <a7721619-50b8-8d35-b392-3fd5088ee5a8@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 13:26:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169521

On Thu, 2022-08-18 at 09:54 +0800, kai wrote:
> On 8/16/22 22:55, Christopher Larson wrote:
> =C2=A0
> > This class functionality isn't limited to images.
> If not, it may need to move to classes-global. Otherwise it fails to
> parse:
> ERROR: ParseError in configuration INHERITs: Could not inherit file
> classes/distrooverrides.bbclass
>=20
> =C2=A0

I've moved this back to the classes directory for now until we can
decide on how it should be used. It is one of those cases where either
can work.

Cheers,

Richard

