Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C44C5AC75
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 01:51:25 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.6949.1643161883417264959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 17:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=FpZOvRO6;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 749b38ac-7e4a-11ec-b0e2-f8db88ea9a09;
	Wed, 26 Jan 2022 09:51:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oYg3D/ntwYLpH9XnJ+5Gkx3AqBog51+NlfI2rgto/Wg=; b=FpZOvRO6/mqth3sJZ7qx+B4FcS
	GUP3EbDg2iZqu7WZGP3RTMerF4p1YtpQEWdAtsTfcfUdbigKWWlFDYuqvyNRGVbLVW/gmfb6Xo1yg
	8oTRD3uJCGrzcPs3Wze7vcHBpNbTOK3AvyrMB107UHoaVy+EGZiKGdkvPthx7P4tviaBy0CgL2Ats
	ErQDVxQ1jb36q5qR1m+RPqJme8sN7bBBfxM2uU4hW2fKYcIEMDSUdfdzMSWbBgvZrs2JvMsLoD+XS
	JZBL1HzC70OQyeJNgj3q1fYR7+Ppz+fabQ1VaTEP1XuTvklPwbvF73rJE+tvaMBa3N3hJeK0ubF/q
	YHuJ9MlQ==;
Received: from [151.210.143.188] (port=33426 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1nCXSw-001VcL-SH; Wed, 26 Jan 2022 14:51:18 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Jon Mason <jdmason@kudzu.us>, yocto@lists.yoctoproject.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Barker <paul.barker@sancloud.com>
Subject: Re: [yocto] Inclusive Language Proposal for YP/OE
Date: Wed, 26 Jan 2022 14:51:18 +1300
Message-ID: <7338313.EvYhyI6sBW@linc>
In-Reply-To: <bac12863-a9d7-6fbe-e45b-09cace7dc7fb@sancloud.com>
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
 <bac12863-a9d7-6fbe-e45b-09cace7dc7fb@sancloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 01:51:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160954

On Tuesday, 25 January 2022 21:26:33 NZDT Paul Barker wrote:
> The layer index may need some modification to handle different layers 
> having different names for the in-development branch. We could implement 
> the layer index changes first to support other layers which rename their 
> master branch.
> 
> I'm going to bite the bullet with meta-linux-mainline and rename the 
> master branch to "dev" this week to see what happens.

The layer index does already support this, it's just not exposed (at the time 
I introduced it - some time ago - I thought it might encourage people to 
deviate from the release branch names, but in hindsight that was probably not 
worth worrying about.) So at the moment an admin can set an alternative branch 
name. It would not be hard to expose it through the UI for layer maintainers 
though.

Cheers,
Paul



