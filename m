Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnwGg-0000RG-Vv
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:27:07 +0200
Received: by gwb11 with SMTP id 11so4168658gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p5TV68cvBYiXtvDfHVAvaFsqdkoQlyxAHQ0KvN8j3Uc=;
	b=nhECz4y/xb9WNWHqJTNXDuJSCVs1e7M6zGQWx9VQIuEAJN94PP6ZmT4PAE7n1WkO/V
	kR0nN/veCiO1TtHcU3XDE35Hm4cC5tx/6ozjUeeWioMtDwqO31JnL8oeNlYTqvfiJZ08
	GER3uA4jgugNqag8ERt/onvG/9TDkOaiNHWpw=
Received: by 10.68.29.138 with SMTP id k10mr6638894pbh.60.1312219364704;
	Mon, 01 Aug 2011 10:22:44 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z6sm5738446pbc.78.2011.08.01.10.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 10:22:43 -0700 (PDT)
Date: Mon, 1 Aug 2011 10:23:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110801172334.GA7798@sakrah.homelinux.org>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<7954213.WCcvt5c9xE@perseus> <4E3496FB.7050605@mentor.com>
	<1651296.NY6EmKFV0b@perseus> <4E35A9F1.701@mentor.com>
	<4E36DF12.1060208@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4E36DF12.1060208@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Mon, 01 Aug 2011 17:27:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/08/11 10:14), Tom Rini wrote:
> On 07/31/2011 12:16 PM, Tom Rini wrote:
> > On 07/30/2011 05:56 PM, Khem Raj wrote:
> >> On Saturday, July 30, 2011 04:42:51 PM Tom Rini wrote:
> >>> On 07/30/2011 10:33 AM, Khem Raj wrote:
> >>>> On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
> >>>>> This comes from oe.dev which had this set for arm-linux only.  Bump PR
> >>>>> since this changes how builds happen.
> >>>>
> >>>> if you are clubbing them in right site files then this variable is for
> >>>> deciding what serial API(termios or termio or sgtty) to use its not
> >>>> dependent on libc imo.
> >>>
> >>> Where do you think it should go?  common-linux?
> >> yes
> > 
> > k, I'll v2 just this patch, tomorrow.
> 
> OK,
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-round-2-v2
> and
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=trini/update-siteinfo-round-2-v2&id=d8f714075dcbe37ef21b17639f91a8faeb868bf1
> in particular.

looks good


> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


