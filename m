Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13692.1795699444970904361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Y2isZdvD;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=VUj4Pvtj;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1A4BF14002D5
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:24:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 26 Nov 2026 08:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795699444;
	 x=1795785844; bh=ZDb37xVJh0knt/iVBrLqhD4g3Oq3fc0vIYu1oaX8CRo=; b=
	Y2isZdvDI5a6dpnQ8+Bul7xnHy73fy7Dmhpa5hZierw0uIu1LSZLrii659xl2W1q
	6wNgQvm5zh0zfLkeT234/OHCs8iH9IW1mVhTsFizYyIVt53MO2TK39DOR8ffhlkv
	yK3xGLmpI05NEF4X6yTdPO/HOenu1Jm1wqys7cb5QeGTMnHjRKM0WCkTBvgjG10d
	+vsYAB9yoPuiMhuho688DH1g42VxKAP56Rxnuk8PjHBNlmMF9ucCTR03LyiuS8HF
	JgisO0nc6+A0HBEbxgTPkGuFb2MbxnguWE1KCGul+26eXdqk32wNSuILZc+3B3Me
	cjsaGiua3T7QQptGAPfukg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795699444; x=
	1795785844; bh=ZDb37xVJh0knt/iVBrLqhD4g3Oq3fc0vIYu1oaX8CRo=; b=V
	Uj4PvtjYOk1WP+pb1SN2xB3P0AfCnq1qne0u6oGwOpKOqRPfe46bdCo49S3PYEgg
	Ej+BrmFjHYkoRPI8ZdEQ9fWUDsQUeDIiv7b0y2ZkUKEgm3WfB0XhzL4jrzSgnQxV
	A24vQKf3RI3OdTAzh3Jn+7B963FSAxP0kyTvJnwlK6XYRbsMs5L9g4EYRJNgnmQF
	ZMZyTFblV9T7ookhQEFNO8jE+lQjoHd5TXG74SaE8wTKdu+t3yT5ugMGCfiU743N
	btvUOjjpVQpNmStsFDtwOsl4gT+9YkoCPl8oUV/LYh8jdc76w2i4weKt0l1BZQPk
	NJ9BqRcE8vzsMv0upuPzg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795699444; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:A27v4WBDwwu0h8vmTyx8oclc06TTCooeevzh4gIvceruMv2
	lOCYeQRGusuTmk2vCDTqMM9YunPofiVtvEGkxNIPVJh6kNujETH8DdOxkHRIAzcy
	22oP688OAFyLgKumz8HT1Jj2UToy+foznuBj6uKYeypuM9M3uqDbMPtsHb+XWm9/
	NwozFXC41ReI/r/XiA0/pzJWHSrUGtrpxnBjEk3sXuIxzFiT8UZGzuxQ3YVRn8Hu
	M5cldIA0gOmnbpw1DpOnUqX+P6VkmbvKa5Tbow0UrKPve5Ddhz9HeMhLkGVcVah/
	e+MKgbJ2MZWvhNY2y/RqaBq5Y76UPhyEyqXGmIw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:euQoMgaFuDB9rg/OpZzFhl6G9ZlfBeK5z89XJr2Ud9A=:ZDb37xVJh0knt/iVBrLqhD4g3Oq3fc0vIYu1oaX8CRo=;
X-ME-Sender: <xms:8zIIa-_i7fyCiTTwMSUHvG06ACT34WQgkGEdFPlzVOw3d3YLm7w7mA>
    <xme:8zIIaxQ6NBTJ8PO3qY1avZOPWHlqQ6dnFkhMV2Fv_JI885Km2GAhcmo5unZo_pNoB
    CYm1itTCWWpaXrKLqa_omq4LZv_-xk4iF79DJZvbMNZvgcZGYJ3pBD2>
