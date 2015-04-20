Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 04CD7735FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:32:55 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so63305809igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=T4VM6r12X+xAi2CP2FAqPuX/pAZs7mNEhKgjaqdJJhI=;
	b=mDllmaV2E20mfHZc7T9sbUKQ1FRzV3rJ2DcW0hoCiqg4+5x+5f72VYYlNciD5UikC2
	3eKO/BexKUznPhFbY1iLd38I48NzgUJrvKjbObjq0vdlgRt8LM0JfgSLArd0yrw83B0o
	KBXvAHICXc/GfEFGHPUSTe7ViPNYVn0Ktl98bmkRsMKgiDii/gdflmCd2aEOCQO4iGkX
	jicZYAx/K/XG1uJA9AeS44374nA2JsGKnfUVLjrjuaDQVnAKT8ifk8LFyhckohilX9K4
	IMpcRtSinwQZ/g2jcBeSyUlX2TiATjbG4Rqm2Hz2OXtOvn5TucFL4H68LmM4v078AZaI
	0aTg==
X-Received: by 10.107.33.21 with SMTP id h21mr22785533ioh.1.1429543976919;
	Mon, 20 Apr 2015 08:32:56 -0700 (PDT)
Received: from [192.168.141.83] ([66.49.191.189])
	by mx.google.com with ESMTPSA id
	r39sm11594977ioe.25.2015.04.20.08.32.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 08:32:56 -0700 (PDT)
Message-ID: <55351C27.70600@gmail.com>
Date: Mon, 20 Apr 2015 11:32:55 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	openembedded-core@lists.openembedded.org
References: <5530F9E0.6050906@topic.nl>
In-Reply-To: <5530F9E0.6050906@topic.nl>
Subject: Re: Using CRDA in combination with MDEV
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
X-List-Received-Date: Mon, 20 Apr 2015 15:33:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-17 08:17 AM, Mike Looijmans wrote:
> I noticed there's a "crda" package in OE, but it RDEPENDS on udev for 
> no other reason than simply because it provides a rules file for that. 
> And I want to keep using mdev.
>
> I think it would be better to split this package, and have a 
> "crda-udev" package that provides the rules file and the dependency on 
> udev. Alternative is to have a PACKAGECONFIG to enable udev support.

I think the PACKAGECONFIG option would cause fewer surprises (perhaps?). 
Otherwise anyone currently using the crda package with udev will now 
have to change a previously-working build (to add the new crda-udev 
package) so it can continue working. Is it possible to have the 
crda-udev package automatically selected if udev is a distro feature and 
the crda package is part of the image?

