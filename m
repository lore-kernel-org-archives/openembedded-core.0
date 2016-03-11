Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13FC4731D6;
	Fri, 11 Mar 2016 15:03:18 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id z8so13156743ige.0;
	Fri, 11 Mar 2016 07:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=MBq2kTcshQDeFMU3mOaZK5lb/DCa570AHyYJH3GVV3c=;
	b=t0BlzSMVOPP4oan2jANXGhGlS0MH0/YOCXc0IxsmSqO/PwkR96C1iIBbyNPX1wEdNT
	/Q1k7SRmJ/HjAam0hIEylb3jXUpP9F5wfivqjgipaNLll8r3OKnsdB5sN1IrdSe/D7c6
	zlFKTcpWXjFxxYp63x17vT1p9MzU8ynDiy7uMdCMy9LVHj6FAaWrso6v1unTXfKokWuw
	EhHq6U2qwCJOUWytILpeFgIcNunP9+Dh2ljlDVUiVYHJjUdEAE+g60IY5fb709VvS5vS
	bPcEt8H0Q91oW1b378Fco0+RvENoes8/WkkoX/aG3B2n2dzmMBk0EVOPIZDP06sr7TlT
	GYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MBq2kTcshQDeFMU3mOaZK5lb/DCa570AHyYJH3GVV3c=;
	b=D/ko9IZ7gLBEKOmh1P3sGrA1S7gUtTcJkB5Ul26MA3iEausRWIW4/OFKHFCHcfOBmR
	wb8qR2Kta+TypsZmJxkRiELGv+TI2RqFWorVpnZ6q6l7SYkz9BfF7x7ziCf8LGGhG1TG
	eslHw7pmR4D18zV0mEWlOI8nBq2GVPzqPntUvpihmAKPW3PiURvij5g6U1BGGYL9Rik+
	RI1hS5ttSx3on+Jv0ehKmr0XMJ/uz3vns0CcmcpoX0cj68bvOaFjIYP+CETHpbkdMQwz
	B4WCnqgNOrwrm4o1pg5yPKL55lcSwuIObgit9QgvHuCaflkySPlX/e/A5KuZChFMJXQG
	bWZg==
X-Gm-Message-State: AD7BkJLWIRgn3mwA2WcauyBj9S0+vi0vvfwKbkQ+Q+lnnm9ryRWvIzC8U7PnGBEu0IBv/Q==
X-Received: by 10.50.61.232 with SMTP id t8mr4049405igr.83.1457708598931;
	Fri, 11 Mar 2016 07:03:18 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l6sm883685igx.14.2016.03.11.07.03.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 07:03:17 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <20160310115301.GC2573@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E2DE3D.3050703@gmail.com>
Date: Fri, 11 Mar 2016 10:03:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160310115301.GC2573@jama>
Subject: Re: State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 15:03:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/16 06:53, Martin Jansa wrote:
> I'll look at cef3 and chromium issue, my recent patch for meta-browser
> fixed the build for armv7a MACHINEs, so it probably needs to be extended
> a bit to cover warnings in x86 and then duplicate the same to cef3.
> This issue is there for so long, slowing down the builds significantly
> (and causing logs to be much bigger) - I don't use these recipes but I
> hate the failures even more.

Working with the chromium recipe is painful! Each build takes _hours_, 
of just this one recipe alone, even on beefy build hardware. There are 
several PACKAGECONFIG options which affect the build (component build, 
lost context, side painting). There are multiple MACHINEs. You can 
perform a 'Release' or a 'Debug' build. Plus there are two rendering 
systems to support (x11 and wayland). Simply switching between x11 and 
wayland isn't just a matter of setting some build flags, you have to add 
another entire repository to your build from which you have to apply 
dozens of huge patches in order to add an Ozone layer underneath 
chromium so it can talk to wayland/weston.

The matrix of builds to perform and test explodes, not to mention the 
number of days it would take to build all these permutations.

I think one way to help contain this situation would be to split the 
chromium recipe into two: one for x11 and one for wayland. Another thing 
we should consider is wether or not all those permutations are really 
necessary. Is anyone actively using/needing Debug builds? Do we really 
need a component build?

