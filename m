Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58545C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 10:26:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.11954.1632824793587092585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 03:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RtYXQxJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id s21so17083669wra.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rsBxQoVZBUp6wWe208PkEU+2z2IDKryoxD+2aAyQNxk=;
        b=RtYXQxJ84vT3xvEYLxgtKpSzsLvrSjww5OB2sZeYZrzjKbaqjKrmypBkF3ZaTzQidg
         KGq7le/uilVla06TV/+7DhwHfrV8Capg23KN0OUmMXBwyMcr8cpWeu3cQzMH7/nRJtFq
         Zy01m/mzCiWpbecyz0AXu/Kvtv7rf+++EVG3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rsBxQoVZBUp6wWe208PkEU+2z2IDKryoxD+2aAyQNxk=;
        b=N60ANkw0TaP7xVn6FhyGRX8ysvQDFYyFAVFNKy9wR/y9GENRsWheHjvj8fQOk6IeTg
         HX5rCaTq7HYnUTfwd9eFDbogr/xnWpNnhrg8mF00vApOzdoO+w8O0/wA+CZfCbrL5N+v
         ODwpVWMDTJvpoz899XYdddbqqPz3n3fXShuf4s7xxXILbESxsN9cGe4fRrChl8sXgE+x
         F1Pwwwm9O8UnDGGS3WC4K7T02VuXwrCHD+LfqpDGkjlPp3tFHmUxAZiMMhcNliPGGKE3
         ep32WIGvdAfwySkDfxCoQM6x9E2FngbNcJ4u9dCohfnlhkF7kVGJEhIHfDjvgUBQAQBi
         TOsQ==
X-Gm-Message-State: AOAM532207ej0jlALJw4lPbmWwsroo+b/eHdrS7qsHEtB451k9Vvcy7k
	IBOpdL+UcqoL0xTqtB3hh/V/Ww==
X-Google-Smtp-Source: 
 ABdhPJxUPvZVEliyncSe791zx5CSCHajxLgkFMzN6p5+i5me+qfoHVVh8lK1QMoN/f1AubJL6na9aw==
X-Received: by 2002:a5d:6512:: with SMTP id x18mr5437789wru.325.1632824791990;
        Tue, 28 Sep 2021 03:26:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a38:b35f:af4c:6fb5?
 ([2001:8b0:aba:5f3c:2a38:b35f:af4c:6fb5])
        by smtp.gmail.com with ESMTPSA id
 x9sm10613653wrv.82.2021.09.28.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:26:31 -0700 (PDT)
Message-ID: 
 <9dbca117a4c0edf169132f1521d43593e308ee17.camel@linuxfoundation.org>
Subject: Re: [OE-core] simplest use of SSTATE_MIRRORS?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Sep 2021 11:26:29 +0100
In-Reply-To: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
References: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 10:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156412

On Mon, 2021-09-27 at 12:13 -0400, Robert P. J. Day wrote:
>   colleague asked me how SSTATE_MIRRORS worked, so i had to check,
> followed the section here:
> 
> http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache
> 
> and in one of own builds, i moved the entire sstate-cache directory
> to ~/SSTATE as is, then added the following to my site.conf:
> 
> SSTATE_MIRRORS = " \
>         file://.\* file:///home/rpjday/SSTATE/PATH \
> "
> 
>   then i removed all of /tmp in my current build, and re-ran my
> bitbake command, but it seems to be doing all the standard fetching
> and unpacking and so on. what clearly trivial step have i overlooked?
> 
> rday
> 
> p.s. i checked with "bitbake -e" that that variable seems to have the
> correct value. what silliness have i done?

The other gotcha with this now is hash equivalence. If that is active, you need
both the sstate data and hash equivalence data that match.

Cheers,

Richard


