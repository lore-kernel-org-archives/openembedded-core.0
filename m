Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D2EC61CE8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:29:49 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.web10.30492.1749205783408236609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=f3uYQ/ND;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 851CB1FAFC;
	Fri,  6 Jun 2025 12:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1749205780;
	bh=mVWEebuDLAojxJfmeBaeEO6jNcQoMok/jZoM1KPkyvw=; h=From:To:Subject;
	b=f3uYQ/NDeQWpESGH0I36NP/iluLRasJAzYIRq1sJ9jbvu490NvG8b+JfKMRRnY+sf
	 5EvaxQhPoQaSqiFM7GztbaawDSxI5T95+B5nAEbmh5S/huydQP0PQe4guPaa1QZ/P4
	 fuLHXXCg9gbG49vGL+/CTYJWnHR4wK2fVPSExIBgKKKlcAuT6pFczE+I2XMDfjqNqi
	 V4x3YGG9u+qCEavOxZoJ9bHdebkXSyM6oQSvCRNUImXIuoS0dEWKCcNX2rvCNI3adc
	 g/ZyEKyZ1h9ZOG5yUg5U1wTYfXCL5RVx7pDSh8kebl5AwF+oWZa5kxX5URaEAwGilU
	 C30NhuJTOu7Fg==
Date: Fri, 6 Jun 2025 12:29:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: AdrianF <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org,
	meta-ti@lists.yoctoproject.org, hiago.franco@toradex.com
Subject: Re: [PATCH v7 00/20] FIT image improvements
Message-ID: <20250606102936.GA29790@francesco-nb>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218128

Hello Adrian,

On Tue, Jun 03, 2025 at 10:23:11AM +0200, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> This patch series re-writes the FIT image related code. The goal is to
> fix [YOCTO #12912] which is a long standing issue.

I did not have time to look into the details yet, but it seems that this
breaks build with meta-ti.

| 06-05:18:06:33  ERROR: ParseError at /workdir/oe/build/../layers/openembedded-core/meta/classes-recipe/kernel.bbclass:183: Could not inherit file classes/kernel-fitimage.bbclass
| 06-05:18:06:33  ERROR: Parsing halted due to errors, see error messages above

https://gist.github.com/dolcini/8240a229516e7a93356ebba56631d3c0

Francesco


