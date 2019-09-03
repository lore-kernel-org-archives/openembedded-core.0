Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Sep 2019 18:42:19 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF717F2DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 18:42:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 75229A011A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 20:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1567535827; bh=iSllO75Y2t4ach+lOM3rrEf+9CRx26VLoENU8JDyXAk=; b=u
	gGRdpQ0drkp/MBuTunLkWxCPhQ4i3H00CpRlbS6LD8RYZtRx8sulCxa1oZCecqLF
	lleSMUlEpWanF2l74jbhuyEShXd+tiIHGKQL3DtcaQ24cTexqHcrZmCbwBByT4wd
	uGtkhrpD9EE/PTHq+HKHcLF8S31+Degau9b5kCGrhNPOCfRbz/Dzn65s0JhOgpnt
	IChbYO3In7tqmsNyZFqM2T0AIa/OD6GFHZwrobtxIq9+0TEYPcrRvdv8O64XT+uk
	YmMRf0UNfiuCRo0lgvkoBPyvVG1zr3W7Xm+Q962f8lyJS4drMZ1zVcfKORpnpafv
	tXUJhFmdG3ipUjgLALcfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1567535828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=uvPFCwpOPLDrvqgPRTuX9ORGmg4lQhKhU4eE6QmqrqI=;
	b=H49ph3oE6h9Ex6Yy87FgzjwPukGrzVeKqNeaGbNOHG5l6LpitzJSVREt3ra/TZQR+Cl/yO
	bHMHQeaeACULz6ICMBPOQ2aWF0yx2kVyU83QwaSLpX0WQHakSpTVVqxSG7Y1yddLgmHRwg
	mDAN/ura53KPDmGsDeSAmqWcpU4Oh5TFbyo743Kft9mMAP1mfpEZye2KGLf+xUefUBzzwS
	arucVeIBrVQiLauC/8ozPSuqpw80rYhW0i/zORL2zZjNAhBITej9g2/XOBjkfUsvWxfcdv
	ddMYHzX7TD0/4WauloZoocRp4oKT9Ehh/kBkUGj39UZeSnjqtHsRCECtfogLmA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id U6romWj46S4m
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 20:37:07 +0200 (CEST)
Cc: openembedded-core@lists.openembedded.org
References: <20190817174901.6A730440001@auh.yoctoproject.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <9a559cda-e3a5-1f57-d66f-614d8f2c5dd7@mailbox.org>
Date: Tue, 3 Sep 2019 20:37:04 +0200
MIME-Version: 1.0
In-Reply-To: <20190817174901.6A730440001@auh.yoctoproject.org>
Subject: Re: [AUH] kmscube: upgrading to f632b23a528ed6b4e1fddd774db005c30ab65568 SUCCEEDED
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
X-List-Received-Date: Tue, 03 Sep 2019 18:42:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

FYI: I have updated kmscube to perform run-time checks that replace the 
existing build-time gbm_bo_map() check (which is what the patch in the 
kmscube folder is about), since upstream prefers run-time checks via 
weak functions. The commit is here: 
https://gitlab.freedesktop.org/dv1/kmscube/commit/99264af7f2b820f7464ff3036a49aff3dd7fd8cf

Unfortunately, I have no platform with a Mali GPU, so I cannot test-run 
these changes. I have asked the authors mentioned in the patch for help. 
If anybody else here can also test-run this on a Mali-enabled platform, 
it would be very helpful. Once I get an OK from test-runs, I'll update 
the recipes to use this instead of the existing patch.

On 17.08.19 19:49, auh@auh.yoctoproject.org wrote:
> Hello,
>
> You are receiving this email because you are the maintainer
> of *kmscube* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *f632b23a528ed6b4e1fddd774db005c30ab65568* has Succeeded.
>
> Next steps:
>      - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
>      - check the changes to upstream patches and summarize them in the commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --amend
>      - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper

