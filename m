Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F097372EA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:36:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g6-v6so5993598wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rLCXpsrqi3hL/4B/2QiZkc+ZbboRtDJatoGMmaBsnqc=;
	b=ZqI//MofDAQOXviivKz/sDXDXc5REP53kAkn8srOECJ8togyMZr4jaGcfqnSDXLSiN
	LkLHUPL0/CjuMUp3IWVFvznVZAfT+K56Xt6/V9UdJ79TtmU3d0FuRzuVx/lqKP/aiJpN
	IlajXjjWLbZLeGW2nIBSFRotdedaO5rUySm0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rLCXpsrqi3hL/4B/2QiZkc+ZbboRtDJatoGMmaBsnqc=;
	b=YZsHpzThfstzE+hx/3S2rKHky51qwKTMjwgXBdzNAIEbClI+8d5I+yAt4u+I+ovT7g
	jb2w4tPv74V5J2vbqo46+m4bmGxwvxFuTezhSS//cnhv4ABWjSxr10QdDZGZVl5+Iys0
	/vrNzKpLomTWi9hIZJt7VDJ4kY2ELgZIKUkwBmPusQoF9JvjL6+McjBP/K0vvW1saYh/
	HEJLm82/p7vt4tZKgBZLk1oNAmJWGV3D0dyLYCHNoV7hAJLM8Fp9gL7m8rZfGSIgAHdV
	f6I1N+X28EBVsTGWlsbRwMRHHdVam8uzXHwTCcEJagjRVTxpdHCnFmugm3i4wDKIaqL8
	v6FQ==
X-Gm-Message-State: AOUpUlH9v/HWfSrifeWWXb5s6L3l50ooVjsfHab9KZ+6jD4BFNV8T/Hp
	vVi04+y6U3jh+a/VdBT2lLEBww==
X-Google-Smtp-Source: AAOMgpeZvKoEplEcubP1fhX5ViTgSsIyq5mJt92nx7bEQDbtjFDM4SWekz2ggQbrpu+sIKWATmZZMA==
X-Received: by 2002:adf:f850:: with SMTP id
	d16-v6mr2900414wrq.172.1533314212706; 
	Fri, 03 Aug 2018 09:36:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h5-v6sm5418348wrr.19.2018.08.03.09.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 09:36:51 -0700 (PDT)
Message-ID: <85b56805f64f36e0c0a200b560fe1cd0502fa8b0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 03 Aug 2018 17:36:50 +0100
In-Reply-To: <CAMKF1sr+M+eD653my6oCt4EDCoSE2W6gc0Ximad4N-ktpXdakw@mail.gmail.com>
References: <20180727210433.1580-1-raj.khem@gmail.com>
	<CAMKF1srtPvMcUEiraSvL2Y2dTL5OVX_7SUeua-uMvz5T+LrPKw@mail.gmail.com>
	<2badc7bffd65c7e51a5121522e3c4105b4c97e81.camel@linuxfoundation.org>
	<CAMKF1sr+M+eD653my6oCt4EDCoSE2W6gc0Ximad4N-ktpXdakw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "gnutls: rationalise libunistring arguments"
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
X-List-Received-Date: Fri, 03 Aug 2018 16:36:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-03 at 08:49 -0700, Khem Raj wrote:
> Yes, will do. I explained it in original thread as well

I know, but we need it in the commit message so we record why we did
it...

Cheers,

Richard

