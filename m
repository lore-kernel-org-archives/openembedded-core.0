Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id C30227CED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 13:20:15 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id y185so5272156ywy.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 06:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5r1kRRxrDEWFMayZlETm//yFXyWSVUZHlTPytmSuUaE=;
	b=k4OmkzZ4JWDylLPrqgQO+YQFGV15FA3M85E6fdQcq9BrW9ypQL/9fxf2DUSxXZub1z
	wHve2qupR+OyIlNj0Y6IxL2674TJbqS6f2Ykge+sk94Ju+kAMxGZGE92SmKcImQ68TFG
	JCe0ahpjRL8n3cMGGBnxvSneskPYsfgfWJFKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5r1kRRxrDEWFMayZlETm//yFXyWSVUZHlTPytmSuUaE=;
	b=IsgwaCi9L60Nu/LFShL2R3skE1htTZyJ/zWeSuNtIDniw0GQfrdmfsEssnScTRXI10
	ApT45pICFAD3ocEW/P0pmSd6POya337VJTJf0TqS01S6mfF/g5OacX1zdJUHgX3Rf35y
	xJeVdNbptyRwTOW66l6cNYjFMKprhmJHvr4V86dJEOid0HYvCrUN8lCUxo200E+dMmav
	SzqabbyD6g+VyTf0NKFT/2SdSK/6Rcl8gp6L6XJDIDV15b65mKR3ob2kgK1H8AAtFJyl
	Hv8hI16K4iLmaIOUmGAPshuTc2GrUrJH2WeTonTW/Maq1zCDgt0Lkgj3bhfTsox4DTaJ
	NvqA==
X-Gm-Message-State: APjAAAWGH4K6Oz34IH3yO8BXQDhOaSsIhYVpvra9BnbP10t11weyX1CP
	X0dgNaB8EYQ9qkPs6SIp1VSUkw==
X-Google-Smtp-Source: APXvYqwD04tJqlv9qvjoczRAg2IAqeMZqm9pDzB0MKrYiobVBtRnEr931QbvNsmMhyq9wQ6fKfizSQ==
X-Received: by 2002:a81:50a:: with SMTP id 10mr22926493ywf.129.1560259216376; 
	Tue, 11 Jun 2019 06:20:16 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-1DD5-268A-2EEA-9945.dyn6.twc.com.
	[2606:a000:1401:82de:1dd5:268a:2eea:9945])
	by smtp.gmail.com with ESMTPSA id
	h129sm3861512ywe.97.2019.06.11.06.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 06:20:15 -0700 (PDT)
Date: Tue, 11 Jun 2019 09:20:13 -0400
From: Tom Rini <trini@konsulko.com>
To: chee.yang.lee@intel.com
Message-ID: <20190611132013.GC7115@bill-the-cat>
References: <1560234697-27013-1-git-send-email-chee.yang.lee@intel.com>
MIME-Version: 1.0
In-Reply-To: <1560234697-27013-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/plugins: kernel image refer to KERNEL_IMAGETYPE
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
X-List-Received-Date: Tue, 11 Jun 2019 13:20:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 02:31:37PM +0800, chee.yang.lee@intel.com wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> replaced hardcoded kernel image with KERNEL_IMAGETYPE.
> set kernel image to "bzImage" incase KERNEL_IMAGETYPE not set.
> 
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>

I could see this being useful down the line (if not now..) for UEFI
images, but aarch64, so a good idea.

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

