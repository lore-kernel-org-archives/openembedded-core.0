Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4aR4-0004o0-T0
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 17:02:23 +0200
Received: by pzk35 with SMTP id 35so38085pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cLQnxhbftZxt7D+p6AiG46Yqy4YbwPdIbTe/VhjFYGk=;
	b=GRbJbRpDvbh8ft6SKGKoa49yOgY0hrfSCMf62ZBDjEmpoy9Yxv9ySVjx2Y7nsLAeXs
	SeWA9EdXxR85IlHh8cx/3bUR/ZcQRurRwmbXQyt7SRD1d/q693J9fpS5N/RV0yMSQti/
	tofe6JsQqo1r9UD7+6aoH+x9MI3sZK+YYynJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ahoT/06A1zDrcpd28JlgX6v7DDIdkXGvNclN7cInOTtyzSNONyU2wD701MQBe78fvG
	W7/i1vWdcsqgS4zh0QuVcBnFbwOnXaOaoHoMJ7f8zdYhLYZY8SwR6n/eRO2238/hEGQH
	EazWk7ABjAvYAgFofPPhWmKyaT0JLeWQ00ugU=
Received: by 10.142.174.12 with SMTP id w12mr4849579wfe.158.1301410822844;
	Tue, 29 Mar 2011 08:00:22 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm7371780wfb.10.2011.03.29.08.00.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2011 08:00:21 -0700 (PDT)
Date: Tue, 29 Mar 2011 08:00:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110329150018.GB4529@sakrah.homelinux.org>
References: <cover.1300730825.git.raj.khem@gmail.com>
	<00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
	<1301405666.24596.27.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1301405666.24596.27.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Tue, 29 Mar 2011 15:02:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/03/11 14:34), Richard Purdie wrote:
> On Mon, 2011-03-21 at 11:11 -0700, Khem Raj wrote:
> > -fexpensive-optimizations is enabled by default at -O2
> > 
> > -fomit-frame-pointer is enabled at -O2 selectively by gcc depending upon
> >   architecture if debug info is not hurt
> > 
> > -frename-registers - This might have some performance advantage on top
> >  of O2 on architectures which have more registers and registers are left
> >  after scheduling but it affects debuggability quite a bit so as a i
> >  tradeoff we do not use it.
> > 
> > -feliminate-dwarf2-dups - We use this option to reduce the size of debug
> >  information by removing duplicates this is only valid for dwarf2+ and we
> >  use dwarf2 by default
> 
> I've disabled this flag for now as it was causing too many failures
> across the board (various apps, prelinker). We can add it back when this
> has been tested more extensively and its been confirmed to work with the
> prelinker.

It would have been better to disable one by one we would be able to
utilize current testing. Most probaly the prelink issue is due to -feliminate-dwarf2-dups did you try to remove that out ?

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


