Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFA4783CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:24:11 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id m47so34133389iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=EOOaPK5uqoRh8tZf+mC1ju30ryQ7w5I7OE5dCEyYcFQ=;
	b=fKRmBLMy0Y9ZbjLlWVohVWypImA2qgJoXbeCk7ecX4YfV1hwasMmhxKYO1f6l2azux
	Scr361ByOBYy6AG7g/MDOlOrDb+AI/U1fKj59PpilurObUC1OhFv8/dWNofgVS1D1BEI
	FL68WDrRWUmbBoR911+lprnAg+H19B0Yid8jJPMrrywgTSj4lRdnkXb8Qd/5N3CfNZ/E
	XrZ3pX9AliTpQbcXyOhOD31bvXyJ8p/njq1d4MkOVHv+aNT5Hh9G49e2d5UsUyEvGkRL
	CFHqkV6JuAl8kqNYr0BwZtgv23uZxjksYp09Z1/WWS18Z+xCoOsLquUxVUgvRh6YveAR
	3m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=EOOaPK5uqoRh8tZf+mC1ju30ryQ7w5I7OE5dCEyYcFQ=;
	b=BbaJewoXAi0IRVEBgOUAQWxSoihYpET8Wvd3C03MW9NVtliUXxX8IoI987fZDA/MX5
	0aiVTsxFBLjyM3IazBzWEecut4TMg3Q25eeqazuidSWHqmcubpzMhc5+VOXhQohKDA0m
	8Dqt5C3Z56UGipnoKydO4UTTqGBFeCmOCrKj1uuLHbaksnqguLRJANtDFsYr3QOSajPR
	ySElvoYRtXP+/MKiyfabQHm2YLHhBR31/3auPSczQ8yONzGbp6D6Hc0Le45bmMS7t6Nb
	TtMMh3LkmME+5tQ9h9tZDl8iWfi3zTyd4soIbpxQ8Wq0aQHX6htKdYpf91r9U1qhfOtN
	olWw==
X-Gm-Message-State: AKS2vOwaderE+ZBvpReMUBHwvGel4IGYfVF5g+h2izgzlCrsjPKmW/lF
	/mN51MhbY+iCOhuK
X-Received: by 10.36.178.75 with SMTP id h11mr10612063iti.16.1497615853174;
	Fri, 16 Jun 2017 05:24:13 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EEFB.dip0.t-ipconnect.de. [93.232.238.251])
	by smtp.gmail.com with ESMTPSA id
	s131sm1344350ita.25.2017.06.16.05.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 05:24:11 -0700 (PDT)
Message-ID: <1497615849.30163.419.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 16 Jun 2017 14:24:09 +0200
In-Reply-To: <7d05fe3e-ae22-fd9b-a94c-4f1dce40b2ba@linux.intel.com>
References: <22146d3f8ce5f2c3da42f8f19cad49f9f4ffc175.1497606816.git-series.patrick.ohly@intel.com>
	<7d05fe3e-ae22-fd9b-a94c-4f1dce40b2ba@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ovmf: fix secureboot PACKAGECONFIG + OpenSSL update
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
X-List-Received-Date: Fri, 16 Jun 2017 12:24:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-16 at 14:24 +0300, Alexander Kanavin wrote:
> On 06/16/2017 12:53 PM, Patrick Ohly wrote:
> > The recent ovmf update broke secureboot because upstream changed the
> > +OPENSSL_RELEASE = "openssl-1.1.0e"
> > +
> >  SRC_URI_append_class-target = " \
> > -	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
> > +	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/${OPENSSL_RELEASE}.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
> 
> Is it possible to make ovmf use an externally built openssl (that is, 
> the one that is provided by the openssl recipe)?

I very much doubt it. The externally build openssl depends on the libc
of the target system, and that isn't part of the environment in which
the OVMF firmware runs.

> Given openssl's baggage of major security issues, I really do not want 
> to have more than one copy of it in oe-core.

Now that OVMF seems more flexible regarding the actual OpenSSL
implementation that it uses (previously, one had to use pretty much
exactly the version chosen by the upstream OVMF developers), we could
try to make the OpenSSL version to use a distro setting and ensure that
both openssl .bb and ovmf .bb use that version.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




