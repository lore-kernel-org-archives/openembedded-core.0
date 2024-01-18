Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CFBC47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:04:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12133.1705586654576955647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=kKstOLn9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nslZQeCfrhlUDkcn1z3TVWQ0wxvJMH2plI7SP9blaPA=; b=kKstOLn9QE8P3wtSCqvfja/TuS
	75bg9hTiDz704vT1mXU4sJqXpTXQYIz9eRhh6PgvDaahSumsMSE07f/nJC0By0cQe9fPMyIctOBQo
	ySnXvFBpDOtfcST/sO60kkRF6oGCr8t7vl3d8Widd+x1vo/D+heitmevm0Q9Et84A29kll7sGz2PA
	nkVhiEMmjbDkqcIz1HD3mSn2Jy8rn3FsNVHs/53EtOXRYobe95YOasB1cdYR94kRVbUr1nHEMGzq9
	LUI7RvIzFiZ7+Uef6Q6PEixDAy0zgwtIbrkzheAzFFvRmK2fgOwZ/I18hSPVURJJAwfU0iB80s9QA
	bBwbZtZw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49986 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQT07-00GgAy-11;
	Thu, 18 Jan 2024 09:04:12 -0500
Date: Thu, 18 Jan 2024 09:04:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and "bin_package"
 efficiently
In-Reply-To: <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
Message-ID: <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca>
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca> <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193983

On Thu, 18 Jan 2024, Alexander Kanavin wrote:

> Mono-repo seemed like a good idea at the time, I'm sure.
>
> I need to point out that externalsrc disables sstate and always
> rebuilds from scratch. Is that okay?

  i just tested, and the recipe does *not* rebuild unless i change
something in the ("externalsrc") source directory, at which point,
yes, it rebuilds. which is exactly what i'm after.

rday

