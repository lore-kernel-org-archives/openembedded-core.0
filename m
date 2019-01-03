Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3ADF6D728
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 17:49:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r24so35290151wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=f9uZ3xc+ywE3ILGpPkjXE1PtapdL7z2ipeCwZXbtZP4=;
	b=LYcpu90yvG+g4erJdTyQ78tvFcIM4FsngFg0s2ctkNPtrv6jiWgUop5DMkLvmUmk21
	FKgTf9N2Ox3LVE4wNCFdankrXOBLgWIxwPeBbq3t+lTqbWuTgjnWb8u1kbw/MIR+cGCz
	6ifNlg5JfOcPVHM0OgcATRnWPZkOoIu4vwdTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=f9uZ3xc+ywE3ILGpPkjXE1PtapdL7z2ipeCwZXbtZP4=;
	b=AMxSK2c3tn703zxQb7TTUkJnrOIXr8ZYYHY/Mtv4gfGOTbrhOKhhczsDrc1e2YcZiM
	sQODLek4nviyiGPFiFgN54fYMW61nl2naIiHq04pP8l8+lzaMJEeaNhcf0LoUukmeZbE
	4E5Tqnaitt/aAH0EAhyJq+WbJOCAeGd10UXIjb7UxuvznYT2VpzX9xbkz2kFrKmBWquB
	aLMrEUKMe6v/QSoPyZpDS+2pSf0ZLEn9DDKw8kRsewMVlCQjzSoCB95oVxJgl9FVTcZm
	B2/pO5AMVp81JemyPdEXZQp/dyEFRMoqVPM9m5+VMwruEpPpAqUc3pNlxVRsMS5GCrrw
	Y2cQ==
X-Gm-Message-State: AA+aEWaDieU7BLJUm26986hZzqYcZr1BueQOUBlWbnO1fPuPMcp69iBa
	fGcWvUT6BTKgw48SZxn14vTULQ==
X-Google-Smtp-Source: ALg8bN48lvUbmCX0MarqxTl/NOJ3ZKONQRTuAe4n6kS9TbE6vRscbYBtf3CQsWAQN2VVVe6y5+rR3g==
X-Received: by 2002:a1c:bd86:: with SMTP id n128mr38374018wmf.22.1546537749227;
	Thu, 03 Jan 2019 09:49:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c8sm37609210wrx.42.2019.01.03.09.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 09:49:08 -0800 (PST)
Message-ID: <1a4c8e17282847375def4206dda77101598a1794.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Jan 2019 17:49:07 +0000
In-Reply-To: <20181220154043.7860-3-ross.burton@intel.com>
References: <20181220154043.7860-1-ross.burton@intel.com>
	<20181220154043.7860-3-ross.burton@intel.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] oeqa/sdk: add test to exercise Meson
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
X-List-Received-Date: Thu, 03 Jan 2019 17:49:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-20 at 15:40 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/sdk/cases/buildepoxy.py | 36
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/cases/buildepoxy.py

Fails on the autobuilder sadly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/84

Cheers,

Richard


