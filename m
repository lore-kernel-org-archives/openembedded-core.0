Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 037857316D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:07:07 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id v96so61889610ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=RqXEtBiFAWYldUnIg5K7M7EMOm4gwcTmBGlv1x/LESQ=;
	b=sYIVFKcB9E6K104VdgK0NmcPXW53ZKUx3l4x3GdxXNJrP1kDqF1NCfbFtyC0acHV97
	quJoXY1sowaoyB1MMcu+KEAjbHJYRcV8EaynLFle3y9elS6HJEbFXOK3j9XQWAJOgoLP
	V2YlIrcAFAr4GQu/IMZis68M+lilB8FlwQqAwTU2fFgEw9vL1/FytzmjWuiBaR5Jtp/K
	7MbSt4uEA9rsp4NJFv2ZQOy8OMrX1wQxL/meelKHHC/SqGO990biAlpc4WndwUh1Og9l
	oMOgUFKxX2KSOKXS6RUN9ALsQuCTH1nW7QoWO4Lnb+KPiaMqMtEHWkpyFJJEui94xHRE
	7QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RqXEtBiFAWYldUnIg5K7M7EMOm4gwcTmBGlv1x/LESQ=;
	b=gcKmjCfVLT7ub2FWar4bbB2cZSaOlFoNiVejPWo6sgxR78O9QUHuIwyJzjoX59CREC
	ZTg0fOQz3HuumBhn4nc83yxsU5WCulOijk7uVzU/gKUhT41yI5HhIK2denCj2Elivbfh
	cPck26aO3T9oCu210cQZNzdFa2cDdLPtLjkPxLBn8onhtRQAOHpWHqgdAzTeUm0dkUft
	4git+yK3C7WRtCcdn0H8JyZ5lK53mi605lSBPBps/NiLIbOawVYh5V5AtM/9dKc+xenx
	Yl0IOoW2gVGwsicXvjK/v/XNTQIbywTAefL5pYM4TQCZUQW5+yviXSmQo2zFa82Vbps9
	VMVQ==
X-Gm-Message-State: AIkVDXKZIXkrjFO23qpgxoa1uo21Uvb7ncZo8b2RMyl9ZJRNemQCtUFmzoWOPU4Fs7tKyS+C
X-Received: by 10.107.167.204 with SMTP id q195mr14881674ioe.170.1484921227407;
	Fri, 20 Jan 2017 06:07:07 -0800 (PST)
Received: from pohly-mobl1 (p57A56DD5.dip0.t-ipconnect.de. [87.165.109.213])
	by smtp.gmail.com with ESMTPSA id 62sm3102283itl.1.2017.01.20.06.07.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 06:07:06 -0800 (PST)
Message-ID: <1484921224.23233.123.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:07:04 +0100
In-Reply-To: <20170120135343.23276.63313@do.openembedded.org>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
	<20170120135343.23276.63313@do.openembedded.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVFRkkgKyBTZWN1cmUgQm9vdCArIHFlbXUgKHJldjQp?=
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
X-List-Received-Date: Fri, 20 Jan 2017 14:07:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-20 at 13:53 +0000, Patchwork wrote:
> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
>   Suggested fix    Sign off the added patch file (meta/recipes-extended/acpica/acpitests/aapits-linux.patch)
> 
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-extended/acpica/acpitests/aapits-linux.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

This is intentional: I'm not the original author and didn't want to mess
too much with the recipe. Should I add Upstream-Status in a separate
commit?

> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at ce5c7075d5)

Argh, apparently I only meant to rebase and then didn't. Will resolve
this and send V4.

But it's good that patchtest is finding this promptly, kudos!

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




