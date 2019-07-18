Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAD607EFFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 22:37:54 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k8so54471479iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uPGwRZvaSm+ZO8obZdr59hba53qiN22godGC2xTLx0E=;
	b=WkFW4iSy6flwMv5NreIiJP20zRZ4TKMNKC2kwhuwfLcxuf/gJHTKdPHq5O14Bl6Wuu
	xYfQoDVcuFDT8ZjY9l1vdhEfxmHn1vdjfzx6ewnlbrArd85xiKt7tqvtRU3OGvjusSl1
	SoixnlNeeoXGQM09b9gLXJtQDuLhSKfKmqSxxzKg9nCDcXkggTiE33Pdy3Y4n9+fePe1
	4vDJFpfR2sJZOHk8yRGtqMxtNR6O77jMOHvVCbzHWEXcaSJGF3+sn2AkTOz4DgyYrI8/
	ISd+FSbnYULI7k7kW5xz10gohKQL4S3E/OyYYhUrqWo5ywmwkYvWHp0riyYW8NaZqgyL
	ODaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uPGwRZvaSm+ZO8obZdr59hba53qiN22godGC2xTLx0E=;
	b=VO3BIT9xzE/jBZSwyxQQPE+9HeLuK4ZFviEXdydpbz/sHaOI2j0LN1V8DelbBnZT1x
	32K8yFGYJTnjc1xWGfYh9ek4Jkkkd1/LP4I8Hkklw0nIxMoM2jGndr8vHVUcnoXiLgUg
	SD27hrP2DIUmpWM7q9ktL9HK1qKk7+NlC4D6pRfTXpmlxJYCb9xISwE+0dpNmGFPC1f+
	ozNeWUNOzFB0zguRsxy6M4QWSns+KpiAKCl6U44Ll4cS8H7fta11Q/twMansg+Jx+aHg
	4sxpPZfsLbQ+hMO1npL33SvLvvEYSNq4O++WDgOw/Yj5k5jLXFJWtEKpPZZF0/b+TiZQ
	ToyQ==
X-Gm-Message-State: APjAAAVCaXe2YxhnPdq4jymydYvtSy9jgqET3abM2OQJCgsA1RgatKXI
	mslqDoOQ6kr9Bh7XYfyjQsxxmEK8ZXyFwaT1GV3mnw==
X-Google-Smtp-Source: APXvYqxsFnibtDX+9IAzqAY9BZKL9Wnizy1PfIBrVFQZGBHwtXMudQlCpOdfCMe/C2rvhjOn3t2WEBW8M5kl7RFQtMw=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr43352754iot.200.1563489475921; 
	Thu, 18 Jul 2019 15:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190718200400.19750-1-ross.burton@intel.com>
	<20190718200400.19750-3-ross.burton@intel.com>
	<2df077fa-fbfe-15f6-d690-ff3f611a2128@gmail.com>
In-Reply-To: <2df077fa-fbfe-15f6-d690-ff3f611a2128@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2019 23:37:44 +0100
Message-ID: <CAJTo0LZhYbDnQgqASA69Z=4+=v6APjuE93+Hiu4uQLsZf9TQ0w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cve-update-db: refresh once every 24 hours
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
X-List-Received-Date: Thu, 18 Jul 2019 22:37:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jul 2019 at 23:31, akuster808 <akuster808@gmail.com> wrote:
> Any reason this can't be configurable?

The raw data isn't updated a lot more frequently than that as far as
I'm aware.  Also I may retract this and replace it with simply using
DATE as the hash because otherwise the class causes constant rebuilds
of the world.

Ross

