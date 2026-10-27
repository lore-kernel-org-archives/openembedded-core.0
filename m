Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14023.1793089009615288593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uuaURnHJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B98DF1A1367;
	Tue, 27 Oct 2026 08:16:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED44603BD;
	Tue, 27 Oct 2026 08:16:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AFCC10329044;
	Tue, 27 Oct 2026 09:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793089007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UcHbMtPxlvdnBTLMWOeELjDiHAlPw6g3j4gL0TM1urg=;
	b=uuaURnHJZ0Ii1fWejrPUcc4up0ckl+OL0KXnQC2QNTwGHa82c5Rj/UwS61EyKcFMIVVVYV
	fEmPqJ39ELhfoaPOdIXaeAfCTAo7KhMI9s3IZ2tOOITe1WszyBhqx+s+5IuvZPEfnsH4rj
	dAAvKn/3MFUwGz9eAQ0jNlVjLpYEKAC1BDr8RnG4oGuOC2V86WNDDsXrVZg9TZUMpRUTzt
	5jJLs4ni0q59yxt51mxZnEfi2cydgaIeNJcOq0p0L5f5spUIrVQh/hVaHCj+rLo6VrLvUU
	QgFt8ch7Wr/2r1sW9oyyhTAXVY0hdAhxQ5luLj+QnATbmt0OY3us8XcrQZHnRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 09:16:44 +0100
Message-Id: <DMFH04O6U4SD.23GTK0R8VRCA2@bootlin.com>
Subject: Re: [OE-core] [PATCH 11/12] python3-pycryptodome: upgrade 3.24.1 ->
 4.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
 <20261026103138.3137-11-jaipaul.cheernam@est.tech>
In-Reply-To: <20261026103138.3137-11-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248718

On Mon Oct 26, 2026 at 11:31 AM CET, Jaipaul Cheernam wrote:
> From: Upgrade Helper <auh@yoctoproject.org>
>
> ChangeLog: https://www.pycryptodome.org/src/changelog#october-2026
>            https://github.com/Legrandin/pycryptodome/blob/v4.2.0/Changelo=
g.rst#420-24-october-2026
>
> License-Update: Update to license text [1], [2] and [3]
>
> [1] https://github.com/Legrandin/pycryptodome/commit/65aa57f08db0afb1a3d3=
887164a0027654b55931
> [2] https://github.com/Legrandin/pycryptodome/commit/43b28d7170ccebfc51c9=
148e723aa881fb32a1dc
> [3] https://github.com/Legrandin/pycryptodome/commit/04a1ad1d286eb843ac62=
abfc05ed58df99eaf27b
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for your patch.

Should you upgrade the pycryptodomex recipe at the same time? Both
recipes include python-pycryptodome.inc, so now we have a QA error:

NOTE: recipe python3-pycryptodomex-3.24.1-r0: task do_populate_lic: Started
ERROR: python3-pycryptodomex-3.24.1-r0 do_populate_lic: QA Issue: python3-p=
ycryptodomex: The LIC_FILES_CHKSUM does not match for file://LICENSE.rst;md=
5=3Da514b4a7ad24677ae50f3becb03404e3
python3-pycryptodomex: The new md5 checksum is 29242a70410a4eeff488a28164e7=
ab93
python3-pycryptodomex: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4922

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

