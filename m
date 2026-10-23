Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5516.1792757612961252051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 05:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZSOq4Yd8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5CFB1A12F8
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 12:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A95960398;
	Fri, 23 Oct 2026 12:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99C9A10328DD2;
	Fri, 23 Oct 2026 14:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792757605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G9kq3C0LYV5MQ+cbXRSwj7XjBUD9iiQCPY7ZerLD5yk=;
	b=ZSOq4Yd8qDD9ytRZUrG97gkk0+XcU5AA4ANjC8ThEduubFZSl2tt3p1G7Ph1ytzF8S8oLC
	gbCOKWmqNQiXouU4nogH9kDLt4XMpoUx+rklxdrVAg2/VjUiSPcceGcAMbO0IKXZVkiSOu
	ZezmvP3k+Ou4oqqSTCPrTY+suPSA+dNejtpOxl9d68nyjcouqG2HLsa0qWzhHA/ab/Z2ed
	R+Uvb3i12UrjXqu9xYPLcIw2DFiiIEzEDCpMoi0SURXNhrkQirPaqEaOmrUIer0i2PiNyy
	Atp1EV+eq/OeKB4kO1493s3IE+uJJNnSLXDxfaeWHfH+MbCQxzsPePQkd/Z2lA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 14:13:23 +0200
Message-Id: <DMC7J563H5Y0.3G5XOPFZQCKZO@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-uv-build: Update rustix to 1.1.5
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261023042749.1756636-1-khem.raj@oss.qualcomm.com>
 <20261023042749.1756636-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261023042749.1756636-2-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 12:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248550

On Fri Oct 23, 2026 at 6:27 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
> non-glibc Linux targets, but libc also defines them for musl with its
> musl 1.2 layouts, which are used on riscv32, so the build fails:
>
>   error[E0659]: `STATX_MODE` is ambiguous
>
> rustix 1.1.5 imports them explicitly. Add a patch that updates it in
> Cargo.lock and regenerate python3-uv-build-crates.inc.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

Thanks for the backport.

We have another patch on the list upgrading python3-uv-build to version
0.13.5. Looking at the git log, this version contains the rusix update,
so we can probably skip this patch.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

