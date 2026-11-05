Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36459.1793890987714393148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 07:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=n9G+sLk4;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=dida0lzM;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id EDC311D00064
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 10:03:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 05 Nov 2026 10:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793890986;
	 x=1793977386; bh=W4m59CeAINAEc/apG6Vbq9IOHB5S3vgtYADqDF9F9F0=; b=
	n9G+sLk4kCFNoFcKk8IecDim5pfLFP7h6a/Vms4zVmVcNBi86pYNEkiKpUbP6Kex
	NIHqHZObdkVLfLIm/myWR0ohK7+xssO9IPurLWzl0A3e6totlmjzyXGDZpkHdTFM
	ndgtehZlcTEqpa8L1H1QR3H1Ma6sGcr+/She4HSIgooYgdGWClkbovQ/4YEo9ojr
	SIud8AMwQnfU6zVstdAbsVlhhZ95B9Filn19Ap+pXkk/jJ2ayQOy1w2BpmLjJFjr
	OMTuKHe9KrOmHQPtMvtZ0GL1NphYWfPs2Q3EOiv52Is6QlXCfVDL36x29shz6XL3
	PZZiB/w8RGp3eNvc7VKr6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793890986; x=
	1793977386; bh=W4m59CeAINAEc/apG6Vbq9IOHB5S3vgtYADqDF9F9F0=; b=d
	ida0lzMjrzgogFGVE2xqHpKkGj+MLKOaDuTPw8HLnpC8h0o0cEtfzfC7zQMf/OX/
	G0ThDEd3ra1tBGFI3KdDYNX0KlTSoj2z04yFHLw8U2Mkdp+nWO0JgZKQ8wOqCb4Y
	lNuxIeL4trhvJ5PppbQYQW2lZVE9LJBQj0GjM+D4G7661zQl5OIsKPo5lf7EA22O
	jUEDBLuTrePv4jdsTDUHVRc3L0zlJ9/QZvoKaaG9DcxQVnueZCeKvawmnOZe5o7P
	jGkUh1GnFEsgKdrXf/xDbThWrkTSB0Hs+CcQ4213UhmEfiryHSHvedjDDamGOIl1
	VC7npIQhVDhl1ThXiNfmw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793890986; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:fygCjK6Q4hUf7xLl2vziD+7HkCcYmdAM7mVAHWHMi3VFXpI
	irBRnTRgQoFIng2KombrgZI3TYEogybrfrGgCNwlIzyN3CMV2JrY1RuQTFaa5nO4
	/kDncnQuiuR/QWKY3AjQsjrIcvDiT44W/jW5/wieBMFthflrtccDjKdyoWrNdAHs
	EHmQ4XI3+1BmMyuYwOh3mk6A2rUmcj11UBHVO9Ktsjmtc6RiAV68ch7lzXSdfr3x
	Q6mbR67guLYYdTJe7SUdbVDoHt8BOUq0SW4m0bpVrCtmgsj9N46cCqy7hhxp57c8
	U48BrMGG1etR03KcE/Zq2bAcs8X3isM7LXlvfFQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2EFP3phIcOtVd6gOxfeBxRGicWjzC8zVhKep/8e5st4=:W4m59CeAINAEc/apG6Vbq9IOHB5S3vgtYADqDF9F9F0=;
X-ME-Sender: <xms:qprsamSfvry9OLnALvNX5S09zTF8GL6uX6-Krgp52qyWZfA34kjTBA>
    <xme:qprsajg5WDHa5Fkj67ZtuHh1k8xtxJIvH35rCbUDAu7dumCP3jgY28wfuu1X5zlY5
    G0J_p3INxI4nRnV_SydiEmciMJqfDJQyeE8tSue05GV595QxzvyApI>
