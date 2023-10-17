Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF23CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 10:31:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.209237.1697538691581567392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 03:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=blEzbyLy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-406402933edso55115665e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697538690; x=1698143490; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDw5StJUHbWQyetf3rS47WdWL7gRgf99/PqNONFQ8pw=;
        b=blEzbyLyc2GE0GbVEvb8LojiXZNdR324sET6VX62DmVTATFEOf/t+lu06XCiEIYqzc
         uoE52VLHQVf1m2BEtM/OyKg8UZvqASZuyu5x1mUvkUBh+zh6GhBLpsyheAAheyjt0Eip
         LpQO9zF/hUh5O6rj7ajvvobV4QuZcPTz/G/8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697538690; x=1698143490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDw5StJUHbWQyetf3rS47WdWL7gRgf99/PqNONFQ8pw=;
        b=ti1eO6VCyjAVUgfpFVph4ZxEyFfrk8tfQ8Fk6AAG0WzYbWkWATmecnKh9H5Zn82MJZ
         WdKmmJfAHik5brHcPQ4p4/61Nh0l3uIMLkwNVHc2F4SKmJ+AaWIYWeVfjll0WraLTU28
         JQq3WLUTOa7L86Qd4hBVKVTJo8K2/bsyo4Pfksl/hX2gt3KiBgof83/Nll64OTeVPhsj
         KudHrqnhTk4QALHwFbdSiPlOABvgLe8ZmPCoprMEd4W2tu03/0tv6l861Ss0tW3dURDT
         Qt2m7SYtsPsxsKvJob3o/Im5GzxRjjot5ILMmX/hjYIGyJ8IOhVCQCLaVv23rvXN0iRs
         qbjg==
X-Gm-Message-State: AOJu0YzOYYAjItcF8W82bb8q5eSLu/X4bTv8N6T6pizhz+WAA4vDqiXQ
	CmneDJ1T5F2gTd17ckWMQL1OBD54rZHZgRs1rw4=
X-Google-Smtp-Source: AGHT+IGNN1phLAQ9hAYGYysS40rUY9jxfL/BPCkh4BkZc9Daul3fKpANDdVYH0bKhKkyZCa5PPAxpw==
X-Received: by 2002:a05:600c:45c6:b0:407:8ee2:997e with SMTP id s6-20020a05600c45c600b004078ee2997emr1406350wmo.27.1697538689897;
        Tue, 17 Oct 2023 03:31:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81eb:8695:fc05:9038? ([2001:8b0:aba:5f3c:81eb:8695:fc05:9038])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c458600b004080f0376a0sm959636wmo.42.2023.10.17.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:31:29 -0700 (PDT)
Message-ID: <71bad2d2641cf30c50e46c9559688f938af54514.camel@linuxfoundation.org>
Subject: Re: [OE-core] why is it PROVIDES = "udev" and not PROVIDES =
 "virtual/udev"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2023 11:31:28 +0100
In-Reply-To: <99f6ac2e0b7aeecfa55ffa161a00c050@crashcourse.ca>
References: <99f6ac2e0b7aeecfa55ffa161a00c050@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 10:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189322

On Tue, 2023-10-17 at 02:30 -0400, Robert P. J. Day wrote:
> given that the PREFERRED_PROVIDER feature is typically used for=20
> "virtual" entities:
>=20
> * virtual/kernel
> * virtual/xserver
> * virtual/libgl
>=20
> and so on, is there a reason that this pattern is not followed for the=
=20
> selection
> of a udev provider, which is referred to as just=20
> "PREFERRED_PROVIDER_udev", and
> can be provided by either of systemd or eudev?

udev was once a real recipe and still kind of is it just became eudev.

Cheers,

Richard



