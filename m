Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDEF7F876
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47DJwq6GFHzQk;
	Thu, 14 Nov 2019 12:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573730540;
	bh=1XVIzX4epoBaHa7Cg7y0BvOTkJI8gE1/YznpT+OjCoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYAoS2FAaDMZZ1E+W0VZB9Blz61vCMFZrxtmxRMC3t52Pmf1jlA+IvJlI3mVivb37
	27SPZB8yiZKA0KUVQJVEiezrxbzO4467Z4a/8sQSG4mFF9qw7XvAKQ7q9CwTCVFBn1
	OTcC+DcXKWo/DfkeLwMiY+DNXfGMy6t/LfKhQ0acIof2N0s+jyx1gSUd+gQ3m/3c5D
	cFZjLzL33s9n4XLJhBJORY2SskW7icffu5ug7XzePz0/M5jqbGCg8vfPqutNqwGiJr
	ZxboaYhFX6sXWVu+Rr8HCXvOF+YvRB0y1MsivNmlyDcy2PdiIfbpiY+gJZhDRuSwwD
	c+0Xck2qRzK+CvSLvPRp12GWZrbVTXHBOjNHvaKKJSXN9tEzqpGgAzOro51WGVtShC
	AHqq7OlJMiwfUvw1DVcRbDb6AK6JsStmtlXC5qh7gKd7S6M5XEvg8xdyo9L7IOZf2C
	SASdqIDQpGyrpbdfL/GZ3rDCCDyF2tLEe5RbSI4jjiwPDI8m7/rzMVa7hKCrg84Jta
	S+DHineGFT+RrnaQ/vuZryr88FkbMifZ/RdWV7t8e8JxJbYmFohXoqbJSuipcKELqb
	oVgZ4yS7Wm1gsvnSfqJZGxDUSOos/QLQiOUcfQp2f7hPMy2s+Ov/rWFrafzCOBH5lu
	qgmZp8rDxU5aMwpWwjr951pg=
Date: Thu, 14 Nov 2019 13:22:17 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191114112217.GA13971@localhost>
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
	<17c4c8b5-09da-f8f7-effb-b67c33624840@intel.com>
	<CAMKF1srtAu02xK-7QWcnrPsgJ8qCWRLnGc2FKnDZCXAYtui9Ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srtAu02xK-7QWcnrPsgJ8qCWRLnGc2FKnDZCXAYtui9Ww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Thu, 14 Nov 2019 11:22:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 13, 2019 at 02:36:56PM -0800, Khem Raj wrote:
>...
> however, there could be another problem, where libgcc_s is lazily
> loaded during pthread_exit and
> application is not using root user which many daemons do where they
> use less privileged user to run
> and it would fail in the exact same manner. I also see few other uses
> of libgcc_s.so being dlopened in
> nptl unwind code and libbacktrace in glibc.
>...

Why would this be a problem?

dlopen() does not require root privileges.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


