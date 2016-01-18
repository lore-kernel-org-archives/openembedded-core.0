Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D3E456FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:10:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n5so55556066wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IIWbpO6FHf62j8C/n49eanVQuLu8nwD6161FgZmn+co=;
	b=J48QqD38X6oayYBI1n8FUbFrn1oFhp7EVSLr8DnqjoQ2lkQVKAZmFAOasvl6EpS/ho
	uiaONlSMQiqXgCMGOu6cNfLNh7KUV3YFZVU1j7S/GkIDIn8/SSgd1ggW2IIdBufBJtWj
	1Zgy3TUrFV0ZUvUJjmy+ua9f5uAFfAeM+b6jXa46YK2yUmcMKcvxrC0+dTsvARqrTacU
	z7VToBKsZTPrPb90UZnwmpUqScwmGgIYONqEN9MCHJsynkyIR3rOFKbHwipO+vZAsj7H
	H+ElU1mi2sPzjjrCGMxovtOlwFFnvosVyc8rkUKikJbdEKKZ6bn+0w+l4CsCrnwxxU94
	MfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IIWbpO6FHf62j8C/n49eanVQuLu8nwD6161FgZmn+co=;
	b=V3PBDikBgzr8tLMDyvgUp+lEY7EEkS9VpmK2+BsBoznmJaz2OLtu/tdo/pU/ezzCWc
	AwORcq3f66MZxb+sFy+7vWq20MTw6A6Qx2Cm+UHfaf8pXyF+96ZpNQwA6Kj/Jlkh5nZg
	AxBqVf2cUKB0csp41JmzJ6XzjV+XLseXdB/Vy7fNKrON6/uxbefRFoWH/JzmWQvtAohT
	HrBEKjCJjDke539F35NVZP0o5/GuNuuCOsXRYsgGpva/g+5PVC1i7HswixDqPKK/unpY
	/km9jsD/x8yMBjIqhwYRBWTi+A2ndGwnhxcC1h1275M3Hn35T+CiKLQHqPXwNdxQyV54
	g3DA==
X-Gm-Message-State: ALoCoQnXhQrzZ1Zk3VZT04H8qs7nZLiF/BkBv2sGAuqtNTpjum+pTHTuALWNx1Xc3WdP5hTcUHfqWGQkX8NQ9pYE70kg61oYbA==
X-Received: by 10.194.79.37 with SMTP id g5mr25158899wjx.89.1453111852130;
	Mon, 18 Jan 2016 02:10:52 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	r10sm23048752wjz.24.2016.01.18.02.10.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 02:10:51 -0800 (PST)
To: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de> <56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
	<569CA241.20805@dresearch-fe.de>
	<F620CA2D-BA83-436A-B7D4-EA0C117154D9@dominion.thruhere.net>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <569CBA29.60301@dresearch-fe.de>
Date: Mon, 18 Jan 2016 11:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <F620CA2D-BA83-436A-B7D4-EA0C117154D9@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 18 Jan 2016 10:10:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 18.01.2016 09:41, Koen Kooi wrote:
>> Op 18 jan. 2016, om 09:28 heeft Steffen Sledz <sledz@dresearch-fe.de> het volgende geschreven:
>> On 15.01.2016 15:29, Koen Kooi wrote:
>>>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> het volgende geschreven:
>>>> It seems that all machines based on armv5e are affected.
>>>
>>> FWIW, I'm seeing the same problem. The last time it happened it was due to the fixup angstrom does for broken arm BSPs
>>
>> What commits do you talking about ("last time it happened")?
>>
>> https://github.com/Angstrom-distribution/meta-angstrom/commit/7f3d898930077710dfa42150882bce60d437af7d ?
>> https://github.com/Angstrom-distribution/meta-angstrom/commit/4b2e8ecb9a82109022727f6d80b8db56ae493fe8 ?
>>
>> Or something else?
> 
> Yes, those ones. 

If I understand right you only introduced an own DEFAULTUNE override for angstrom to work around the problem. Right?

Did you identify the parts of meta-fsl-arm which were responsible for these problems?

Steffen

PS: Hi Otavio, I've added you to this discussion as the official meta-fsl-arm maintainer.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

