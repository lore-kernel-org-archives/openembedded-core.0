Return-Path: <anders@chargestorm.se>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B12A1760AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:57:55 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o80so13419655wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=9JGw75PyMuiQuR4WQF185iUiKYALmfQku2t9Q5AE0Ik=;
	b=UXpwk3RUjj5dwWXBTKOpzDq/Ilc+1LQM6VkYp6TTf7Eauin6vezj872AnzTmGH6Yli
	JWM2KDu7LTd3tqtSbO4Q9IRKcBoDbvoiho9ymUgJwsC3RE78N+pjKSWn72iQUb9HdX23
	pNwvESmbHZY79sbkXKxZGUGiV4OeOoyfXN+V2KuTGy0vb+MHtZW6KAZeETYr38asn3mJ
	UG7F3u1FSZik6Ek/F44i3i23qeEWPNFZYH1TUYf6GmHnXm8DaGyP75Vez4F0o2Cp4mtV
	6nyFQPwpj/fXR0zkOkeDb6EqALf/hteCfvhiKlTETgh9WUSNnd4Q6rDuAwCY9pRwy3+6
	aFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=9JGw75PyMuiQuR4WQF185iUiKYALmfQku2t9Q5AE0Ik=;
	b=Li8lsTBX3CxxEYEc0DtflfWt42X7qHmItSCD/LAtUb1UMK7wSclZvcOq2XsZyDr9vp
	Fvcn4BlTopmm1CNF8quVSuKBieLnNT5wuLaRGFkFWVLHF/mIAUU+uW1GG255gOu1104e
	Hc2vdQnKHx4VljLcAhwQKXRJFo1lN25lViiK8KW+xI4lv2kNJTefDAxYCSe9xF20p2fL
	iw4fEFwaqKfihFAwzeusgl6atQa1E8gbkP+uY/pvrBRkU/cefHL6/bha3xtyW/gUjTYW
	r2WXwAaOjGn1aUGTT8zp/6wZk0TaJiYlueRWkdRSC61U4NG6/6k09BpfpsTRDkAZttsW
	fdtA==
X-Gm-Message-State: AEkoouumKcjwOmjhEsJFeg3ap1Ii+Y5uEDWqlmnob2PIWwqIIVmN/zLufvcsbczTQb9ezA==
X-Received: by 10.25.147.197 with SMTP id v188mr1400544lfd.9.1470898674928;
	Wed, 10 Aug 2016 23:57:54 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	l129sm283408lfl.37.2016.08.10.23.57.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Aug 2016 23:57:54 -0700 (PDT)
Date: Thu, 11 Aug 2016 08:57:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160811065752.vchy5fxukujie5pz@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
	<bbf4ea57-5a32-7696-3e70-3c11dc069ef1@windriver.com>
MIME-Version: 1.0
In-Reply-To: <bbf4ea57-5a32-7696-3e70-3c11dc069ef1@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.2-neo (2016-07-23)
Subject: Re: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 11 Aug 2016 06:57:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mark Hatle <mark.hatle@windriver.com> [160810 22:18]:

> On 8/10/16 2:12 PM, Davis, Michael wrote:
> > GPLV3 and BSD portions were originally placed in the same package.
> > The GPLv3 portion has been seperated into pcsc-lite-spy so the package can be used with GPLv3 blacklisted.

> > Signed-off-by: Michael Davis <michael.davis@essvote.com>
> > ---
> >  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)

> > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> > index cc72549..e1d405b 100644
> > --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> > @@ -1,6 +1,7 @@
> >  SUMMARY = "PC/SC Lite smart card framework and applications"
> >  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
> > -LICENSE = "BSD & GPLv3+"
> > +LICENSE = "BSD" 

> LICENSE should be the overall license(s) of the sources used to produce the
> binaries.

> So in this case you'd want to do:

> LICENSE = "BSD & GPLv3+"
> LICENSE_${PN} = "BSD"
> LICENSE_${PN}-lib = "BSD"
> ...
> LICENSE_${PN}-spy = "GPLv3+"
> LICENSE_${PN}-dev = "GPLv3+"

Shouldn't the ${PN}-dev package have the combined license?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

