Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCCCEB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:02:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5613.1689246125522587796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QuaT8NQh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3094910b150so701101f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689246124; x=1691838124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9aCrC6AWPb7du2brAq8h+bFVNYnwh6bK+UDSKniU4M=;
        b=QuaT8NQhs+3Vy/hEIoisEMp5U7M2VQdbJj/kU5QE2M4UjT81QRou3Vxokh5iJnql13
         qyaD0pDU3VCLDDl1dKojj16u9AuGwjbhEdvRtbykeujw019BkYR6LPGnuCS+2xyOC+d1
         4Y7aXBu6g/JWlE3E50lPAeqamAXZCSm/RmRr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246124; x=1691838124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9aCrC6AWPb7du2brAq8h+bFVNYnwh6bK+UDSKniU4M=;
        b=LwVNOIYRW6zvTaS75JqyVon/NtMTl8F1QiBUTjnmyx9gXu42kx1jLvPVI9RVfUG1iT
         xbK5Nwolxme13+fltyeor7HaaRhUcJ7qj7V41P6c8943gEsgpnK7WOn7GWW2arxTseSG
         hl9E4hMSTFc5TO/AxjM+bP8yW3Ym7Pb9FVXLG2FQEf3V51d5TmSagM5rweqUXADR2D0j
         hyoMGy51rb3HOSOXEZz0pYjCADhAWrJD0/Cy0zJ1zlY0M5Oqy6ZU67oYNHVu8Eg+oWZ6
         xpkweS2qo+BRt037DTBbjkFG7rxx4TKWgqL+hVfOzZWcEBHO4FZ4efqIS8+uvHyOx4fc
         E5Ag==
X-Gm-Message-State: ABy/qLbTQPE1bWGbEzsacSSGZRSyrHSoYTkPpO994JHWzLdJ+ET1OBil
	bOXzIN6ZtYsj5irjvaXUB3vWPg==
X-Google-Smtp-Source: APBJJlFuOD2uVI5eJ9NayG3fqEnpr9mIiDmGELjS9ClIf4Cfla0HwCRGCNnptR8d+3hS1S0WVX35kA==
X-Received: by 2002:a05:6000:1192:b0:314:3e77:f210 with SMTP id g18-20020a056000119200b003143e77f210mr1110668wrx.59.1689246123843;
        Thu, 13 Jul 2023 04:02:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:63d8:38f2:4435:df11? ([2001:8b0:aba:5f3c:63d8:38f2:4435:df11])
        by smtp.gmail.com with ESMTPSA id w8-20020adfd4c8000000b003141e629cb6sm7551541wrk.101.2023.07.13.04.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:02:03 -0700 (PDT)
Message-ID: <ab9c16fb53d525f3f0e3afaaaa30dc9e78c403d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] extractedText for every License in SPDX
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Brehm, Wolfgang" <Wolfgang.Brehm@karlstorz.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 13 Jul 2023 12:02:02 +0100
In-Reply-To: <SN7PR19MB757312F779E1255862F293EE8237A@SN7PR19MB7573.namprd19.prod.outlook.com>
References: 
	<SN7PR19MB757312F779E1255862F293EE8237A@SN7PR19MB7573.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184239

Hi,

I've copied Joshua on this so he sees it since he's done a lot of work
on that class.

On Thu, 2023-07-13 at 09:29 +0000, Brehm, Wolfgang wrote:
> We at Karl Storz need to provide the literal license text for each
> software component we use, for legal reasons. There is a property
> "extractedText" in the SPDX documents, but it is only meant to be
> populated when the license is not a standard license. However even
> for non-standard licenses like MIT, the license text can differ from
> project to project.
> I'm about to modify create-spdx-2.2.bbclass so that it would always
> extract the license no matter what, similar to what they did in Mend
> (formerly WhiteSource):
> https://github.com/whitesource-ps/ws-sbom-generator/issues/96
> Would you be open for a patch and what do I need to do to improve the
> chances of a patch being accepted, other than sticking to the style
> obviously?

I think the challenge will be knowing if the text differs from the
standard license. Is this a word for word comparison or a byte for
byte, i.e. does whitespace matter? What about things like copyright
dates?

The net end result will likely be that the that the comparison will be
pessimistic and end up including it most of the time. That will then
mean larger SPDX files and more data for people to process.

I'm not necessarily against that but I do worry that if we dump all
this information at the end users, it is going to make it hard to them
to work out the things they really need to pay attention to.

I appreciate there are regulatory requirements and legal departments
which will require the exact text but we also need to consider the
actions people take based upon this. The likely action is to map it
back to some known "good" list :/. The end next result is a lot more
data passing around which nobody will actually need to use in reality.

So I'm not against patches being proposed or merged but I worry about
the overall effect on the ecosystem.

Cheers,

Richard






