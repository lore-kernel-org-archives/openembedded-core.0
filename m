Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E351C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 21:46:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.24564.1635630406707102069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 14:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMAZuqrn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id s13so15086454wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ey7hqawHB9HTN2PUwMpFiZvWfnoWnDzpkhwVRGGqG6k=;
        b=VMAZuqrnzxYH1nYROdLdxEEymV/NzBWjm+lI/YjWISJq6CBrByiFELnMxTu4QjVq0I
         KaxCQiSqnw0vPOS21EUH94WE2ri2NNIAnnTINKWncZn2BJrLfgmnctpnf/B3X68N2f3k
         TCaPAtEkf59QYekSI+UZA2eH1WCx2QF0I7lDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ey7hqawHB9HTN2PUwMpFiZvWfnoWnDzpkhwVRGGqG6k=;
        b=gPzT4cGr4fBjq4wcd73wy8T3nlBYaFqnhacjJpA3vFvMK4I3WtUf8SZ3JejVz79X+6
         9eyQn3lnUZJd+c2hrULSr3a6wCBZU9EPj0Y4U6J6JLPN1Rgy3DlNsTuFUkdqcsTjyamY
         vljrOFX5/5hOLmFUIXEgsevcD2wPb14FqEgPmEbOOZ3ftOc5DkiNJRqSi0MQWyyBOPdB
         r3WQC4J8OqxaXcnJ4eKpWpkKMYv+M5BGj146n4nhDoRObTkBoCEjgohknDPjYhGvl0gz
         uzBkFFzIrWbYCxbF4+Ebxs6Sz02Us1biPRRKnRxKng1nveKC3BxfW6uQIJkWHsi1jIke
         y4Ig==
X-Gm-Message-State: AOAM531tPdUkwnnI+qhptP3f/BqTjtwitJ9+nQ4HT8UCvvqaIMz6gsVR
	J8v9TsFI14LTzZdNgtN6X41GxQ==
X-Google-Smtp-Source: 
 ABdhPJxWQPukiSfP27LFrKdN0M0gWJ7vn3+eXdv5ZG0Zw76CdIXKPHMqZQGVKZiU0sN3xFaYxUbA3w==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr24839425wrr.45.1635630405029;
        Sat, 30 Oct 2021 14:46:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c?
 ([2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c])
        by smtp.gmail.com with ESMTPSA id
 v191sm8634909wme.36.2021.10.30.14.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 14:46:44 -0700 (PDT)
Message-ID: 
 <658f56df6d3b814dd0228f8c0d23f327facf6507.camel@linuxfoundation.org>
Subject: Re: [OE-core] ERROR: Task
 (.../kernel-module-something.bb:do_package) failed with exit code '134'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Oct 2021 22:46:42 +0100
In-Reply-To: 
 <CAGj4m+7jjDzf6ZXWDsEUhkzD5X1MoSWP7HWCknL_fKQ==x=dOA@mail.gmail.com>
References: <W5wi.1632764687377274770.mOgu@lists.openembedded.org>
	 <e47d11b76cd90e456330dd111f9ca37fbd39bb4e.camel@linuxfoundation.org>
	 <CAGj4m+7jjDzf6ZXWDsEUhkzD5X1MoSWP7HWCknL_fKQ==x=dOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 21:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157651

On Sat, 2021-10-30 at 23:21 +0300, Vasyl Vavrychuk wrote:
> Hi, Richard,
> 
> > Even if you can't reproduce the error, you can likely look at the pseudo
> > database (in WORKDIR/pseudo/) as it is a relatively simple sqlite3 database. You
> > can check the inode numbers in the database compared to the files on disk and
> > the issue is fixed when the numbers match up.
> 
> I have checked files.db but it did not help. I have found that ino in
> sqllite db is what is printed in pseudo.log, and, it does not match
> actual ino on the file system, as it is printed in pseudo.log too:
> 
>   inode mismatch:
> '../kernel-module-smth/1.0-r0/image/lib/modules/5.10.25-yocto-standard/extra/smth.ko'
> ino 701049753 in db, 639582649 in request.
> 
> The question is what has led to this mismatch. How can I debug it when
> I get this situation randomly (or not randomly, but pattern is not
> clear for me at the moment)?

What I was trying to highlight is that if you do a comparison of the files on
disk with the inodes in the database, you'd be able to detect whether there was
corruption whether there was an actual conflict through reuse or not.

If you can detect the corruption more easily, you can then narrow down what is
causing it and which set of files aren't matching.

Cheers,

Richard


