Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA2716AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 14:10:31 +0000 (UTC)
Received: by igcse8 with SMTP id se8so47880624igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=KFdMtoTrQUCvPaKUZl/+60C6eeRsH+jenm9Uog1Mclo=;
	b=ilxJ6P77ZT9R2PNkP4IsHGC2uyCcJMfV0lqGP7wcCOedhNlyAktoPiD40vD2i2cFlQ
	/zto2lTQJBfPA2TdiO7MhywKTz5GyOIKiWGWIcDbEapcyZMLcqdh9azn18khYd5rTckp
	KEWN6zocqprCwaGWpQUjMcxCUVZ0v6dmAREHhLItvU+AeicjRb0h0Qh/2qeH53SHi3yh
	FRSgC8agNoUQbQ5q/Zyi4iwF8RGRj1Z5nNDyfKu5YrwF7aOv5dnqLiVRFmlLsGmzfBEY
	Fk2ACRnLt6OSLxpAtMhOXfXiivGC1edtH99PsrWiz5fju97NKM6RGHsV0+0dFHzRixYZ
	n7pQ==
X-Gm-Message-State: ALoCoQk5qWR+LHQdDTBfbhocgVqwGExIyKh8AkwiLAecZscEyVfoV6zDMMru+9nJgk4onQB4Kb1X
X-Received: by 10.50.61.144 with SMTP id p16mr13897474igr.22.1440425431303;
	Mon, 24 Aug 2015 07:10:31 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBD.dip0.t-ipconnect.de. [87.165.109.189])
	by smtp.gmail.com with ESMTPSA id x3sm8906637igl.2.2015.08.24.07.10.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 07:10:30 -0700 (PDT)
Message-ID: <1440425428.17883.3.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 24 Aug 2015 16:10:28 +0200
In-Reply-To: <1440078442.17136.60.camel@intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440078442.17136.60.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Mon, 24 Aug 2015 14:10:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-20 at 15:47 +0200, Patrick Ohly wrote:
> One more comment: it would be slightly nicer if empty whitelist could be
> distinguished from no whitelist, with "empty" meaning "enable no
> recipes". In other words, replace "if whitelist" with "if whitelist is
> not None".
> 
> I want to list all PNWHITELIST_xxx values for meta-openembedded, even
> when the layer is not (yet) in bblayers.sample.conf, in order to be
> prepared for adding it later. Doing that with an empty string is more
> readable than with a fake recipe name to make the variable non-empty.

I'd like to retract that proposal. It's unusual to distinguish between
"set" and "set to empty string", and once set, it is (as far as I know)
impossible to unset a variable. I.e., when a distro conf enables white
listing for a layer, a user cannot undo that in local.conf.

Perhaps there should be an explicit PNWHITELIST_LAYERS variable which
lists all layers for which white listing is meant to be active, similar
to PACKAGES and FILES_<package>?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




