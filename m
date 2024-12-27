Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC00DE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 08:55:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.10051.1735289740699344977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 00:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l5q3dl4K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EEF1C0002;
	Fri, 27 Dec 2024 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735289739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bEyE6f1IFRPB9y+z0TqQG5sYDb/vkioeKBkmauoo8k=;
	b=l5q3dl4K8KpXj8GzCwzR3ioYBw+WVa7h9JMZhiGb2BtWQEzPrI/x7xqm+G2vvpyaDGVF4Y
	5OJ5RMjd6sZ8x6jMkJDwivV4m9K9QtnApZzntqr2s1WHnh+8KHfHEAKd5LB1QUEQ7i95f8
	9eKEz0A/OdsD2mTBcgXOvqHBOoAFNfpD0bSwLbg93Z1httpauPqM+YCafN00toKNZLzu1G
	GVjEo/Bk2VtHjzneD801/L1z5+VfRrkddf+nK4gJyRtn7ISoA8UBEVUOB6kQJwEV0DXSbT
	8JxXQRzISUTvp351GnwF8bbzHCvRsbrOucnIRFGJD/39B8u+DfNQ859cn0PitA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Dec 2024 09:55:38 +0100
Message-Id: <D6MCVGGU83OZ.1NYAD8RHIPNGH@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/lib/oe/spdx30_tasks.py: set license
 alias to hasConcludedLicense relationship
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241226054321.143382-1-hongxu.jia@windriver.com>
In-Reply-To: <20241226054321.143382-1-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 08:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209100

On Thu Dec 26, 2024 at 6:43 AM CET, hongxu via lists.openembedded.org wrote=
:
> Set license alias other than spdxId to hasConcludedLicense relationship
>
> $ echo 'MACHINE =3D "qemux86-64"' >> conf/local.conf
> $ bitbake shadow
> $ In tmp/deploy/spdx/3.0.1/corei7-64/recipes/recipe-shadow.spdx.json
> Before this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee=
/source/8",
>       "relationshipType": "hasConcludedLicense",
>       "to": [
>         "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a40=
5441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee/licen=
se/3_24_0/BSD-3-Clause"
>       ]
>     },
> ...
>
> After this commit
> ...
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99=
b12a405441/c34a0920c2f689375e786a80ab3176b844997d543b73dd5f99e6ffa8fcc72fee=
/source/8",
>       "relationshipType": "hasConcludedLicense",
>       "to": [
>         "http://spdxdocs.org/openembedded-alias/by-doc-hash/cc72db638e3f8=
e283e722af0ecc77d19f93cc6736700ee76477e3773b6b07b05/shadow/UNIHASH/license/=
3_24_0/BSD-3-Clause"
>       ]
>     },
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Just to let you know, I took both this series and the other one, and I
had a successful build on the autobuilder, without any of the SPDX
warnings we had previously.

So I believe issues are now solved.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


