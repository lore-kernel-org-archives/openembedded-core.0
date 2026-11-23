Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53735.1795441147253834066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CmOeCO9o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F09174E41698;
	Mon, 23 Nov 2026 13:39:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5069601E1;
	Mon, 23 Nov 2026 13:39:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFFB911E6A458;
	Mon, 23 Nov 2026 14:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795441140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pc8wj5zDMaqtZ4+Ao6u66BfcrY51PytBHKT3ix2+c1E=;
	b=CmOeCO9oLNRU6HTcs9CmY9ZxrTcJCOHzEi0zdDQ9znzJC5mZvGg3fMWBjP1FMtHBMI/3/X
	RfdGnsGMU/3A6qDEeVTcr6RQzEPGM41WH7kJbHLx2AwhBZmZ1pIU1IS1+3DM7ekLUVGs8o
	YVK78Oeg/yyjQEYHoZu6T7AumizVcQsyS1l3iv0Hs/7IhVRDjXnp9UzITegY7AFL8cHMtX
	m91GAZRLPysSi/s7sWySTkCj4bkpoK9LKlQJ2lI4WsQLWhP+EIaMmPkSYOjZ5J68niPj8K
	H2GsTogxBIUdAYO4u7vpCHjO9GRhqqZVfTLmkjiQBGXLYP2v1h+V1RXuLz5tdg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:38:57 +0100
Message-Id: <DN2MRJRYBUW3.LO3D9FVVIEJX@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 00/18] devtool: ide-sdk: add support for
 Rust recipes
Cc: <openembedded-core@lists.openembedded.org>, "Adrian Freihofer"
 <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Enguerrand de Ribaucourt"
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, "Adrian Freihofer"
 <adrian.freihofer@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com> <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com> <CAB3asfiNShsoU4MzCjkUieDaBqs36MiGLuV6oLb7K1tX3ufbTw@mail.gmail.com> <72b94c28-8f93-4c2d-8423-d63f6c093552@savoirfairelinux.com> <DN1PPP14OJFU.2WACOJI87M8F5@bootlin.com>
In-Reply-To: <DN1PPP14OJFU.2WACOJI87M8F5@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250920

> I'm adding this series back into my branch, we will see how often the
> test fails. This mean I will probably open a bug report to track the
> corresponding test failures.

Here: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16534

My first thought is it does happen a bit too often to be merged as-is, I
will keep the patches in my branch a bit longer to have more data.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

