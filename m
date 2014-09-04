Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B566C71403
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 14:12:24 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id f12so9349278qad.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 07:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=P1XJ1I7iH/XMKYO1dJTV79mzg30uKRynLop3BcZrOwA=;
	b=GEHLvqV35TXDAyxogJXsIashbzR4gpkOw6rDhLFkIZv8zHcar40ksQ4YQt+9IXq8Dn
	QPorPC4C/0T78/C4kZ+DArLytmiSLD83BQzdAuTZkViQpN9Re3CCuye20vuTmc7UJQwP
	H7CU4QohFR6RIcRs67okyJjjFfZdcvvysIPpkMq+UYxOb/8+4hOsloY6kuHtBQ4QW34N
	Z+/MZXsCY0fvAB9XBJmjnkjlLkIt2XFGZBDLS8WRM6leZ+BvD1Q1MzDeuot9gb8Cfoae
	AAtvRzwLaNk6M0pPjyjIrg8PEKVKR/XAt11HTNvF3QV5Ha9GYTN2V9utVvrgXxr+DNse
	mqGw==
X-Gm-Message-State: ALoCoQkmBwcc5nR2cPFvl/FP7LNtTtIcRNE4TY4YV+UEVDggXIREisKrvpG3MTdnXtx+tEOYkfbD
X-Received: by 10.140.94.234 with SMTP id g97mr7044324qge.77.1409839943907;
	Thu, 04 Sep 2014 07:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 07:12:02 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 15:12:02 +0100
Message-ID: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 14:12:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Quick question of style for the community to bikeshed on:  in the
general case should recipes be split into foo_1.2.bb and foo.inc, or
should they only split to bb/inc if there are multiple versions and
generally there should just be foo_1.2.bb.

Specifically I'm looking at the libunwind patch for oe-core (moving
from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
Personally I feel that splitting them up complicates packaging and
should only be done if there's actually multiple versions being used.

Ross

