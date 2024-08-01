Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866AAC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 14:08:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.69226.1722521302981003916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 07:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AubVg7tC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3903204f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722521301; x=1723126101; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ou18xmlWK5Lo5joToV8TdBpo9rGQqr/mObcy3edtbXk=;
        b=AubVg7tC8nRhMdlKJL714P7/C0e1zecAO17hyXjt6+7ozAq6gP8MQhf0ZpoaYqVn7I
         PkkAYt8/eqaGTmCZpssFkf7MRvoExzFjLd5o3aIpHQnK7ILDv6cpqyAMa9yzOe9cSKFc
         doagW280hinlwEWMN/M072hWCuc53LPgvNCyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722521301; x=1723126101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ou18xmlWK5Lo5joToV8TdBpo9rGQqr/mObcy3edtbXk=;
        b=dVmFE5+hpMv8CTivn2ZWu4zJfN7br/iP0czLE+Nto8/FRXlf9xmFZX0O9QXy+m0QvL
         w92jt+vHo3fUW/fuAwkrh70ysQg9rJADPaHTJfEKDXMqwpLHuMo7DbH6hSrfyLVm+ppZ
         h7CoOrBv+FaEBXCOAN9zAuMQIhDyXlHrurlA9fA6dlTCF+PT6jyo8nUkEwXvxcSX8ZGk
         DNqrSNXZ2tL0Drzh9F3Dv9cgx9RfDKawCR0HmQUhyHdSQDUrJmLLgToZbjIKCE1MAbn6
         PsJjAYX7RaPLJ8XRPRcSglktcTIeEcuO19oFKzmo6plfDbqFD6qCduBF3UNuUmHHI/LC
         e38g==
X-Forwarded-Encrypted: i=1; AJvYcCVvbf8fT88NCLQByOJV4qj0gQIOYCVZ/NGsX4VXF9pF8g3Eot6xCpFHVdCfe8t2HuZduiBpIxtOpySVUuDWxQUQJYVBfq/P318shL3UfoeL5M/cQNXPoVUQ
X-Gm-Message-State: AOJu0Yx4BJeqk6Mf2ERg+K7tvXgN/ZjzfLlVtcnwBOFYGobHP5PqJTW8
	3dvsKN6G301TBYEJbjN6yxFq3goasGRxe38XXVcZoxPIQC+4FV7TQCCk+epZxQs=
X-Google-Smtp-Source: AGHT+IGzC3iFB+lRyoyDhkDKOX1eD92QuyK/djtaeXeovrOCMV+LQoZJB6vpXtIf3scqnQ8dKHiRSw==
X-Received: by 2002:adf:e7c4:0:b0:369:e72c:876c with SMTP id ffacd0b85a97d-36baaf23dbemr1516762f8f.45.1722521301034;
        Thu, 01 Aug 2024 07:08:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f? ([2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368709fdsm19483974f8f.116.2024.08.01.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:08:20 -0700 (PDT)
Message-ID: <9d33f694d08c91ef31c49c0c549f17d272358476.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add
 deprecation notice
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>
Date: Thu, 01 Aug 2024 15:08:20 +0100
In-Reply-To: <CAApg2=QPTmm6Y-r-oWS2PfP-DZ-t1NRfm7rKqcBnuFmkXRdC2w@mail.gmail.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
	 <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
	 <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
	 <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
	 <CAApg2=QPTmm6Y-r-oWS2PfP-DZ-t1NRfm7rKqcBnuFmkXRdC2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 14:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202737

On Thu, 2024-08-01 at 15:58 +0200, Marta Rybczynska wrote:
> On Thu, Aug 1, 2024 at 3:47=E2=80=AFPM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
> > On Fri, 2024-07-26 at 14:28 +0200, Marta Rybczynska via
> > lists.openembedded.org wrote:
> > > On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton <Ross.Burton@arm.=
com>
> > > wrote:
> > > > On 24 Jul 2024, at 16:25, Marta Rybczynska via
> > > > lists.openembedded.org
> > > > <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >=20
> > > > > This file contains CVE_STATUS without machine-readable
> > > > > information on which
> > > > > recipe it applies to. All entries should be verified and, if
> > > > > appropriate,
> > > > > moved to their corresponding recipes.
> > > >=20
> > > > The point of this file was to be an opt-in for more exclusions
> > > > where we didn=E2=80=99t feel 100% confident asserting the issues co=
uld be
> > > > ignored.
> > > >=20
> > > > How much of a problem is it if this file contains a a limited
> > > > number of CVEs?=C2=A0 We can review what is in there and move/remov=
e as
> > > > needed to cut it down.
> > >=20
> > > With the vex class (and with SPDX too, I think) they end up copied
> > > present in every single package of the build. This brings enormous
> > > confusion.
> > > Impossible to filter them out as there is no information about the
> > > affected recipe/package.
> >=20
> > Difficult, yes, impossible, no.
> >=20
> > Surely we know which recipes a given CVE apply to?
>=20
> Without having the CVE data at the same time, no.

I thought we had the CVE data?

>  Also, a CVE might apply to multiple
> recipes at the same time - and this could be dangerous. Imagine a situati=
on where
> the CPE is incorrect and is pointing to the wrong package. It gets added =
to .inc.
> But then someone in their layer adds the package the CVE really applies t=
o...

We can't cover every possible scenario and if the data is wrong, we
identify and fix it.

> If we keep the .inc file, I think the most correct way would be to add a =
field marking
> =C2=A0which recipe it should be applied to.=20
>=20
> What do you think?

How do we mark up a CVE as applying to gcc-cross-*/gcc-cross-canadian-
*/gcc-runtime/libgcc and so on?

How do we convert "bash" to "nativesdk-bash" and "bash-native"?

There are ways we could do such markup but I don't think it is going to
work well.=C2=A0

I guess the key question is what we're trying to achieve and where
we're expecting the data to be processed?

Could we write a common exclusion file out once as part of the CVE
fetch recipe and avoid putting it into the individual recipe output?

Cheers,

Richard




