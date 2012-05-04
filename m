Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQBup-0001LS-SY
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 08:22:55 +0200
Received: by wibhj13 with SMTP id hj13so932698wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 23:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=njiqjkzZWG07wP3tnXahdpLca/pBl+0aoieSINif1z8=;
	b=gwrEqepN11RVkm2ZGwACboM9XaDDw2/WHGTXSJ5BP5W8AHlkXwoZCJVICJV8IJPevO
	P2A4t6Cx2bLCDh4UuVp16EvcweyGhWhpMTlnzOKdyYdU/A3ZKKi21Jy7pZlfTZ6IG4DX
	WUIz9C9MkSEfBgmeDAu2/ZD1tcqXvNcBQslghWfmu2aCnURCCjYNOEki+fLPTn/MG7zi
	Vh8X4V5BaB1wzRAuoNxABbeuU/4gzoRU+mbFFw1ok8XxODXM/CTHSf3NJtK6IZhChIvm
	2l1yHjxs2uXtuoAfMJPNaPOmbgELVmlaCGAlScD6a5MjWd19Rc2C8jhNz9KemJjTWAsc
	ZUpA==
Received: by 10.180.77.4 with SMTP id o4mr9719779wiw.17.1336111989648;
	Thu, 03 May 2012 23:13:09 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm11586279wiv.11.2012.05.03.23.13.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 23:13:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336045861.30113.83.camel@ted>
Date: Fri, 4 May 2012 08:13:06 +0200
Message-Id: <6C4B120A-3A7E-43F9-BA67-0A580B9D2911@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
	<D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
	<1336044241.30113.73.camel@ted>
	<481C530F-A851-4861-B261-9CBE17258D4B@dominion.thruhere.net>
	<1336045861.30113.83.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlk8sdJuqL6ybxcvWrFO0imIdE5bRq/0yaebe27B6AzPHz2TDIzWnrhgsnvseO3gPFTo4BX
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 06:22:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 3 mei 2012, om 13:51 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-03 at 13:39 +0200, Koen Kooi wrote:
>> Op 3 mei 2012, om 13:24 heeft Richard Purdie het volgende geschreven:
>>> The whole point with the qemu emulated machines is that you build them
>>> and they work for new users easily and efficiently. I don't think
>>> calling bitbake to build them and force the user into another wait is a
>>> good usability model to be promoting.
>> 
>> OE-core should set the right example and teaching people that a global
>> IMAGE_DEPENDS is OK is not the right example. Especially when it
>> actually causes breakage, see below.
>> If people insist that IMAGE_DEPENDS is the one and only way to provide
>> the runqemu experience then at least put a big comment in the file
>> saying why it's done and why people shouldn't be copy/pasting it into
>> their layers.
>> And an indiciation where the line is drawn would be nice as well, I
>> can imagine that someone wants to add amazon EC2 support to runqemu
>> and sends a patch to add the EC2 tools to IMAGE_DEPENDS.
> 
> I'm happy to see a comment. The line is quite clear, the documentation
> associated with the qemu images, the quick start guide and other manuals
> assume we build qemu-native and friends and for usability this is a
> clear win. The manuals do not document EC2 and it is not something we
> expect a new user to need to do easily. Running an extra "bitbake xxx"
> or including an extra configuration file would be perfectly reasonable
> for those usage scenarios.
> 
>>> I'm also slightly bemused that in previous discussions you've implied
>>> build time is less relevant then functionality yet here you're taking
>>> the opposite stance :).
>> 
>> I get build *failures* for the qemu machines because I don't have mesa
>> and sdl installed on the autobuilder. But you are right, I do think
>> build time is less relevant than functionality.
> 
> We should also consider setting up PACKAGECONFIG options in the qemu
> recipe for these things so you can specify to build qemu-native without
> sdl/gl easily. I appreciate that is going to be pretty nasty
> implementation wise but I think it would help and in fact if someone
> files the bug I'll mark it as a P1 for 1.3 since that does help
> usability a lot.

#2402 and it's already going the WONTFIX way


