Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EC4D69103
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 12:05:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.93248.1732795506998342051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 04:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J4540AgS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5A81C0005;
	Thu, 28 Nov 2024 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732795505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4h6kmmZSWmHgDxjNcR/k92idDTygaSR+4Pzm9ORYvGY=;
	b=J4540AgS+xtEVK5iB8RH/dQ6yAPeU8bTbPgupwP1/pPQUD6x5y1AJWSelw+W0M1yjlyuDM
	82tNomDmFunsEdeM3aPu9cI5IJ+nhGHNzcj7Sd4QtMq12rx5NQA932zzjJIAKwElCBlBiB
	9O+r7RBgWPE8Zaazx2yB4dWUobhMJn4lBp1daFpydTUxd8tHw9uSE3jHATPLFU0emZ+9Zn
	9WbB+fFcIJGDOx5VldDsFrFrdAYFlQnSmSpx1LtPVBYOaKHEPNEOVMITmM5yd9qc0udqtI
	ovqheNWF/4B87MPDXT0++N2yBBvejAtKA8rbBr8AOtGJaxg3bciIzAli4e10gQ==
Date: Thu, 28 Nov 2024 13:05:03 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: richard.purdie@linuxfoundation.org
Cc: colinmca242@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
Message-ID: <Z0hcbzUOxStSvtAc@bootlin-mathieu>
Mail-Followup-To: richard.purdie@linuxfoundation.org, colinmca242@gmail.com,
	openembedded-core@lists.openembedded.org
References: <20241127125945.3211089-1-colinmca242@gmail.com>
 <Z0hadK8D8_0rGH2E@bootlin-mathieu>
 <83062184283c9a80138d75f9abecf30cd8dcd782.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83062184283c9a80138d75f9abecf30cd8dcd782.camel@linuxfoundation.org>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 12:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207987

On Thu, Nov 28, 2024 at 11:58:41AM +0000, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2024-11-28 at 12:56 +0100, Mathieu Dubois-Briand via
> lists.openembedded.org wrote:
> > On Wed, Nov 27, 2024 at 12:59:45PM +0000, Colin McAllister via
> > lists.openembedded.org wrote:
> > > The database used by cve-check currently stores the access vector
> > > and
> > > vector string for the oldest CVSS version for each CVE. This should
> > > be
> > > reversed, where the newest possible CVSS version is included
> > > instead.
> > > 
> > > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> > 
> > Hi,
> > 
> > I believe this patch breaks some selftests:
> > 
> > 2024-11-28 13:29:06,536 - oe-selftest - INFO -
> > cve_check.CVECheck.test_image_json (subunit.RemotedTestCase)
> > 2024-11-28 13:29:06,539 - oe-selftest - INFO -� ... FAIL
> > 
> > https://valkyrie.yoctoproject.org/#/builders/48/builds/463/steps/14/logs/stdio
> > 
> 
> Is that not from the ongoing NVD issues meaning we can't actually
> obtain a new updated database? :/
> 
> Cheers,
> 
> Richard
> 
> 

It might be. I don't see any issue with the patch itself, so it might be
an external factor.

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

