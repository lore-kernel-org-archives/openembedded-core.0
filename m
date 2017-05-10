Return-Path: <anders@chargestorm.se>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D24065D35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 13:20:57 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id b68so15295221ywe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=bkTOwAwinyAy1zPcp56HId/B/ZUkYqCK/EY7C79UyKg=;
	b=0dVaDM13nl1TPrKEgGftL59xQdRpzY8Ez0N1X00MvvBu9jwy0OWgbMHgZ3uWo6ImZK
	3QuCslWwwMS87twBTfiWRs4r4rD+c6PDgvo0t0z6FQcMubPQMNECJS2nfpFCfMwsVSPE
	II7T47HL7P8xUvCiVqcsdVlVpPVi6vqf0YrPif6NgubHFbIhk3y0ObhkflM2JQZCFKGG
	zbkevwYCzZ83A8b6jR9PwVF14aA7xdVFMiWdcwbz3sGIU9eXPJPt0u6GH81Pou46fzmu
	2bGllwNBUjxUus7gpV0GgI2DVKezZjBtrXndhYH6oIa2owqa3786ua0W+EnkDK+Y8+h0
	6gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=bkTOwAwinyAy1zPcp56HId/B/ZUkYqCK/EY7C79UyKg=;
	b=ikyiE5HAdyXGV7HUOOiRWW2y3WIusX0ZhZJwEjUCslffLCVXbUCn++yuRQV07yZbsj
	YUYPLsgA704ZkXLtkQQqubO6mdLg+akhmH3/7fHLNAQKwOtIguggZhxdUtxD6w8kfkoB
	hPUj4qDUGXP9ukYPVNjH0cMtJR+m5QcXaNRTKSk74fpWSga8vmW8ATwESGYY5yu9Qtu7
	msneJOjkfWYshXNM6Ksry9sWujemBFL6v2O8/fjXqd4iIYX3K0aajfVcPmNZ3Ji2Oq80
	wLPXazZRCDLbycguwxvI4kP/HUnfBM4K86tCXjwUms/icSBZg6XBTEPuz7UEdDgEioCn
	Ml8w==
X-Gm-Message-State: AODbwcApYlaEhCIeQ2xkf6H3INDuNNm0pyo3SwSAcpuC0Zy6R5nIsNQU
	+iiT3WYUwaVNPFuyIr8=
X-Received: by 10.25.43.1 with SMTP id r1mr3056719lfr.89.1494422458721;
	Wed, 10 May 2017 06:20:58 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 2sm550826lju.0.2017.05.10.06.20.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 May 2017 06:20:57 -0700 (PDT)
Date: Wed, 10 May 2017 15:20:55 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170510132055.hnr22ktoy74xlw33@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1494406033-28833-1-git-send-email-B40290@freescale.com>
	<1494406033-28833-3-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1494406033-28833-3-git-send-email-B40290@freescale.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Subject: Re: [PATCH 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
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
X-List-Received-Date: Wed, 10 May 2017 13:20:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Chunrong Guo <B40290@freescale.com> [170510 11:02]:

> From: Chunrong Guo <chunrong.guo@nxp.com>

>     * For example:
>       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

>       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

Why not just change the definition above?

Curious, as that would've been the easiest and quickest solution.

Is the current definition necessary in some other way?

Cheers,
Anders

>       but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its

> -			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
> +                          
> +			DTB=`basename ${DTB}`
> +                        DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"`
> + 


-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

