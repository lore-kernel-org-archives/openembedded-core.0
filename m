Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE881C3DA61
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 08:13:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.12992.1722327188627792143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 01:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iKfhRWLr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3684407b2deso1955856f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722327187; x=1722931987; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+70/nsthVoV0pVqiS88R64ALkKNHtiISZtlAN2PLCk=;
        b=iKfhRWLrRU+Yqa8kKt8BTLz8y4Mq1FVW8dWr5rkMANjkUIaTtxNrdPS0UDYq8dS57n
         J8YLwusRvlhkqgFGXJXtL+K1NE8VaLFcSl30G315RVCsuWFnsdoNKU4RlibFhOaqSNg2
         x/wow5XL77w9/L/fFLimcoo9PrM33q2WNBc94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722327187; x=1722931987;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+70/nsthVoV0pVqiS88R64ALkKNHtiISZtlAN2PLCk=;
        b=wOjbFIAkOkuumJtB5GLhnqQCzXN+a9lBAFG9sg7jQ7fLgGD6ZSRLxj7ebBA1JiLEZI
         ExbsablEtSmF52nLVKUtfZGqXj/z5saMyLijcZwCPxwNAPPeSn8CRKFLpfHSrV6E9GCA
         U2HgXdSS63hmu/NiepZD4z2nrlNHRm4fL23n9KSHBl7U0HQ8NpvNKCeC7SV7BTK4T4p+
         3IxA91Ih8NNYMYLkqW8K/KMGpV96+b6Vl/g3ZuMgtzr9ZtQA+H8r5XZetuainghuCx3O
         n3Pj1DTzarnEXD3UPtKpVep7SfEt4vXiqBh4kEHsLy2oTH8E/msT1RVe0946W3krr+1F
         zaqg==
X-Forwarded-Encrypted: i=1; AJvYcCVyU2VEZCRDzfyoJZTtBibQFZRtgs3/zKGAW3FPVFJz632cogzWYX6uqc+qg7n1r541faPhie2GouQksfhqwloqyPYtal5NQii2xIwbzfwHXc25ebXJ3PgP
X-Gm-Message-State: AOJu0Yw0cq2U7woEunwx1hkHXlPO1AFX0/hytpd4IOX/Vk3vQE0lpf6O
	aItKaGEjeQ/tLw2a/6+JOb7ItP+Bkvhl8rCOkXkAuX6yWgviKS7CNZhe7ZGC4RQ=
X-Google-Smtp-Source: AGHT+IH9UhOqZNGCcsvuzsvmK0+lwB0Rmg8ERWuq3/3GKdja8vYxEuNS/Yoe6fmepjdbzXgYpufzwQ==
X-Received: by 2002:adf:fd50:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-36b5d073f09mr7114482f8f.41.1722327186813;
        Tue, 30 Jul 2024 01:13:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:569:bcae:43de:f9cf? ([2001:8b0:aba:5f3c:569:bcae:43de:f9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36861b54sm13907522f8f.95.2024.07.30.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:13:06 -0700 (PDT)
Message-ID: <57e05ea2308501897f3dab545047e32187d7713f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] classes: add new retain class for
 retaining build results
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul.eggleton@linux.microsoft.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2024 09:13:05 +0100
In-Reply-To: <91375a039483ece87de8835f50cf4b4b0ed474ca.1722211934.git.paul.eggleton@linux.microsoft.com>
References: <cover.1722211934.git.paul.eggleton@linux.microsoft.com>
	 <91375a039483ece87de8835f50cf4b4b0ed474ca.1722211934.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 08:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202667

Hi Paul,

On Sun, 2024-07-28 at 17:22 -0700, Paul Eggleton via
lists.openembedded.org wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> If you are running your builds inside an environment where you don't
> have access to the build tree (e.g. an autobuilder where you can only
> download final artifacts such as images), then debugging build
> failures
> can be difficult - you can't examine log files, the source tree or
> output files. When enabled, by default this class will retain the
> work
> directory for any recipe that has a task failure in the form of a
> tarball, and can also be configured to save other directories on
> failure
> or always.
>=20
> It puts these tarballs in a configurable location (${TMPDIR}/retained
> by
> default), where they can be picked up by a separate process and made
> available as downloadable artifacts.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>

Thanks for the patch, looks like it could be useful for some contexts.

I ran it through the autobuilder and whilst one selftest passed there
were failures too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6961/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3662/ste=
ps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7016/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7026/step=
s/14/logs/stdio

Maybe everything after the first run failed so a build from sstate
issue at a total guess?

Cheers,

Richard


