Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA6B6BCA9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 22:50:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x02Mnxtv004284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jan 2019 14:50:10 -0800
Received: from yow-masselst-lx1.localnet (128.224.20.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 14:49:49 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 2 Jan 2019 17:49:48 -0500
Message-ID: <1854457.oLG38CsAch@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <269a8e278b182ff55dc88913edc4848e4d0dc436.camel@linuxfoundation.org>
References: <1545320094-21504-1-git-send-email-mark.asselstine@windriver.com>
	<25783268.MQFnVprAOB@yow-masselst-lx1>
	<269a8e278b182ff55dc88913edc4848e4d0dc436.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] man-pages: use alternatives to resolve crypt.3 conflict
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
X-List-Received-Date: Wed, 02 Jan 2019 22:50:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, January 2, 2019 4:23:58 PM EST 
richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-01-02 at 13:39 -0500, Mark Asselstine wrote:
> > On Thursday, December 20, 2018 10:34:54 AM EST Mark Asselstine wrote:
> > > From: mark asselstine <masselst@yow-cube2.wrs.com>
> > > 
> > > To fix:
> > >   Error: Transaction check error:
> > >     file /usr/share/man/man3/crypt.3 conflicts between attempted
> > > 
> > > installs
> > > 
> > >     of libcrypt-doc-4.4.1-r0.core2_64 and man-pages-4.16-
> > > 
> > > r0.core2_64
> > > 
> > > This issue came about after commit 59be9254df9f [libxcrypt: Upgrade
> > > to
> > > 4.4.1 release].
> > > 
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > 
> > This issue is still persisting. Any reason for this not being picked
> > up yet?
> 
> Vacation and being human :)
> 
> Its queued in -next, I thought I'd picked it up previously...

Thanks Richard. I knew that it was getting close to the holidays when I sent 
it out, I guess I cut it too close

MarkA

> 
> Cheers,
> 
> Richard





