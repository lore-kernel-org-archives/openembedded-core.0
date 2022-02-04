Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02764C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 13:41:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9016.1643982101281411545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 05:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d8co6IRn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w11so11422914wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Na0oGpxBO4gJ1E1T+X0d48Kd2kKq9E1QqVRm8OpQNJU=;
        b=d8co6IRneN5xkFweBYnWTKQaoGMPVAybMnUCmihY1iygrs/YBk+OroqrOdu6x+zsT+
         DPUnVeJmFXgd3TvlgAeCJGKQdyhOSuFgztrUsK8CaFoQERH/K9HUsyo65Wf+vFP00zwy
         fu92gdEdAAcqMMH361koDsnwo6dHLqA4PBPHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Na0oGpxBO4gJ1E1T+X0d48Kd2kKq9E1QqVRm8OpQNJU=;
        b=h5YsjjUprvQ8PA4XLL+ZXV0d9qLIoG1XOJfw7lE++4u4FmAbJWEE3sR6PQIB0jXc/Y
         8MIQiJOKLIQcee89l6KTjiuALVhd/g9plZ41bfAD2HY+h3sEdByllTMWVocgFba00diJ
         PvsQV5GqBWhkDidYWh/W1H8yOxMArI3Uvw2TlHvJ/ig5Wtv0n9TK/KqPzDkf/RY0pxWB
         OGTMnT3odCXp5uarWyqUnHVHPBOJsQ0lcLQoe8kMs/YItKQPoT28HtfdBns06R+rxULo
         X93rEQyX0puymiSQt+Fd4bbeRUMJfCyqWpHxLyKd3r61Wgf5+XwBG9BkqwA9+E5rC62V
         22qQ==
X-Gm-Message-State: AOAM530SuL9D/ODFmPG7QCNUEqU0VtYT+2HDtLRY1fwz+s4KIfEYhDmm
	AeufI0oNjiO27yGSyLL0OjEe7w==
X-Google-Smtp-Source: 
 ABdhPJyMZiB93wiyODwvLzpaI7CU2aosmSpnYBkdOgcgE8kj8D+n3u1S9CyHvDgrrdmMXUPdfSxpeg==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr2622080wrz.414.1643982099689;
        Fri, 04 Feb 2022 05:41:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7818:26e5:4f1b:504a?
 ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 b2sm2165966wri.88.2022.02.04.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 05:41:39 -0800 (PST)
Message-ID: 
 <d532984a72be45bc75ea6fc80e46664dfb01efa7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 04 Feb 2022 13:41:36 +0000
In-Reply-To: <4ede83ba-c6f1-4dac-8dbd-44cc67d16062@weidmueller.com>
References: <20220203170724.1319808-1-saul.wold@windriver.com>
	 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
	 <4ede83ba-c6f1-4dac-8dbd-44cc67d16062@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 13:41:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161345

On Fri, 2022-02-04 at 10:05 +0100, Stefan Herbrechtsmeier wrote:
> Hi Richard,
> 
> Am 03.02.2022 um 22:24 schrieb Richard Purdie via lists.openembedded.org:
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
> 
> Please keep in mind that we need a full license text and not only the 
> license name for license compliance. The current function only search 
> for license files with license text.
> 
> > We'd probably want to list the value of any SPDX-License-Identifier: header
> > found in any of the source files for the user to then decide upon?
> 
> I think this is an other feature like a license checker because if you 
> have a SPDX-License-Identifier without a license text you have a license 
> violation.
> 
> This brings us to the problem that this code will interpret a file with 
> only a SPDX-License-Identifier as a license file with license text.

As I understand it the tool is there to help write a recipe so filling out
LICENSE and highlighting a missing full license text would be a valid approach
for the tool and helpful to the user?

It certainly isn't intended as full validation, just intended to assist the
creation of a recipe.

Cheers,

Richard







