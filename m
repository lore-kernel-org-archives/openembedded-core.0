Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E70C373130
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 15:51:06 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id f84so32618121ioj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=i9+WbbBVcq0PJEcQgHOrpNSPaaG8M9AVnyGLfPUhdJM=;
	b=ajgqiKTSSXP49qFkfYe3ejGIQu0LyUTlRQ8gFAGZnUX8TM2HLjcNkoLSnfVGXjX2eJ
	BL4eBx1TaTrP9Sgs6i1GkN9RhNoE2+IvtL7dI65gd+Jp6SgiBvSB9HztZMJdxzZIt1aX
	uwBjKaatsq5PRcrbMtiJfek2zLwKOnNp2YnlMn6guPuipMBq9MXoAMwzxE6mQg9WmEUb
	D+rAqf0AuWjte/Lp1iJir/XPk1mdJtshbbhMUczfXarrAPysMojsDhbz2xCrDdF7CIAq
	AjoCSnTTSuri3EHHmPG4Nfrg9/WyGjust1lfC46iy2XrJZRNt48AGHCMlMamXT/Icf3c
	jYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=i9+WbbBVcq0PJEcQgHOrpNSPaaG8M9AVnyGLfPUhdJM=;
	b=p+UZNxAW4kjBVrDuGcDSyRvTwf4iDEHMwyQD0bP3ya+EZQ9P/ZNApOpSBY75AFF/Vo
	XRIeelqS86JmfC7ioS+kCgOxxjcOWI38bKRcTxOy1ZEmFBUww5mknhCEs812JVf8RH9j
	UtO0frShV1cn2ogwKo6wqeEdxDxUDx8KGEJnHVL7/1UdrUfr8Z+OBrxaqe34tTBxlFNw
	tBGLdgDDRBrmA+4Dg87H2jTidv7Bspi9EpK4NyAnuqPUgKk0Aeub7Qw2PWO52dVkllH9
	C1X8GOWCegBjBchgerm+JHJgOytOJUCitWdeuunJWwOELYDlcHCZOFDlpNI98wYL5VT1
	x8CQ==
X-Gm-Message-State: AMke39lELONwmA4ibAt6+yTfZtlxjH2CgG3MwaRkHFBy2JAwm2Cm0trZbViTaXg5pZ2zoJZo
X-Received: by 10.107.29.144 with SMTP id d138mr10495722iod.22.1488383467718; 
	Wed, 01 Mar 2017 07:51:07 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E037.dip0.t-ipconnect.de. [93.232.224.55])
	by smtp.gmail.com with ESMTPSA id
	f42sm2248672ioj.35.2017.03.01.07.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Mar 2017 07:51:06 -0800 (PST)
Message-ID: <1488383463.7785.165.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 01 Mar 2017 16:51:03 +0100
In-Reply-To: <1488381139.24526.30.camel@linuxfoundation.org>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1488312568.7785.73.camel@intel.com>
	<1488340816.24526.26.camel@linuxfoundation.org>
	<1488352225.7785.83.camel@intel.com>
	<1488381139.24526.30.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Wed, 01 Mar 2017 15:51:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 15:12 +0000, Richard Purdie wrote:
> On Wed, 2017-03-01 at 08:10 +0100, Patrick Ohly wrote:
> > Is the "build single distro for different machines" scenario that I
> > described part of the Yocto Compliance 2.0? Should there be tests for
> > it?
> 
> Right now its not

Okay, so the goal is a bit less ambitious than I had thought. I wonder
whether that's useful, because at least the problems Ostro and AGL (at
least as far as I understood it from lurking on their mailing list) had
only happened when trying to combine multiple BSP layers *and* actually
using the different machines in the same distro.

> but I'd consider it.

At least I'd find that useful - not sure about others ;-}

>  The question is can we write an
> easy generic test for it,

It's a bit more complicated than the existing tests, but I think it is
doable.

> and also clearly phrase the criteria in the
> list of compliance questions with a binary yes/no answer?

Does the BSP layer only modify machine-specific packages and only when
the MACHINE(s) defined by the BSP layer are selected? [yes/no]

The "only when" part is covered by the existing tests (because they keep
MACHINE constant). The missing part is comparing different MACHINE
sstamps.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




