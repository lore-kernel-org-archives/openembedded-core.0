Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5535C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:29:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18535.1700170158526381570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TUsy85XP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso11217005e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700170157; x=1700774957; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/WazusTnEnChuQKkmqG4e7do9sNfgmB7+M/BJm7MJ7g=;
        b=TUsy85XPVG1aUl8JJBD7p+KeS3yRxVdpu3YX4ZGaU91lSPJEI7EjAJzHVlmJe6UMlw
         YAmS6wxxW9IvBAPlidArrUU0p8CsIiUlKSyHPGNMysED4UeXs9uxbgHSU1rgGe/7Sh/v
         w7PoFuwsgfWitUL4zBbuRYanjxbByEaHIcFQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700170157; x=1700774957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/WazusTnEnChuQKkmqG4e7do9sNfgmB7+M/BJm7MJ7g=;
        b=msnfTtI9JvvWaHBnng4WZYlHiVMNv+YbHjjSrDXKATt17C//7C0xc/XJRQMP7wj2Ln
         hs1x4ajjbDKq6xd/Zw8jJH3nwshLo9JYAir8tDW3ppjz60Ua3K9nVi1aWRYKuVWSAcYQ
         OsUirAqDzGo9nJV9N6z6PSMoSLfVzW0wBI5rB78yo6hX3kaGb3uztHhvqcTlsK4sN4c+
         eETatiXZ0rPxZo4cxWpbiQJC5ZUyTME8xIwU6AYhwYLCb+mB/g+HRW+nRTtJtpwZt481
         7ePoaiIhK/tNumEsLde8bf5x+37leUFUywXQqT9IEqxEgpehxKF5cHDLW1M2AsRRdl12
         8jyw==
X-Gm-Message-State: AOJu0Yyhfcv8thpZJg5W3yu15fbI8EMV0kzyylGASE2yWqcHRvcXVibG
	qqtBiM5j3YcGYBDlg1s83gZpOg==
X-Google-Smtp-Source: AGHT+IGYUmqIWIhagljj+PcP0mvTekxbWLd4HdGj+hWEYS8t3su/VViIZHor+70dszjCgvCoyV96vQ==
X-Received: by 2002:a05:600c:a48:b0:407:5b54:bb15 with SMTP id c8-20020a05600c0a4800b004075b54bb15mr13369656wmq.36.1700170156918;
        Thu, 16 Nov 2023 13:29:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:53e6:c03:6926:154d? ([2001:8b0:aba:5f3c:53e6:c03:6926:154d])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c230100b003fefb94ccc9sm488191wmo.11.2023.11.16.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:29:16 -0800 (PST)
Message-ID: <847e297330c0748c27926ceccde31f62f5ffed47.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] bitbake.conf: Drop oldincludedir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2023 21:29:15 +0000
In-Reply-To: <CAMKF1soCqH=+=QUeaF-ikMmwHCe0L0K8Cp_-X3tVqe6xTkQVFg@mail.gmail.com>
References: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
	 <20231116165250.2863415-2-richard.purdie@linuxfoundation.org>
	 <CAMKF1soCqH=+=QUeaF-ikMmwHCe0L0K8Cp_-X3tVqe6xTkQVFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 21:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190812

On Thu, 2023-11-16 at 13:25 -0800, Khem Raj wrote:
> On Thu, Nov 16, 2023 at 8:53=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Autoconf defines this as:
> >=20
> > "The directory for installing C header files for non-GCC compilers."
> >=20
> > Whilst this is something autoconf does allow changing, I find it hard
> > to believe it has much use in the wild now and that headers don't get
> > split like this in reality, it would probably only be useful on really
> > old unixes.. The values are the same in our configuration anyway.
> >=20
> > Drop the value and just use includedir everywhere.
>=20
> Maybe alias it to includedir instead. Since some makefiles may assume
> a default value in its absence
> which might change the install behavior. It does not matter much on
> native builds but for cross builds it might.

I did for autoconf itself but I'm struggling to believe there are
generic makefiles out there using this.

We really need to cut down on the amount of environment exports we have
so lets see if this does actually break anything...

Cheers,

Richard

