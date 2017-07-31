Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 566F16E671
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:39:50 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id t86so14915819pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=wijngPo2L7nDFkOZw3UZ6pXtkb8mlESSUgY8kuaZrck=;
	b=bKLYLRsL1IKmli/Xbkn9XGxO8WwOjpMS4il8+BEplaraUYXsbLjjrQnE1ykMqUm6W/
	LW1zKjGhIYzO33K73kuWEveTazsjkpQHHuTOB2sUaARco5LUQDihmMlg14+r0RbLtGPW
	3qSDvpOpltuMHxJoxjxrt64e0+7o+7jWvcNuqrELkfSWBD8HVZkWD4xPTISFYe2lFdZM
	UKVjngCeu7lllBD8sis1egRqK/oylyugwoR4TASNbFtY+BmwAae2+eSKn+6S4FXMVg6m
	5gpYyCCLAxSC5bgI5BpdzRtKSwpWswnynbpRa+y4q3KsIakmJPZc/QPXqWc3uB5Mm/96
	Sh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=wijngPo2L7nDFkOZw3UZ6pXtkb8mlESSUgY8kuaZrck=;
	b=b2KolNhwIUOBGs12cbaqSaeR4mOW5wJLhuIKd0/d3ZEx2wpVAbqVX1McoWsO0PZxfz
	r6VvH1kWKUN+1n+XAZsTOXfNe1X0xyY/tl8IuvriPXdQ5MOMP37aDcK9ijwt47rRDrF4
	h68FF6XQliIL/GeeNYsRpudOOgu46Fuw8zVXiUTxdJyjbS0PGNqAT1zjA5lGYTth/c07
	23FPAWxdzayDEFqJkjh5R93in2+X32/3MgA53iWOpmM3Qoo/VtDG+SJm+Z9LgetGqSMT
	6aUl96zFGneo4gGT8FxyLUg6/f6zN89XBERP7nwqzhb0ZpLv85F69Wjq+aEnca53K8U8
	pemw==
X-Gm-Message-State: AIVw113cs1iqGZDZKAmI2Y6PuQWIlJPNwzqKRffCfu2VrPMLkP2njiSv
	6k4FBWN5zsbQITSI
X-Received: by 10.84.247.2 with SMTP id n2mr17953549pll.457.1501529992429;
	Mon, 31 Jul 2017 12:39:52 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FE53.dip0.t-ipconnect.de. [93.232.254.83])
	by smtp.gmail.com with ESMTPSA id
	v86sm49816160pfa.6.2017.07.31.12.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 31 Jul 2017 12:39:51 -0700 (PDT)
Message-ID: <1501529984.18875.33.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 21:39:44 +0200
In-Reply-To: <f6e284a595aaa7b2444dc521407f8dc5ed6e8961.1500848692.git.wei.tee.ng@intel.com>
References: <cover.1500848692.git.wei.tee.ng@intel.com>
	<f6e284a595aaa7b2444dc521407f8dc5ed6e8961.1500848692.git.wei.tee.ng@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: saul.wold@intel.com
Subject: Re: [PATCH 2/3] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Mon, 31 Jul 2017 19:39:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-07-23 at 16:51 -0700, wei.tee.ng@intel.com wrote:
> +
> +SUMMARY_initramfs-module-install-efi = "initramfs support for installation option"
> +RDEPENDS_initramfs-module-install-efi = "${PN}-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
> +FILES_initramfs-module-install-efi = "/init.d/install-efi.sh"

By making the install-efi module a part of initramfs-module that is
enabled unconditionally, parted now needs to be built for the target
even when only the rest of initramfs-module is used.

Can the module please be split out into its own recipe?

Alternatively one could add a PACKAGECONFIG for it, but that's less
flexible.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



