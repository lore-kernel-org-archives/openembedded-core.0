Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43886CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 06:40:55 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1617.1778654450271552599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 23:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=u7vrIP16;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D0F73206DE;
	Wed, 13 May 2026 08:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778654447;
	bh=Y0UG3FxnbehtqwpGEE4o2cYfKfgPK5RVXx2mt3iZASU=; h=From:To:Subject;
	b=u7vrIP1664yxqz7kr6DKzMoaclvm7d2WkgeWmv2XMLA7d4XZerIiQTTJTWHHDue/h
	 YL0uwe12uro3Oc3fVBgMiWk1hkaAR+isCvOEA8XO4TWEIQMVAZtndM1x2PYImTZX49
	 /2ByN0R/Q4xSa4r+5u9Mj2Qy0xo/R4ppAb3vi4giXjejKZHuUKCOJmaBH3UsGzj85v
	 5b/fU3qgHrsyJ6SLhS7ilxg7IzXWvyEgrULrcF64fceFxYwGBdm6ysMhl2/oaOMJIE
	 +6CxIPhJyoV7r+JVmlbjtIIbtY0Io2fqfUQAN5nzxv06FPoIn5oE0zyGSaAaVAeUG3
	 svDZdXe/RrJJA==
Date: Wed, 13 May 2026 08:40:45 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: u-boot@lists.denx.de, Franz Schnyder <fra.schnyder@gmail.com>,
	trini@konsulko.com,
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Simon Glass <sjg@chromium.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH v4] tools: mkeficapsule: Rework pkcs11 support
Message-ID: <20260513064045.GB15116@francesco-nb>
References: <20260513044537.22773-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513044537.22773-1-Wojciech.Dubowik@mt.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236930

Hello Wojciech

On Wed, May 13, 2026 at 06:45:35AM +0200, Wojciech Dubowik wrote:
> Some distros like OpenEmbedded are using gnutls library
> without pkcs11 support and linking of mkeficapsule will fail.

In the meantime, OE core enabled pkcs11 support (in master and wrynose
branches). Just for the record and for having complete and correct
information.

commit e9f12f64279c ("gnutls: Add p11-kit for native builds")

This patch probably makes sense in any case.

Francesco


