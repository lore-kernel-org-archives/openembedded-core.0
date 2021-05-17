Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.16968.1621245364726400531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q1PcBimZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n2so5765663wrm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+v7SvQcXuSoV8+PGc+m6JPJhW6XE/zL3AX/cur4Wf64=;
        b=Q1PcBimZikM0w08x36lNoa2HO3pTnBTMrsL8tThXd72hpuUXXybh/gwIul8IEx3YH0
         B1Bx5vOkWTVGovRYiRo/5G45ClC5I0rdoWCeoyI0l2YyIjxcb4qU02CbSOFQHw+p38a3
         GURbRqwdQdb3+uhbgseIRgNX780SFeVPy0jGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+v7SvQcXuSoV8+PGc+m6JPJhW6XE/zL3AX/cur4Wf64=;
        b=UaWUWQ4m2+8G//ltx2wI55dXQfcL0A95Gfp2AmcrKCbJUJDi8K+0oGiTVzQ1bFR0O+
         BcC8fgIGTIyWJ0WkYz7ipxWdvXglHKdUCjanCccTHFnvgkoMfoIxfLfA2HUWwKgBOmEO
         RsuFH1JPzJ8QaW52/c22ayYjPMkBuTghPJuJgli0pjR2d6GXK20rnGGTKDq0IhmneFQE
         /MjA0gcpn6BalLOTSV1SnIG586vww3uZYdxdApB2htzVaIDJ8akoglE7pokIPhFEnBSf
         pnKi6mbKY8Pa0dR+E6faOu8idlW3CdzrjbnFsr1ILuk0psz9ysTKVOAUeI+rOTxpOwAX
         k4Pg==
X-Gm-Message-State: AOAM531j6ORI0trnBYxHr7PbLIeU60GzzDYwhX2VeK1X7n+AUKgGIdNw
	aR2JLLmvvISgAm+DC50ggwPs5g==
X-Google-Smtp-Source: ABdhPJweCrW+0YDuBQQplSqCoL2puGMwDSjSbGc1jy/SmwgcqDNMChTXhBWaE97dxLEP4yioETYrOA==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr72105247wrv.372.1621245363366;
        Mon, 17 May 2021 02:56:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id q62sm5667914wma.42.2021.05.17.02.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:56:03 -0700 (PDT)
Message-ID: <43a7663387094774c300fb70a3516c2081d93a81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: Exclude CVE-2021-20266 from cve-check
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 May 2021 10:56:02 +0100
In-Reply-To: <eab4eb99-b189-e8a9-d16d-d90cb748a331@gmail.com>
References: <20210517094834.2415783-1-richard.purdie@linuxfoundation.org>
	 <eab4eb99-b189-e8a9-d16d-d90cb748a331@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 11:50 +0200, Jacob Kroon wrote:
> 
> On 5/17/21 11:48 AM, Richard Purdie wrote:
> > This is included in the release we have, it was the reason for the last rpm
> > point release.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > index 2857cd730c4..760adab02b5 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > @@ -51,6 +51,10 @@ S = "${WORKDIR}/git"
> >   # included in 4.16.1.3
> >   CVE_CHECK_WHIETLIST += "CVE-2021-20271"
> >   
> > 
> > 
> > 
> > +# Fix https://github.com/rpm-software-management/rpm/commit/2e21a178fcc76565c09ed3a28624ca8aeda1880a
> > +# included in 4.16.1.3
> > +CVE_CHECK_WHIETLIST += "CVE-2021-20266"
> > +
> 
> Is the same spelling already exists above, but is that really 
> intentional, "WHIET" instead of "WHITE" ?

Well spotted, I'll fix that, thanks.

Cheers,

Richard

