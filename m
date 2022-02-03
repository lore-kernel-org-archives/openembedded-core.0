Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695A1C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 22:01:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.1054.1643925673768283934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 14:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EXb8/1Vz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id f17so7716358wrx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 14:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3CfMbYaAelwmKKd1t9ov21LyBhXZfgUuQ9x3oelijik=;
        b=EXb8/1VzOM/tGLane0yqYIEDqM2yVshEnYw8r0zLXUd0CwuhPem1LyZFnC4weA1sfF
         6B5xiinJOSa5Zy4+52bZUT2T1MMc3ZP9wND863SVzERdQot2A3v9aXU5/0RhbOVPzqu+
         E1mwlYPkcjwlmhA0alY5qjmpcVbgwUcJAhK9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3CfMbYaAelwmKKd1t9ov21LyBhXZfgUuQ9x3oelijik=;
        b=Fh79dnBQeNgqIXTGtOo2rWrzbYHPaX+KeT4yuFjAF5PhEUyW09cdECivhtxh7KUD9z
         g3kG1uk0JnuNwi4eBWiH7X0LtScLAdR587B3ERerkaSeuf9Ftix4Ytbu/6kvw9WAEf7m
         DGRFcBHtB3rGM3J/tCJNeDFvb/piYTjQ2x+VUox8YW2hpvnScRL/GEbt01TPsWuoEi/M
         o+pXGv1x7T2KgtGFsqGSCivlqHbf8JwyawWxR6IbM3b2jycA+UOSAHQQemYYTAUUF6CR
         twj/t0yzMluT6kW95hzptLaad/MVFDNMM8I7aSa3LO0y5AB/pncuouJQfaQL7v4Qz/ZW
         qHMA==
X-Gm-Message-State: AOAM5335ARamGyMEXBpkdCjCguibBYkJJ2d0DmVDdUtCIfvtyIcc9Jy3
	txwvslHaXYzfnYLfN8/8VOdv2w==
X-Google-Smtp-Source: 
 ABdhPJxyHeGFj+Tx0QrzwfXP/V/RSU8nxm0uFK7Kddq0xRZ6wVL2ApRcy01Fljx3JgeWwD5PzgvVVg==
X-Received: by 2002:adf:f8c2:: with SMTP id f2mr626wrq.150.1643925672216;
        Thu, 03 Feb 2022 14:01:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7818:26e5:4f1b:504a?
 ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 r17sm9118981wmq.33.2022.02.03.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 14:01:11 -0800 (PST)
Message-ID: 
 <fb63360db25e822a8cf13f913e87b4864066db92.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org, ticotimo@gmail.com
Date: Thu, 03 Feb 2022 22:01:11 +0000
In-Reply-To: <aca6f0c0-decb-2fdc-03f9-54a8cb896e09@windriver.com>
References: <20220203170724.1319808-1-saul.wold@windriver.com>
	 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
	 <aca6f0c0-decb-2fdc-03f9-54a8cb896e09@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 22:01:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161324

On Thu, 2022-02-03 at 13:58 -0800, Saul Wold wrote:
> 
> On 2/3/22 13:24, Richard Purdie wrote:
> > On Thu, 2022-02-03 at 09:07 -0800, Saul Wold wrote:
> > > When a file can not be identified by checksum and they contain an SPDX
> > > License-Identifier tag, use it as the found license.
> > > 
> > > [YOCTO #14529]
> > > 
> > > Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags
> > > 
> > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > ---
> > >   scripts/lib/recipetool/create.py | 16 +++++++++++-----
> > >   1 file changed, 11 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> > > index 507a230511..9149c2d94f 100644
> > > --- a/scripts/lib/recipetool/create.py
> > > +++ b/scripts/lib/recipetool/create.py
> > > @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
> > >       for licfile in sorted(licfiles):
> > >           md5value = bb.utils.md5_file(licfile)
> > >           license = md5sums.get(md5value, None)
> > > +        license_list = []
> > >           if not license:
> > >               license, crunched_md5, lictext = crunch_license(licfile)
> > >               if lictext and not license:
> > > -                license = 'Unknown'
> > > -                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> > > -                    "and replace `Unknown` with the license:\n" \
> > > -                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> > > -        if license:
> > > +                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> > > +                license_list = re.findall(spdx_re, "\n".join(lictext))
> > > +                if not license_list:
> > > +                    license_list.append('Unknown')
> > > +                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> > > +                        "and replace `Unknown` with the license:\n" \
> > > +                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> > > +        else:
> > > +            license_list.append(license)
> > > +        for license in license_list:
> > >               licenses.append((license, os.path.relpath(licfile, srctree), md5value))
> > >   
> > >       # FIXME should we grab at least one source file with a license header and add that too?
> > 
> > I think to close this bug the code may need to go one step further and
> > effectively grep over the source tree.
> > 
> > We'd probably want to list the value of any SPDX-License-Identifier: header
> > found in any of the source files for the user to then decide upon?
> > 
> That's moving in to the create-spdx.bbclass territory I think. The 
> change would need to be much larger. and I will likely have to shelve 
> for a while.

This isn't related to create-spdx.

> 
> > Or am I misunderstanding?
> > 
> Maybe it's my misunderstanding, Tim has mentioned the LICENSE related 
> files in the bug report.

Right, we want to "guess" what the right LICENSE is for the new recipe. To do
that wouldn't we scan all the source for SPDX-License-Identifier: lines in the
headers, add those all together and suggest that as the LICENSE field?

Cheers,

Richard




