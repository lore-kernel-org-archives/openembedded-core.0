Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id B854E6F7D3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 17:42:17 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id eb12so8286405oac.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 10:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ie4ZoXpBUeAmUDnQozynwKDlsiK1BICII2PAwxejEYk=;
	b=FE2jRqvFvZLEFK4kGDizjHU6uUUYeEVa+1iCy2xrISAnWdk2Q6JqpXw9VukXIyWWYc
	jkUlcdSqPwJvRdS/gAamqzF/FRkgnXZta5Hp//n0XCZl8ejCqsjd8VkqWTRKFx4umzAt
	p4oG8RL7MtzftIlf2ZoMgE/JFGTOgUrYgOgmdA6ZEfrODSEMmuu52tQx2FrWtRbrRH50
	2Pz05Vp8hgkjRzxsXncgVW2qi/28Mz+KqfbkMU+7lWikpbQeYIf8D0KgHa2XtljSu9db
	H55XtlUY4xkaNwVqkeFzaYG43lGPc3+P04kZO/VQTIJf+7/Q2YFbJpLRVYnJ53ueLlT2
	NkFA==
X-Gm-Message-State: ALoCoQnQe5p6ONzxp8xlbYl/o5/LXWuEfKwEGmkmhnmC9NW5fjkKDtVLV84J3BH6poLu9kyNCQne
X-Received: by 10.60.76.194 with SMTP id m2mr1434649oew.47.1396201338311;
	Sun, 30 Mar 2014 10:42:18 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id te6sm50684485oec.2.2014.03.30.10.42.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Mar 2014 10:42:17 -0700 (PDT)
Message-ID: <53385779.8030305@linaro.org>
Date: Sun, 30 Mar 2014 13:42:17 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20140329225432.GA2428@jama> <20140330002800.GC2428@jama>
In-Reply-To: <20140330002800.GC2428@jama>
Subject: Re: State of bitbake world, Failed tasks 2014-03-29
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
X-List-Received-Date: Sun, 30 Mar 2014 17:42:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Just out of curiosity,
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20140329_001343.log/world_fixes.inc
includes the line:

    inherit blacklist

But when I try, my build doesn't seem happy with this so I use the
following instead:

    INHERIT += "blacklist"

I wonder what I'm doing wrong that I need this change?

