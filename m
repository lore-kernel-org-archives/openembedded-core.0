Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48A5C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 20:41:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.17332.1661892059553622029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 13:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DCvLZq6S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id az27so15736574wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=5qB2C6omtDSiLV/gbsAJHO0jEwNZJHDURIIndbhgWTA=;
        b=DCvLZq6SixrPiEud/Ko6saSw8pby0aRU90VyczMdbMVy5C2g8MkxQ3eVyABgOYoxs6
         NEJmt7tCPAj+Ftrgl2fdaJ0t1vl4E0iKxqtKYYNQXNIDIEI1UIBE0P3STXQFWEx+gXyz
         0j1zUZlwT9T6/Viv2fCIvCxJhICs8o+wtT8/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=5qB2C6omtDSiLV/gbsAJHO0jEwNZJHDURIIndbhgWTA=;
        b=TEjrZPIGWY2gq8ijNCFxgKOujdxbwNgbZDdjAsIzAzM9uCHAEN2tFF2ISfjvbOmj3r
         Abhux/ByhMo1wr5+h6O7r9/sIt6BsjVEO1LZk8ltU1SmU5UiZifXAQX0wkSdnZuz16xh
         XYSC9eNqCrLIiBI6OFZUFRNFOa/ELEXjpQEpoF6c/cewph6KAoypQqo6XBHYLf9mV3bi
         D5lhhutEGaC0kAU2nlDcsQg5lAP3J7wniACd0zxX5byWX/eJ4zAXc1+o9M7Ua8mnX7Fh
         5gtakEzWNNxKYfRNVlaYcjPAGbon/4JvMXoDyevSFn8F05+vAHMPcvtf5xtYOsjZl8s4
         h/Kg==
X-Gm-Message-State: ACgBeo0YuaWyv/pPY+KP34RMlQfBlD/ByMz4u+/ZU5km/CpwJb+xl80d
	TODLKLSFdoVBviNoIcbe8T8Aog==
X-Google-Smtp-Source: 
 AA6agR4rkzZPal6ujl6s2DvU8Jqsi3gmVhvr2tHmsPUdFtOHIM05mm7/nIWSK9hVRp09pcIrcULZeQ==
X-Received: by 2002:a5d:5847:0:b0:221:748d:243c with SMTP id
 i7-20020a5d5847000000b00221748d243cmr9620819wrf.222.1661892057914;
        Tue, 30 Aug 2022 13:40:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8fb:7413:92ab:6224?
 ([2001:8b0:aba:5f3c:e8fb:7413:92ab:6224])
        by smtp.gmail.com with ESMTPSA id
 bn5-20020a056000060500b00226d217c3e6sm10777048wrb.64.2022.08.30.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 13:40:56 -0700 (PDT)
Message-ID: 
 <1792b01731d2412c53740470ba7521b68c6a3973.camel@linuxfoundation.org>
Subject: Re: [OE-core] Yocto Project Status 30 August 2022 (WW35)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stephen Jolley
	 <sjolley.yp.pm@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2022 21:40:56 +0100
In-Reply-To: 
 <CANNYZj-NE9s+b9Yny9+5q6MFGY3fT5RpWX76Sx6p-yFRGty1tw@mail.gmail.com>
References: <003301d8bc7f$c2feb310$48fc1930$@gmail.com>
	 <CANNYZj-NE9s+b9Yny9+5q6MFGY3fT5RpWX76Sx6p-yFRGty1tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 20:41:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170090

On Tue, 2022-08-30 at 17:54 +0200, Alexander Kanavin wrote:
> On Tue, 30 Aug 2022 at 16:49, Stephen Jolley <sjolley.yp.pm@gmail.com> wr=
ote:
> > layer setup changes didn=E2=80=99t test successfully
>=20
> The latest patchset has no known issues.

I think I may be lagging a little behind on status. I did see a lot of
confusion about the patches and I know they didn't make the last
testing cut. Hopefully they'll be in the next patch.

>=20
> > o    perl builds hanging indefinitely: https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D14902
>=20
> I will look into this. Findings will go into the ticket.

Thanks! We haven't quite found the exact trigger to reproduce it but it
seems related to rebuilds somehow.

Cheers,

Richard