X-ME-Received: <xmr:qprsam4o-v9y1pdhJBtxazqutCdUYSYYcrPLluG_cUvVyOPKWEzpIjY2g-Np1bBCR4-9-1vouFGuJL07ZtnL7tf6Bf_x>
X-ME-Proxy-Cause: dmFkZTGIrx7RO/vDZt3tqdH2B6tCWIBdJ0Qsl8JXIw2feLJCyG5eNlxV0Dn+bUFh1dg3oK
    q98Kay18MmzfmENbYadc/mQL5R2sM2HHXaYKHcrC5X4pGOXcKzYbqvSqx+JL5h5TcoDhq8
    8n4KbvwNDd3f0nUpbFaV2Dc5pSIJGSMb/ZCornnWKo7mqxLsQB66Z8VmV8ylGFWtUNvX92
    +J99nVPXs9lIWWn+lMrsAfxfZwSnmIGiuq0mH8SnWnv+PPjz4eubwSK/BgPeYFaKWkw9Ht
    2dWRbDYMAT82s0YJzHCfj4h31WyLdZWUANn30DbrbSQT2HDHu4KrLpifQpzHDxG2h3DgPc
    pmKpJIW6jNd0fJSP+TUTI3Mzfh1Jzt+H/3tYnUfmQqYWSqdqcwc5ndr3LsekSIaXF4UUoP
    NBa5NUD5MEC0lo5RBw0cYr9EkiC55wWbGTmA/P3DNczsKnjCNFNFf28HoG/plxiXjfxbkO
    3nwUP+P+zTjLq2ZE4Dq7Xte8M00V6mZwvFu2uuYoqme20qpah0lw0J5qcZ6UlRshnkX63D
    hk6IvM+Nujm5b4+fKg1dvdX2u7DGKLNDjPuIcNKifY+FSee0Igg0OzcpnnMKomq2XO207z
    ZaCjeKOPlVTXt0SZpGABehx0f3T3LTGNdsiNmjmumamxYjsZzO5YU1tE1tIg
X-ME-Proxy: <xmx:qprsagCMz3FH34_vw0H3tqcbTG3ustmptE3sAmQ2MxF-hG5wIc9K8A>
    <xmx:qprsatal-WoFpEfClu43lJwjZhpfVYRk3oW2_r6O7FnXq9OY3UUDRA>
    <xmx:qprsaragwK-eEX0DiWg3ca1YW3mgKaK3noUKP4r7LYv2MqYaC3pvSg>
    <xmx:qprsak__GU8H010gAolWBkcpqVN3HzMDLKICC_GNMiLBy3SlWr5j_g>
    <xmx:qprsasAG1VPezyyjbzovt7-ZnE0YYY9ZN8kdGTq-ggS1HcycA4i-6OXf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 10:03:05 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 15:03:04 +0000
Message-Id: <DMNDA5FMY9UQ.1GQQ7M7RMMVH4@pbarker.dev>
To: "Prasanth R" <ragaprasanth@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Prasanth R" <prasanth.r@lineo.co.jp>
Subject: Re: [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-76844
From: "Paul Barker" <paul@pbarker.dev>
X-Mailer: aerc 0.22.0
References: <20261030050531.720920-1-prasanth.r@lineo.co.jp>
In-Reply-To: <20261030050531.720920-1-prasanth.r@lineo.co.jp>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 15:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249562

On Fri Oct 30, 2026 at 5:05 AM GMT, Prasanth R wrote:
> From: Prasanth R <ragaprasanth@gmail.com>
>
> Backport the upstream fix. It covers both CVEs.
> CVE-2026-85091 & CVE-2026-76844

Hi Prasanth,

This troubled me as two CVE ids shouldn't really be pointing at a single
simple fix. So I looked into it some more...

CVE-2026-76844 currently points at zlib in error [1], so this one should
be resolved by setting CVE_STATUS rather than by assigning two CVE ids
to the same patch. Please could you send a v2 for CVE-2026-85091, along
with a CVE_STATUS assignment for CVE-2026-76844?

[1]: https://github.com/madler/zlib/issues/1330

Best regards,

--=20
Paul Barker