X-ME-Received: <xmr:8zIIa3qH-O8gDGeFEXKdb9Xuj50ZafczJkaJvgfkKJPsyKc7dkPp8ZWdVW9wItO9JcxVNz2LQXGnPFYZTeUhhJSGIqeh>
X-ME-Proxy-Cause: dmFkZTGn4cZK7958bs5a8BJIPZBmYfgKvSjc5QrTNndjZsWslsKKB4c9fBnIr0Aa82mFpO
    kYtdFmypxygU5qxt4G1tMREJyS3DsNfCb4qOeJ5r/UDeuKQ/8eVGf0pND+wnTkinbdfehx
    kwCNpufZxbLLdRVxouGcLMSRHXouNj3JOHfvH7CgwYoPqZo5+ggDU2V7y8ay1tI9bTHo2W
    KW9yN525OfgLO06QyhKUqW9NUEV7BXjc1ogNRyaWCxmCjG4krUVm2IfBTvE0c1zwvlMbp0
    i/TaIismN+B6je4NeVzIz3NpNeK1pcAkt2lDK9It1aL8NrZvz+12nB80R+jZPVSuT3jPRB
    yTr/7IGBQJ2fxvr+F9lFh93qYyKL/JuSFYi5mTbxtybXRMWqfoZ768jSX6CuBECe5ApQ4H
    uK4wM1vEtou+Dnp8utbFOUj37w8X3YVcOEM2o15Y34VmSfqV+z8EN4LYrppd9IkoLjvr6+
    3Rb5SlPxwS24C6Lngk+69oshsgGrzWSKIjsjs7IBI3BnrtlmQrKBxCSYFblnk63ro8Ca+n
    G19+rItQ6ifcV5YMdAHtwOB7k7hQR91Jq7pL4C/3tCKbRbYq4p8GBFfwQBCd9cKTdmugrY
    ykhC6+mtDLYkx+YI1b/h03bYCRsXfBgEyi17yVYcU7+bFyDFBBkgQveP655w
X-ME-Proxy: <xmx:8zIIa2kAjjSr6Vpod8P1o3xCHeGp9hv7yUQKoCl1GxvqnGgzYasnpA>
    <xmx:8zIIa4eyIOUzyzSXyG1J7Ke_KcexbP78YLoqSaya9WLq9FHtM8D78Q>
    <xmx:8zIIa6oDZ6cIRFSKYd7wbG_08_ipsyn9wyeVSWEqe-sdzZsaCOjLCQ>
    <xmx:8zIIa6NH5mk-emAYzvorLepWR8qeJZ79Ak3VGpPghYHSQYJiuIeOfg>
    <xmx:9DIIa6ixM7yuIfxB0ioC4VBwHwfKrvCthFSu7l2J5j2c-q-6kz8oJ9w9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 08:24:02 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 13:24:01 +0000
Message-Id: <DN56BR66WII7.34FC67CIINIBB@pbarker.dev>
Subject: Re: [PATCH v4 2/4] spdx30: Record the lifecycle scope of
 dependencies
From: "Paul Barker" <paul@pbarker.dev>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Joshua Watt" <JPEWhacker@gmail.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Stefan Herbrechtsmeier"
 <stefan.herbrechtsmeier@weidmueller.com>, "Paul Barker" <paul@pbarker.dev>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Peter Marko"
 <peter.marko@siemens.com>, <stefano.tondo.ext@siemens.com>
X-Mailer: aerc 0.22.0
References: <20261125183613.1335718-1-stondo@gmail.com>
 <20261125183613.1335718-3-stondo@gmail.com>
In-Reply-To: <20261125183613.1335718-3-stondo@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251300

On Wed Nov 25, 2026 at 6:36 PM GMT, Stefano Tondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> A Cargo.lock file lists the crates for all targets, and some crates
> only run at build time (build scripts, proc-macros and the crates
> they use). The fetcher downloads all of them, but only some end up in
> the binary.
>
> Add the variable SPDX_DEPENDENCY_SCOPE_FUNCS. A class adds a function
> to it that gives the downloads of a recipe a lifecycle scope. The
> create_spdx task links the build to each download with a scoped
> dependsOn relationship: runtime, build or test. A download that is
> fetched but not used on the target gets an annotation instead. The
> SPDX code does not read the files of a package manager.
>
> For Cargo, add a do_cargo_metadata task that writes the dependency
> graph for the target with cargo metadata --filter-platform, and the
> scope function oe.rust.cargo_dependency_scopes() that reads it. The
> graph has all features, because a recipe can enable features in
> several places (CARGO_BUILD_FLAGS, PACKAGECONFIG, pyproject.toml). So
> a crate counts as not used on the target only when no feature uses
> it. If cargo cannot give the graph, the task does not fail, and the
> crate downloads get no scope.
>
> The walk expands each workspace member only once. Members can depend
> on each other in a cycle, and a member can be a dev dependency of
> itself, as uv-preview is in python3-uv-build.
>
> Add unit tests for the scopes, with member cycles.

Hi Stefano,

This is an interesting patch, and I can see the value in tracking the
"lifecycle scope" for each dependency. That is a whole new concept to
add to recipes though.

I think this needs a proposal on the openembedded-architecture mailing
list [1], so that the design can be discussed.

[1]: https://lists.openembedded.org/g/openembedded-architecture

Best regards,

--=20
Paul Barker

