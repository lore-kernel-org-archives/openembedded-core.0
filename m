Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id EE39E771EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 06:51:41 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m68so7107064ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 23:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=nZ01LaGKX2aWfYrGtdr/XH3BXQ1lmfYrJ3DC3hVIa/0=;
	b=GOD7CMV/k5er0noTh5PNJkAxBssgJuRTa58S6GbC1IUNtLUg0a+//Q73w1k/p5Vtdx
	zaalI2+Q5JUHQ11JWPUdugJv+uSnS+91bkKMRYJ8brjutL8CVYsvGL8JMbeZCl4UFINU
	92aQpuW+zfq5KUgILETPQtUT/AQsr5g8B2b6iX4LZsouvg0DfS234KcMvaiZFvjaL/9b
	ii9iM+AxkXfOziTXhfc2ImSu0unQkoqNv6L3AuJIVAO2WN1njRFklN60lvLOXnNy2RoT
	RTtZ+t4xpI4mF2uqG2GVSLYSXdfqRBPzsIh9n9j0NlfEbVrhFjFSkZW0diuwjzsLoHFt
	WKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=nZ01LaGKX2aWfYrGtdr/XH3BXQ1lmfYrJ3DC3hVIa/0=;
	b=thWcrc7nfB0c0mrHpxR1jwThQYU/4HjKI96kf1mItVhVJt6SBmFCcR0E0xJ+Y52J+L
	LTflNKv/0x2Iz7qumKGiXYNtZN7x5Ietj5Skg1fs4MKEFsHt6jAuz72/EiW5YEWoo5GZ
	3+dw1mn+/YQDhqrF8auqcbOJSnqSkEL9Z7s6ZEoaNGP9GfGhZXo69C61FaXXa+MVqggH
	ljdF+5gn+440ba08WF4EQlc825oswpzWmi5LTKKQhVacNY32te4eQFUcTSg0TWaBBw94
	hf00sZNH9/p/5YVIUKXx6HBFReVcqEsttuMS/Cy24yTJiYG50aZAtx0UL2z7DbTsU+42
	2W7A==
X-Gm-Message-State: AIVw110C2gr+yVJd5VHHMBcjl4GxmH35/2lew4CU/F46ICVcZ2hYnO7K
	ZS8a8x7OXgsPs4s8
X-Received: by 10.36.80.201 with SMTP id m192mr20114441itb.31.1499842303070;
	Tue, 11 Jul 2017 23:51:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F424.dip0.t-ipconnect.de. [93.232.244.36])
	by smtp.gmail.com with ESMTPSA id 88sm1143091ioi.5.2017.07.11.23.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 23:51:41 -0700 (PDT)
Message-ID: <1499842297.20211.103.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 12 Jul 2017 08:51:37 +0200
In-Reply-To: <1e9c0f3ee67bdcb9a810c1a3e0bdb31a283a6c0c.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<1e9c0f3ee67bdcb9a810c1a3e0bdb31a283a6c0c.1499803885.git.anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/30] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Wed, 12 Jul 2017 06:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>      def setUpClass(cls):
> +        super(VersionOrdering, cls).setUpClass()
> +

In Python3 one can simply use super().setUpClass().

Not sure whether that's worth a V2 by itself. There's also plenty of
other code outside of this patch which could be simplified like this.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




