Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8F86E73E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 13:41:57 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so6676547eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 05:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-type:content-transfer-encoding;
	bh=HhALPEh/MG0jDCdYko3lBFawL15on0fpY+C4/bzabmk=;
	b=reYAleuz5uYaDhHCN4BotCrVLNiR/aPbOTkUJFntDtJZ1i6Mjau/Sl7zqnlAhQBiMX
	eTdT3Yjm4yCWwjm/maaSQT4uWYJr49+YcIqJyo4Vb2VB2SCtJUUx25t0Gk1haB3ewg5x
	50v8V6mSHHToajzudN6pEsdZbCmWI8zV8lWt1E/2QBV7AIcnwYszOW1foM/mHSTxCi+C
	WZy0BUjgLiU3SwjcLhg6qaI0VTVYL54x+DcBkpRRpRseyGTBstNUn2z95N+9OMfTUMgs
	IRlq96BwSNHYSvSA+Qky6Zhphn+GtymMZ92IgdBKQXxUaBdRObaNmumLiAxiqA1ygYrc
	erog==
X-Received: by 10.14.87.129 with SMTP id y1mr21509352eee.38.1392558117614;
	Sun, 16 Feb 2014 05:41:57 -0800 (PST)
Received: from [176.66.127.28] (176066127028.atmpu0052.highway.a1.net.
	[176.66.127.28])
	by mx.google.com with ESMTPSA id u6sm44808627eep.11.2014.02.16.05.41.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 05:41:56 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Feb 2014 14:41:58 +0100
Message-ID: <1443aee84d0.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1392432877-15003-1-git-send-email-raj.khem@gmail.com>
References: <1392432877-15003-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Subject: Re: [PATCH] usbutils: Patch to detect iconv support
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
X-List-Received-Date: Sun, 16 Feb 2014 13:41:58 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 15 February 2014 03:54:25 Khem Raj <raj.khem@gmail.com> wrote:

> Fixes build failures on uclibc

Does this also handle SDK images?
I had to divert iconv.h ..
Thanks && cheers,


Sent with AquaMail for Android
http://www.aqua-mail.com



