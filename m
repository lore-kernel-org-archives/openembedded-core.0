Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4AD7CFEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 22:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4514MY2wkTz7k;
	Sat, 11 May 2019 00:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557526649;
	bh=0/nHlclACPSnnSOrMU1Xnx5dDKkHZmtu2/lOLXjKBH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ME8ya/WKjIrQCy4m9EMl46FHj55vhpdQk0h7hT/vA2xyv0KDr0EJvU7g7Pr0e1+Fb
	9QWlOLur/kjXfwLXBlijePSK7ejbKGiq0DOxfOieC77CIyMRE4waePOGZP50e0WrHn
	Rf8Lhyq6q3yj67wpk/NXeVRlL3sjrH8VkKLfav5zENNyiFSG+JJc7vmgBYrugijMAu
	1lH5Dmx0f89tWK2/dv6hYEVnR8Sv2IWTWeRaBKx8MZ+HFb+e7o7xopAdyGSE93wViX
	l5FwnDof+rU1WvDmpWGqLOVuwHY3TPv9Hoy6NU6vytBZo/KOWb+pCKr3aKNXvVK3yk
	L4n0dzaHWqxG1F+L7bnO0L/HyKchvgcORgmNVs8EUV/kaEI+KVRKqeeqDi8rH7l0Tr
	pBOcgRf7dcDvx+78Hsst6lwYAYYqndtKBsGHfHdgBti+K7I9miKQ5TSBXhXlfEbmsU
	8OZsxhMD7Du34zWmrmHv8BnKXOI+/jjV/jkvHGJfWRBlVzKbbxV7ACHUQNjuQwFAzU
	G64Q7xwOmhh8tvWLUsbebD/Z6wZsuKs7Maex45PtrRBtVikB4B8nsf4SmKkWump2xP
	njaIGA/LU8R3CyE+UCgmfz4fQwCXpH3jnNi01pDQvXJYP+urdrdfYa0sQOgHD0/z96
	wrJxbxFUPVuQ6C439od1Qd+k=
Date: Sat, 11 May 2019 01:17:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190510221726.GA20997@localhost>
References: <20190510204954.33591-1-raj.khem@gmail.com>
	<20190510204954.33591-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190510204954.33591-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] epiphany: Fix build with clang
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
X-List-Received-Date: Fri, 10 May 2019 22:17:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 10, 2019 at 01:49:54PM -0700, Khem Raj wrote:
> This patch is upstreamable, issue is not caught by gcc
>...

Upstream already has a different fix for this:
https://gitlab.gnome.org/GNOME/epiphany/commit/a6a022c9c498ad5dcf7f2220644a7520df74ca31

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


