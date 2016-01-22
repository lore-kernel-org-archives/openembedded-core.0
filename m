Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7130E76A98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:38:26 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id mw1so8401436igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Eg6irq6KUryzFl3uBr6153v+3hyk7SEu3L5bTeR9OVw=;
	b=Y58AcEWlk0gzZgQ5b8UjjapYuuHPSBMRFEClJ8kgEJp6yXs9JOWdqJbReuOylE2456
	u33muHuvZDdzELVNBs1yCjnlHGTjzRevQlbAYYEQ6+L5zYVcDKkI8zOw35nPw0fokh18
	rWFeYbMaEWI4amuQzfSL3jQhVxqZ/ZqGpBRgABIKc851UMqBtNuiACR6Xhk9wVWMbKex
	aglruT8qKyEVjMmvgntGtWu/V47xC2hZQxXMGijL1P1N3Qd4CAmCnVE/KYaREbV3q0/u
	wpVocA027ioNZYFMqYB4G5ByatAO9jVKa/wD+W0+kWtmaEE1JR6NGRo2BBfaPJG+mvEd
	7EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Eg6irq6KUryzFl3uBr6153v+3hyk7SEu3L5bTeR9OVw=;
	b=j+zweH1KZeKIaoj4s4K2cl1yjGQKi85VFZyUsxn5fEGX2FIfvotYOobLarF7oFi0iM
	dZYU+ac5qs7bh2NfHFq6nC8/Doq9nU3qS2VOpomCaUoqw2yxg7eSQ2feaS5S1TSorlWf
	43BIzxI2vfrR82uNkJ7XnSREnC91gYx0SmoqqebyZQ2G3Gh4nOpSH05UVtpUiKYhApU3
	cCDK7XARS06Z2iVRSedxMtJaw3CBWKsfJMWvvksR/uQqEbtg4GzGWcFuwbiOaD34fyOf
	ugMfSzB/KFNPeS1GNHqvuXMtBkTGQuOmE4LSSDz8QT8rqw18cnsn7hajw1nsgksbwRVm
	yAKQ==
X-Gm-Message-State: AG10YOT0RlUl2XkG5meDZt27sEQqwtFvGXAsNQbnWzeDhSwCOKDRJYVhbM1t+kHJa4w8VfdwQCras26TnV24kA==
MIME-Version: 1.0
X-Received: by 10.50.73.168 with SMTP id m8mr5829989igv.53.1453495106659; Fri,
	22 Jan 2016 12:38:26 -0800 (PST)
Received: by 10.36.46.79 with HTTP; Fri, 22 Jan 2016 12:38:26 -0800 (PST)
In-Reply-To: <D448FD3D-8C29-4F26-AF95-068346B6FA00@dominion.thruhere.net>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
	<1452804997-20926-3-git-send-email-george.mccollister@gmail.com>
	<D448FD3D-8C29-4F26-AF95-068346B6FA00@dominion.thruhere.net>
Date: Fri, 22 Jan 2016 14:38:26 -0600
Message-ID: <CAFSKS=MTx7RsNXf2yrAp2cgSwz6SxTKb6=Y_qKHyE-BUYZbTQA@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 2/9] bash-completion: build nativesdk variant
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
X-List-Received-Date: Fri, 22 Jan 2016 20:38:29 -0000
Content-Type: text/plain; charset=UTF-8

>
>> Op 14 jan. 2016, om 21:56 heeft George McCollister <george.mccollister@gmail.com> het volgende geschreven:
>>
>> The nativesdk variant is required for some recipes like git to use the class.
>
> Squash this into 1/9 to avoid mid-series breakage.

Will do.

Thanks,
George

