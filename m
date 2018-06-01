Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23D9F74C1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:08:46 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id t1-v6so27903505ott.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1q0pGTe19fPsGRTPAtG+h5Atmdwu6lFnKqSk8AFVec8=;
	b=AOg7uvxp/5dOWN4UpdfV2A/H+Nu/peWtF6gVzLhm5cBcGW6HXte7VL7jHX2uF0HPYb
	h9dyWxUWSl5K78S3j11uklgUxJA3mfwfBCYsjJsDAMfLuJ2Qum/7mNer3XDaHbWCVxFv
	jTkCp+VC4GfP3xymWsErHXPSbkyNowCnBZ3WT9JFWuX/Z9Kky+7daI30jl6eUKgODGPa
	0mz/8bIq2p3KO67dYUFwkbGON2GPhRwrKSGQwg9ZZ6uDFKLEVkfrdKdvLU8th9pQMcuJ
	CFFQXBfTFHttZqII+ytfiDRtJ0d9vW1WCTKcvyL0YAr8YxswMP+hqw7sxGNDMLB9CBz0
	fkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1q0pGTe19fPsGRTPAtG+h5Atmdwu6lFnKqSk8AFVec8=;
	b=ju+Sin/8LFwcd096nLdMQD6m4VfgpE7D63N6t3JIGclLgpvSuXGExXuufzpxRcM2kH
	4Fz18Q7z0FNZrh7W95H3Upnj+fMiNwrPcOi5gwKysxY/ig6ky/GZ4VgwG9+TA7T9pRa8
	XRtIXcbqZSjhuVpLkr9r6JWMNjqXo/S1VWLACiNYLPjKU6LiCpGV2j1Bbm6zQv/yzCB2
	UF02UhiujIhWJKn85t689uxCfAJX5cOlQE9QIWxKbTOdoj6E7XCVgaONtc6tWsO0rAJQ
	0TFG+517yz1FQDH6wmakorRrHJrv4ecnB5zLmph1Vt6JgKgdcYBWOPo9zxLVY++hzIwj
	LOCg==
X-Gm-Message-State: APt69E04/z9zSAFNZh6yakyvNrO84N55vumhKdx/aD2Kik5Fv6y7mJ/F
	rZtxNNYqXLdh75ZZ4Wu0b29NWj3XIWSXJzMn/74=
X-Google-Smtp-Source: ADUXVKKwfuytfcTbk0ssEBR0m1G9dHQbYXCEMmlM3h78Bjel736SQaa802h4Nr6nsfVFeB9Qq5NeQ1BPergN4oSeir4=
X-Received: by 2002:a9d:4609:: with SMTP id y9-v6mr476866ote.259.1527829728075;
	Thu, 31 May 2018 22:08:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 31 May 2018 22:08:47
	-0700 (PDT)
In-Reply-To: <5B10A3D7.20309@windriver.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jun 2018 08:08:47 +0300
Message-ID: <CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 05:08:47 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-01 4:39 GMT+03:00 Yu, Mingli <mingli.yu@windriver.com>:

>> This looks very unlikely to ever make it upstream. Rather than carrying
>> a patch to boost forever would we want to just strip the file in
>> question with a custom command?
>
>
> Thanks very much Richard for your respond!
> I did try to strip only file which in question, but not find out the
> solution and then turn to strip the context library.
>
> Alex,
> Do you have any suggestion?

Yes - as RP said, please investigate how the path gets into this
specific file (but not other files) in the first place, and whether we
can disable or make it not happen, rather than strip the path after
the fact.

Alex

