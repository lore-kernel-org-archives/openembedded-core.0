Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id A20486E94E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 13:21:29 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so5477873lab.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 05:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fL+wzuqefNJw7+3Yt0KbIDUuKKgDeWXPpvfERt2x7N0=;
	b=zAREZJguN80cvXaRqr8PQ7JLyaTHbRdSkpLvCZH80UPYy12n8rzH5HsUdV6Qy/zcwr
	1/Pys0YdVNt6qD33oJYmmLyvrofCJ5ChOp+HIRxhkCkg6Td1RvdT067TNPjiEBwa3AGj
	WGfyI9wMNjhL3KI7kRMQ33KaMZ6PNTeTSO/v8wwnQmnPIwZHGNjOoYq7PiD/ta49b7qW
	850zUsoXqyuK6Oa/P5gsnWuFrC6MKP35i91LOOn1NlSXAb/fo1a55nQk8PlHfKXm+Eof
	EZrJMquLMlY3CpCHcFG9Q0Evngorvo/zI9+Vs6NTSnD3G8l3QZxg1EZOa4wqEcoUf1tW
	sk0A==
X-Received: by 10.152.180.42 with SMTP id dl10mr220671lac.62.1391433689674;
	Mon, 03 Feb 2014 05:21:29 -0800 (PST)
Received: from [172.16.141.133] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id e1sm3189019laa.8.2014.02.03.05.21.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Feb 2014 05:21:28 -0800 (PST)
Message-ID: <52EF97D6.8090708@gmail.com>
Date: Mon, 03 Feb 2014 14:21:26 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
	<1846327.CZeKFxv0XS@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1846327.CZeKFxv0XS@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Mon, 03 Feb 2014 13:21:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On mån  3 feb 2014 14:03:47, Paul Eggleton wrote:
> Hi David,
>
> On Monday 03 February 2014 13:58:49 David Nyström wrote:
>> An intended fix for below error message with core-image-lsb,
>> Sending this as an RFC since I dont really know what constitutes
>> a RRECOMMENDS vs. RDEPENDS.
>> Is this clearly defined somewhere ?
>> Below should be an RDEPENDS, no ?
>
> Does this actually fix the problem though? An RRECOMMENDS would only not be
> satisfied if the package ended up empty, or you were using BAD_RECOMMENDATIONS
> (or NO_RECOMMENDATIONS). I can't see this change actually accomplishing
> anything.
>
> Cheers,
> Paul
>

Thanks for the quick reply,
I was using --no-recommends, via the opkg package-manager. 
(rootfs-sandbox).

Regarding the split between RRECOMMENDS and RDEPENDS:
In my understanding, RRECOMMENDS would be when the functionality is 
optional,
RDEPENDS when dependency is hard.

To me, this seems like a hard dependency. But a definition between the 
two would be good to have
for future patches.

Br,
David






