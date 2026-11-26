Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13765.1795699665877537761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=SNGWnd3y;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=MOy2BmOh;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0A62814002CF
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:27:45 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 26 Nov 2026 08:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795699664;
	 x=1795786064; bh=9+hf7eek175MNvhJWb+QKO98/xMdM+Nnp1T6qk8nQCM=; b=
	SNGWnd3yswDsNIpc9pXtvyPa60JvwoIKIX6fqPTxFnDajwTzsZKckxeOL9UZldPJ
	N0mChHTz+bHJ/MltnJse7/NsRORrisO7a8sK7l2AeCIipe7xVDOXYykLLVRwryhB
	xKB5i21GI5RIi1nnMKxnE3jF1GisRU/SSXfnLr+f0TBuCiyZtKthIHoeLTh358Tz
	41LuVQ8JcF9e97E6cCn2U/iHYeJSL8CiyMBfLqcA/BtghOdlJJ8Am9fa615koMR9
	jpRtJxGAs/YrqM8V/3rmkpnVtcBodR6I/Oq53Bx3k1oe6PvT3WTPX5Mlo8oRLN+Z
	bsIwl+bjuZPiTBPmEYsegQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795699664; x=
	1795786064; bh=9+hf7eek175MNvhJWb+QKO98/xMdM+Nnp1T6qk8nQCM=; b=M
	Oy2BmOhZfKpmUy/XjTTiE3PyK6DlmkEkz9R+S3wCFvxnDUyJuQIXhDGPzBR/qcYy
	mgFRz0YCOnNcdzKsu9b+7fG4DLomXTz2W6lqcjK8Za5/QkhCMsuE0oXnX9irl8z8
	16/USxm3P/uot22gMkoqW/BM6n0wy69TYeSc+Vw+ZyJHA/ossyzJBgsNl5uCIaPO
	g0AmwOBKvTNfNoMqzB5bp2OOMuL1IJEQQlRBhwK6Dz9z0e7bEZ4CK57TudkMpf4y
	pgpbiofd5DsGAjM4StbdjhvjGK5aaEolTRNrxO1MyM9GxyXvkQ7L/TC8KcJUPqU7
	rMgxNSqHFCY7nRCRc++aA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795699664; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:MjfbA7YflAI+LfavAPnLJsbuKxeQbkPlzBUVtoHoWoApHL5
	gg8Ae/wgXMU1lVzMQ0F7PFLWDVlamiD3eAljisLsS/m3wTuGRymSfry2g2J1GP4F
	fkxdqUQvERtgzoIDh+V4TSLUmz2C3ol383+mGvOanuoKDuKl44Zg0Cy3yKQpys9Z
	nJ1CXSfklZHUy7fPde88/tf+PqDys/2U172Yo9uXsiRvgK4xl5t9D2q0/0Z6WX+H
	LfHqMqps80qg9jbvkweIB6z+ionxQAuvpqu9JHVENSYYOu3HPeVCuPE66+8dFbcd
	cMm9VdS9R4pwKn7i3kt2uoWH0NVFXlrKuNkKUyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:b1FrCwui9LZhlZpBhOT7x9k4t0QPluIPB8EO763xDvQ=:oZSgXhxX/VmuZGg9Xia2wuWg8bWXYalzT29mwLhOcpc=;
X-ME-Sender: <xms:0DMIa1GYUv6FyI1RcgJnr2NpGNt2MyiXWC2atAnNgG0tKl_dlJtQ6g>
    <xme:0DMIa86AY1nS53bClmA31iL7tC5yxh8_keytstN48cmoVWpS3F0-20qev-25zvG2d
    -nC9TYwf468ubK9kNGw4BRdW9rj6HFKZc7OWTrF3lIL2B1VLQEMRxQ>
