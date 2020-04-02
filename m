Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.962.1585808501525262465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 23:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=a9lSKV0Y;
 spf=pass (domain: google.com, ip: 209.85.167.67, mailfrom: paulburton@google.com)
Received: by mail-lf1-f67.google.com with SMTP id c5so1738576lfp.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 23:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fdMGOefkKivV6FpVMLQ8IH9B4opv6y60NaqXlfm85sI=;
        b=a9lSKV0Y531R9wVZxy8rUbMi9z2OZlqg32LKU2r6E8OUrMpq23UYmr/xJXX05GJhPK
         KQ1Z/I59IB8PPrLm9S01Xg1iAses1UE0mMDbqy6kSNZ7rtMo8jn0qrbX+3UvGXRaFl40
         QAGD3HWDO2lJS+jEKFT+IRSo7cWetL9OVYEaiotzC7OiNoHoCun0/Z5m5i766mE25f9X
         3rOVAjfRCrJRddZWg1CNJWCybjK3DGthViCH4yQbv/jwz0cJONn8l7kMn2O5ufVzfQUv
         SOJ2t6UshO+w7jMmip/9fY3T6JOQ8QdihGEeCtfKcm4f88n5golypkZ/hWP83mViC2YY
         gxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fdMGOefkKivV6FpVMLQ8IH9B4opv6y60NaqXlfm85sI=;
        b=oXI8pskcSFiG+fB5r6rCDCTbjUn2C+hiPjfTPG+8Px1FisgDZAyYWhy291KyJ26qJB
         scbiniwkpC+E8+hBTzIwbyPp8wvS6XlmdIxto0XIg4t4acYqSZS7IxKsrQ4kbLM1I6t7
         cJmS49xnSgr/ZXZtY/4IAtFmSKqCNd1yZBhIOMkK+hb2leGK2Xd5zaG94aaVMasIQUAf
         /TOScR8WhTEF951humbpSS359WcxYM1D2lfHmS5vaXv5cqMgcbLp0Tdz0itWdE336W9Z
         2+LJbfNvhG54dIK/ZhSsy0raqStPgcdDT5ScCy8tgSFm3FCmmMl6k27jOhdpsGzWflVB
         IkFw==
X-Gm-Message-State: AGi0PuatxKq3UDGhmPgwTXWHRrPdJpi2THqiwpI0Cr6Qvq417R8iX0Ze
	k+Lx4397AVE23dPScIa07ZkSmCU1bV2936z7NXmQxg==
X-Google-Smtp-Source: APiQypKGEdNUAn82sIQwi5kMiTkzPyUYlbsWitrfVdEYITPWf2b4YAP9fsm6dnUHwzsP8elq6wzGVkGbWkeh1DdqHp0=
X-Received: by 2002:a19:691d:: with SMTP id e29mr1110756lfc.83.1585808499478;
 Wed, 01 Apr 2020 23:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com> <20200401194102.161130-1-paulburton@google.com>
 <fcad93f710482b42d125e173a410c8396a518a71.camel@linuxfoundation.org>
In-Reply-To: <fcad93f710482b42d125e173a410c8396a518a71.camel@linuxfoundation.org>
From: "Paul Burton" <paulburton@google.com>
Date: Wed, 1 Apr 2020 23:21:27 -0700
Message-ID: <CAB_4827BARe6DGfHf-gco2oOiXPyu2MmjVRPbzZ42X9xS4R+5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: Stop creating empty .scmversion files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Wed, Apr 1, 2020 at 4:54 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I get very nervous about patches like this that come in a day before
> the final release build.

Absolutely - I would too; I didn't realize a release was imminent &
certainly had no expectation this would be part of it.

> I'm not 100% certain its this patch but a
> build with this patch in resulted in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1747
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1749
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1753
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/649
>
> and a ton of other similar failures.
>
> I'm starting a retest without it.

Thanks for the pointers, I'll do some digging.

Paul
