Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id EB6327F4F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA82940BF3;
	Thu, 17 Oct 2019 20:01:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id K94e6EocZTV8; Thu, 17 Oct 2019 20:01:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0478840BE4;
	Thu, 17 Oct 2019 20:01:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 612B717429F; Thu, 17 Oct 2019 16:01:53 -0400 (EDT)
Date: Thu, 17 Oct 2019 16:01:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191017200153.GO17412@denix.org>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Thu, 17 Oct 2019 20:01:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 12:21:11PM -0700, akuster808 wrote:
> On 10/17/19 11:42 AM, Denys Dmytriyenko wrote:
> > Thank you for this revert! I've been pulling my hair out past couple days 
> > figuring out why BAD_RECOMMENDATIONS stopped working for us. This fixed it.
> 
> What I find curious is that the offending commit has been in thud since
> July 29th and we are just now hearing about issues.

Yeah, in our case we only noticed the issue when we started preparing the 
latest release and found extra packages that weren't supposed to be there.

-- 
Denys