X-ME-Received: <xmr:0DMIa6zAHF5y2wZIyTn7EXEZClOKMw8SR_GH_6x_1uSR9JbFEplczQVsXs8S9ttS_hjr5ECoan5HV_WufwMsMakY1Os0>
X-ME-Proxy-Cause: dmFkZTGb3hHqodZAWbg/EJ+vbA8mYM9EnLmPLJp6+vI+L3i2K389uOz49vLGjJr9WwEJ+l
    5ugjO6+uXWte/Gj1U8woivII/LqJtuGfZRfTAL3dDrKaw9mQWEK/61WokSr8Kj2CYeqyBZ
    cPRPKroedRZtErn4UJIDqgfx/98cLzyl391iU7+eovvd223eS4axVSehiROabFB0O3FNYn
    LQyTOMnEzOkbG4VtufEoFl/PTwZjibShtGVT/wK4ZQ0wa8mHxfgpo0w62Qve34a3yqoe8M
    mgesIqiffMfRNTND8dShW3qOFB6xUcfa26OLcLQ833UJiXEjSrYLxI8uB5YaG+7393XbgY
    0tzJcryCWR8ie0QvicGZtEuXsjFcDE5LhFZ5bwGxWtQ/q+RT0KdgzUwT4NJIcLtsdUWZk8
    DhrM/IdH/KT+h3WJq2R+Gky5SPkjsKOTvn2iYflh7lOYBaGTWVLOkeSrPWXr6/tzrnwACK
    TMgVs59kyxc7tRO1pLUg160SZrqiQlIr9vW9geJLbgdPBXlbB0yCw+ynUubGtZg4jMmD+P
    BGjRWVvp+UUfBjWP3s7P1W4cKL7vdmZLdvT/07O8Fkbucc+BI/IPobc/F5BrLmakDOszp8
    Y0f2ORHPU6pYgEOmnEhrgsDxFZ6HXyaTYNsSCsTOzyekVe9d1U29qSR3sQpQ
X-ME-Proxy: <xmx:0DMIa7NGdbvVboqoH6oN1x1dSi1XvnKfjjkHUkbKfYJQVRAXF9O3QQ>
    <xmx:0DMIawkc-Bb6VPrfz99hURFkypqH5T6ULLo6xzUgXxML1q2re62mBQ>
    <xmx:0DMIawS8wWiIVJ_om8LavXhqacQhlCDLupjukj7y5wjTdTI_BFZK-A>
    <xmx:0DMIa_WhHz6aj340xu306InBkmV4U-cCYTn9UR-MAq539oT5fkU6kA>
    <xmx:0DMIayIXJAPwPynetrHfsN-Ox4fzJLwdfO5KzScAokEsXm3Pyr_yLocN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 08:27:43 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 13:27:42 +0000
Message-Id: <DN56EKP8RI3N.UY4F4DI6PFGI@pbarker.dev>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Joshua Watt" <JPEWhacker@gmail.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Stefan Herbrechtsmeier"
 <stefan.herbrechtsmeier@weidmueller.com>, "Paul Barker" <paul@pbarker.dev>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Peter Marko"
 <peter.marko@siemens.com>, <stefano.tondo.ext@siemens.com>
Subject: Re: [PATCH v4 4/4] oeqa/selftest: spdx: Test crate identity, scope
 and output PURLs
From: "Paul Barker" <paul@pbarker.dev>
X-Mailer: aerc 0.22.0
References: <20261125183613.1335718-1-stondo@gmail.com>
 <20261125183613.1335718-5-stondo@gmail.com>
In-Reply-To: <20261125183613.1335718-5-stondo@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251302

On Wed Nov 25, 2026 at 6:36 PM GMT, Stefano Tondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> python3-bcrypt fetches 42 crates. The new tests check three things:
>
> - Each crate download has its name, version and PURL.
> - Each crate download has a lifecycle scope, or an annotation that it
>   is not built.
> - The output package gets the PURLs of the runtime crates only.
>
> A fourth test checks rpm-sequoia, which builds with the feature
> crypto-openssl instead of its default features: the download of
> openssl-sys must have the runtime scope.
>
> The tests name only crates that do not change on recipe upgrades.
> blowfish is the cipher of bcrypt. Only the pyo3 proc-macros use syn,
> at build time. openssl-sys is the OpenSSL binding of the
> crypto-openssl backend. The other checks do not use crate names.

Hi Stefano,

I think this needs to be a simpler test recipe, preferably one with a
fixed version to avoid it failing due to future upgrades. I know you've
already replied to my previous email, but I'm not so sure that the
dependencies of python3-bcrypt will always remain as this test case
expects.

Perhaps we should use an artificial test recipe here instead.

Best regards,

--=20
Paul Barker

