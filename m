Return-Path: <anonumiko@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1950B74C91
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 May 2018 02:55:22 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id h4-v6so35977204lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 May 2018 19:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7Z7mfRWTrBhmAafRSNgVqL8geOOrBoO+ozPhCbPaBjs=;
	b=R+JDuBHzeesDufzNu1FFfeBzDC1l+8aSdkT/QSI55zau5uEgXe2X2XprwZKa3o/MDJ
	aPxVsOLqbXkhNRYoWudzUzbHkYQaSrxnkBeDEdlEbEBAV+GaNf2LE7ckDb46oHPSTlsP
	N7TjXiVKVxU89vwn6Q7piecGgTmijHblypN4FlsdNeJ0xqgQkTj+HInI5hLRJsdYETws
	9fIC/BTTtnCNBF2yLsbOFQcv0KdntP6iVH3V5BiNrqgPdXYB9uNXGaoB12TsGtUXT74Q
	DrK7vc8zIkCmtXY4bNKzh6blvjb7gtL1O2mc7Djg0j9ZXqTm9CbyrXHBgG06sjWebdub
	CTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7Z7mfRWTrBhmAafRSNgVqL8geOOrBoO+ozPhCbPaBjs=;
	b=hLE3oTSkCtJMfo1EihtU5/9T0QqIwamsHu9wi0rPHfUtMgeqCKGYXkUcQpjncnVNxb
	mtPcc/5Ts0uLyLqbRQOn4txbk2AilZCXODbFF67P7UOwaVgETerIQQyaUpPo1LcX9+i5
	D4LGw4i24VbxVZ7usMjF8NbvcTCtYq0FtIBksI9RiZbYFVprDrUtKCxb/1PDs8DElM5d
	r3OlNGOvfQFNUVc6ACOINenMu7/1WJF4ONMTkFGAZ7Eb3EaTIJjGinyFsnwb9vloeO23
	028yggnBFavGjwC0lmgD0lOFLU0BlCBmx6E20nGzGcnCaG0WIjkTLMn4/sx3tNZFGl3J
	qnAg==
X-Gm-Message-State: ALQs6tBRqLd11D13l74aJKxeu9Cf59GP0isDJXusGtq6Ux8jrDDZVevK
	Tv/SsmAXq0Msp3jOtJqlKw/Vb2E6
X-Google-Smtp-Source: AB8JxZp+m1pE+WhqPPAxTCJoVU6rwRvL7rge+SuHfxsJYvnu7ui5N3/YM38w0NkGFdljxIRZPCwl4g==
X-Received: by 2002:a19:db45:: with SMTP id
	s66-v6mr20825662lfg.78.1525575322733; 
	Sat, 05 May 2018 19:55:22 -0700 (PDT)
Received: from [82.181.15.94] (82-181-15-94.bb.dnainternet.fi. [82.181.15.94])
	by smtp.gmail.com with ESMTPSA id
	u5-v6sm3757733ljk.64.2018.05.05.19.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 19:55:21 -0700 (PDT)
Sender: anonumiko <anonumiko@gmail.com>
To: ross.burton@intel.com
References: <20180420140930.8149-1-niko.mauno@vaisala.com>
	<20180420140930.8149-2-niko.mauno@vaisala.com>
	<CAJTo0Lb85CAs8Y+fX=b8J=AQD29DwpeseVwUEVMi5OXmAu0ewA@mail.gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <a6563180-9fd7-8228-64a6-d6627e15d2db@iki.fi>
Date: Sun, 6 May 2018 05:55:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb85CAs8Y+fX=b8J=AQD29DwpeseVwUEVMi5OXmAu0ewA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] e2fsprogs: Complement update-alternatives scope
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
X-List-Received-Date: Sun, 06 May 2018 02:55:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 03:56 PM, Burton, Ross wrote:
> Breaks packaging:

Submitted v3 still in which I changed the added 'ALTERNATIVE_${PN}-...' lines to 'ALTERNATIVE_e2fsprogs-...':
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150471.html

