Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.59222.1595866403744066118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SxfviDp6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r2so10386495wrs.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=zrQy0zqWcSKYE8AE5qUDajBDigxrdWIgsoBhzuKGLYI=;
        b=SxfviDp6BTrbV3hcGbF4T62qPm2TjtaaZddaeL0V5ih7jyqc+S6hW7K67EDwU8ezaQ
         VGrdznpKMsiI8X6cnGOSYopZvmbQ/SChBwpOlkvyojqQ3R+o0kgo+gs3qGxz/VbXEnuq
         EpWfz4B3Z0luB4fQXU0vaTstJ59umtyzGxcb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zrQy0zqWcSKYE8AE5qUDajBDigxrdWIgsoBhzuKGLYI=;
        b=OPGPcr/yBdeXXPzDlqOkJxPRmD574i3nGHS9YkstpQU96sS5fa0G+AgCKAXdjdH2P8
         0Hb6ZgSsTmzalY/neLftX8Mamd6HJRdiZfmrdYrdC5wd+MMooKd4sDcB1UMya2HJZhIl
         a2zm2YbOvegTICXRney8IQiKmhfk59onLQkHuoe1oaE2ILHIG57uDGJzAicJlCu453+J
         RbMWT1irI8QK2lTSPLm9J8rLPmf8zoRlhUUO6iKmSZJ6k2ixY4tRDTLVRxq5sfcWnTFu
         NnQXuGORNNjigeONuKABLjbGrEDsKndVc34bC2SP4fdBYaghFaGtxfZDaY98wC9/LrSr
         b02g==
X-Gm-Message-State: AOAM530F0wIpnayjnHd1kn6ElKiEJO1GMUSQKBp0Byfm6gyrbeQA34Zq
	HZ5gbxlrva7vdMBZPv4gwEdc/Q==
X-Google-Smtp-Source: ABdhPJw1yaUKpg9h94Q3HDwiMYidVpJqod+evQ1Cj5Ls9C2vowM6LqcveESpdHIhN7+4pqfP1p33cg==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr22464063wrs.226.1595866402139;
        Mon, 27 Jul 2020 09:13:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id v1sm12602990wro.83.2020.07.27.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 09:13:21 -0700 (PDT)
Message-ID: <1297c16922819cffa41212e77328be3c1398db22.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2][PATCH] cve-check: print warning if file is missing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2020 17:13:20 +0100
In-Reply-To: <edd3e796-d21c-61fc-61fa-d3903ce40831@gmail.com>
References: <20200727025231.24418-1-akuster808@gmail.com>
	 <d60c82f476989c46864b9d50a7f6fce3ae9eb189.camel@linuxfoundation.org>
	 <f5995aa5-dedb-167e-cbfb-00886de6ca64@gmail.com>
	 <5d6b233e209d6ea0a3c3047c0d63feea0543b647.camel@linuxfoundation.org>
	 <edd3e796-d21c-61fc-61fa-d3903ce40831@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 09:05 -0700, akuster808 wrote:
> 
> On 7/27/20 7:47 AM, Richard Purdie wrote:
> > On Mon, 2020-07-27 at 06:57 -0700, akuster808 wrote:
> > > On 7/27/20 2:39 AM, Richard Purdie wrote:
> > > > On Sun, 2020-07-26 at 19:52 -0700, akuster wrote:
> > > > > If the "tmp/cve_check" file was not create as in the case for
> > > > > -c
> > > > > populate_sdk, just print a
> > > > > warning instead of dumping a trace back
> > > > > 
> > > > > ---
> > > > > v2] lets include the missing part of the patch
> > > > > 
> > > > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > > > ---
> > > > >  meta/classes/cve-check.bbclass | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/meta/classes/cve-check.bbclass
> > > > > b/meta/classes/cve-
> > > > > check.bbclass
> > > > > index 0889e7544aa..b16da9890af 100644
> > > > > --- a/meta/classes/cve-check.bbclass
> > > > > +++ b/meta/classes/cve-check.bbclass
> > > > > @@ -55,6 +55,10 @@ python cve_save_summary_handler () {
> > > > >  
> > > > >      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
> > > > >  
> > > > > +    if not os.path.isfile(cve_tmp_file):
> > > > > +        bb.warn("File Not found: %s" % cve_tmp_file)
> > > > > +        return
> > > > > +
> > > > A warning is something the user really needs to fix or take
> > > > some
> > > > action
> > > > about. Is this a warning?
> > > Its actually an error in certail conditions. Do we want this to
> > > be
> > > silent or fail on 'populate_sdk'?
> > What are the "certain conditions"?
> 
> populate_sdk
> 
> > Should it not detect those conditions and error if they occur?
> if INHERIT += "cve-check' is included and -c populate_sdk, the file
> is
> not generated.
> 
> > Showing a warning and asking the user to guess is not a good user
> > experience. I have no idea whether I should worry about the warning
> > above or not for example, so I doubt anyone else does either.
> 
> I am fine with not sending any warning.

That sounds like the correct solution to me in this case or maybe a
bb.note() which won't be shown on the console but probably will be in
the logs.

Cheers,

Richard

