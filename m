Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C496AC4708B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web12.4299.1649885728516198569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=dnOyuKYY;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 7c91095c-bb71-11ec-ada6-f8db88ea9a09;
	Thu, 14 Apr 2022 05:34:24 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Bb9cZSZ9SVKoGmvHSMPQOL9W4RgCj42dHjQKAs4ZsY=; b=dnOyuKYYV9fwo8rfzusuoJS5Iz
	wQaq1OwAS8falV86mPde3uXM9wv9TbwH828i98HyY561a23KLEwSYlW4InJogvnyE50rypD7F3Kdi
	PQ1kI86K4sXhkJgILc3/58Tv0i2c4zScBrsWvael0VQBwPcUmktQKxRlOHDvnLCSUcZtogcKmt4jS
	z+KzEA90XIUNjKif70kqFnYwT/b3i1F5r16WOkOosoL7/rqQkkdnBGCbooTisYqD1n1ts07LaC9AO
	OQSExY2WA2TFVnFzGxHJTnxSA8IhN8rGXb6Nei2ZyQg9iWIAeM9WZOmzyv8dITbbdPnkF4+yFvsMX
	m2SNyEgg==;
Received: from [151.210.146.27] (port=45752 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1neke2-00021q-Ep; Thu, 14 Apr 2022 09:35:22 +1200
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 04/12] recipetool: Change default paramter
 fallback_licenses of function split_pkg_licenses from None to []
Date: Thu, 14 Apr 2022 09:35:21 +1200
Message-ID: <5257179.Sb9uPGUboI@linc>
In-Reply-To: 
 <20211008074228.8635-4-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211008074228.8635-4-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164370

Hi Stefan

Firstly, thanks for the work extending and improving this. 

Secondly, apologies for dredging this up, but I just found this looking back
through the history for the release notes:

On Friday, 8 October 2021 20:42:20 NZST Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier@weidmueller.com> ---
> 
> (no changes since v1)
> 
>  scripts/lib/recipetool/create.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py index 83cf25d9b7..893980a5ce 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1134,7 +1134,7 @@ def guess_license(srctree, d):
> 
>      return licenses
> 
> -def split_pkg_licenses(licvalues, packages, outlines,
> fallback_licenses=None, pn='${PN}'): +def split_pkg_licenses(licvalues,
> packages, outlines, fallback_licenses=[], pn='${PN}'): """
>      Given a list of (license, path, md5sum) as returned by guess_license(),
> a dict of package name to path mappings, write out a set of

Note that setting a mutable type (e.g. an empty list) as a default for a
function parameter is not good practice in Python - see:

  https://florimond.dev/en/posts/2018/08/python-mutable-defaults-are-the-source-of-all-evil/

I'm aware we have done this already in a few places - git grep "^def.*=\[\]" 
shows a few others that we probably ought to fix.

Paul




