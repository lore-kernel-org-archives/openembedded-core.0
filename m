Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C263B71A6A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0340B31C21B0;
	Tue,  6 Dec 2016 17:04:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nJ6mJkuKn_1c; Tue,  6 Dec 2016 17:03:58 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C1D2131C20AC;
	Tue,  6 Dec 2016 17:03:58 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
	<1480545786-5069-3-git-send-email-obi@opendreambox.org>
	<CAJTo0LZxQO7B6V=MK9+XE1is=jNDFut8Fq+q7S9Mrov7FrLX5g@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <26165659-66e8-f334-2035-1b50001524cc@opendreambox.org>
Date: Tue, 6 Dec 2016 17:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZxQO7B6V=MK9+XE1is=jNDFut8Fq+q7S9Mrov7FrLX5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] keyutils: new recipe (version 1.5.9)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 16:04:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 16:49, Burton, Ross wrote:
> 
> On 30 November 2016 at 22:43, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     Used by nfs-utils for nfsidmap, if available.
> 
> 
> This breaks under musl:
> 
> | key.dns_resolver.c: In function 'afsdb_hosts_to_addrs':
> | key.dns_resolver.c:374:21: error: 'UINT_MAX' undeclared (first use in
> this function)
> |   unsigned int ttl = UINT_MAX, rr_ttl;
> |                      ^~~~~~~~
> | key.dns_resolver.c:374:21: note: each undeclared identifier is
> reported only once for each function it appears in
> | key.dns_resolver.c: In function 'dns_query_afsdb':
> | key.dns_resolver.c:456:22: error: 'ULONG_MAX' undeclared (first use in
> this function)
> |   unsigned long ttl = ULONG_MAX;
> |                       ^~~~~~~~~

Apparently there's a recipe in meta-ivi which already has a fix. I'm
going to merge both recipes and resubmit.

Regards,
Andreas

