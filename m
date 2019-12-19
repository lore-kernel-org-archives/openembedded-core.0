Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C10047FE2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 06:01:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47dh9021tNzLM;
	Thu, 19 Dec 2019 07:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576735316;
	bh=tpVJ8x+071xey20Rc6kbvGlVEUh5orXGTf0SIBlJBRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNdiPiriB64oKptrHd2C7C62By/jEgWFY3LE1efzN+ga9cYn2ceOK8fOoF7KUW+7v
	anmaYs0+AcWyyb3rJujrPcds7yu8v4wHlkSz87cyXyx4Sl5dpEXLR2uZ01FcmzY/Kg
	NvghYlP8Zl9wmH3pMEcJZXqtTKyULZyFEJs4+f9WJe/Moluh4XoakmbIC1Pij3MTMm
	w002mEjDVGRzQOd/66p1A9/8O5DNH0efmOsSYcevPcEkgSwp1Pnjrzz3lDSccuTD4S
	UYwvQexJJo45+QyUClGld9bnVDkJzqVWzoLeahsq+3ofgBbaDBfstTfMIu6VpmBYRK
	Suk5A6GASV60VyBdMguHbpn+A5kO+5UvbFFcPunYSGWZosHTEdlCoD4ica3xoI+7JI
	cQlLeSwijIHoRddU4Ltb/zO8IqHLZngIy6I4rW1TUva3wKlIoj5kce5/gHEx3qzoUc
	UKjUYg7esiu8qEXhCrkkO0nBjp2Jz+2IBsCUUsakORGYdNY5coPT09RR9vk1w+npl6
	pzIt04D6cgzWuT0YpNghvnyBRW/khAerJ8t473XXtxJFAQSiEPf62r6mU/CssC4vhN
	vAP3kd4vtoDfjuYinNzOJ5+Ymp08tH9T43O389tv1HyliiSx8RCZOzoaI5+BpIO/s2
	7nK+hTyTlv04H9dqzYZPKwI8=
Date: Thu, 19 Dec 2019 08:01:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <20191219060153.GA24309@localhost>
References: <cover.1576733575.git.anuj.mittal@intel.com>
	<509b450af8d1e4c25ded53db18524d669ecd834e.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <509b450af8d1e4c25ded53db18524d669ecd834e.1576733575.git.anuj.mittal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] libtasn1: upgrade 4.14 -> 4.15.0
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
X-List-Received-Date: Thu, 19 Dec 2019 06:01:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 19, 2019 at 01:41:08PM +0800, Anuj Mittal wrote:
> Remove backported patches and explicitly pass -std=gnu99 to native CFLAGS
> to make sure build passes on older and still supported OSes like CentOS 7.
>...

-std=gnu99 is default with the ancient gcc on CentOS 7,
you could pass -std=gnu11 to bring it to the same standard
as current gcc.

None of this actually makes sure that the build passes on CentOS 7,
and if there is no problem right now it is better to not try to fix it.

cu
Adrian

