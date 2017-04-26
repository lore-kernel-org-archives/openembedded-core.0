Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3C4677B95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 07:25:22 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id r16so224748973ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gCsPmMVKpmjHzEISTzEHGME5cHuyfAXgXvaGu1eZdy4=;
	b=T3DrktkX+58Dommrj0aS8lQrenKthdiqk8t/HxdR20fmQjLiUPPWJBGY8YaKVRnQEC
	CcFK2ELzy7W2CIn8S1uMm+/AP5/Og30pShsk8ibfvV2g645t9ZF0RbirxvkltN+KIA2B
	CuupgzRpv5oAA5Ln7X9OETdjED6ry9yQS3Lj17Z+5IWBRyV3ox1hzjKRKNZECC1X3LgO
	22XTDBgImzXwgXMfK33Cc7GWrMUqijNPsPZw9PtV0ouJEdgxF2Bs8RGYsb/3/RqWJ9Mm
	t1rVpRonENl9wtiGWmuFN4dItsbEyrr+HbzYw0E0CkTw2tKCqzzJ7UxbcOPjSgbjQPLL
	LVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gCsPmMVKpmjHzEISTzEHGME5cHuyfAXgXvaGu1eZdy4=;
	b=H/pa7FeRLeY6UhSbfQhc/4EMVya1rjIYFgLnMCelEpft7bk7qkfO+kgpaKT9ubegR6
	VqoUQJMxNUHTIaC8/Pw/sft7QvzwIvM2CUDxENbXhh+u2tQnmtTTKUi4i6gOCZWgcQNT
	ZXNqUbxoFBS4qBDK93qpwsRAhuKJxX+3Im5iJDxeWgCLIAC9/bHko3qftnokYzZtYLst
	sYZZMWwM9PXV4AhdCnaYj6Moh2mupwPq3+A1IdKP1+rdZgd19vNnXoYpb2FGTCSZ7jG6
	2g+dav14+CP50FVrX99qMW1hR9IsB7lxKo+lpt8YEVb4o095k/dDKZdOxN6hU10jjEcu
	gp7g==
X-Gm-Message-State: AN3rC/7kz1pkm+AhuEZqXh5KHAwX9YmfNmDICrctqFNilpb81NmM+v/v
	qaqAJIZzR1R45esG
X-Received: by 10.107.170.163 with SMTP id g35mr20172689ioj.101.1493191523571; 
	Wed, 26 Apr 2017 00:25:23 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E485.dip0.t-ipconnect.de. [93.232.228.133])
	by smtp.gmail.com with ESMTPSA id
	l136sm3195124itb.15.2017.04.26.00.25.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Apr 2017 00:25:22 -0700 (PDT)
Message-ID: <1493191519.4241.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 26 Apr 2017 09:25:19 +0200
In-Reply-To: <CAHUNapRY94uC0W2Z0Y3GCfMSer5HjOW9AWoe_vc3m3MarxG+0A@mail.gmail.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CAHUNapRY94uC0W2Z0Y3GCfMSer5HjOW9AWoe_vc3m3MarxG+0A@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 07:25:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-25 at 19:22 -0400, Trevor Woerner wrote:
> On Tue, Apr 25, 2017 at 2:14 PM, Juro Bystricky
> <juro.bystricky@intel.com> wrote:
> > The variable defaults to "0" (do not
> > build reproducible binaries) in order to minimize any potential
> > regressions. (Once the reproducible binaries code is mature enough,
> > it can be set to "1".)
> 
> My guess is that people would prefer security over reproducibility.

When all machines targeted by an attack run the same build, they also
share the same seeds, regardless whether that build was reproducible or
not. In that case it doesn't matter, the attack method and complexity
would be the same with or without reproducibility.

It gets a bit harder when targeting multiple different OS builds, but
relying on randomness in the build as a defense against attacks isn't
particularly secure.

If people prefer security, they shouldn't use prelinking and ensure that
the machines comes up with good, per-machine entropy for the random
number generation that needs to happen on the machine.

How much does reproducibility then still matter? I suspect not that
much.

> Maybe we need more consensus for the default value going forward?

Yes, it's worth considering.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




