Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4F8860657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 22:00:53 +0000 (UTC)
Received: by iofz202 with SMTP id z202so154265281iof.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=qSzvGGVs7ekNT9fsaTM920Adk8zDGCtDNyEH/6+Ebcw=;
	b=HZh3/F0ND3ZTv1ilRcelj4au+SsNZ0G5wvU8PpeXiwX6xIKIrPr058ClhBRMJyZQoI
	qlMpAb4sppf6tjQO+cUDkp8e7CPs51vPEgDJqkgjbVr7aU3XUC4ZjSDcJJmT65YW1MSE
	5YAHmw2Dzo4/SSVWR+mLd/W7dnoTppPbI9nYundn2Iy1Jo+6Doa3CU7OPw5A9QY1Axcs
	QVJL5xTzCyOTAudz/Mps0SeC21h9jyFjBOxCvhxUN/zDLG5bclA3JfWvf/86qwi9+kmJ
	dTkH1rLKFV8jdrkbzQ7gBrjfIm/tRJe8fN7n0UUoyATQDGPSO0ajnKJHJ+WBQQLFqVun
	Hm6w==
X-Received: by 10.107.41.3 with SMTP id p3mr16768358iop.80.1445724053268;
	Sat, 24 Oct 2015 15:00:53 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l198sm2601765iol.37.2015.10.24.15.00.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 15:00:52 -0700 (PDT)
To: Koen Kooi <koen@dominion.thruhere.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <CAP71Wjx+xcW0qG62zxskUGY_BbWCS1Yk9OvJQx+fKooKKKyuvg@mail.gmail.com>
	<65454D5E-98C5-4BA7-828B-05BBD56FB3E5@dominion.thruhere.net>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <562BFF92.9020407@gmail.com>
Date: Sat, 24 Oct 2015 18:00:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <65454D5E-98C5-4BA7-828B-05BBD56FB3E5@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to handle mesa customization in BSP layers
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
X-List-Received-Date: Sat, 24 Oct 2015 22:00:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/20/15 05:37, Koen Kooi wrote:
>> Op 20 okt. 2015, om 11:32 heeft Nicolas Dechesne <nicolas.dechesne@linaro.org> het volgende geschreven:
>>
>>
>> The issue is that mesa is arch specific, not machine specific. So if
>> you start mixing machines from the same arch, we are getting
>> unexpected/wrong rebuilds.
> In this specific case I think we should enable freedreno for armv7/armv8 in OE-core, but the problem remains for other recipes like this.

Are you suggesting that every armv7 device should have their mesa tuned
for freedreno and freedreno added to their filesystem? That seems quite
overly-broad!

On the surface[1] it would seem as though the decisions as to how one
builds mesa and which graphics solution to install is more similar to
the decision as to which DEFAULTTUNE to use, rather than which
architecture is involved?







[1] which is my way of saying "I don't have the experience of actually
having done this, unlike you people" ;-)

