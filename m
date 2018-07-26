Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA1D78994
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 11:11:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e7-v6so1302271wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vlCP47u9hI4UPcaQ6F1YsD82bEkM7fYTbSWfN/G6jSE=;
	b=UAlzpfCXapE8VttTv2BW4bOmPfeRVzTvf0b13JZ/AAhZpHXbm5F9WqtFE+rWl0Do8z
	7m3GxZKFytFTJYYnU9jjmNGqfg6x381HDEAsiJt7KVpqBaQwQ7Lv5/dXBD3ltxVJhLPm
	RaMax39Z/fWwbGGZTEBuQIjb0v1CmHKPIRA7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vlCP47u9hI4UPcaQ6F1YsD82bEkM7fYTbSWfN/G6jSE=;
	b=Kr+wAy6K4FRwP9e5yfAz/GLwVZxZIXD4W9rfdxly3z3/AILOuo9ULkvqOR0043o6Ps
	dqysdp87DtshzF/TkT0Ei3Zv941FM3KjdRaNdkB02jB3Ah+o8PrGDfArThycaZMAJ6FK
	chkuycL7gePKHAuVrowCnXZ2t/QSJve9Ws7cwNA6qUIDyezwv3ZIovumH0bNOqNUdBRC
	Cd450xuRPCZN/BICQgSWgHEFyqUlipsHDNYp+Z9Tkcn8obPogK5+s/b3cQIXnheS1dP+
	DUWjixPqOkOIun77iPtFpEC787prDOx8V16EPYa3djEucfkRcQBNo44h3oZbNmuRP6Lg
	DwxQ==
X-Gm-Message-State: AOUpUlEVLJcVcnskdqIXYWdWijhhSU+OWumk79E200AtghC6mu3pWEYN
	P4MAHprQomv5Kb7cdrv+BoFTqRZVMj6ObA==
X-Google-Smtp-Source: AAOMgpdCSU8sV3teGlsTkF1k+f6z/OPm9+QXhs3btkahZfAQ8XnwSIpQo3DgIUnNLuq/5Cm0GXHL4Q==
X-Received: by 2002:adf:f210:: with SMTP id
	p16-v6mr1262091wro.184.1532603518087; 
	Thu, 26 Jul 2018 04:11:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm2421612wrq.45.2018.07.26.04.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 04:11:57 -0700 (PDT)
Message-ID: <56d1a5ca98936388dccf918519b87558ea1b6228.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 12:11:56 +0100
In-Reply-To: <1b2cb46a-2bea-eed0-c9df-254ffb3c1f99@windriver.com>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
	<a8f34da6-a6e8-4419-1258-87262cf6b772@windriver.com>
	<bc64ac66-d4cb-acb3-5e8e-9bf15ce86317@windriver.com>
	<1e41274ab544bfa905bf98a75d6729c492bec19b.camel@linuxfoundation.org>
	<edd66fb0-d295-dbbf-97ca-5a11ac509ded@windriver.com>
	<1b2cb46a-2bea-eed0-c9df-254ffb3c1f99@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/6] oeqa: Add selftest parallelisation support
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
X-List-Received-Date: Thu, 26 Jul 2018 11:11:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-26 at 17:37 +0800, ChenQi wrote:
> On 07/26/2018 05:18 PM, Robert Yang wrote:
> > 
> > 
> > On 07/26/2018 05:10 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Thu, 2018-07-26 at 14:00 +0800, Robert Yang wrote:
> > > > 
> > > > On 07/26/2018 11:03 AM, Robert Yang wrote:
> > > > > Hi RP,
> > > > > 
> > > > > On 07/17/2018 12:33 AM, Richard Purdie wrote:
> > > > > > This allows oe-selftest to take a -j option which specifies
> > > > > > how
> > > > > > much test
> > > > > > parallelisation to use. Currently this is "module" based
> > > > > > with
> > > > > > each module
> > > > > > being split and run in a separate build directory. Further
> > > > > > splitting could
> > > > > > be done but this seems a good compromise between test setup
> > > > > > and
> > > > > > parallelism.
> > > > > > 
> > > > > > You need python-testtools and python-subunit installed to
> > > > > > use
> > > > > > this but only
> > > > > > when the -j option is specified.
> > > > > 
> > > > > Should we add python-testtools-native and python-subunit-
> > > > > native,
> > > > > please ?
> > > > > 
> > > > > And add them to TESTIMAGEDEPENDS ?
> > > > 
> > > > After talked with Qi, this won't work since we use host's
> > > > python3. So
> > > > we need install them on host, or use buildtools-tarball.
> > > 
> > > Correct, this is why the modules are only loaded if you use the
> > > -j
> > > option, so the dependency is only needed if you use bitbake -j.
> > > That at
> > >   least minimises the cross-section of users affected.
> > 
> > There might be a bug since we don't use -j in our build farm, but
> > I 
> > see the no
> > testtools module error, I will do more investigations on it.
> > 
> 
> In testsdk.bbclass, we have:
> processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or 
> d.getVar("BB_NUMBER_THREADS")
> ....
>          if processes:
>              result = tc.runTests(processes=int(processes))
>          else:
>              result = tc.runTests()
> 
> processes will not be None even if we don't set 
> TESTIMAGE_NUMBER_THREADS. I think this is not expected.

Ah, yes, that was not intentional. We should perhaps put a:

try: 
    import testools, subunit
except ImportError: 
    xxx

in there...

Cheers,

Richard



