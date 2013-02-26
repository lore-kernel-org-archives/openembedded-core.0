Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAP3Q-00037k-E0
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:15:05 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so1024503dak.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=j9R0WRA85DctWObwjIP0FOmZ04iLdWrD1DvIOdibZDI=;
	b=JX2zPgPnb/geIYse4hsIxVw+IpmuVT8pHKyILplLa6hQxO1Lj+aEdq4dkw0+hcbzvM
	C5NjzUTNhN1P1826BYu+aFAFQL9tEIa1AyE80mO9JAub1T4Q3rKn4aAgEWyLNruopPLS
	kbGrxE4OMs56pusXmCRXSecvzqGK33i6kXQ2e6RKqupKZeZy8FpIYZK+YmXHuJ6j0r4e
	oXZ83JKxTzUHZA69TnSw8J95aooBaxAfAMmnvi2VL0MQkmxxhXPpPEV4HRz+mUMFVor/
	sg9SCdFPGluhCPj5rQjPzjhSFnWuhSbcqij17qb1ftFBzSM2ZfEOMh+IJlBVDEE+cXcB
	pC6Q==
X-Received: by 10.66.9.2 with SMTP id v2mr3029671paa.18.1361901524299;
	Tue, 26 Feb 2013 09:58:44 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ub1sm1634567pbc.5.2013.02.26.09.58.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 09:58:43 -0800 (PST)
Date: Tue, 26 Feb 2013 09:58:36 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20130226175835.GC13278@sakrah.homelinux.org>
Mail-Followup-To: Darren Hart <dvhart@linux.intel.com>,
	Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1361857721.git.liezhi.yang@windriver.com>
	<a5db423d88f92e3ff5ed58bf35c7561b80aec82e.1361857721.git.liezhi.yang@windriver.com>
	<512CE051.2090900@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <512CE051.2090900@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lttng-ust: cannot find -llttng-ust-tracepoint
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 18:15:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/02/13 08:18), Darren Hart wrote:
> Pulling in Tom as I don't have any experience with lttng.
> 
> On 02/26/2013 01:24 AM, Robert Yang wrote:
> > liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
> > there maybe a parallel build issue when building liblttng_ust.la:
> > 
> > ld: cannot find -llttng-ust-tracepoint

Are you using gold linker when you get this issue ?
patch is OK if you are sure that some other .la is not pulling it in as
well otherwise you dont want overlinking.


