Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16439.1793379341943801553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 09:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=HlAd6K7B;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=E9G42S09;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23B1F14001A2
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:55:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 12:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793379341;
	 x=1793465741; bh=AcxLbuJyKDq+hODOkdBCv7Iq0Ky5aYgcggIP73PWB6E=; b=
	HlAd6K7BGgabAY2SLMFYchJaR6DJHXazJb8PRVSjZkem6Q7DCtbf5e5EUDAGTGSm
	ZBER3mlUUGVESi9GTaBUwCCe9LU2J6eFW8o409i2e4WgibOSfAAqaRKTnV+iQf0i
	+3xoht/Kq3wCV/EoigjEX2wzH9uB1tw1ktTcz3STlwDV0WfGETOSZFEmJ0hfnZG/
	r7ipdL5as1FlYjotpuSd4y2TdN8R2eS96dETIMjdXIJ3PTRGTINgk8EwrIQucHQ+
	9AhwqJiSucNMtEKEjNJ30vR8sjAgrELvTE0EcluQPt+TGvKQVabhYvygS8YC9DVO
	h4Bz8LFjpevXBHQ8VAChDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793379341; x=1793465741; bh=A
	cxLbuJyKDq+hODOkdBCv7Iq0Ky5aYgcggIP73PWB6E=; b=E9G42S09KNqgHvdeK
	ChNdkqv1jhVOF8x9TKT0enpqFjgJPshGAJ+6gDCtJicWTJQYNQiOx8PaDvRwclWU
	gVORL+CFuaAZchIcUWPrgzGdEqtFTuPcSpdawdzQMwY+rQoWu5YzkQdu4jB2Qob9
	gZWMvXrt2Lb8VcMfsgiiCaAiVj3gqF/RuJvxYqBo6eOfa4QzdwrVMgEU0xXmz/xg
	jFcEDS2L1T5AX17gqc4r3siF6NdYNyWbh8IHZdWTEHCuIpwHpswkStvNtNgBjhl3
	s9pHqn8qHKmM4UVb+tUXn/vXsaBTcE3u8jdnc0W9UccPcxE5v4+tjdJLoji+CwMv
	uUWBA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793379341; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:J2apABPF8haQdxRygdmTt2eWDi5SZcWnWAAleIOzacO3kK/
	SK7Qi2STyeNqvc7pumFIy0lffXcZQzofRLNlN9OE2a3JqyYviP6d6kDscp3g1HJF
	YPsMwNgaFf1xtiZYHeIhOb6wszQlikFU/yfXfE/rLML+dF/IlnUhDs8sTlDslSDj
	kEq80Pe9ILvo04FD3YMB10MCPTcVRc8aGJ+rWx4NxETwf+dkueZlIUGxWq7zvQW9
	DvWJw8oAA3tfmM/gPsaX43FlM28nLKgcXpW2WGlFD33mvj3IkldfB2v+vCtOk0dB
	coXUG8HAeofgYiVKBwFxmG6GlQksfBB9vMtU4AA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:EXOZeYtxk+AQ5ahhLlpXqkF/WtHEkw6KXkJeHB7OkdA=:AcxLbuJyKDq+hODOkdBCv7Iq0Ky5aYgcggIP73PWB6E=;
X-ME-Sender: <xms:DMzkamMEVtlvHTis3Z5shXOElOYMVTxQmhhO-pxSu0I6oDWW-3DD3w>
    <xme:DMzkaq9vaI_uduS057Bj95fM_sHC0eFel6mlrO1gIqwrVkLUfC0FaUXbfMjJtqkAz
    xQRF4xEjm9Pks_5G6Q0FDk6fVE_p27lykQ3SpKxolM4bZDuW6ByEnk>
