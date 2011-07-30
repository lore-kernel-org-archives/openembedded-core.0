Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnEZl-0000jV-4f
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:47:53 +0200
Received: by iyj12 with SMTP id 12so5756854iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=1U1EyTAsyYYVwb2Lt27jKyo/TGm//Qsa7tnkn9leRXk=;
	b=i62W/o4Ma+zTrX5FQ8Qo1Oow2Kmtmi/V5rTyB3B+1+MlMzOa8finTkqTMH+HoZqlt1
	/4lgOdDOjt2SvEF8PKN/9j71lrVFnaxdyE4plf2UqNv9HDcmtxD++XExGUyam+z5KzDq
	Rp8iV65gzLet/SLC6LwPdMvfC2KrHdgUOpamc=
Received: by 10.142.117.1 with SMTP id p1mr1801113wfc.420.1312051412689;
	Sat, 30 Jul 2011 11:43:32 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v17sm1974861wfd.5.2011.07.30.11.43.31
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 11:43:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 11:43:30 -0700
Message-ID: <16609727.QKxnTdGfvX@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1311779631.30326.366.camel@phil-desktop>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<EF599739-F511-4465-B5BD-B19F15534482@dominion.thruhere.net>
	<1311779631.30326.366.camel@phil-desktop>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jul 2011 18:47:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 27, 2011 04:13:47 PM Phil Blundell wrote:
> On Wed, 2011-07-27 at 17:06 +0200, Koen Kooi wrote:
> > From the conversations I had with ARM they implied that it isn't
> > optional for cortex a8/9/15, only neon is (e.g. marvell dove, nvidia
> > tegra2). I haven't seen any black on white contracts saying that,
> > though :)
> The spec on the web seems to say fairly clearly that it's optional, at
> least in theory.  I guess they might have commercial reasons for not
> wanting to sell it without VFP in any given situation.
> 
> See:
> 
> http://www.arm.com/products/processors/cortex-a/cortex-a5.php?tab=Specificat
> ions
> 
> for example

thats only for for a5. For procesors koen mentioned VFP is mandatory
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Khem Raj


