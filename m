Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B535DFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:12:40 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40564.1777284755256391216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=sKLPqz7e;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 21DAC20ABC;
	Mon, 27 Apr 2026 12:12:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777284752;
	bh=38JLuzLyvJ4+jRopVr0GCZvpHD70ZurwMElPcUF6Orw=; h=From:To:Subject;
	b=sKLPqz7eQVkGLDEFMUz2YSz0HaPOlYe+6sdAT9XepKI1HnN/mTcyfeT3YOYVgp1Oa
	 nUK6vv21MEANmHVYxDSzGycSDSDd/tZhxrXQ1sWJnq1UrxNajnMdPUliOdf+1+gvKQ
	 t29bvmfoIoc5r5yPbOql/UmLv560YieL8h3tlJciQ4YUEj7OCXTF4syz5lEwh//f51
	 804d3dMHm2IzUHoNhX/XdFfCg900r8GQadF172pTzBExkitgOtiB2/6C4x1Pl0uJLg
	 C81G247ms4N8vuV4XACZawtJltqPJDXJKG20k2FquSgUCmz9IyuU+P9DXVyrelhvV7
	 fh3/AO77zMGFw==
Date: Mon, 27 Apr 2026 12:12:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: gnutls p11-kit in oe-core/master-next
Message-ID: <20260427101228.GA57248@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236002

Hello Richard,
in master-next commit 3f2f565af755 ("Revert "gnutls: Enable p11-kit by default"")
is not reverting just commit d8c97e06c385 ("gnutls: Enable p11-kit by
default"), but it is also reverting commit e9f12f64279c ("gnutls: Add
p11-kit for native builds").

What's the plan there? Is this wanted?

Francesco



