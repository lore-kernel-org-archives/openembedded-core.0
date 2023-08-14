Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EC2C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:03:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.113296.1692032598237967965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 10:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UsUlmtWj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3970067f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692032596; x=1692637396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1vPWbdIePfZXFEgW3QOafqvebdfkNedF7LlYRdWISmI=;
        b=UsUlmtWjyHxU0YoSiExmNO+RP7xkubFdCZLUjORb+WEwlrhpbowEYeQpG179jWBrT4
         nvNNxKQ0r9KD1BzdIrWOvLviY/akLw/ssg39DyEA+boiaTECPGJWv40KUeIR+NiYSgJd
         fz4UHXzZWvDOWkBbe1uwxqKj+eCK+haIJ5pxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692032596; x=1692637396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vPWbdIePfZXFEgW3QOafqvebdfkNedF7LlYRdWISmI=;
        b=YqMzBa1WoVYxp8QhkcGtX+Oszgmy22g1thbEVONvFmg1ajgS8eqej2VdQKGwLX1aIG
         npA7IhnCxF6jOE4gGOhLARQiCxl7Zt3SsyBHnuKhDiIBq1s2wIsDb+xPqNIGxuvoPhtH
         +ZktLWCCjHr0YeG+ul2RQWIwRMSpsLGovetLa7VU2N6B1QLbTtpj3qO1VFkgl37Scdpy
         7pxw0E4FWp0NxTiWaPzh259eVebkEwMIXZRDZ+M/bfNxe07RhMW8NKZVExtYsz1+StRB
         rlKizTFHRtEfLTRz5dLzqyTXq7JPFb8nnz6moGhvNpSpaFCnMPr5eAbY1MT6UR3wdo4L
         AodA==
X-Gm-Message-State: AOJu0YyFVDGFbX2cUxIBiCbiqb18lJmaWx7CXv/g65s3/eYghZSuFsYY
	0NrhghTW/7UE9N7sIV6HMuEg5Q==
X-Google-Smtp-Source: AGHT+IEfMhWY2LC1/NXR1r3jpZ1j2WuEfPAp3T5E+ziqfx8XEh+oWTCVKnswXX0/oVXAbiMA84VV1g==
X-Received: by 2002:adf:ed8f:0:b0:314:1ce9:3c86 with SMTP id c15-20020adfed8f000000b003141ce93c86mr6911928wro.0.1692032596429;
        Mon, 14 Aug 2023 10:03:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0031981c500aasm690245wrp.25.2023.08.14.10.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 10:03:14 -0700 (PDT)
Message-ID: <99dd4527598f958a1d0be1dfbe03d21d884a2829.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 13 Aug
 2023 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 14 Aug 2023 18:03:13 +0100
In-Reply-To: <CAOSpxdYnvqeS93k4HEEJ7ew5dzixoBJZkcf6xUM7fWk0uMxuHg@mail.gmail.com>
References: <20230813122807.DCBD7106C78@builder.sakoman.com>
	 <227c69b15bc3e2060c35b5a4e941b34e7c3907d4.camel@linuxfoundation.org>
	 <CAOSpxdYnvqeS93k4HEEJ7ew5dzixoBJZkcf6xUM7fWk0uMxuHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 17:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185940

On Mon, 2023-08-14 at 06:36 -1000, Steve Sakoman wrote:
> On Sun, Aug 13, 2023 at 3:02=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sun, 2023-08-13 at 02:28 -1000, Steve Sakoman wrote:
> > > Branch: dunfell
> > >=20
> > > New this week: 5 CVEs
> > > CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-29409 *
> > > CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-nativ=
e https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> > > CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3817 *
> > > CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-4016 *
> > > CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-nativ=
e https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
> > >=20
> > > Removed this week: 0 CVEs
> > >=20
> > > Full list:  Found 110 unpatched CVEs
> >=20
> > Something doesn't add up since:
> >=20
> > https://autobuilder.yocto.io/pub/non-release/patchmetrics/
> >=20
> > shows a fall?
>=20
> I see a fall for master, but not for dunfell.  Am I missing something?

Sorry, I got confused. Normally the master branch is the first in my
inbox, this week it was filtered somewhere else. I was confusing the
two particularly as they had similar numbers at the moment!

Sorry for the noise.

Cheers,

Richard



