Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 138AE76DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:45:23 +0000 (UTC)
Received: by iods203 with SMTP id s203so46616675iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 23:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=L5RPgabtDiACWnQw4kZsp5NK6AomEZarrNppgYvWUwo=;
	b=mEOWhtI8raF9HpkmXP+AI3BF5M6TVQO9TnyP4zZRRPkefO/RlUoBH3CyoEfYkC7lDy
	9UQycpUlCwtwmJY0KgfVVYn8H/JRkx4k4AKj+Rf7uBeMM0qvp6LMJUvzwtKaMDKqy/Ov
	8tSUzbfNNv2IrQq4uclIFE0tuPGEqsrZx76FrOn30iJSQoZZN2boR4dUEIH+OxPLwJ5W
	EZSc9tGxFDec2ysx2/WawCmYPQy6EPWima4eWJN4mkHtso6lke9gzHfMKJAALS/cj6h+
	hKI2KRtdJuVPsCaO3NbMEi6UNJneFOYQenxCCje929OPXs4Ps2vFgUzGUSV8wAo4a4FP
	XJkA==
X-Gm-Message-State: ALoCoQmlapL1LJKOBnpp0e/vyWtQMH6B3F4PwrbgpPa5OPqyIUisZzAICDYyHYBpbxg9hx09nNi7
X-Received: by 10.107.15.39 with SMTP id x39mr8300352ioi.156.1440657923717;
	Wed, 26 Aug 2015 23:45:23 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2EE.dip0.t-ipconnect.de. [93.232.242.238])
	by smtp.gmail.com with ESMTPSA id b5sm1125027iob.39.2015.08.26.23.45.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 23:45:22 -0700 (PDT)
Message-ID: <1440657920.20082.28.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 27 Aug 2015 08:45:20 +0200
In-Reply-To: <CAJ86T=WnRNNrh9kr7QfHtP-tqmxdtZ1qm-0mnsAA1ANW04qysA@mail.gmail.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
	<CAJ86T=WnRNNrh9kr7QfHtP-tqmxdtZ1qm-0mnsAA1ANW04qysA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 06:45:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-26 at 12:02 -0700, Andre McCurdy wrote:
> On Wed, Aug 26, 2015 at 9:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > The unconditional removal of -DWITHOUT_XATTR accidentally introduced a
> > compile-time dependency on "acl", because "sys/acl.h" gets
> > included. This caused random compile failures.
> >
> > To fix this, we introduce a proper PACKAGECONFIG for the "xattr"
> > support, with the distro's "xattr" feature determining the
> > default. Setting the define must be done with custom code because
> > PACKAGECONFIG can only influence configure parameters.
> >
> > The "acl" distro feature is not checked because although enabling
> > "xattr" support now triggers a build of acl, nothing from it will not
> > get included in the resulting target image.
> 
> Typo?

Yes, the "not" needs to be removed. Can whoever merges the patch fix
that or should I send a revised version?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




