Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.3568.1596619577175007848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 02:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=SUg8Th0i;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=aldv=bp=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BM5pY28rpz4C;
	Wed,  5 Aug 2020 11:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1596619574;
	bh=VrEHzzsz7nGCZggc2wD/nvKN0qtMp5bSGww2x7x7pP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUg8Th0iYXzVJDnmh9b5igsjJq+DuKOl0kVF/ta6gxNgnBg3ii+XCDMQnCA7+AJKr
	 agsp72SJnI9hlij6qvG6t6W4PXzv/YQed04VoTjhUXCyOCxbEPJg+DCLPxF5PGM2SZ
	 9CZXo9FBM/Pwpwfxm3QNQEeW4MnRkVRz4gcIX/hCf/1PBfvNCVacNUsjTorpfOqWBo
	 hcQ6Wp9f5Epkzbxy6oDW39fjiiLKNgSezUiRc7OEZXo6F5kwXAliRbLQitMYeMJYRG
	 fRDrxtQSy9PIFYyV+GVswPFBMF+7ojZPd9L2i6zQVHTQjJo5p/lGnS2YsqHs6sfaLj
	 x6thJnr0J8WnOKlDytV0AABFrIo6VuaSjSFRgM1AuOP6uCrrMPhZ3CHSY2QsHFIPQb
	 K6oYsqu0fmpyo0nAQkRj+kMgiLafuPct1aP5k3hB+3to78mFVMlx8xmJxFGgQf75Yp
	 8EWR3TdIqUR5vgCxLWJ5iGWkdDpK0jeQPZY8l6iPhfOJA44qCsCgMc6WbpiOTz0oct
	 cc8uWLfjLimxlhe4bdUVvGJjdXt6mfNtlU/8RTY07Deh6BVK7k8eZBE9K1r9Gzs975
	 +6eIgDruhAS0L5WYx8ha3iQrrGpa/MA6c8taHDc/7fKjTfHnY2PE/CZGu0L+fUCH1x
	 K9/4RFylRFytdxCdJVYM0ILQ=
Date: Wed, 5 Aug 2020 12:26:10 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] libunwind: Use -fcommon option to compile
Message-ID: <20200805092610.GA27769@localhost>
References: <20200805061449.1029166-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200805061449.1029166-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 04, 2020 at 11:14:48PM -0700, Khem Raj wrote:
> defaults for gcc is to use -fno-common this ensures that it keeps using
> -fcommon until the real issue is fixed
> 
> Fixes
> src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/dyn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwind-1.4.0/src/mi/dyn-info-list.c:28: first defined here
>...

The upstream fix is
https://github.com/libunwind/libunwind/commit/29e17d8d2ccbca07c423e3089a6d5ae8a1c9cb6e

cu
Adrian
