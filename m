Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14C4477354
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:40:35 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id n124so158691517lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=FP0hsj0wHIdWAfLQl5RKnqYqumLCQvoGArZKObhOpSE=;
	b=vyR2WVtiH0C22xzKVY4n3vgRP61f5yMcRaxYyf9ophRD8CuXaRgvquvE/m0fvZbiqw
	mVZhioBWtIVLRHiz+vshoV1GQWKCbwLa27hnll5KcJFjJfUVY8s+CVbrxQqUHw7SBMvl
	v2XwYdwtuT1xjxRMmgTltfqjIiLeFSKjQqJ0aqtGv7WFLQSwhcYLcqcXBFA4+7+/hdN4
	2l2ibypQHJ6HtwI0K6wQ4nSJptfrs8mDCuC+86B4hMnsEPzVh08xBPNixk4lxuKKUTSD
	oo1U7ScoqyOpyNVA0FzBy3HJdTL/uVDruk/Q5OurFLbpBSHyb9f8PEL4k5+A8mDYY8Hz
	fuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=FP0hsj0wHIdWAfLQl5RKnqYqumLCQvoGArZKObhOpSE=;
	b=To/zkJHG2bml4ck+sGDDW0tx/eYQdvBRrjrDRvIGGXMvv2NkbuUawDOAR5+V/t9YBh
	U3K4BpRrFTUfOJOAmP2hEueTNWtohSch7OtznvjlQTqrqLoXsgihkTLy2wDkubHdUN3K
	SCus+E7j2/8K4EBi3n0x4xag3YKdD0mdHE6qT29EyUd6MJw2aZMJyqxMNng4Xt0RC4/i
	ztrlcUMJb+/QcNXKf6G9r+gkHzCGWM68tvfI8AhT5jb9P2Tc6W88vcN6w4KBYm/13Qtf
	B2mhN6GFKoMlIXhNLdMW/Uh6pqb3q3vLvW2SKKijBhIz4EuWZg+3KOkCbsqmYIU3LWnZ
	19DA==
X-Gm-Message-State: AIkVDXK8XO1QTiFaGxaLEFbzLf/c22ZRon8Z9+0kQO3w3LGI44eQAYL04pgJL4bdJIcs8w==
X-Received: by 10.25.195.145 with SMTP id t139mr2004736lff.96.1485510035323;
	Fri, 27 Jan 2017 01:40:35 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	s20sm1151092lfg.29.2017.01.27.01.40.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:40:34 -0800 (PST)
Date: Fri, 27 Jan 2017 10:40:32 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170127094032.zpdy3uaohktwcgqk@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485505680.git.anders@chargestorm.se>
	<20170127092329.4462.45493@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170127092329.4462.45493@do.openembedded.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFB5dGhvbjMgcGFja2FnaW5nIGZpeGVz?=
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
X-List-Received-Date: Fri, 27 Jan 2017 09:40:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Patchwork <patchwork@patchwork.openembedded.org> [170127 10:23]:

> Series: Python3 packaging fixes
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/5024/
> State : failure

> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at a99cca0e8e)

This is likely due to issues with the email-patches. One of the patches,
0003, has a line > 998 characters (one line in the patch context, ie not
modified by me).

Retrieving the patch series from the branch at github should work, as
it's based on the current master, a99cca0e8e.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

