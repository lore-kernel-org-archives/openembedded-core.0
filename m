Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 47E8C78277
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:36:32 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id i7so20969122ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=hGqUCEAS6I0keG27bP2VMv/rliuNPkSSLGP7I3ymmG8=;
	b=ZN0xShr9T2FRM7F2moih4wCfiS0l6QacBgMWBVXFB+MCkJuXc33BpsZF1O9SounPIY
	aYURRHqhGuychxWundMGiRPoqAxmlztMqmorM9SigeWMdUSr9cnGr3fIAu990cW+Bzz2
	rGKWqn1Y2aodEmUkptbIQ2q9xskgT4x38rlPu+04m6OHeQU8gpraGm4SmfHosiCaQDU9
	BdfvjudOQD9z+wB0J7WqfZg1FbH2ImPi3nWzKXgg9LPo2+olSYgYcg3D6MnWnI8+WV7B
	44lmnFk/U10X/yyoOXL1ayuXSQSTh+N++LhynX2onJQ95WGknC2Kgqa/Fhsmbd151ME4
	NXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=hGqUCEAS6I0keG27bP2VMv/rliuNPkSSLGP7I3ymmG8=;
	b=VUJzSR1YL7sDLYmno7tbEnvRZSr34qdsgRFaJ+vZRz22SHFPI1y9WiCc1CJ3ZOZBsH
	6QHnNP9F6eo/ajbeAoDDo1tEz2Ekr8WeFojLnirXeuFbRzDz6sKzn2ONbSUYjL4VX2nZ
	1OGrp2BBloTBjPOhEbx0/s0IsHJb++WiC2vvivfOBbEHnjlj1Zt5g0j0VYKZ5WO/iXCo
	sOUYhfdMHIQXj85qEs7xCMRf9jiqzXyfigsfbxLfmNNUmqqmJLP0S5giyDQ3fMzfYxbT
	8JUZL5ChZWV9RrN0kFlXozcQsYux7pXC03b46w8qQYoZRTgl+CLqpH/jq9m6AZ9IUqjE
	ro6g==
X-Gm-Message-State: AODbwcAHCPa0DTMeAeeBjAdfFfF/CFbSK/PpV1Xk2Gnth+DFfdPoc0/Z
	9Q8tqVejRUJD2QgT
X-Received: by 10.107.155.140 with SMTP id d134mr36054956ioe.88.1496932593230; 
	Thu, 08 Jun 2017 07:36:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id
	r82sm2224036iod.45.2017.06.08.07.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 07:36:32 -0700 (PDT)
Message-ID: <1496932588.30163.135.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 08 Jun 2017 16:36:28 +0200
In-Reply-To: <1496913653.6630.233.camel@linuxfoundation.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<4e9ae0188740bcab90705399321c8db4631ecbc0.1496849345.git-series.patrick.ohly@intel.com>
	<1496913653.6630.233.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] utils.py: helper function for optional include files
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
X-List-Received-Date: Thu, 08 Jun 2017 14:36:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 10:20 +0100, Richard Purdie wrote:
> On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> > By using oe.utils.optional_includes(), developers can simplify the
> > code which selects which additional include files need to be included
> > in a .bbappend.
> > 
> > In the simple case (one distro feature and one include file) the code
> > is not shorter, but the intent is clearer than corresponding code
> > using bb.utils.contains():
> > 
> >    require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }
> > 
> > More complex cases are also supported, in particular include files
> > that are required for one of several distro features or multiple
> > different include files.
> > 
> > To keep the common use case simple, DISTRO_FEATURES are checked by
> > default. Checking IMAGE_FEATURES might also be useful.
> > 
> > The DISTRO_FEATURES default and the intended usage make this more
> > suitable for OE-core than bitbake.
> 
> I'm honestly not sure this actually aids readability.

Fair enough.

> Taking your example:
> 
> require ${@oe.utils.optional_includes(d, "foo,bar:foo-or-bar.inc xyz:x.inc,y.inc,z.inc")}
> 
> I think I actually prefer:
> 
> require ${@oe.utils.optional_includes(d, "foo,bar:foo-or-bar.inc")}
> require ${@oe.utils.optional_includes(d, "xyz:x.inc,y.inc,z.inc")}
> 
> since its more explict. Spelling this out with the existing syntax
> isn't so bad either, I probably still think that this is clearer too:
> 
> require ${@bb.utils.contains(d, "DISTRO_FEATURES", "foo bar", "foo-or-bar.inc", "")}

That's the "foo and bar" case, not "foo or bar". It's an actual mistake
that people have made and that didn't get caught during code review.

> require ${@bb.utils.contains(d, "DISTRO_FEATURES", "xyz", "x.inc y.inc z.inc", "")}
> 
> How about simply:
> 
> require ${@oe.utils.distro_features(d, "foo bar", "foo-or-bar.inc")}
> require ${@bb.utils.distro_features(d, "xyz", "x.inc y.inc z.inc")}

That works for me, I just wonder about the exact semantic of listing
multiple features: "and" as in contains(), or "any"?

I'm leaning towards two functions where that is explicit:
  oe.utils.all_distro_features(d, "foo bar", "foo-and-bar.inc")
  oe.utils.any_distro_features(d, "foo bar", "foo-or-bar.inc")

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




