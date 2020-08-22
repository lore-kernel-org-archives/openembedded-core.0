Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.156253.1598106569497417969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 07:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ak1HGN/f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id a65so775660wme.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IpIbuaWPzsonq1RnVsuSmBHg21NTds36rePineYUn9o=;
        b=Ak1HGN/f8nxTbSNLCrP6FFb+uIxKoDucUR94SKyBuQwrFrGV0KrJS1XhG8xQZauOkI
         at1eAbxrZlKx1VgibXIXN1PbveYdZt6BOTsWdWyVYY8/SgPlnTzuL6LHWZf3u2/WWByn
         PcwvzZrr5MPRO+YKSoSYl0w9BcJPVd7uOh/Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IpIbuaWPzsonq1RnVsuSmBHg21NTds36rePineYUn9o=;
        b=RytdTK/6l1wm2VSoW0Vr/CyYTQOJEnww5v0wtAgol6k1Mm9iXsl7AUTC4Un8IGvwa/
         fhkcLy8vEKtQUGoIe+0QQQIOPd65ZDJnEKl+BaqJMcfwAPzdwytLBhm2YGFA7aHfSo83
         Qd6h7muLXik/x8JnQP1UDXaPXFX+VBWCAf2ffWZ6vp/Pqfuc+8LGeBCmBuDLQUE065JL
         ohV0KonHtpYyePo9rY2JMGLJ9YjxREdbFtqcj1ordHOyG8yQR4znP68hTAAAAP7pHdJp
         OcRLZOQAzNulxIHsoe2UpkLPaNvZbM1u5jXfcjOPPmPt9EMN9t/nNdHZlZQARlgKoB3I
         NNRA==
X-Gm-Message-State: AOAM532k5C+da+NFGd0GT5H3JO850nMEcbcUZi7v/RisoYP0LCZ4/rNS
	mGntfS+GMbdzfYqdAM/HTmoXUA==
X-Google-Smtp-Source: ABdhPJy+FgrRO+c+lP+mJM7QHhpLkLK9FKPodkj8ZgkJr3dEjndLGh8WuGGLdSqHiNR/7kObBClagw==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr7390572wmt.166.1598106567882;
        Sat, 22 Aug 2020 07:29:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id t13sm11044832wru.65.2020.08.22.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 07:29:27 -0700 (PDT)
Message-ID: <75977a489612546d9128d3575f125a9bc6844320.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 1/8] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>, Denys Dmytriyenko
 <denis@denix.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, akuster808@gmail.com, 
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Aug 2020 15:29:26 +0100
In-Reply-To: <CABcZAN=WmvJGmAG8fsJOOoSDB=+jjDFMJQ0Up7_Li_Nssd2UtA@mail.gmail.com>
References: <20191211164820.26588-1-pkj@axis.com>
	 <20200820223503.GM17660@denix.org>
	 <CABcZAN=WmvJGmAG8fsJOOoSDB=+jjDFMJQ0Up7_Li_Nssd2UtA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 21:13 -0700, Christopher Larson wrote:
> This actually also results in checksums changing for recipes that
> inherit license and call incompatible_license_contains() when
> adding/removing layers that add to the license path, such as lvm2.
> 
> On Thu, Aug 20, 2020 at 3:35 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > This actually fails yocto-check-layer script for Yocto compliance 
> > checking, when a layer provides own licenses via LICENSE_PATH 
> > (in layer.conf - LICENSE_PATH += "${LAYERDIR}/licenses"):
> > 
> > Variable AVAILABLE_LICENSES value changed:
> > ...
> > 
> > Is there a new way to provide additional licenses from a layer or 
> > should the yocto-check-layer script be modified to accomodate 
> > (i.e. ignore) this change?

I think we either need to vardepsexclude this variable from its usage
sites or we need to figure out a different way of handling these
license issues.

I worry about generically whitelisting it as there are cases where
adding a new license should cause rebuilds.

We'll therefore have to look at the usage sites and decide if we want a
rebuild for each usage.

Cheers,

Richard


