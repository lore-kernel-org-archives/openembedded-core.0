Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbzZc-0000Ww-AB
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 20:33:16 +0200
Received: by pzk36 with SMTP id 36so1218504pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y5Qtiho00jwmxNkOe4mON/B0Z9EP0J7kG558P+yhoSs=;
	b=GWdxsr2uOJQJjoUpey1UgsAmZ7ztnkAU+viCt4gR1h6aqldYYvNDKawpLwJJrOBkhR
	wXXMiMEEAXBBtWsnLEGhM0VtcjMB+SA+gOdPNQ6xwAG8+g4lgE1hr/V+HSZh/PCcDRvL
	DrW97rlXzygK0LFQX15IP4STRNyq0p8zDfekY=
Received: by 10.142.195.7 with SMTP id s7mr590769wff.15.1309372172658;
	Wed, 29 Jun 2011 11:29:32 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm967124wff.12.2011.06.29.11.29.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 11:29:31 -0700 (PDT)
Date: Wed, 29 Jun 2011 11:29:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110629182940.GA15546@sakrah.homelinux.org>
References: <1309188248.21613.325.camel@phil-desktop>
	<4E0A7159.4020003@gmail.com>
	<1309347373.2551.26.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1309347373.2551.26.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] fontconfig: specify font directory in EXTRA_OECONF
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
X-List-Received-Date: Wed, 29 Jun 2011 18:33:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/06/11 12:36), Phil Blundell wrote:
> On Tue, 2011-06-28 at 17:27 -0700, Khem Raj wrote:
> > On 06/27/2011 08:24 AM, Phil Blundell wrote:
> > > -PR = "r1"
> > > +PR = "r3"
> > 
> > a nitpick though not wrong but should be r2
> 
> Is it official policy that PRs need to be sequential? 

no. sometimes people might think two things changed to bump it by 2
and sometimes it could be that you forgot to submit 1 change

There seem to be
> various precedents for incrementing it by more than one in a single
> checkin, see for example d3fc33760a80b0a067b41ff88e99941f1c40c8f9 and
> 993a2367f881f1f4eaa10339cde93c7058660d67.  If it's meant to only go up
> by one each time then I guess I can cope with that but it would require
> a bit of extra mangling at my end.
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
-Khem


