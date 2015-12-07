Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E353660124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 19:02:41 +0000 (UTC)
Received: by ioir85 with SMTP id r85so191369877ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=N6WvSpwOf1icBbNGW4uXhgc3gbdz3KMafIXmM2ZH3p8=;
	b=DuI6Ve6f2Rf9tW01+en1z72EWe7LRoWt74UeZd0Fza7Y5rqzsi5hmSwFgiFItzzSIN
	l57ZdQzgKyRYm2kosKhMU3av51Tv3g5Byvt9PnZXiRj+h/9nPLntqEgVcstt8Gl8O3JZ
	oJESYzuUW5BeMif4chS5rGRksWHuonLhebO78J4T+ADvTzfNkga9Ke8/zy33vOiQjN5e
	fJ4kAmnlSonp2K9ug5+Saf0nxio469B9UKzFQaPUXK6i7tM+FQefE417ogJDmVhssICP
	COejpNVRLwFnQOsXSSU6qL/D7SxR1vpOgLUAFe89ToOMSNeO0un2+2GPgwTuemqEBp0z
	MwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=N6WvSpwOf1icBbNGW4uXhgc3gbdz3KMafIXmM2ZH3p8=;
	b=JYmi2OADVveyMs31LfdMWV2t5moha4JdkNMVDQAUjkbu9wibuRPpiz9LygtsiU6CYV
	HPnIux9mbOSdPvQ5k0NYkbu6vpflRkizUbvJKow1qRSNxX6txUgE+OKUppwYp7G8mMe7
	6BKrgDkJnDfEGZw89nGv5QYNpvF/WFo0G3xfYyLRrBEOEUlLZaqP1m/47/OIRezNpTTQ
	SnwwmbQY+7djZmy7VYX+w4El/s17DrCCcwx2pB8BTErelu8pa7Is7L0hTxu2kNTBtw9g
	cEmRiYoLe3FIhYbo2VQvORj0zkCUDH+SWeheCg1nZmDarVBYIdvyr4u83bW9ehzOwqYw
	Z4/Q==
X-Gm-Message-State: ALoCoQkBcZhHj0SLLq6wBQcChyfIbrJuislgYA2XB/hlN72Ttj4z3bFSsy/Im6ceaTwyWaqOkXCL
X-Received: by 10.107.159.199 with SMTP id i190mr25204097ioe.29.1449514962361; 
	Mon, 07 Dec 2015 11:02:42 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DEE2.dip0.t-ipconnect.de. [93.232.222.226])
	by smtp.gmail.com with ESMTPSA id
	i69sm10267008iod.27.2015.12.07.11.02.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2015 11:02:41 -0800 (PST)
Message-ID: <1449514958.30674.37.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Date: Mon, 07 Dec 2015 20:02:38 +0100
In-Reply-To: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dbus: build with systemd support
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
X-List-Received-Date: Mon, 07 Dec 2015 19:02:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-11-20 at 15:38 +0100, Andrew Shadura wrote:
> It's good to have the extra functionality, such as seat support
> provided with systemd support. Not least of all to support
> systemd user-sessions.

Your patch is against D-Bus 1.10.2, which is not yet in OE-core master.
I adapted the patch to the current D-Bus 1.8.20, but there the
advantages turned out to be (IMHO) fairly minor: it only adds logging
via journald.

socket activation via systemd already works even without
--enable-systemd, because the recipe explicitly installs the systemd
unit files and the code itself supports it also without
--enable-systemd.

But I like your patches, so perhaps including D-Bus 1.10.x (1.10.6 is
the latest stable release) can be considered for the next OE-core
release?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




