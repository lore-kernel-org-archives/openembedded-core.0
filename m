Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C4DC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 10:13:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6297.1685441578478953291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 03:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hW/AV51o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso45150045e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685441577; x=1688033577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tf7W0eHYhEpKDvmKAbo8Am6nxw33QJgC2bellYx4clE=;
        b=hW/AV51oFPFGEDzY26BpPrEMphlDSSkZIU3/Y8FdmEyC5lITSNTRjmUTX7j+NKsWub
         /OoIdoISOyh7T4Vl82rmHkMv4/Kc+6JbCublOilsQt5G8UwzxTdEK4+I5U4SU71LenTA
         0GFLSVXbmvQNiX+oiSsA0lC5I1JietRzO3WuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441577; x=1688033577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tf7W0eHYhEpKDvmKAbo8Am6nxw33QJgC2bellYx4clE=;
        b=BqLEVVWVpZgfYZIdo0tyhicz86ruP6sIYKaENJebjuvv16DF2zmOULTtw2Dok+0LBy
         39X/d0+GsOGW8s/sWFbiF1sLIHe0dOJ9pNXJoKqRDNexEk/FT7YZ1d9Zubhm4+PfyDYk
         LFiZLX+327AFq+Ucot/z2ULfyn+JEpG3eCfyEhCzs3P54djwUP15+KwDyJJ3Cbz2M8w8
         KSW45ooOI9DyFolTNnO3XJZtUTDMQWCzM489igYSZyfrFoDAbquMwtmtKYAsCeMBDvvM
         pZKxU/kBQm3Hxw5VfLBuID1Vv8B86RangEcKFtOOtKwfMt2eecKqgmNwQIX7yaRGXnsl
         q4PQ==
X-Gm-Message-State: AC+VfDwlL5AzL7P7iAHFxI/pYabgLQJrW6cjGKBbAzRguF4yf5EANNSV
	pwSicGSQOi6I5//T0GVjsJFnGQ==
X-Google-Smtp-Source: ACHHUZ5OJEArNA9vNRcBGaS99rEDmegxvykgB9H7KQIWw2DkwuhFcWAy27R7WiPoze1TQva2cvs8UA==
X-Received: by 2002:a1c:f30e:0:b0:3f6:41f:8e66 with SMTP id q14-20020a1cf30e000000b003f6041f8e66mr1198797wmq.5.1685441576892;
        Tue, 30 May 2023 03:12:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b003f180d5b145sm16902420wmg.40.2023.05.30.03.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:12:56 -0700 (PDT)
Message-ID: <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "rybczynska@gmail.com" <rybczynska@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	 <mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>
Date: Tue, 30 May 2023 11:12:55 +0100
In-Reply-To: <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
	 <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 10:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181911

On Mon, 2023-05-29 at 07:32 +0000, Valek, Andrej wrote:
> Hello again Richard,
>=20
> Maybe this email was little bit unclear..., so I will try to recap it her=
e.
> There are 2 open points, where some final decision has to be made.
>=20
> - Could we rename the CVE_STATUS_REASONING -> CVE_STATUS_REASON? The firs=
t idea
> came from you.
> - What is the final enum for CVE_STATUS? I would say "patched" and "ignor=
ed".
> Afaik, the "not applicable" status came also from you. Should we keep it,=
 or
> remove it? Of course all others are just like an additions which could be
> implemented later on request.
>=20
> So please, take a look on it and made a final decision.

Whilst it is true that I get to make a final decision on whether to
merge a patch or not (for better or worse), what we need here is a
community consensus about what we need to do. Usually that is done with
a proposal which gets tweaked until there aren't strong objections to
it and a majority are in agreement.

If do change, we need to get it right as we can't keep changing. We
also need to be mindful that the LTS releases are more closely coupled
in this area. That said, we need to get things right for master, then
work out how to work with the LTSes.

I think we're all in agreement we need to do something more than what
we currently have as it isn't scaling as we need.

FWIW I'm not sold on CVE_STATUS_REASON*, how about CVE_STATUS_DETAIL?

My original concern with "ignored" also remains. I'd really like to
encode more detail about why we think it can be ignored.

For example, this set of values would seem to match the common reasons
we see:

patched - we carry a patch meaning the CVE has been fixed

cpe-incorrect - the CPE entry versioning is incorrect and our version=C2=A0=
(and newer versions) are fixed. An update to the database is hopefully pend=
ing.

cpe-stable-backport - the CPE entry doesn't cover backports to stable serie=
s but patches are applied there (e.g. kernel LTS versions)

not-applicable-platform - the platform isn't applicable for us (e.g. window=
s or OS-X)

upstream-wontfix - the upstream maintainers don't believe the issue needs t=
o be fixed

not-applicable-config - our configuration means the issue isn't enabled/pre=
sent/applicable

other - CVE doesn't apply for some other reason

The reason for having these different categories is it means people can
group and act upon them differently. If you were building on windows,
you'd take a close look at the platform ones. If you were changing
kernels, you'd know cpe-stable-backport was potentially incorrect. If
you're changing PACKAGECONFIG, you'd take a closer look at not-
applicable-configuration.

I'm not 100% sure I have all the right categories but I'm trying to
articulate my own thoughts having written a number of the exclusions.
I'd be interested to understand if the above works for others. The
challenge is we all have different reasons and uses for the data.

Cheers,

Richard

