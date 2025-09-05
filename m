Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749E3CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 19:17:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2101.1757099820797013669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 12:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fwZ/vpd2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 011344E40C42;
	Fri,  5 Sep 2025 19:16:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDEA36060B;
	Fri,  5 Sep 2025 19:16:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC5A5102F1CFC;
	Fri,  5 Sep 2025 21:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757099818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NCYmiM2i2hce50Sf9y0H1AM04B5GP3c9zKzMOhUhJs0=;
	b=fwZ/vpd2/aw4E9CMLw+e26sZo9mfMNeTLb5QGfQOBG736tpd74VGe/GugLM5KXcYPpXeO+
	I4eP630hY+JxtiVyZc5enPtnD6WDRTbHo7xFbBoySzGyRFoB3PjGD0fPg0kwddtEqsC29a
	/bJy0avwE3bzYPA2OQ/7tJ8Qe/r4aEK0TVD+IBkVeg1XKHXIj2EsCNxNriBoynIAsU+NPM
	yYoM1BOat/yLLWV0p2FeAv+whzzJ3s+5jSpyNxiaOdXY5mDSZxOvz2VJ3sKAkoIfU1aasn
	4SWDIRjX1MIaAp45BS1cU7C45wiQC+dHIzf+4t+Enx1mH/6iKsjByDZX9pxkwQ==
Date: Fri, 5 Sep 2025 21:16:49 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, Steve Sakoman <steve@sakoman.com>, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH 0/6] backport: SPDX 3.0 support to Scarthgap
Message-ID: <qcqr3llrim64qgznikxhoaszezuzxt5wr6egdpabmguqe4gqic@sedpra5rmzk7>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 19:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223038

On Fri, Sep 05, 2025 at 07:11:48PM +0200, Kamel Bouhara wrote:
> Hello,
>

Please note this entire patch series is for Scarthgap.
Sorry for the missing [scarthgap] tag in the subject line.

Cc: Steve Sakoman <steve@sakoman.com>

> This series backports SPDX 3.0 support from the upstream Walnascar
> branch to Scarthgap, along with a few additional local fixes to ensure
> correct integration.
>
> The primary motivation for this series is to bring full SPDX 3.0 support
> to the latest Yocto Project LTS release, Scarthgap, which will continue
> to receive maintenance updates until 2028.
>
> This ensures that long-term supported releases can benefit from the
> latest SPDX standard for license and compliance tracking.
>
> These changes are also in line with discussions at the Yocto Project
> Summit in Amsterdam, where the need for up-to-date SPDX support in LTS
> releases was highlighted.
>
> The backport introduces SPDX 3.0 document support, SDK and image
> integration, and related helpers. It also brings over tasks, classes,
> and library code from upstream.
>
> Feedback is particularly welcome on:
>   - The correctness and completeness of the backport
>   - Whether the local fixes should be adjusted or further refined
>
> Greetings.
>
> Kamel
>
> Joshua Watt (4):
>   classes-global/license: Move functions to library code
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>
> Kamel Bouhara (Schneider Electric) (2):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1348 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  15 files changed, 9028 insertions(+), 207 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>
> --
> 2.43.0
>

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

