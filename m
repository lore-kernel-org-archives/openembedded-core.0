Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 859EF71AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 08:29:11 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j13so110350899iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=HE2AvbG/bLj+egUxHb6n2hnzGZsKuvOlG1RBUNuimAw=;
	b=cNdNz8x8suLxmpJS63TpW6a0HKuCnwfolNlzCPqYABBbuTCjFXH7oob0SRiMjjs9e3
	ADz9jfCy7J8Uxt7NyspiZkFuyBKaAL+yQiAMXt1fLy1LmlYDQsvMfjKLG/6JsUaTMjRO
	+qnHw/c6ak6WomC7R4dU9Bkxv1QGCvw1cF1fH24U6ZUSk+1tLfdPTcPe8puF7J6uhuRE
	WsO3hYrtDJWQOFfY1z1FcyeOQE1GmVDmg2wxI9VCLE83MjZIekavd2CUCslCIA7yq0j3
	VvVICC7CUlyszNjXKjJBto/dtB1VX3feXvGYcqo6twSU/LC+mXvQ3ZRrVCX0zRl7HOAb
	aJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=HE2AvbG/bLj+egUxHb6n2hnzGZsKuvOlG1RBUNuimAw=;
	b=I/tnjGW4kOq2cb/l6+iEfM5noFvSmX3JgwRQadrmB36h4T3FWdYbEYjOSMW89U95GK
	up/njYWaQWUcIaNtfI3MtjtBSeoRNdKfxwivKbERe5DQPpyV1FTlnQOEjbTwy5Gv7N4A
	JKfvKzakQRcrwM3/L9WTBIgjM2xW+yio8hyhWI+FaxszFkPEl9cpCVkrradaQ0ad266z
	95qzkIngGEgVWJ1q2MHiNwUoiEafptIt4dN8cjOSOrsntNLhMPgVwSaurg4qkMirSJak
	X18DuNWlFpwgr79/DiyOsvkz5qzifd1ddop8FRwDtMg1o3TiWRjELz/GPbFOpb0wswVc
	OoPQ==
X-Gm-Message-State: AMke39mekKBNfd0tQ0MlfkYKA75v1L5D1BngRZCokZ+XQWw9ZnnLQ8vMuYxEh86hKsNZ0SYK
X-Received: by 10.107.185.212 with SMTP id j203mr9738052iof.226.1486542551512; 
	Wed, 08 Feb 2017 00:29:11 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DEB3.dip0.t-ipconnect.de. [93.232.222.179])
	by smtp.gmail.com with ESMTPSA id
	q89sm10966354ioi.42.2017.02.08.00.29.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 00:29:10 -0800 (PST)
Message-ID: <1486542547.14889.196.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 08 Feb 2017 09:29:07 +0100
In-Reply-To: <6be3c94d-099a-907a-15f6-651ffb3d8c4b@topic.nl>
References: <9b8f8f39-aa5f-cbdf-8d45-9bd0e27c9404@topic.nl>
	<6be3c94d-099a-907a-15f6-651ffb3d8c4b@topic.nl>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: (morty) Python exception during rootfs
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
X-List-Received-Date: Wed, 08 Feb 2017 08:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-07 at 17:08 +0100, Mike Looijmans wrote:
> ﻿Found it. A rootfs post-process function was misspelled, and that caused it.
> 
> I'll make a patch to improve the error message here, to make it just say that 
> it cannot find "func".

I already fixed that in bitbake master, see commit 25df3db5 "build.py:
avoid exception when function is not defined". Sorry, only now saw your
original email.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




