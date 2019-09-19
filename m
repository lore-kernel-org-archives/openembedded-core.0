Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3597FE65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:53:05 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y189so4528187qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+qz4t1A+7UNct1ICHIRVr7I/Jhf5tiLl+jViH4v3lRY=;
	b=ptpG7Ilgle4MGgMTHlD6GuY0l0t8+lutl0mKV8Cw72PuSUpR8t1vrdQ8ASvWq9S92j
	6vh4BaSW8GMp70p82p6RGDcd/KnCwph1fSPd4C8E9FAkMSMeIhaKWJx+lLJW0W9SgQVv
	Km9pRKA78bhhDSferZYV5UpkKStEzpGr+tvE8coKpOb4fBIFaRtKS/Fc1qvMBW94SA0v
	2PzggSJToP4skEq4+WVewoN/sEPfFDReWsPf16jDghKNwM6rfIVOgS5mFEKnK9YNB4vc
	zKRlKIdBSrTghp4RWG+EmWCj6eHTUh/cBrALnilbtKNa/HWTg4imuUopaJbERCwPiFmm
	6hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+qz4t1A+7UNct1ICHIRVr7I/Jhf5tiLl+jViH4v3lRY=;
	b=dLcBIHtQe2Ve81SzNbUFvyl25ajemRXhLebCVV6FB9K3O9AAKVncEdETQdpgeFOal8
	aFcTfTj/IJkXHfTbrprwxhbpnMrP6NcjdMO1lI7H01ny9ck3Ux6K9S9TGZj9EIB3X+Kv
	hR78uDR2xg3QDkXEPGwWv0hZmawQCU9FiRazAQ6cFJWW4ZhUex4PMhSByWMYBs/omG6e
	LyCObuK9NXSpP4zM9fFJ2w+QSkyhtXx7W0j+0BFXtIoJ6ieYE5VY/yagsCcgOSSSSpft
	dFrDfsnCVYfnWYkV3Xjxe+J3j+VFT1FqplTOx2ApBK2tsFZrd6ThkSGoxTwU1PQY6QMi
	iVLQ==
X-Gm-Message-State: APjAAAXzIeK98sYDXR7PTkW4L86d3yoYtVbuP4mbq6E1bZ57FD8nwDqb
	8ovaCsCxlzlvmVDjCn1DQJU9iUbSX3eLPrVsZAQ=
X-Google-Smtp-Source: APXvYqymVP/3bU5fN66pTUqHlwBNg2FJ6Zr7rQRLvj+flbyLRZo9MkwpIDWObBmlu4hFyeV6uOgEf/acr8I8eYQM0Go=
X-Received: by 2002:a37:6651:: with SMTP id a78mr4740968qkc.474.1568919186006; 
	Thu, 19 Sep 2019 11:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190916223502.2966661-1-raj.khem@gmail.com>
	<2983d9781a232abaed3e341dda56b35fabc35574.camel@linuxfoundation.org>
In-Reply-To: <2983d9781a232abaed3e341dda56b35fabc35574.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Sep 2019 11:52:40 -0700
Message-ID: <CAMKF1srJXsbVCDoOjkouewR8i1oVTA_7aCkj+eO3PpTLi_N8sg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5] weston-init: Add possibility to run weston as non-root user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2019 18:53:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 19, 2019 at 7:28 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-09-16 at 15:35 -0700, Khem Raj wrote:
> > These changes are from meta-96boards primarily
> > Launch the session via a udev rule based on what kind of display
> > device
> > is available
> >
> > delete weston-conf and move the fuctionality into weston-init other
> > layers are doing same
> >
> > weston-init installs machine specific weston.ini therefore mark is
> > machine specific now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> > v2: Drop duplicate isntall rule and use systemd_system_unitdir
> > v3: Use systemd_system_unitdir in FILES section too
> > v4: Move weston-conf logic into weston-init and delete it
> > v5: Mark machine specific
>
> You didn't actually retest this and v5 still fails the selftest. I've
> squashed the fix needed into the patch.

I tested that now the package was machine-specific instead of allarch
but I did miss SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
thanks for fixing it. We also need to remove weston-conf from this

>
> Cheers,
>
> Richard
>

