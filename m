Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BF4456ABF7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 10:56:20 +0000 (UTC)
Received: by wiun10 with SMTP id n10so38737334wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 03:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=qGEQ6hzlkzBDngsbh864eZypC7hxCfgOX7lH2lRoFGo=;
	b=cou8LDlXQl9NDl7vDCGm3mVhaaGYd5w6yV5eSfGy7MBmb+A7U74DPXKEbbqP6vaO18
	tWa9Gjc4jTpN36kjQC3R5d1DQcmvCYiSNSNbuy8vQwj60sK9rTsUdfsbxW0duipwiESs
	ek+K7UdpkzpJzcfewHJSuQZSRznJGwaKK/qGk90Goheh9JBoCvBy5Y9PcVYKHc2l7eGh
	girb5sZ7FvRKeHBhXhhyKsR8Zhz0BockrAt5p3hSezqvEKb6e+uAePA2fwBNBmP//aMm
	u1avjQG/cvAMGf6VAxVVSwN+whWtG8bvjoY+eop64ZWbi+jBvOdjYXHECBKSALSZZ++x
	RHjQ==
X-Received: by 10.180.104.4 with SMTP id ga4mr12554371wib.86.1428836181626;
	Sun, 12 Apr 2015 03:56:21 -0700 (PDT)
Received: from [10.46.31.20] (089144233020.atnat0042.highway.a1.net.
	[89.144.233.20])
	by mx.google.com with ESMTPSA id l1sm7742034wiy.20.2015.04.12.03.56.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Apr 2015 03:56:20 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMKF1sp=ecR62FWaR7swXXMats+EHUoV1XaZXe9nfi7df0wmig@mail.gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<cover.1428714999.git.raj.khem@gmail.com>
	<2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
	<A43175A7-E10C-4E5D-9E9B-E91744725F7E@gmail.com>
	<CAMKF1sp=ecR62FWaR7swXXMats+EHUoV1XaZXe9nfi7df0wmig@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 12 Apr 2015 12:56:07 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <7B4AA248-B0B9-459E-A35D-AA604C9B5AF9@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] sudo: Disable hardening for musl
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
X-List-Received-Date: Sun, 12 Apr 2015 10:56:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On April 12, 2015 11:26:26 AM GMT+02:00, Khem Raj <raj.khem@gmail.com> wrote:
>On Sun, Apr 12, 2015 at 1:30 AM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On April 11, 2015 3:20:44 AM GMT+02:00, Khem Raj <raj.khem@gmail.com>
>wrote:
>>>musl does not yet enable ssp
>>
>> What happened to distro feature ssp, BTW?
>>
>
>It was never used outside uclibc recipes.

Oh indeed, apparently I never submitted it :(

Would you accept such a distro feature?
I don't want ssp per default in micro, for example.



