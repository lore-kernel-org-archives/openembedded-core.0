Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9667D71AA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 13:15:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so6094291wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 05:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=07W974+dT54tEWsih5pCE0mgoeifwfFeoN2T7t9KxvY=;
	b=PqmA51ZwPbLP5Sb5agbMyFTbIPAmEsIS0QKVT7/egWlfC80Qk81SVAfv8lF2Ts649Z
	tpPiXFjN5ZsBb31Kv+pOj7PChiUEs9c4zvihLyhZujarettOJlRaHq/f805L433/u6qL
	E3bNsDjc67Tb9E2Cdo3KBiYXYmxaohaYTUJHmVe6RKGU45m4KKInQMIwKFHX+10i9WpK
	rWVJxNPKPsjRrNzlhMzaTwlUUOwih6/+xe4LYEmldmyvE2C5spV3bmv6kLiTMW73gw+Q
	xuToW3MRf0lV2cWQkAcS5KVqESlOU0oM2wlQW8MqtLbt1sby2UVDtVjAsunMtjvyhAOc
	ZKVw==
X-Gm-Message-State: AKaTC00K5TVgP9hNzOUJ4dNWRRkCNiigsnaYhMnaC7GAadg1s8DrA3jvYfMstoJiUJD0uw==
X-Received: by 10.28.92.21 with SMTP id q21mr10690wmb.71.1479474901697;
	Fri, 18 Nov 2016 05:15:01 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u18sm3365569wmd.1.2016.11.18.05.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 05:15:01 -0800 (PST)
Message-ID: <1479474900.27546.14.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 18 Nov 2016 13:15:00 +0000
In-Reply-To: <alpine.LFD.2.20.1611180742360.16475@localhost.localdomain>
References: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
	<1479472068.27546.12.camel@andred.net>
	<alpine.LFD.2.20.1611180742360.16475@localhost.localdomain>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: small number of perl modules that can't be cross-compiled
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
X-List-Received-Date: Fri, 18 Nov 2016 13:15:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-18 at 07:46 -0500, Robert P. J. Day wrote:
> On Fri, 18 Nov 2016, André Draszik wrote:
> 
> > On Fri, 2016-11-18 at 06:41 -0500, Robert P. J. Day wrote:
> > >   after OE recipfying over 100 perl modules from CPAN, i'm down to
> > > less than a dozen that are going to take more work, and a small number
> > > of those seem to be simply badly written in that they don't support
> > > cross-compilation for my target choice of "qemuppc". example
> > > boilerplate recipe i put together produces this:
> > > 
> > > $ make libauthen-pam-perl
> > > ... snip ...
> > > Checking if your kit is complete...
> > > Looks good
> > > checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float -mcpu=7400
> > > --
> > > sysroot=/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/q
> > > emup
> > > pc
> > > checking for C compiler default output file name... a.out
> > > checking whether the C compiler works... configure: error: cannot run
> > > C compiled programs.
> > > If you meant to cross compile, use `--host'.
> > > See `config.log' for more details.
> > 
> > It'd be useful to see config.log, ...
> 
>   see bottom.

That message is referring to config.log from autotools, not the bitbake
do_configure.log. Should be somewhere below ${B}

Cheers,
a.


