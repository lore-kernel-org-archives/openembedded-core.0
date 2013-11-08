Return-Path: <anders.roxell@linaro.org>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0413D6D7E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 17:55:12 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so2006136lab.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 09:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=JT2KXd/PyLQwkUeQOdsQTK/POcFGWmTkkXCTtvSYcHI=;
	b=kOOy2Tdoc+kpfaL6mV5IHjFhRX9DqootDxzOfzjjUwTz2nhlf2VIHwj8kD/CUTnBuS
	DsCmkA9e+LyfJ4cqVA7/g2DycA31Ti5UktyCh2kt0e0L4IABT7U4e1SH+z3Dwee4lW2z
	dR7HMEyElY86rzJhvbnBkO6p1jRVfbGUSlQzhQmGMHsKtcArJmxJweacNNDinrePle48
	kTETWAo0gHRPKTrPBR9t7m95Ag/E7qRr0DnJjeq6DrU5gtvFr2jOZn9JTGGfG84uPLwL
	wsC08tK6yIuCh0jcPpRD5pCN9+ItRkX66b39IJzoLlCypOCKuBv2PxcOMmXBjlOJ4BJq
	eNMg==
X-Gm-Message-State: ALoCoQmjFKrxR+t1crqHQRgRJwIa1YYkJ6GystWr/PREBPU+qfrskPzIHxTFuo6OORPZFSX+f+dc
X-Received: by 10.112.136.163 with SMTP id qb3mr11550608lbb.14.1383933314156; 
	Fri, 08 Nov 2013 09:55:14 -0800 (PST)
Received: from nexon.se (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id xf2sm1760607lbb.4.2013.11.08.09.55.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 09:55:13 -0800 (PST)
Date: Fri, 8 Nov 2013 19:03:12 +0100
From: Anders Roxell <anders.roxell@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131108180312.GC26197@nexon.se>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
	<1378721846-3634-1-git-send-email-anders.roxell@linaro.org>
	<1383040703.17867.2.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1383040703.17867.2.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: linaro-networking@linaro.org, patches@linaro.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] ltp: update to new release 20130904
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
X-List-Received-Date: Fri, 08 Nov 2013 17:55:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 2013-10-29 09:58, Richard Purdie wrote:
> On Mon, 2013-09-09 at 12:17 +0200, Anders Roxell wrote:
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >  rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (94%)
> > 
> > diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
> > similarity index 94%
> > rename from meta/recipes-extended/ltp/ltp_20130503.bb
> > rename to meta/recipes-extended/ltp/ltp_20130904.bb
> > index 387826d..5e10448 100644
> 
> It seems this patch is causing problems on the autobuilder, e.g.:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5379
> 
> but this is occurring on multiple architectures. Looks like some kind of
> parallel make race :(
Hi and sorry for the late response.

I have tried to reproduce the error without success so far... =(

Cheers,
Anders

