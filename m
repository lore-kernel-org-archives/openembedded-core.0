Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.9596.1602538080315519344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 14:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFovNuUB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id j136so19175929wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s3V+N/zLNR2A/cVPYs7bJ1sfocdpWH2GUDRtHbbrNBY=;
        b=MFovNuUB6KFDSWGqvva97PMJjBZ0IZWcuBHlRvH5JU/8NVF37j9JbsbCCxoz/I/WSb
         3jEjfpC4uHjXuph2jIuZkVfWGC0Gbju9eAjyvDz4ZQVZQVxBeCNFeWlYkM9pPdOVbrl+
         g41b21+fzbdljEth9qQzO5CBTXbbxqwsWyT80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s3V+N/zLNR2A/cVPYs7bJ1sfocdpWH2GUDRtHbbrNBY=;
        b=kv7xMoWe/yahnDUxi7Gj7/nDolPpem/d5VwC6xd1rdIgfDtMEpvYAMnyGkOB0iixK5
         3Z6ZKpLocm/xhrE5aSedWwXK6l7+o4M0YFeWHLUR31guKDNI1vDa463iugb2cZYbjwHC
         nhARV3dOXBM/KKBBfHp0w7H12R72LvIk+wT0TsiIBcJSYBl5AkhV7Fl+nC0fNVBBtiS6
         oJNLq9p6SXkiY9VS4nUu/di6ltyLIKq/bCS1MUVJD+a8/LCiq2Vcn7DXxVyhkTnZWAti
         3x2MzPFPg71OYwd/vXTWYWkb3UHG+3YCnS0hdJj5+TF+GP8Wt+T7DpOv4jPIB9SYSkHr
         SxyA==
X-Gm-Message-State: AOAM532lJvpiUfML5s59KmtURzy21qtSMV5Zl0h0nJUM6CTm941FYd3d
	ICU9XF20cbTBgv4dm5l4Vnl1oQ==
X-Google-Smtp-Source: ABdhPJwllFtGpXm52XHXFNlO810b0ZMAx82JmYrzKmFurlXH/BiPswNhN8Ntb5tEaQ2xt+sdgpTbLA==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr12393779wml.172.1602538078568;
        Mon, 12 Oct 2020 14:27:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id p67sm24895367wmp.11.2020.10.12.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 14:27:58 -0700 (PDT)
Message-ID: <f8c6bc9bc02fdf040777fed063972f9ece9f491f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH v3] Update license file to match current SPDX names
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Meh Mbeh Ida Delphine
	 <idadelm@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Oct 2020 22:27:55 +0100
In-Reply-To: <5b2a61996df146de8e86474410e2a31a@XBOX03.axis.com>
References: <20201010122339.9594-1-idadelm@gmail.com>
	 <d53db65c06b96aa6d8e1ac1edb7f912da78293d3.camel@linuxfoundation.org>
	 <5b2a61996df146de8e86474410e2a31a@XBOX03.axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 21:23 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 10 oktober 2020 14:40
> > To: Meh Mbeh Ida Delphine <idadelm@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [poky][PATCH v3] Update license file to
> > match
> > current SPDX names
> > 
> > On Sat, 2020-10-10 at 13:23 +0100, Meh Mbeh Ida Delphine wrote:
> > > Updated mappings of license fields of meta/conf/licenses.conf to
> > > match latest SPDX naming.
> > > Added missing mappings.
> > > 
> > > Fixes: [YOCTO #13320]
> > > 
> > > Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
> > > ---
> > > 
> > > Changes in V3:
> > >  * Added missing mappings to meta/conf/licenses.conf
> > > 
> > > Changes in V2:
> > >  * Corrected the email subject line.
> > > 
> > >  meta/conf/licenses.conf | 55 ++++++++++++++++++++++++++++-------
> > > ----
> > > --
> > >  1 file changed, 38 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> > > index 5b309eb385..b45a9d283e 100644
> > > --- a/meta/conf/licenses.conf
> > > +++ b/meta/conf/licenses.conf
> > > @@ -10,33 +10,44 @@
> > >  # Any mapping to MPL/LGPL/GPL should be fixed
> > > 
> > >  # AGPL variations
> > > -SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
> > > -SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
> > > -SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
> > > +SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
> > > +SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
> > > +SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
> > > +SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
> > > 
> > >  # GPL variations
> > > -SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
> > > -SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
> > > -SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
> > > -SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
> > > -SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
> > > -SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
> > > -SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
> > > -SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
> > > -SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
> > > +SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
> > > +SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
> > > +SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
> > > +SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
> > > +SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
> > > +SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
> > > +SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
> > > +SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
> > > +SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
> > > +SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
> > > +SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
> > > +SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
> > > 
> > >  #LGPL variations
> > > -SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
> > > -SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
> > > -SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
> > > -SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
> > > -SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
> > > +SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
> > > +SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
> > > +SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
> > > +SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
> > > +SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
> > > +SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
> > > +SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
> > > +SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
> > 
> > The above is all good, thanks.
> 
> But only a part of the full solution. In addition, the 
> following should be done:
> 
> * Rename (and possibly update) the actual license files in 
>   meta/files/common-licenses to match the new canonical names.

Thanks, you're right, the patch does need to include the above.

> * Add license files for GPL-2.0-or-later & co.
> * Add mappings from, e.g., "GPL-2.0+" to "GPL-2.0-or-later" 
>   to SPDXLICENSEMAP.
> * Remove the code that adds support for using "<any license>+" 
>   in LICENSE as it should no longer be needed with the new 
>   mappings.

I think handling the "+" versions, whilst something definitely need,
would be a separate patch building upon this one.

Cheers,

Richard

