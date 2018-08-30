Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC6DF793ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 15:22:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y2-v6so2413400wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fi2SJM/KdNg91mg6f8AYi/AHxEIhI/5qDSwOsFkbFWc=;
	b=MsJTgpfmbJJcsCwfZwjDVWtLPcEazFcib2Xw+OqBtdgvjP06RbommAqBOLH/p3Epex
	p0a7DwQanX4mYtyeuCZW4D3CY2gsCTi++vXRu++GmkleUrkx9LUbkSSV7v/cA7uaPYvl
	WvlUHNtM2cMDL8CC3Wu5YSgdG2DSD1mwwfnf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fi2SJM/KdNg91mg6f8AYi/AHxEIhI/5qDSwOsFkbFWc=;
	b=QJBljhnn1XhH+H6A+HsyssvwxIl6Zwxgk9u8rKICy6ZLxPEr0eNGiG1wWTERFqPYgq
	8X3YOLA+uQTco4z5xcWdYcM1cBzO95NeUR1uR2EOAflpz8LLHR4MOeT6l21gLXMmrx+W
	C2XSBaxboJYVJyiEDFd1p8viDsVsfN5tUL5EeFJ4j7Uk5RklKjDpOPS9XgXhdxAjdyJr
	B2KgCt2rfCbVMYMq1fIXlPvDp8C0znpBrnh4CPsBtVnXRWyrRVoRez/421HNbP//qvxz
	2XndMbk95EshhRtYOnqm0WZBfl/PqxCEybMXBgXvo3G1afsWDqYV3FMObfyFDqUDG0LZ
	HvdQ==
X-Gm-Message-State: APzg51BmO1P9qdkwUhTz9Cva2wtWefidYecsng1e+uEnGpfJIug0wxEH
	+2C92MBa8BQt6ZtKu28SGEBViA==
X-Google-Smtp-Source: ANB0VdYgVfuSPXfagoc6DKcBuVtJr/mpm1pA+Rfjo4lL/A6qdsc6dUnkmNmFkbNlaklLV/XHWX/jBQ==
X-Received: by 2002:a1c:c5cc:: with SMTP id
	v195-v6mr2189021wmf.29.1535642572588; 
	Thu, 30 Aug 2018 08:22:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r30-v6sm15511316wrc.90.2018.08.30.08.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Aug 2018 08:22:51 -0700 (PDT)
Message-ID: <5d6ddab2b5eacfe864c99f0e67797c4bd4d96415.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Thu, 30 Aug 2018 16:22:50 +0100
In-Reply-To: <CALbNGRQPs4mX70TdFnaHeBiPqp2hKJyrj1R9nUfGDe7BghGyAQ@mail.gmail.com>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
	<66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
	<CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
	<fcb8bc41a5f65715b41f2c9461cdd434467e6ad4.camel@linuxfoundation.org>
	<CALbNGRQPs4mX70TdFnaHeBiPqp2hKJyrj1R9nUfGDe7BghGyAQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Thu, 30 Aug 2018 15:22:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-08-30 at 12:45 +0200, Andreas Müller wrote:
> > I'd have thought Accepted should have a []. A quick grep shows
> > other
> > patches which have that in the tree so I suspect that help text is
> > misleading...
> > 
> 
> V2 with Accepted?

I've tweaked it in -next to save reposting and remerging the patches :)

Cheers,

Richard

