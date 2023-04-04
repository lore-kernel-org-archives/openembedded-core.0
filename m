Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E673C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 14:16:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.102745.1680617758159477992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 07:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=If95tpey;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e18so32968104wra.9
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680617756;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5/HT1c6mu2ztMNhDF/mZ4WNxT1Y11RsqkujgDnGMcDA=;
        b=If95tpeyK6xUYzqN6goxY5vOy1hKASkRyXnxiW2A+1e1+QUcKP8r7ULw/ULtob6RUF
         iFn4JRjHSdhRXPHwEK7Pdha/VbR+4uaQHDwiKXDXbpzSGCaW5E4en27KXsaJHmGW3haz
         yRvmAoo70QLNJbToRGhR5mDP0alzw9HIp1XnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617756;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/HT1c6mu2ztMNhDF/mZ4WNxT1Y11RsqkujgDnGMcDA=;
        b=yO5WO3ZxRhzeux+ZRweJ9WdSEPKV3lI2aYPVNP6TanybftGydUGOrX3WVydFcagT+0
         VXuj468/CZLnaLEBB0iR8/Q42zORKupbIEHnLQu9fusYnKz8f3/AIHNoqUUDmD1OFWJB
         ADfxtC7nZEVWQzf7Yec7FB4M2odKD6yqdNB69/O919dPD+fowEo1TPetcU1qsZkDNGKm
         9/LBv1FhdjrlKyYkDJ0XN55lJU5rRsi9cMOusCQNRRXOnku5UdwytBFVhZ9M5rBexM0S
         F0B1iobpLDrvf77AuCc0sUUrbrPLr0Mft33HkM9nL6tymj34ngVlCwG2BfDVInCGa12O
         7TNA==
X-Gm-Message-State: AAQBX9cATSQVnVvxW38jlB4RnQkgNlfNp7UiW0pOfx9hX8Z3VN3NQguX
	JbNdonkjUVy8YZBj+rA1+7glnQ==
X-Google-Smtp-Source: AKy350YqwR2Y5YQVsjukHJ3yyKcia6xkVzy22oWN+Aep1H8jsaE5WDMDYAqMpW7PQueK0ARVhBo3Ig==
X-Received: by 2002:adf:eace:0:b0:2ce:a098:c6b8 with SMTP id o14-20020adfeace000000b002cea098c6b8mr1946635wrn.55.1680617756524;
        Tue, 04 Apr 2023 07:15:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d451:665a:3597:602a? ([2001:8b0:aba:5f3c:d451:665a:3597:602a])
        by smtp.gmail.com with ESMTPSA id y11-20020adffa4b000000b002c7066a6f77sm12432298wrr.31.2023.04.04.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:15:56 -0700 (PDT)
Message-ID: <d1c3bc3d76cec7f805f8a5d26aefb6b5701b0dce.camel@linuxfoundation.org>
Subject: Re: [OE-core] mesa-native fails on master
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Qi.Chen@windriver.com
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 04 Apr 2023 15:15:55 +0100
In-Reply-To: <ZCwvy2ZBt/0R0/S/@windriver.com>
References: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org>
	 <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <ZCwvy2ZBt/0R0/S/@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 14:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179692

On Tue, 2023-04-04 at 10:10 -0400, Paul Gortmaker wrote:
> [Re: [OE-core] mesa-native fails on master] On 04/04/2023 (Tue 02:39) Che=
n Qi via lists.openembedded.org wrote:
>=20
> > I just met the same issue. My host is ubuntu18, gcc version is 7.5.0.
>=20
> Note that ubuntu-18.04 is End-of-Life in another three weeks (unless you
> buy additional support) - in case people weren't keeping track.
>=20
> The ubuntu-20.04 uses gcc-9.4.0 by default.

OpenSUSE of various versions and 18.04 use gcc 7.5. We already require
buildtools tarball for both so making gcc 8 the minimum seems fine. As
you say, 18.04 will start to disappear soon anyway.

Cheers,

Richard

