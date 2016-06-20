Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10BDA6057B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 15:21:46 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a66so83803225wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 08:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LYBeWKD7qwSdM5SNVKZhXUa4KY6LYsgMPybPQ02Amq8=;
	b=Ryoyy41z/yck1rxunX411MvAitlZ/XVcCDJgJ703mDgLo/XyKFB2RKI7o5e9g5yNMA
	DP6iyHfsp2ve4I6XtxxC7y9DfBfp9O5kJ4O/J6qOf0vp/SZZD7xg8v65MpKwEtBZpiEB
	xJQeUq19fIhnCa63zw3mYCQVXyBzmFvqESRiRXjlN9/cqrBNiw4XTFPYr2SWdXPWPpm8
	VdpjRY66Q8oc0YKs4570ubv8Q3kheGpginvX6qy/272+/3peRBVzt9njHMO2IUUNNiDb
	YZ1cXKMkspH2cTX6CoWzt8mORrtlD18yWcAJVGYAt4oTDGIb/4ge8ekjI+4HMtrcA2Lw
	Mz9g==
X-Gm-Message-State: ALyK8tIJGsIHVZUUB7h1lG+4HIEK9wru08rHLiLM+RVxeRCtaSLrvT54EQqnJR6BOF+0VA==
X-Received: by 10.194.54.198 with SMTP id l6mr14672696wjp.67.1466436106476;
	Mon, 20 Jun 2016 08:21:46 -0700 (PDT)
Received: from localhost ([185.46.212.65]) by smtp.gmail.com with ESMTPSA id
	g4sm43799776wju.30.2016.06.20.08.21.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 08:21:45 -0700 (PDT)
Message-ID: <1466436103.6499.32.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2016 16:21:43 +0100
In-Reply-To: <1466434134.6499.27.camel@andred.net>
References: <1465571533-21604-1-git-send-email-git@andred.net>
	<1465571533-21604-2-git-send-email-git@andred.net>
	<CAMKF1srfaxLS3wn5d5Fu46i5-hU+kGj3dViD_v7YyF3wut013A@mail.gmail.com>
	<1466434134.6499.27.camel@andred.net>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] uclibc: never build with SSP
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
X-List-Received-Date: Mon, 20 Jun 2016 15:21:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-06-20 at 15:48 +0100, André Draszik wrote:
> This patch fixes uclibc builds when SSP has been enabled by including
> security_flags.inc in distro.conf

Should read:

This patch fixes uclibc builds when SSP has been enabled by including
security_flags.inc in distro.conf and adding "ssp" to DISTRO_FEATURES.


