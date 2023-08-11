Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55DAEB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 07:05:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.37737.1691737534357029854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 00:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TnStBFxq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1569066f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691737533; x=1692342333;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vDwNkFMxNSZqug2MG78utkS1qCVQEr0f8qTBWcdLAG0=;
        b=TnStBFxqt/nwfZfHtx5iUE3ncwSamIiI7kAUrAmqUAoY2Hqn7teQf5IMd8bivAqLks
         yaEwC26Fj9RGD7LZoBPQZo4Ye3xEUqiqvDmttn5ioFp7+H7NOmzU1T6NsLXSaL7kkjlF
         O/9fP8ttkL+uvyCobO/o+CNy25mSkhBkvThWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691737533; x=1692342333;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDwNkFMxNSZqug2MG78utkS1qCVQEr0f8qTBWcdLAG0=;
        b=baKarakbVautUrL+816ZXiUzyNd/fUvycBsbbfDAS1CmLvj0Nu5+i56wn6mLw3qm9Q
         6N5GtqCjx6Ry/xjq7VHqvOgbAAR00yGmVn7B+YSNdUo8YYYlH7a000RlkswAVZBTqHLg
         qJm4BSwore31jRoeQozYvIxPsHT836RMMwrssJWHixJ4JW4WkXUj/JBnTh1QsKGO+PA1
         S6XElWQGdta8z5uwmPww+rdpgK4sW6Q8oZ6OAoPO7Mo5WuiHBRn+hA96xY5sCEimotjZ
         9PjueowMKDmW/3NEjvXbnveBdEH5zSwR9td/0gqsQpMuYYsQ9SBffqruJh+9w7MuV8Ph
         42Nw==
X-Gm-Message-State: AOJu0YylHm0EIqIF8Lu1Txk+yC1mX5GJXvsLmd6oGwI+gpHHOUFv8N5F
	Xns0gpARbl1rVbK/B2LRbqjGEQ==
X-Google-Smtp-Source: AGHT+IFN1yvFkO/uav4o+kn9OtjwrDPqzDGhQhnlA2rbGlwchHm6aNdIIXRtNnVB17SSSkAjIIiCtA==
X-Received: by 2002:a5d:4411:0:b0:317:7081:34c7 with SMTP id z17-20020a5d4411000000b00317708134c7mr685077wrq.44.1691737532723;
        Fri, 11 Aug 2023 00:05:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e7:9ff1:d8f3:9443? ([2001:8b0:aba:5f3c:1e7:9ff1:d8f3:9443])
        by smtp.gmail.com with ESMTPSA id q10-20020adfcd8a000000b0031753073abcsm4428624wrj.36.2023.08.11.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 00:05:32 -0700 (PDT)
Message-ID: <445f02dd08a50e8bbb616ee34560db554af6911a.camel@linuxfoundation.org>
Subject: Re: [OE-core] Status of patchtest tool
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Frederic Martinsons
	 <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2023 08:05:31 +0100
In-Reply-To: <3f31bf9f-a3dd-1be1-8320-5aa2abd67351@bootlin.com>
References: 
	<CA+cAker4rvPcdjxN7faE5jzGTKVC-1K--ezXXmkOdWbJ_f_bkA@mail.gmail.com>
	 <3f31bf9f-a3dd-1be1-8320-5aa2abd67351@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 07:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185829

On Fri, 2023-08-11 at 08:00 +0200, Michael Opdenacker via
lists.openembedded.org wrote:
> Hi Frederic,
>=20
> On 11.08.23 at 07:28, Frederic Martinsons wrote:
> > Hello list
> >=20
> > Michael recently made a change on contirubing guide talking about=20
> > patchtest as a tool (quoting him) "to test user contributions before=
=20
> > they hit the mailing lists; and looking in my older emails, Alexander=
=20
> > also mentioned this tool as a (quoting him) "special bot called=20
> > patchtest that used to check mailing list submissions for common=20
> > problems".
> >=20
> > Can you tell me more about it ? Are we talking about the script=20
> > patchtest.sh in=C2=A0scripts/contrib of oe-core ?
> > Can you please describe the expectations of this tool .
> > I'm willing to improve it and am ready to work on it if you give me=20
> > some directions.
>=20
>=20
> Actually, Richard wrote the initial text, and I actually wondered... Is=
=20
> the intent to have a tool that contributors can run before sending their=
=20
> patches, and that a bot can run on mailing list submissions too?

Yes, that is the intent. The docs are written with the view from where
I believe we'll be in a couple of months. I wrote it that way to prompt
us to fill in the missing pieces as this is developed and because I
wasn't thinking the text would have merged quite so quickly.

Patchtest is mentioned here:

https://www.yoctoproject.org/community/yocto-project-engineering-request-fo=
r-quotation/

Even before that we've talked about patchtest a lot and our desire to
bring back the code/tests we have and get them working again. There are
several mailing list posts where I've talked about it and various open
bugs in bugzilla.

We're in the process of getting some help to work on some of the things
in the RFQ and patchtest should hopefully be getting some attention
very soon.

https://git.yoctoproject.org/patchtest/
https://git.yoctoproject.org/patchtest-oe/

Cheers,

Richard



