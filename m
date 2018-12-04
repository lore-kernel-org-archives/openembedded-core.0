Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF9C6C10C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 14:33:39 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x19so15655945itl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 06:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nDhKXHvpfPHORgJCUlIoed76wUmu1d6Htfu+7StIg10=;
	b=upTiUHfrogAT3orcXaTyy088D/lQ1XmTc29SvEFY+Sqk0XEBZi0/xyN0OqOOjNczdE
	GXdAmBAS7/8TV3C3etv9bD4i1wThjPu5op6T235yRARpGeIW8JeKVzOH3lkBxHNNV3+l
	sBeswci4/wyquzFqJRG/3NBQrUhYEi+rceN0KW+UieWwZpgZzXw49q6qfBBo9hs+LWKe
	StkuEfokGK1A565OzSgd/mnwr0GoSa4BVuCw0yoT/j4hyCQzn3zidTcCz2ervWsOnvZC
	7ksWhsgoAaNxfYuEX1H+JlQWBp/D0co2AKDNX3/ML+WaxRY4Gq8zGEgzkUEIbHh5O4E4
	3TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nDhKXHvpfPHORgJCUlIoed76wUmu1d6Htfu+7StIg10=;
	b=VOJyO2auk1O2mMzcVTSTV8SFEauy4IAzr5sjfIO5uKDV/CKNiIXYTs3rXSG6BOwHKf
	sSBRUahXDVHiHdqSfCe8AFAzUS7P2ShYeZDMSfjVydrDAGgTQBxIlezn1Oii2SGCtT44
	VTky3L7+fx2Qp0Wpx6KR13+68X8jyNQCEBK0wgOG4noeXs95tEiea7qbu7XabljCJel9
	JORS8kDgso3+V1HarWZEOOkuVOJV9rKpI8D4z7obicA8dxrZiMcdiEtIBvF2HeIC1tCq
	4wUSeu6H1Gd4i2wC8nzP5PPq6wfESxibx9j677C0rCVCT60Pn0OZiKkdMQxsSWDeD9aq
	JyLw==
X-Gm-Message-State: AA+aEWYRVt2FCFQeISZtX6UBwMckuk5LnPE7DtdWBmEGz6ra0qVKqv25
	Mlvg5ARuPtQL20RXwmscxAIWd44SX4iHVTvwBSTyig==
X-Google-Smtp-Source: AFSGD/Vai0kLrJONYcmW6XFjF1SGtRUy1PFc8c/3SBm/6XvXfOkFDqTtvzUJqnLaykqmhdwd52sXviLDKJVlA5LnOnA=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr10936589itj.62.1543934021109; 
	Tue, 04 Dec 2018 06:33:41 -0800 (PST)
MIME-Version: 1.0
References: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
	<CAJTo0LYsnuRBTeWZAStDNHzZHTnZt3+SH4XKgPydzDfrKF7yFA@mail.gmail.com>
	<CAJTo0LZR+ZsT2hkszgLKELwJOQhLe=O2LV4LuTo14550QZ65xw@mail.gmail.com>
	<CAO5Uq5ThtzAvYkHFQqMem_Hq+MPuHipM2KCyPdCU0e9DDnBUnw@mail.gmail.com>
In-Reply-To: <CAO5Uq5ThtzAvYkHFQqMem_Hq+MPuHipM2KCyPdCU0e9DDnBUnw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 14:33:29 +0000
Message-ID: <CAJTo0LbUcXtVFeaU0dKBD0jUP0NvGZNrYr-mx-pza2r5+Lq7Pw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-docutils: Fix shebang path to point at python3
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
X-List-Received-Date: Tue, 04 Dec 2018 14:33:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Dec 2018 at 14:27, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> I'm wondering if the right fix is to delete both the patch and the
> do_install fixups and start again?

Probably.

I've just verified that simply disabling that patch for python3-native
(shouldn't be applied to python3, as we definitely don't want this
on-target) results in sysroot paths going into the files written by
distutils, but then the class correctly fixes them.

Ross

