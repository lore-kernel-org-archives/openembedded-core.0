Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA9AC79006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 21:58:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v90-v6so13923849wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l/MoooN7VuVae+OYJRTlCddAmEV4ueN0EfwD7hM05SU=;
	b=bRu5SWUV4RcNklnLGtRmLOYb9ybZ+3oVocuOytYSRa97LxcCa20BI36qerohvq+K0i
	9aJC8gfW52ZZqiIYQwiUrBmdDQvKt0z0R7ymrgnJo18xNKsbS/5hAGWzpnDijeqEzLFr
	WsVxKx6H2a+TdCd+R/uxSTi8Xd95XrWXCNxO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l/MoooN7VuVae+OYJRTlCddAmEV4ueN0EfwD7hM05SU=;
	b=iH4n2BqMUXC3oOFMaoXTe/IE2abG3QIOaB39VHaxSQkyrCcWs8c0YHunFSajxDn0sT
	lrHaGpmCwbDwh/b99zbfoRVlF4Jbu/QzKYPqGN9qc6jGouaxCGAkxdFGOqxs9QPfCQYR
	OLFD9dEF8Ykr8UH0hnZmPblfGbkzC3QVBVNO5N3/hCVbTwKtNV1DLVSn2Qh99E0Z99gD
	avdhlMFvg4bheLA6GoorB8lxqHtBzqAOdZwsnZFHR2E7qfudIWDydJlUheuNnOXsCr54
	5OpuyN9q5cf0EqHIBvWUI63ZHN4e7HGK673luuvdw0BAZALHxuWptWKBU3z1gvxDE9kY
	xj2w==
X-Gm-Message-State: AOUpUlFd17mjxekiJLbwl5lFas3UjyJZblw8sm3W4sDiN8LOrcvqH4Xk
	Qhmm/eHQHgakTXm6OOxnAfszEl2U/BqG3Q==
X-Google-Smtp-Source: AA+uWPyEmodqFT8T5JNNn8w8ed+QqB9qu5ZbU0UA80LHOvVbSUFh+bYtML6vIYi5eWozBiMcWXxfEA==
X-Received: by 2002:a5d:6908:: with SMTP id
	t8-v6mr16984281wru.170.1534888728738; 
	Tue, 21 Aug 2018 14:58:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm8871996wrn.58.2018.08.21.14.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 14:58:47 -0700 (PDT)
Message-ID: <a6e6fea9d8763611b2df805006639187f9c95326.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Date: Tue, 21 Aug 2018 22:58:46 +0100
In-Reply-To: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
References: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Tue, 21 Aug 2018 21:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 08:36 +0000, Jonas Mark (BT-FIR/ENG1) wrote:
> Hi Richard,
> 
> This is my third attempt getting my reply onto the mailing list. I
> suspect the first two attempts were filtered due to the link to the
> v2
> patch I added. I removed the link this time.
> 	
> I already sent an updated version of the patch to the
> openembedded-devel@lists.openembedded.org mailing list because an
> automatic system informed me that I hit the wrong mailing list. I
> propose to switch to openembedded-devel for further discussions.
> 
> [meta-oe,v2] directfb: fix tslib version check in configure.in
> 
> Sadly, there hasn't been any reaction yet.

FWIW your messages do appear to be making it to the mailing list(s) and
you can see them in the archives, e.g.:

http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120115.html

I look after OE-Core, not meta-oe where this patch needs to go so I
can't help with that but the patch is on the right list for them to see
it.

Cheers,

Richard

