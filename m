Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3841.1795173131302537846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kl5kauJT;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=pwejgZL+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 7832E1D00365
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 06:12:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 20 Nov 2026 06:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795173130;
	 x=1795259530; bh=/weLcniyloSUDOWhjOBdxWDp8gu7Vp8DMW8lvN9u7tY=; b=
	kl5kauJTDcBE9xapRPEL89Qrzp8/tZQgUygqoitJ4oWKx6Nus/YiDM6z/h3hOaCe
	AmjcnYUDy788kU6AHqhsnk21cTmpkm9pKgO0FHjEsxl640KNJTHybiN/mrmOSQqT
	zkrHALhMA4kIBbzgl6iSLVhVQSzwHXWYiKz5xai2Mt4yvPVvHYYwF3vdgJvnmM0a
	peZP0OD8MZFmSlPfvqROSP9t7tydkWfGd7i9XetHdIZksp0/M9uCpbcQm9EckHUR
	ky2Zqt+9AvwQjGpvDZfXjv9ZdY+nfGIxP6l6WI0L/bXwgHstTvLYV17X1wW58XFc
	oql3kIkzh/sTUuaUmJymvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795173130; x=
	1795259530; bh=/weLcniyloSUDOWhjOBdxWDp8gu7Vp8DMW8lvN9u7tY=; b=p
	wejgZL+n0XZ9/OpCZ+6uIUZd7Evb6Nstva0IIiW5rh+7LjihJtvFSBrBx1RCVPAs
	Ny6Nd+9xGWYOFMS3svQh4ySxh93zVffK8y3NFHQG4RWJejYdJS6TmvTpf5No/BRl
	Vybw95V+IEzykxIzoGXV2hh+81lJxRCjq5jj7PYW7rlchkJN+1XNcGvDOgsmGkHu
	KFWipaNHmgwy08V8lowvYwmXaezN64BgzLx2gUtUnT84XomjWpJMKrtPCKUoin9p
	wLAj/F8RibRqyfILVG5kUEbUOCTvVEjZ9hOTiUki4YpcLpfVGYsSxfXKodf//pEw
	y4GH7RmTs4U5OL6+BCDVw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795173130; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:Lqo71LggGlljVR0fXFBlcIEXAZGnttCpLDRQvB+G//3GYmk
	NYBD5N1btvI04qpNwvBMpSAklRsdqtYALXDXFnfS8e+uHzNgdWo+jFXPeYvgZU6Y
	v36NAgqWXmgAOacGYjxRdCXY1TWw1zi36j7I92jY3882LlBqCD4Ioy6nfvGx1mq1
	wKtivlsl0ku2HGAODmV6zmm1941UhKvrR5jP3KHrT5xEhQ87zD1WjAInFD3rbgDW
	nwKpv+1ysjIVEZbsM3NWHLmg1bF/Vq9YiumwcKORCTQ4qRlRHGHSBnGM+qvJ/mbR
	0xrmcr+kVi/fktkIvW3eBnxk2xA6W8exu34ckTQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:j/E2inR3KWnCeTmxCrTOfYWmPOQRHIv2AHLhH3p4EoI=:/weLcniyloSUDOWhjOBdxWDp8gu7Vp8DMW8lvN9u7tY=;
X-ME-Sender: <xms:CSsAaxqpXPftAXcILMDzLo53osPQztvB-R5VzB2JIzNUeIhfu8tB0A>
    <xme:CSsAa6ociGVfBmt9pmIRFmYCG3kY6X0KczJjOebnwVJ9xCf5SJlzChxFvEL1iGnVs
    FYQEDcvAUcM6wORQ5JdOQh5xALxZQf4LMNOGC_Xf2DZ0Aw7bSatfPZr>
