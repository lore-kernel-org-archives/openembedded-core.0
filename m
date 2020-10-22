Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.7976.1603358496226761076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 02:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VNi1DuBj;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id h5so1304975wrv.7
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7TBX2U4h3L5csT3F7oSRq1deRZsnqLBNO8WCbX67nY8=;
        b=VNi1DuBjrmQB8+JHH7t3bmZWNyEZZUWOHMENIQt/fh/rOcPc5QlLh1bk0unZbhnAnD
         y8zGkrHFuISIIGtpFAfhNWnDhH2qBFSUSk16U70dKIi6IGuHUdkPCV+555DyV8kw+I2l
         VaMW0JEqBCcaneUMkgQCLdQEE2cLl50vVZzj8RN0WK0L3lyFJ3w6iIjA4zsKctWnMnoh
         oKjPIsvL22dth3WWuhWjCv49yPRe7pZxD1ype6+SJc109HGuF6TVVCvjdupYfhFYMHvy
         Vn09CGnaU/MEaWCL9Mtyf40KlF82soJXpbMBgFtioAARImYoRmiUihY39BRkTgbxhPGh
         HNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7TBX2U4h3L5csT3F7oSRq1deRZsnqLBNO8WCbX67nY8=;
        b=Aw92ECxNQFhwZK32ATpQ8e8ozin3qq1DooNkB7KP6PyfBVuXXu+iosJxRuZg8otmAO
         tcCFdbmy4+sxfsDVx9lb6jTe00MbPtshF/+w7jqZ314L3wcWfQ1dDtvgwfKDW4yxahkM
         4qAIFzsmyxOgJceaGuO3HegOQKgJpUHwOdnaDqne8ShtOFoEOAOjY8fUKiOvWbONTyHs
         BtEStYkQ2jYUZOg77w4GIF4fD9roq+mM682yWZ6qBnq+LGrPCZzSPXbG0ln5JohklCph
         sUzM9kMeaph6c4ACaEPNbwG4oMlowkE4KCoIUL9dfDFPA5PDTYZvfVpvv4oSeOzcambq
         N7ng==
X-Gm-Message-State: AOAM531UBC4hCBCugLd0E4/SC5NHJRgK4IdIRmnnWVPLwuz21U62pLGY
	GqV0oj7D5eYAA97lJjN/c0M=
X-Google-Smtp-Source: ABdhPJyYyz6mWCVK6I4L0NxCtsJotAFbpSE0YyomLTFKVLOgw9ulzah+l13CEfQI0NFKp8kHfLFMtA==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr1601445wrv.286.1603358494834;
        Thu, 22 Oct 2020 02:21:34 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id r3sm2638418wrm.51.2020.10.22.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 02:21:33 -0700 (PDT)
Message-ID: <f331436c48d4109a69199ff247132fc684c94524.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2020 10:21:33 +0100
In-Reply-To: <VI1PR01MB6462255CF43C3222C6DF6281A81C0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
	 <VI1PR01MB6462255CF43C3222C6DF6281A81C0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 21:08 +0200, Konrad Weihmann wrote:
> On 21.10.20 17:58, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >   .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> >   create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> > 
> > diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> > new file mode 100644
> > index 0000000000..bbc5f86ae9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY = "New set of tools for working with SquashFS images"
> > +SECTION = "base"
> > +LICENSE = "GPLv3+ & LGPL-3.0+"
> 
> A bit of nitpick, but with all the license files mentioned below the 
> LICENSE setting looks wrong to me.
> I would at least expect some BSD and zLib SPDX identifiers here.

Added MIT, Zlib and BSD-2-Clause in v2.

> To be super exact one would have to take the PACKAGECONFIG into account 
> to get the correct value

The binary is distributed under the terms of GPL3 regardless, so not
sure it's worth the complications? Is it required/commonly done in
other recipes?

-- 
Kind regards,
Luca Boccassi

