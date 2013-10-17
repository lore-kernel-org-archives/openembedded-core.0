Return-Path: <iwamatsu@nigauri.org>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7D32060EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 02:02:30 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so1281937lbh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 19:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WaA9lq50FyClD9Tr5SnnhK8QsnsPufmVTWOY3MomObA=;
	b=DULI2jJ8CNzy1OrZgaggf8c0K4sfXodzvOaC2pfkt1BNwmOF2vnAnv90Ekx6I9uTAJ
	PJe0G7dDQDoDjyB4Uo7z0qzVGuNOWjwl1zehnu3lpZIAhkYUBHwh1ZDp6xZ0hR12XZB4
	cCFX9RL8rtGlXGAMHlc1YpxdWGOb41xdgVqpGV7/ZMRID0Ph9Ct7eiGpTRWUUcb0sxYu
	DMCc1oLgNkfaFXZhNVwPtCNhvrp28ho2n/7arPzB2mC7vWikwZNMmkqysln//WABbKWV
	cOas+0NvInLGYB4ypcZhCOlxVQIQO0KQPPVL1zaXfqlSUeHK85PpKIvYWoBq8gjviRI+
	+Kew==
X-Gm-Message-State: ALoCoQlpL6+YpQUkJigGo1NTACC/j4nfI5gmNgni8rKrGX+ld4iGiNpfq83E5BrcYSblvVLhbMJr
X-Received: by 10.152.28.7 with SMTP id x7mr5031266lag.26.1381975351246; Wed,
	16 Oct 2013 19:02:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.170.168 with HTTP; Wed, 16 Oct 2013 19:02:01 -0700 (PDT)
In-Reply-To: <86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
References: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
	<CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
	<86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Thu, 17 Oct 2013 11:02:01 +0900
Message-ID: <CABMQnVJWFgwZ3mKVAyp4Ur-yydG4MimwVczWJ+NzRBJN1zf=cA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Thu, 17 Oct 2013 02:02:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

2013/10/11 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 11 okt. 2013, om 07:37 heeft Nobuhiro Iwamatsu <iwamatsu@nigauri.org> het volgende geschreven:
>
>> Hi,
>>
>> I have a question.
>> Why don't you unite  name rules of  other architecture?
>> Forexample, armeb is endian-big of arm.  mipsel is endian-little of mips.
>> If you can unified name, arm64eb is better, I think.
>
> In an ideal world I'd do that, but that ghastly 'aarch64_be' is already in upstream gcc, binutils and eglibc  :(
>

Oh, I see.
Thanks for the clarification.

Best regards,
  Nobuhiro

-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6

