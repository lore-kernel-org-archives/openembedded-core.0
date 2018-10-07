Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9B35E79164
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Oct 2018 19:44:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id i8-v6so71060wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2018 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=awz43kbc+QN++M8NYkyXA0UyMwThlsBmJxlp/luW1SM=;
	b=o3i9wGyZ6fH/tDadDgVU7QQDSMcjroGaWUI2Vv6CgDW8ydo/v5MZlJCdAKCbZ75DaI
	jiEKL9ST46p8ru+zGs+NvqLO4Dm8/6Xe9w4hIloc3frp+mAjfaAQleeckQsC1qwJfYPo
	1xLshtS+fbrmatCz5qBg/0ga1rrEGKWXQQRsUoy+WuY2YPWdxW4bbyC64aw2jBdhtDUJ
	JOBpc+FTO4kFy9T8+JNJTWngctGvrkDzzyGG0vRgN604DeKrYIcpPhMf5egnzqNJkvwn
	vC4TcPBuzSBpA3Hpz8YgS048JrG1/Y0JoxGDlCcEuykq0Af1ccdPvO2BCSV445SxLo7H
	8p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=awz43kbc+QN++M8NYkyXA0UyMwThlsBmJxlp/luW1SM=;
	b=fYrp8Ns1UBqutmh5mBnAvNQeMgx3axFD2ICQL71LE4l8yGBv3FaYge2D0cbCuoK0CH
	GPV4SArFsE9zgj56dgSWjCkwoByWo3M3+zBTuTkP3VnPb53+EbC7oJwVLzg7Gzc2oh7u
	Fs2RO2gtL92RguvmQOshU4/D9B9Ufz4aliEbLCLJtvkMvz4Hi0azVnaGyuPouz8vvWgW
	aioMNVaghT0AutN29x0Bj5uLhLHKaxlK8uIVyoWmnYd+oMLuZpQjINsds5IvHuAgSTv3
	gM0cDWtEsfvCFPwEfNbJhS/qV/hW+JXOOuzFczAGNfskSeo8hdUfzdR8PQRl5xlIpc/7
	sTPw==
X-Gm-Message-State: ABuFfojXKee6QkcfY5o6c4+4RJcZhtg9+YzhpCsgLnxVVdg+moBd+SjJ
	4fwX9JAZhYrmXtBts8ZW+nziwHQt
X-Google-Smtp-Source: ACcGV63RJlZ31i61yrPPtcJlRGiAsbyQIZzaZgGFaxqpXgVk1dNExVhEOuim5IP11Mmr1RbvEM1x8Q==
X-Received: by 2002:a1c:c2c3:: with SMTP id
	s186-v6mr13403454wmf.16.1538941479838; 
	Sun, 07 Oct 2018 12:44:39 -0700 (PDT)
Received: from x230 ([85.119.94.113]) by smtp.gmail.com with ESMTPSA id
	b8-v6sm4027376wme.1.2018.10.07.12.44.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Oct 2018 12:44:39 -0700 (PDT)
Date: Sun, 7 Oct 2018 21:44:37 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20181007194436.GA2143@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20181007183115.20717-1-petr.vorel@gmail.com>
	<20181007190305.29310.78689@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20181007190305.29310.78689@do.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGx0cDogVXBkYXRlIHRvIDIwMTgwOTI2?=
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
X-List-Received-Date: Sun, 07 Oct 2018 19:44:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> == Series Details ==

> Series: ltp: Update to 20180926
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/14398/
> State : failure

Replaced by v2, where addressed the issues.


Kind regards,
Petr

