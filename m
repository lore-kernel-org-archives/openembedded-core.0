Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4667.1793967618487831089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=u0U/Ewxl;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=uY27mWNG;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 804E0EC01C3
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 07:20:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 06 Nov 2026 07:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793967617;
	 x=1794054017; bh=6pU8RlY7e7ooTD46GLul+gzU8ovvFPrDJi+gq5CFtsU=; b=
	u0U/Ewxl0QpXGTBJvI2196dSSmKsR/DPzvCQD35ULtD/tWM+g/tVMKVQFdud6HfM
	/L3U1SUM3KvUv5KSErn8/oeSG2MBRt2HYCeG8JkvaNzHTCYdwtPhns2iRkF7aexe
	cAW/syhgsYwROGsr4Zd+htyGIdJo0MrgKYKRFy6Ww34W3BHwGjjJXRaNpnTRMx4j
	Dc9udbAYTFLTjukFOYVAi64bsJfwGvHjw6o7hzrHTg7L2V5vB/XATRF8pcnXBgWY
	+bWaLuKnxav8ZU6VXgidpLjg51VRanfyaDPQQ/YkQC3JPU+T8cq0s5J21o4cinG8
	/pKm0JTs3cmkmfKJrnqwfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1793967617; x=1794054017; bh=6
	pU8RlY7e7ooTD46GLul+gzU8ovvFPrDJi+gq5CFtsU=; b=uY27mWNGvdkw+GDV1
	3KnZV2RO1jxDRJpgRiw+3yJABiurQ6VV9gW9Zr7eD5v+ctOm99mQ65E70XpCE7Z1
	VAHT++rkSZmvOg9HyPOZqQ8tb8qCe9oWmcyIBqF7AhJFkKk52CSoAW/zYdXhjvCx
	umhlZj/jiVuNSxjAmbT0qZrVFgpYVJ/RQqXVUgsaQ15T2Ybx+BmWqpfTiMjU+xF4
	up9ccs1Rvdso5UG9w+i2FHUG02NkmX83/oXVpknj1WIwQf/vH81ohaReaWJIrxMM
	h6CZKlc17kNUfLUglffuYQ0XIO7ij88JXrx1HNndB462iyEQ6dNU5CTH2TFz0YJc
	eKuPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793967617; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:j/0NYyq/0loMsWmlAvctepMIGRRHmR6XpApQECU0Gm2Qv7G
	kteQ4hluRm5IXvEcnhbbz/kaLS7ynSU0hz9hVGBt5pivRSTWySwi1GX3j4KODBJF
	dz/fO1yoGhJyq4oQj/PzZJUBorLE9W6bk+ileUQNdSWkoepO5SZB2M5Jc6mrdI3t
	TOCU87gQ87WGt5y8cRXc5fi3JD/aVU+SDBIAPdXUMzyFDrNWcC1IEzriloVw/yqZ
	XxUU7BgdaWQsiSdSli8/2Dtgt2F2aKsV1xEMbbnrbKXUGuEhuNkOAGUhgSB0+dBs
	D/rYc2lYI4FmEY/Ro4l0GlgUYlKhL1RHNT2BZWA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OmoRePcgOCbeWs5saEVWo43lF7VpVH45mZIKnUf33ak=:ps2T7EVrF9hcU3AntJfmIoOHbGN0TfwGancBPaOtRlE=;
X-ME-Sender: <xms:Acbtarex66N-Pm3hn6qrLvECLPta9QNHY7MtjJT8EjAmq74Te3StyA>
    <xme:AcbtahYLAkhElXR0GiMk6jfkr1GsgH4AeU6A4PphGdoJi7Q5RsZzRyibe8tunFD_Y
    vxNNAvImO3KljaFYbPjBtdb4A-tWR8W1L_KGXV4XROCCam9qRhdgpBW>
