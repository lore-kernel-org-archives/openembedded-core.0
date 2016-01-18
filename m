Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C3CC26FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:55:16 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r129so48105178wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=3w1B4pKHwIVU7Wl2a1w9BAD0+GpBVOYIkENuhAn8GgY=;
	b=lC924NHkH4Cn7DYN43f8qJBZZo17pKTuaX9ZA9m+GBHlHZcnUF9s+X8wJrM5B4zujN
	J0Et4XVAk+47HSPtda0sipQO4xDKw1c/8jxtPstiR2s4RY8i/2x4qABZiAA5W5GHfYdi
	LYS/0oK6x2hV+8eqdOFNF7gotBph8YtBRxg0mZkdPztGUqvM39hj/Pkp4l3TnzUi+7fx
	e+X/psAH55g/qyqs//nSXV5BbQdbSNYoH8UKFc98GvLgv+jiqpfUEQZ7Y+1A2rNGoxXC
	+jKj5cUKtT+uiQz/SxbUGwJ8jxKq9XN7/ySUWJJgU7aviduEmrbWVClWJgnq8JiZ26PT
	Fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3w1B4pKHwIVU7Wl2a1w9BAD0+GpBVOYIkENuhAn8GgY=;
	b=IkWAFq8Soil+898uCGa9lndKthHOInLcM1KrzP/oZLUVvOQaqun4UP8PXZUMi9v9ix
	p32lnQQ6/3BZPD1SAcM8SHsOOkLVziFem5RUNFuP4RnM0I/L7QNF7+z5XNxBf9e/TXeN
	sKC53bWRa+khp2s0pJSRKnfW/cqLfWsgSpPP0JAu2ygTbQmbALV5J+73ujiKlPERNIfw
	ajbomN+Ocop2RouarH9dhl5CwKfdnj7DGeSlkhcMSoEm7GnS4qWvkf9PABLLHgwWdeB2
	Oz0oCfr97Nm2NxUcVvSeOvTEitiiqJWqB2n2b91r/S+uctis7skj1CC2kgCg2HrAklJi
	LMlA==
X-Gm-Message-State: AG10YOSRrWntCjIqam6+UDIrx1P9eqWMvQd5Wo+d8JzKR+iFahLwiurDAKdGxIWKoI+t8g==
X-Received: by 10.28.0.79 with SMTP id 76mr13777381wma.27.1453118116611;
	Mon, 18 Jan 2016 03:55:16 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	uo9sm23484857wjc.49.2016.01.18.03.55.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 03:55:15 -0800 (PST)
To: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de> <56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <569CD2A2.8040006@dresearch-fe.de>
Date: Mon, 18 Jan 2016 12:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Mon, 18 Jan 2016 11:55:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.01.2016 15:29, Koen Kooi wrote:
>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> het volgende geschreven:
>>> On 15.01.2016 14:24, Steffen Sledz wrote:
>>> And I made another interesting discovery: The exception appears on certain machine types only, e.g with qemuarm it appears, with qemuarm64 or qemux86 not.
>>
>> It seems that all machines based on armv5e are affected.
> 
> FWIW, I'm seeing the same problem. The last time it happened it was due to the fixup angstrom does for broken arm BSPs

I've identified this line from meta-angstrom/conf/distro/include/angstrom.inc[1] as "trigger" for the exception in the way, that commenting out this line avoids the exception.

--------------> snip <----------------
# Add FEED_ARCH to machine overrides so we get access to e.g. 'armv7a' and 'sh4'
# Hopefully we'll never see a machine or arch with 'all' as substring
MACHINEOVERRIDES .= ":${@bb.data.getVar('FEED_ARCH', d,1).replace('all','noarch')}"
--------------> snip <----------------

[1] <https://github.com/Angstrom-distribution/meta-angstrom/blob/angstrom-v2015.12-yocto2.0/conf/distro/include/angstrom.inc>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

