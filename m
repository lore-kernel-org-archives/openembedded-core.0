Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3C5678195
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:09:05 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id z132so309548wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 04:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yRponW4gU/BHH+jF+wx8JInruP6QpgxopKB91trsWw8=;
	b=jTFNE876FtgVA2Jzp1SWzpm5c3w0SiJQZ6oU+6BLKOL2Iw4CE1PKmOlDCb9jBbhADa
	yzJ1QfxwWarPY2keB2E7Ru3yoihAg6lg5f3vn10HWLerrrtRNNBc81ftKHM//zv6/NDl
	kgREYSvxP9kibWh+eDcE3Xe9l0ui9C+lXIvQUaPDWXqCJ7EKngPn3w5Ibh4W2siGo8t9
	tZdu4I4pbfhArojqAnM7zmaLMH73AlbR3PMFOVr4q/cGXp1QXb9fjO2+ShbM7mR08P4p
	SV20p+WLdpsQq9oEHLVa8X/iT8rXTUt2tXl5YlwqYRFKuFWTjmQLABdxBlDVT4p8o3MK
	8d/w==
X-Gm-Message-State: AHYfb5hzE+Xo+9NB0b8Dmy/31/uscEt9vUPz6qcx5sS1MYXGgZlyeP2e
	Qs1G9hkVp3cz7w==
X-Received: by 10.80.167.197 with SMTP id i63mr9072671edc.124.1503659346635;
	Fri, 25 Aug 2017 04:09:06 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e12sm2940166edm.53.2017.08.25.04.09.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Aug 2017 04:09:05 -0700 (PDT)
Message-ID: <1503659345.5806.11.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 12:09:05 +0100
In-Reply-To: <1503659104.32591.220.camel@linuxfoundation.org>
References: <20170824091924.25945-1-git@andred.net>
	<1503569930.32591.188.camel@linuxfoundation.org>
	<1503659012.5806.9.camel@andred.net>
	<1503659104.32591.220.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Fri, 25 Aug 2017 11:09:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-25 at 12:05 +0100, Richard Purdie wrote:
> The patches I have in master-next which enable a native version of
> debianutils and then add it as a dependency from ca-certificates?

Cool! Hadn't seen those.

Cheers,
Andre'