X-ME-Received: <xmr:AcbtamXF9vKRlDbWI1aoMaBnfIt-2_lUYcAFBvy_oebQ1CMWFn6g6ntcyLxrCrLNZntWpBSs2vL9eGukpf7k1J0kGihy>
X-ME-Proxy-Cause: dmFkZTFrHvkAyJdpA8xooQqi+JHj9yDgoKrohDRO8qJloKfldoWAhOecglMhDlvNaLbsss
    lDPcFtaNfCTq0sRtQ3Zgh4rAzWodEs4MUvjYIPmxq1KaTBjIXrNfoHpdxX3u650fiUcYcU
    OVi9PUHQHhYckwqJQ2YOpLN83a6xHiCSXR7Hyy2R6T3dunT8pQvvqvRxynwdFDZ0Di/2U4
    0knYpU1MBKq9GSq/y+p/AJ8Q9V+2Ux5zDeZ0KCygvnJZUZ/wodQOHH0tdbzC727oJ0cCgT
    7z394qdQTRwhaX8px0RhNDOkzD0g3DkGaLo6pAuVDNSVEfVzgPJytorMJ3+mrqGBLKuFGq
    qdMwcGTfpcg4raLbGihIYuHOwSv2Mop6v2FeGJxTqSj7SNbI7ttLhH0U/wI6d+f+vE+U7a
    IuGmpbELSp/e22YEOWMG5nELn6zYaGKunuchKnX2fhTCDS5ilwabFseeLVsrC3LoZ0tCSj
    4yfwkGBHRkqy77v5AAIlfKPs5x4Ikl/E7/x4YLthYq2I+ndhjHVl7lyM+L7EUT1BXhglEx
    rTJRqSGOa3xucm2ysRx3FfeOsHyHrvuFfmYZHbWMZgtWtz/Lt2mmUfcHduNJe43dZnL5/6
    Ol2myxtQGxM4ngeyCditYMfrwwKn/a74SiJcDugCHhUvUGoVYSLM05+lFRwQ
X-ME-Proxy: <xmx:AcbtarhHTaHWSWtgZUQLNBzHohfrkFKCfZ6l-XThfBfvUCpV1fuwJQ>
    <xmx:AcbtasXEjmfyf-CoLnRutkjD41TldgRziBSgWKlvBAiCbbBEttPbSw>
    <xmx:AcbtaqN4w3MaKROUZUDiOeiTgWR5A663u6V9N3nLsaCpe58rJYSqXQ>
    <xmx:AcbtagbHsirJMjcLYHEQllF7oBC9VdL52vQzpj38Ya5fSfWRUgkdbQ>
    <xmx:AcbtapHxaNOTRJFBl9i1usGLzq2fsYYgW9l7kCmRzBchf5Z7vA2s1uaO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 07:20:16 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 12:20:14 +0000
Message-Id: <DMO4G0Y6A3J0.3IIU7DV1YG5W6@pbarker.dev>
Subject: Re: [DRAFT PATCH v3 1/2] spdx: add entries for meta-layers
From: "Paul Barker" <paul@pbarker.dev>
To: "Daniel Wagenknecht" <dwagenknecht@emlix.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260915130509.2184318-1-dwagenknecht@emlix.com>
 <20261106115455.4141199-1-dwagenknecht@emlix.com>
 <20261106115455.4141199-2-dwagenknecht@emlix.com>
In-Reply-To: <20261106115455.4141199-2-dwagenknecht@emlix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249639

On Fri Nov 6, 2026 at 11:54 AM GMT, Daniel Wagenknecht wrote:
> This adds support for determining the revision and downloadLocation of
> meta-layers and adds them to the OE generated SPDX document.
>
> This downloadLocation will result in a NOASSERTION entry if
> * the meta-layer is not in a git repo
> * the git repo is dirty
> * the git remote does not have a valid URL
> * the git remote does not contain the used revision as far as can be
>   eluded from the local repo
>
> Variables to configure the behavior:
> * SPDX_LAYER_REMOTE (default: origin): select the name of the git remote
>   to use for layers. Set to an empty string to always return NOASSERTION
> * SPDX_LAYER_REMOTE_layername: override SPDX_LAYER_REMOTE for a specific
>   layer
> * SPDX_REQUIRE_LAYER_ASSERTION: set to true to fail a build if
>   determining downloadLocation fails for any layer
>
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>

Hi Daniel,

I don't think downloadLocation should be populated by default, it may
refer to an internal network location for an organisations' private
repositories and leaking those URLs may not be desired.

This probably needs to be opt-in.

Best regards,

--=20
Paul Barker

