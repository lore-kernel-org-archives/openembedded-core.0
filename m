Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4C55271C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 12:44:23 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id m27so18209408iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=SVjy1cjTlxIUiwaBV3UsTEjeeuodnyTRm151AxKL/cQ=;
	b=lFGihuSGUwJ1xsV9PhV+ENyamdPmEVT7EFDIO7oHfI3HUazZbfg1po4PsfuWDLCX4A
	GPMzuRy6lp4OANCGo1D710o6eCJG0pnjN0ck5TjUZ59sunHU5ApcLbxi3b7eX529fyeG
	dXj/WDmouEWnK4kvL3AkHUa6EAiVOz7/NGWaTi1WmpqqAPsmWU3waVIpqVCJMIaikcep
	p3QcCiIkP5PgRsivCj2D+bxRfrXd/aCzfJrv1JCiuFijSsYWy6T11S55UuYr+MfHjGKf
	4fv0KZlJ+7bhzp42VjZEm0Xd173bjmNk6V40kaCnN52IqvWzyrbWiapei/T/nNdhSl4Y
	c14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SVjy1cjTlxIUiwaBV3UsTEjeeuodnyTRm151AxKL/cQ=;
	b=IuLGITmtAmSZ1TgLgAIOGuIppz19YujfS/PYv3FOLHoXiYHxD5eNHoTZBOFRpEjvm2
	zMuRa6ODN3qeeeLhI/irhUNwhs4C5IwEpFaVapt0EPsXJXJ0ACZBbSiPxJp/xxNdy3kv
	xAFEPb0CF+9nWA38CSrqR3oR+jCpLKGKljCcS6I/6oXewFP5U9YumJP0fEsMuWsKhKPG
	fuCEq7N3OFohHEm+BRvIZV4ispiqVGBk4liAFVN4K7V2MCcOnGVnOzArzwGGo4LhpE4E
	CLsYe8oQ4RNAsINJpwRAqIF30tByh+N262tUuJERReJz97C4BlOmJoIH2FN+KgB5Z+ks
	1JLw==
X-Gm-Message-State: AFeK/H0QZGyjbX8Y3sqWd8dzn573udDacTgEkzOn8AXgs7yUHVSARsV13L+IBepiCfoHOEZu
X-Received: by 10.36.216.4 with SMTP id b4mr5008707itg.100.1489581865183;
	Wed, 15 Mar 2017 05:44:25 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	100sm1433577iot.39.2017.03.15.05.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 05:44:23 -0700 (PDT)
Message-ID: <1489581861.6396.97.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 15 Mar 2017 13:44:21 +0100
In-Reply-To: <9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
	<9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 12:44:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 13:19 +0200, Alexander Kanavin wrote:
> On 03/15/2017 01:13 PM, Burton, Ross wrote:
> >
> >     +        cls.repo_server.port = 8080
> >
> >
> > What if parallel selftests are running at once?  Can this service be
> > started before the image is created, so the right port can be written
> > into the image?
> 
> I don't know. I only followed what Humberto wrote in the original patch; 
> we need to ask him. I'm also not entirely certain that hardcoding the ip 
> address will always work, and did not get an answer to that.
> 
> Another, more hackish option is to monkey patch the ephemeral port 
> before running dnf into the repo config on the image.

Or perhaps use ssh with port forwarding? Then the host-side port can be
picked randomly, while on the target side it can be fixed.

I was about to suggest qemu slirp networking because that also does port
mapping, but I think ssh port forwarding is better.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




