Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E1AC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 15:08:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.198639.1673968081086601224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 07:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iDb8uEtf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso2627981wmq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4++E86tp3yQDQT8FSQSCtaDX7B0VmHOLuwz/+ltBftQ=;
        b=iDb8uEtfaMpIM3VNUsIAai4ZIq1HSY4of6QCJSdwqXMI/In7Ub/dgRfbt4NAzb/ljd
         QVn9RMqOBfHu5fTaLWOtti3OAPTY0EUp7Ihee/Vj8IVb5ZMiZlN2ku9oKbVKGlhnNIWs
         0S++GRjPQubNcL68EYseE3Q6qVunuIE1aMMW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4++E86tp3yQDQT8FSQSCtaDX7B0VmHOLuwz/+ltBftQ=;
        b=XuoCVcUCXeaHvhVr8PTb/pf6MexI+fbmfIDAqvfO/tKwXl10sbPQNw31SBrLiKpOHi
         K7iiK3HTBDJUmifRTcIG0+RzV4wTmbCrHUVhJ3xqiQcdw9wCZ9ZauusEqScUsiG4CVC+
         stihRhABAgGG3IH0LPdIxNo2sxTnBJKgdy8s/FpRUfrj04la80Tre7DASCeeCIWVGAqh
         8jjWvW+AOJvAUVaLVDenoVlCCn+PMmfRNm2dZz6HeIfFSVqw+UMNgweRtF7C2a5/H28g
         XLPnKKD33ysfxeTzaJDYngbYGFCKZGJziUNitpnUuJSl3s960WoqYL+q+9Kx4M5nY2jl
         l6tQ==
X-Gm-Message-State: AFqh2kpaDWC6jI3+HJrYQOUvSo8i8tU5N77DUqsK72qNqyrXwbUV5kNk
	LaXNZlKeXr3WzCKF/bQsXx2fEg==
X-Google-Smtp-Source: AMrXdXtB+DSWJCgKM0e2Xn9NvOKG94CicCcUZ/PuKp9SGvokMvH/rQE/gRr5wbEZAYypYi1DdhnmIg==
X-Received: by 2002:a05:600c:354d:b0:3cf:93de:14e8 with SMTP id i13-20020a05600c354d00b003cf93de14e8mr3350969wmq.39.1673968079320;
        Tue, 17 Jan 2023 07:07:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b2e7:7f75:b78d:7617? ([2001:8b0:aba:5f3c:b2e7:7f75:b78d:7617])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003d9de0c39fasm47138315wmq.36.2023.01.17.07.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 07:07:58 -0800 (PST)
Message-ID: <54ce6c61fabc641dcb40ce11e72f8eabf4b21e33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add libgcc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2023 15:07:57 +0000
In-Reply-To: <CANPvuRmjUHFVO4DgkFOSmU_2nLb8j6XJVA6nyqYOKt+rUBUugA@mail.gmail.com>
References: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
	 <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com>
	 <60471b4cad9af5016e08174e3e7d7878be89d5a1.camel@linuxfoundation.org>
	 <CANPvuRmjUHFVO4DgkFOSmU_2nLb8j6XJVA6nyqYOKt+rUBUugA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176049

On Tue, 2023-01-17 at 14:35 +0000, Jose Quaresma wrote:
> No, I don't=C2=A0have libgcc installed on my build container and this is
> the main reason.
> I know=C2=A0that we now need the libgcc on the build host and this can
> satisfied in two different ways:
>=20
> 1 - installing the libgcc on the build host

This is the correct thing to do here.

> 2 - using the unative
>=20
> For now I will use the [1] because I don't use the uninative.
> Maybe the documentation needs to be updated adding the libgcc
> as a requirement=C2=A0of bitbake.

To be clear, this is a distro python dependency problem. python is
needing libgcc but is missing a dependency, that is the real issue.

We can document it as a known problem and something to install but we
should be clear it is required by python.

>=20
> No, I am not using the buildtools=C2=A0nor the uninative.
> My build container is ubuntu 20.04 based and dont have libgcc.
> This is not the first time I see this error=C2=A0in the last few weeks
> but I'll go install libgcc and it should fix my issue, if not i will
> come back.

Sounds good. We should add libgcc to the list of packages to ensure are
installed in the docs. Patches for that would be very welcome.
=20
Cheers,

Richard

