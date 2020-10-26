Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.12304.1603717788247008007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 06:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G3BJFqkl;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id b8so12493744wrn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=59hohI3Q5O6pYN7To5CWgyzfeHLnEIsUQx3zCGnViQI=;
        b=G3BJFqkls8vfDUvtQsAXOSwnzZygt+NdOQ9R3zJDCQKSHTpbEN0Ben+pXPvxzmlDGy
         UoMZGFcAKMlIhu2EeQjeADhYW7lMfjGrnLOkhod/3r0xzq2SmCwffZ8aOmZowwpeNRp5
         HCh9aLdH+xCRE+ZFTbXVJjm569pUTiSvHLFfUZrkxU8GNuPU86OUQn1bT5L49vNrPuLs
         RDB48J/3q9EYZGEN27hoikIMJsUV6bnA/leDgkq9sMAGmp1MvchWn8+bHfyuKulJ5QZs
         hb2dF9lReUhNf999W+neljl8pUxL8j6N/uNCDQWRH047BDWpOSMM5d4VnxIgKCaiIdnJ
         Q5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=59hohI3Q5O6pYN7To5CWgyzfeHLnEIsUQx3zCGnViQI=;
        b=XD4CtG8J75ff3VOv0IGZini6arThPmMCfMmE4im+ClnfU7LxOgpxQF3ZSgtS92E4lj
         sMogIny8ueBgIDmtghi39r+BVjILMKgLOWD48x7K7SM/C6mrUyGRF8ec/DcZANjObdFP
         KOisShFjS3ZZMDcfzDcfXya3V+fl96qWAP+l9PTtvW9cyBPsxOr18EZMYLrKal47z+/q
         bmjU4dmD4+RsJtiHIeF1U1XWFF3AfhZcVFceHfLAHW+YX4Tx6RbGXORmhQO4ZyPsfcs6
         5zdfihh89ovjGkkVgkKCQctInDtIK01/NvRVPSORebFq0jXqW7hRB3vMd3sMHbQPp/uY
         LDig==
X-Gm-Message-State: AOAM531lxPDvpdE44SKGx9GfwQg1nzoTrsGC6LCC3T14bDvQlszTGoSV
	atBUFnKJrPzqjpcd7qS3tzk=
X-Google-Smtp-Source: ABdhPJze2EhuR9j7ZyKWWdw5pn0SNL6QrMnJwUaGyTAKnD5jrKjvNz3U8Hf/3JQ6CNFRcpphpC9s3Q==
X-Received: by 2002:a5d:6110:: with SMTP id v16mr19178574wrt.219.1603717786746;
        Mon, 26 Oct 2020 06:09:46 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id x64sm19693070wmg.33.2020.10.26.06.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 06:09:45 -0700 (PDT)
Message-ID: <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
Subject: Re: [PATCH v4] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2020 13:09:45 +0000
In-Reply-To: <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <20201026100503.3200192-1-luca.boccassi@gmail.com>
	 <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 10:29 +0000, Richard Purdie wrote:
> On Mon, 2020-10-26 at 10:05 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used),
> > changed
> >     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> > v4: disable zstd support by default, dependency not available in oe-
> > core
> 
> Sorry, there is one other issue. There is no maintainers entry for this
> recipe (see meta/conf/distro/include/maintainers.inc) which would cause
> oe-selftest to fail. Can you add an maintainers entry please?
> 
> Thanks,
> Richard

Ok - who should be listed as maintainer?

-- 
Kind regards,
Luca Boccassi

