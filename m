Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B5A676BF3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 01:06:56 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o125so249745qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TjC74L0RTDTbZzpmmYWPNbfIGlK6CgocG3rEXif9ErQ=;
	b=fFXnQjvvmclLM9X2sjxP+SNpIFPYSdYGSVi32COYhPxNkhhFM6xw/OWT55UgwHVr95
	LMK3Z+sRHKBWfIjLmnOdGSy8sSzJakxr5Kswy25a+RZy8K/s02n1dg5MFNKkngfW9XkI
	BcUhzNirvY/XM8IHtZo1YNWYU2I+NBri6CpsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TjC74L0RTDTbZzpmmYWPNbfIGlK6CgocG3rEXif9ErQ=;
	b=QqijocPi1R1L4rwNA6t8D852Zp9tZ7Ch03ZhCgLbNSa8K6bgX8c1Y75RlrCa5j8iSI
	GKqFdRylJAUzLz726XcVeLA2937Xgj7QxiUTzJ8k+PthDZEsb6SU/kDuClu3jGCGANOf
	f7+NoawiBL1tezfkhUXUKjx5wm4GL1aqj1mVCquy2a7M237/12S65lXshkAX/VdiBSUR
	l0jEkzOCsEkyJholktGSJOraG2cinmhBiXCgeEtR57psJ6kj2l0nFdlI8vDy1LcvNorl
	cZ68QCRvbssm7EXkzlQA+LfkU9nOI1PBlH71nJuvo9VZAozH4V21nbHbT4uCDA1082+u
	shQw==
X-Gm-Message-State: AHQUAuZcv27U59zJtzSvjO03rzv1qX+Ic98kngFezZAZEPMdSH3EQ1CQ
	Al2nhpFMDsvub0ZHuqbChUk4eA==
X-Google-Smtp-Source: AHgI3IaxMbx/iDD/gc5wOQHeU5PLe+jDlJn/UtE/Z42busa044NoF9OW9NT+gFr/O7tgDTu8qRc4eQ==
X-Received: by 2002:ae9:ec0e:: with SMTP id h14mr1109076qkg.301.1550797617394; 
	Thu, 21 Feb 2019 17:06:57 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-861F-4037-1793-9FE5-B673.dyn6.twc.com.
	[2606:a000:1401:861f:4037:1793:9fe5:b673])
	by smtp.gmail.com with ESMTPSA id 50sm2454qtr.96.2019.02.21.17.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 17:06:56 -0800 (PST)
Date: Thu, 21 Feb 2019 20:06:54 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20190222010654.GN12379@bill-the-cat>
References: <20190221235618.29059-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20190221235618.29059-1-marex@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2019.01 release
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
X-List-Received-Date: Fri, 22 Feb 2019 01:06:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 22, 2019 at 12:56:18AM +0100, Marek Vasut wrote:

> This upgrades the U-Boot to latest 2019.01 release.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