X-ME-Received: <xmr:DMzkaq69a8-2o35X7wn_Deq0HT4NsxBHX3GEmWVDlaW6mUN28SumSNF44y9UwkaPqxA7Supgeq8NXwPkdV7VCh0XdzwMl5eUxkTob54>
X-ME-Proxy-Cause: dmFkZTGnyEeSjSfXnz7LC5w5ESkO/Ej6o0v+PrA1tV2XkmM+i+p4LMLQFPOkh8MMqyVpS7
    Pll4ht62DQKYwc7Ujbkgj24htX4V2u2PHzwk4quEiJrj7pByIx3L6mszXFRTfPDZHxSRrG
    Vb0oLJyHAmqvIdNiFDCXEs7KfgMTA7OFKT3b1dvPFhJDFcB9mU6KRTtM3oVvDT2I05tjWg
    vIIOvCg0mBCKjPrKuZOETljp9QAGDHzqzmlvi7/DQAFTV/cq6ZwLdmJRyBKNgruvWGC4Vu
    gzt2S8ztV3zyVMWhG90u0Y/EIh/6e2/ZAOUd1FiUjpdozME8d9PFnwclTXYoSYuObtndEH
    buiRG0R4Tb437qp4IFC4MCCwQhBcrHMCFUS7odL80Hpt8CFG4gvEIJBsck/a/Wfmq0mrZQ
    V85n4L6kfelIt2h2CbwHuAbMSGkHqvOAIbISDtGOa5W+Y6and7pPNvchpo/pHPSsFOj1do
    wjFhNp3HNYcO+SXfjv6H6gQ9hNjG1g7/caV6oo8Nhtz30gmFaZHJoYXCcSoTaJmw37vtH9
    bmERb6hh7LpbvWII2UDHehm6RDkqQxLPMymRyywfFxta2cJv58yUv7dd0ptcpQbSY6dmUG
    PbxyiFeCAm7yfGPrA2WVo4qp/s7wlhLqitF3329/HrJPYG5vemzLsMwtTz9g
X-ME-Proxy: <xmx:DMzkah1gjAVW-B8IqfNYdTRp2wqaxCpSMEdpAMy40iqi3mwRZVM69A>
    <xmx:DMzkahB4oSWky28-MgXZrAcNMcWVXaCWAyxNHOpzZQ_jLNafN09M9Q>
    <xmx:DMzkaj1q9kNRiiI53Oru7QM8FNmntOipdN-Xb-SxAbHRa5SyNK4a4A>
    <xmx:DMzkaru8LgXkaWfq4DAB30WiPBwH_kdlLFPLs-RnFXOte53F6D13QA>
    <xmx:DczkaulqD4El_oKAlmJFXIETRrQmhk36T_Pnq1qw1OxzI0SEjRsK-IId>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 12:55:40 -0400 (EDT)
Message-ID: <af31ac60fa1d53994a3efbe4d537e3b99db8415a.camel@pbarker.dev>
Subject: Re: [PATCH] archiver.bbclass: warn about sources which are not
 archived
From: Paul Barker <paul@pbarker.dev>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2026 16:55:39 +0000
In-Reply-To: <20261030131434.2267687-1-ecordonnier@snap.com>
References: <20261030131434.2267687-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 16:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249055

On Fri, 2026-10-30 at 14:14 +0100, ecordonnier@snap.com wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> In the original mode, do_ar_original archives a source if the fetcher's
> localpath is a file, or a directory. Any other source is silently skipped=
,
> and the source archive is incomplete without any notice. This happened fo=
r
> example for shallow git fetches, whose localpath is the clone in
> DL_DIR/git2, which is not created when the shallow tarball is used.
>=20
> No fetcher has a valid case for a localpath which is neither a file nor a
> directory after do_fetch, so warn about it.

Hi Etienne,

The archiver class is used for license compliance and to ensure sources
are available for later rebuilds or debug. If it fails to archive
something it is supposed to, that should be a fatal error, i.e.
bb.fatal().

Best regards,

--=20
Paul Barker

