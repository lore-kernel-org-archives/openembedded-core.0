Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3A67197B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 19:22:34 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c20so19141388itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=sYO0L8NztnRmBI+S7qxI0eVHxmV35EdGQrpWizPNZqc=;
	b=pbShJ0AV/Yx631SNWqb5x0obO+cTnaFqwHrOVmmmuXBZ1hoabY8mgxsZocHTeHUhXF
	Kmah4z3eo7nIKQm5g2C68zZdAIQBrya7LJZ3V02fz+wj1de6aAjOMk+Zu3iDa/UgRdpo
	kmd683QGGpVhoizG4zwGw7wTQJGsb6EDX6OW7wL0/4xxDN530IdN1aMrxXuOsF64xLPm
	PgcOaICBtSLIKLiYHf5x2c+g1XgQuhaWSckQUjNYiopnkBDrAlXof18de/MZDPpboLtD
	2TJbvVxDtYLWKb559bTplCHmkIYyT6cO4XfivgnLft19QzTQzqGUhpJ0tJb4AhLHdAGS
	gfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=sYO0L8NztnRmBI+S7qxI0eVHxmV35EdGQrpWizPNZqc=;
	b=qHQYWesG96iMNZuULGq/gLewLkMgLBQBEJbJffjRCLBRk3hLDb5gz3a/6AaeKzqIkf
	EA4UYb4O/X6IC2S3hKodIqkl0HG08idOznUP3nM+ciU5p6h6pT1RjuLuh+frfAk47xlR
	VoO+ZQRxfh667b4yIzp1EV5IY43O7kaHY+v9g5nWK4NGpjxGjHu1ldf56La1akHyjdTM
	eaTLhemKUuIMrud1ZITpqfZKWWfz3JTbUvz2m4/K7yeoT9F/MakvHb16kG+Js56t4Kji
	x87Wg4rxPiGznUtCusgjPlLW8facsVb+E0u67ojriF49yuMCnD+qYooT34bZtlvU9HsP
	GQrg==
X-Gm-Message-State: AIkVDXK/NR06ZDy90wAjWbrtIrL754gGNQ0THHatuzjnGoJwQJu5n26uGa86HQMRIIwP0tr8
X-Received: by 10.36.118.211 with SMTP id z202mr159690itb.65.1483730555208;
	Fri, 06 Jan 2017 11:22:35 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F5BD.dip0.t-ipconnect.de. [93.232.245.189])
	by smtp.gmail.com with ESMTPSA id
	l73sm39777962ioe.1.2017.01.06.11.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 11:22:33 -0800 (PST)
Message-ID: <1483730551.4383.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Randy Witt <rewitt@declaratino.com>
Date: Fri, 06 Jan 2017 20:22:31 +0100
In-Reply-To: <CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
	<CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Fri, 06 Jan 2017 19:22:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-06 at 10:31 -0800, Randy Witt wrote:

> 
> I'd rather see this be a new class independent from rm_work. People
> can always in inherit both rm_work and rm_download.

I'm not sure whether it's worth supporting that mode: what would be the
motivation for removing downloads, but not the work directory?

I'm a bit worried about unexpected breakages when using just
rm_download.

> That being said, since this doesn't operate at the fetch level, i.e.
> only remove things that were fetched as part of the current invocation
> of bitbake, I don't see why the user couldn't just "rm -rf downloads"
> themselves as part of the ci teardown.

The motivation for rm_work_and_downloads.bbclass is the same as for
rm_work.bbclass: reducing the required disk space *during* the build, to
get builds to succeed which otherwise would run out of disk space.

A "rm -rf downloads" at the end of the build doesn't help achieve that
goal.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




