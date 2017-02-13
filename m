Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 677AC71DBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:28:50 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 11so14400171qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=syq1yu90j/MBKe5bHSDzzmxgXimZF5vo8yXq6/Ns7yE=;
	b=r80Prihd5Y+iMoXvrjLNvIKfrmS6Ztj/RYFwjQnvyjcQqg9fZ7KkCQAlK3vlBP5FAs
	s+JqEWtzr9rddvty0Wp19rrkvBlKWNBflbRiPQSp1Pc30Y9+xFoPXkASrZVxm6gZBhdi
	RYmcaca27yxf7C3/ZvBaxaXTFYE2J+BH/shrQENj/7z1M6qxsDuODbKwqxOoOJ021KsX
	cA1c+bACBGcs1O0FBZ3OrkyUDiUD1W7vb1XXlF9JdVdwvqWhDxBQO48kSR+wEh/oUEg5
	E2B3PvNp0PRbhW/Bd/pFQfPEkkKp3VWXBIMXeSHtqCXCVQNWq109dYfB29Qr+U9fxev0
	E2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=syq1yu90j/MBKe5bHSDzzmxgXimZF5vo8yXq6/Ns7yE=;
	b=SuI2/JuwJ5VJ8qDbPfity96miprfJMOclcwx0ud/fu3bbih0g2Eu9n6HMWmk5QA3jq
	EXx+H2HpL684059tMmpLRYN24vRCyfAf78gRyjVz2hIVAASF6PV1OG73V/yIiwtz9u7D
	NjMrOw5MzulqTX7ceL/5YIG+UNKYPgJB8v+Nk7i/9+wHb1dLIGH8G6ulI4uZK/4s/U3x
	Q1F+3MZqSxLBnO8H3s0KWIkDGvkN6QpNa8JQqiAg30JTc5V08zqgWRDqI6td36/2fTTD
	uQ3ZAnAIBCoE7H93hgam8OocnVIMmbMyBDMAy03bEU1+XoMaGDTsrnvBVnP9LgYsaPuA
	tGYw==
X-Gm-Message-State: AMke39kQnVh67Qs6jOlKLJYIeANwScTYHwpkkufJWeb9eEXpOfWk2LPIxwop/AFapim7I9zCrkLQgXZFC1lt8w==
X-Received: by 10.55.143.71 with SMTP id r68mr19684566qkd.84.1486988930396;
	Mon, 13 Feb 2017 04:28:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.37.136 with HTTP; Mon, 13 Feb 2017 04:28:30 -0800 (PST)
In-Reply-To: <CAJTo0LaChW9ENPiJcrnBNGbrbUFiVDSM+Ro2uUjY8NgpQXiheg@mail.gmail.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
	<1480609418-3264-2-git-send-email-linus.svensson@axis.com>
	<CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
	<CAPybu_1tqVeyDqhQLd0qPOOR=D=4WhC_D-Tv4wkZJ2_todZ0oQ@mail.gmail.com>
	<CAJTo0LaChW9ENPiJcrnBNGbrbUFiVDSM+Ro2uUjY8NgpQXiheg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 13 Feb 2017 13:28:30 +0100
Message-ID: <CAPybu_0FepS4PQ_QPMK3-k_h2r5J4ue-b-p8bbGeDDhVjL=Ctw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Mon, 13 Feb 2017 12:28:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi

On Mon, Feb 13, 2017 at 1:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
>
> On 13 February 2017 at 12:18, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>>
>> What is the status on this? it just needs to be resend to meta-oe? We are considering meson for our next project and we need support in OE.
>
>
> Yes.  If the growth continues then we'll have to move it into oe-core, but for now meta-oe is the obvious holding place for the Meson class and recipe.

Thanks

Linus, do you plan to resend? Can I help you?


-- 
Ricardo Ribalda