X-ME-Received: <xmr:CSsAazP-VsuphqzMcopNl2o7e_bgtjcqQN1dAqRIidhSJ4OXJMVHgioTmWN6lfqBlt0JhrnD7iNv_dpTLB9X2CvZm8rh>
X-ME-Proxy-Cause: dmFkZTGT05rqPzcdA5sN4JuGs0avsVKHSqBHAPzfn/ljVMYdK2XopRyRRz2iAUYeuHCS+6
    jnIhoP6WV7sgP69cN3FFS6qNEzBLScR45aUabxz/X96jhMAZW+m1J/Qjoxa53yQqD8m0qq
    P5/7+r1+sWsb7wCsaI8UTGHgg1rMZL4+rL76RDwRs7yGRPtFBBVrFkwG0KQQ2Z0NpDGGuz
    R26veg50fBb6+fGfFtJ6zPXHfVs/v7/NZCKKrm+ZSpNB5LFBv/OehzcKlK4FEt5mT4muzP
    HbVBiG4Op6Qzu5zmXcgMmhDk8S8s4We5s/vawf/cK4PgMt0qoH5WotxdrO36SZJRs2QwGq
    vx4nY1kO/p4jq9bjOXxusBEn58wGDl/+0ESVW/L5CDSwdXIhcHwj0kd1C4rD1VW44pmeom
    jq0YNz36AMGgn7DMB/R/QmzNPlRMUxSITY79eVXk8fGuWaB1o44Gpl6phvn6bw1QqqYj+u
    hEQd/c0KGM8nJhLkEJfdGpjG1DB2aSSar44HilVLPXvgT+/M+zCoEqhj7yJ0kN/OM4SkYR
    ffBgQ+gdBM6kpr6E4ERzaAjymIEEA3xlawGtUQS+I6jM92+txOAIwT869nLhH5anEL1yvq
    +JDk+G7zrKvkFYb4AED29oxAeSuun6EWzT62RYSzb+hNrCf1zaUwPm2nicDw
X-ME-Proxy: <xmx:CSsAa7wbkCa8Ny3sqAjPgn92GKjVZvqAcm2ZDYleIUyhxYFiOTeeuw>
    <xmx:CSsAa8vs1yr0q8U8CZz6j9WbVeVoDzbhI9dGWjVyKaMAI8GZRPD2Kw>
    <xmx:CSsAa06CaOBS90BhOI-70r0TlTj-3_5BlxURpQNWsOCig-JCJnGmyw>
    <xmx:CSsAa7SiZL1mJMDU_edGcj_zEdWY76yAvEFLf8zp6nHv8qbJL1oTIg>
    <xmx:CisAa2qEwcQs6WhXMGEoga63HjKyHE9XZrq85vJ5lzIKSMtRxqxdlJsz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 06:12:09 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 11:12:08 +0000
Message-Id: <DMZZRI421TEX.2ACT1HU5QSAM8@pbarker.dev>
Cc: "OE-core ML" <openembedded-core@lists.openembedded.org>,
 <mark.hatle@amd.com>
Subject: Re: [OE-core] [PATCH] pseudo: inherit upstream-stable-release-point
From: "Paul Barker" <paul@pbarker.dev>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>, <yoann.congal@smile.fr>
X-Mailer: aerc 0.22.0
References: <20261117164151.1362220-1-yoann.congal@smile.fr>
 <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com>
In-Reply-To: <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250774

On Tue Nov 17, 2026 at 5:13 PM GMT, Alexander Kanavin wrote:
> On Tue, 17 Nov 2026 at 17:42, Yoann Congal via openembedded-core
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>>
>> Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on it.
>
>
> Is this branch collecting only bugfixes (or fixes needed for continuing
> operation of yocto release branches)? Is this going to be a policy for an=
y
> future point releases, or is it a one-off just for 1.9.x? There should be
> confirmation of these questions, in addition to the existence of the bran=
ch.

Hi Alex,

I think this is an overly pedantic interpretation of the policy for a
project where we control the upstream (pseudo). In this case, we should
be asking whether changes on pseudo 1.9.x are intended to be merged into
our YP stable branches (yes they are), how this affects stability
overall (in many ways, not taking pseudo changes has higher risk) and
whether the pseudo maintainers will be around to help if anything breaks
(yes they will be).

Making changes in pseudo is one the ways we keep up with changes in host
distros, not just with new host distro versions but with "fun" "stable"
changes like the tar CVE backport in RHEL derivatives at the start of
this year. So our stable branches have to be able to take new features
in pseudo.

If applying the upstream-stable-release-point bbclass helps with stable
maintenance of this recipe then we should do it.

Best regards,

--=20
Paul Barker

