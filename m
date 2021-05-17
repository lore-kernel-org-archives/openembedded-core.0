Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.16846.1621245878179200367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gzyfqEC0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id x8so5707232wrq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5rzXALddepbdrFhyCj+terLg565R90fONu8p6rYbrOk=;
        b=gzyfqEC0ccBxR5S8DwV+kwv4pqA/89X5kg0XL+9kKoVKqnljqjQMOioWUdvXtEwf0Y
         VCKm21gC5dxi8Lg0lwlk5w3uL3omaoX5YPRh1bjkj/kQ3tLW7QSoJvA+zKQu0CXKxXia
         2EKo00tMUWjMRyHGOfTB+Qfz2m6STXUsk6F6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5rzXALddepbdrFhyCj+terLg565R90fONu8p6rYbrOk=;
        b=Y1wwsIJq09qUfxFf/fV+nc/6lWAMuyVUEmpoDWQ9tTZXZz3WLg6Hveuue0BzPOH/0m
         z9oRxoZAsnCVygG5MfwMA1Hrm7wt57e6RBvcq/dPt4ZXsfWD1xUTDNKnQhaQ0vy4srUE
         3nMn6OFePE3JRLOOlez7kgx0QW/GxPmdE3reW3RjG9jmzddTKMaHVw63YR3Xir/jltUS
         qQlFR1lrgb7nVsZhibJgD+zVxoyVAbNlQT7FzVmw+xPk/2zxBSJ9l889rEaQNrnmZX/c
         UlQ8fim4Q0UNYUCwEg2Q5Cut8i/E7IhjJrk9N6o3b5UjhAIE0xSoyATfbSfL5XeNmaqN
         wQCQ==
X-Gm-Message-State: AOAM532NUiGLXXsd9XtyNlDwKulcicSQMyon+pL+o1SaPBxL7God2ymJ
	Luh+LftW6q5AtrNqRv92ctNGCA==
X-Google-Smtp-Source: ABdhPJxN7b6fNI5htaVYkjQSKSB0wbxHId6BRJdBW4X/stTjv+sXMjb+9PyTvshxMnYi27ipAkdhwA==
X-Received: by 2002:adf:a519:: with SMTP id i25mr31689763wrb.312.1621245876714;
        Mon, 17 May 2021 03:04:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id o15sm17032086wru.42.2021.05.17.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:04:36 -0700 (PDT)
Message-ID: <40aa2adc0f3404e98a5225819566404bde16f598.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: Exclude CVE-2021-20266 from cve-check
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 May 2021 11:04:34 +0100
In-Reply-To: <167FD211EC31BA98.24037@lists.openembedded.org>
References: <20210517094834.2415783-1-richard.purdie@linuxfoundation.org>
	 <eab4eb99-b189-e8a9-d16d-d90cb748a331@gmail.com>
	 <167FD211EC31BA98.24037@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 10:56 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2021-05-17 at 11:50 +0200, Jacob Kroon wrote:
> > 
> > On 5/17/21 11:48 AM, Richard Purdie wrote:
> > > This is included in the release we have, it was the reason for the last rpm
> > > point release.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > > index 2857cd730c4..760adab02b5 100644
> > > --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > > +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > > @@ -51,6 +51,10 @@ S = "${WORKDIR}/git"
> > >   # included in 4.16.1.3
> > >   CVE_CHECK_WHIETLIST += "CVE-2021-20271"
> > >   
> > > 
> > > 
> > > 
> > > +# Fix https://github.com/rpm-software-management/rpm/commit/2e21a178fcc76565c09ed3a28624ca8aeda1880a
> > > +# included in 4.16.1.3
> > > +CVE_CHECK_WHIETLIST += "CVE-2021-20266"
> > > +
> > 
> > Is the same spelling already exists above, but is that really 
> > intentional, "WHIET" instead of "WHITE" ?
> 
> Well spotted, I'll fix that, thanks.

The upstream database updated so we can remove that entry. I've sent a CPE update
for this issue so whilst I'll leave this patch in -next, we may be able to simply
remove the other entry and not add this one.

Cheers,

Richard

