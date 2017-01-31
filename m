Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id ADC53731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:46:32 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id v186so206940356lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=A16iYLHXDbtzPMIFiT9COReLOxsgkFNaM89OKmXCLgE=;
	b=ZRzYuE5OWbmxaIMSZyrXWSN/gHzlDdyIgxg3D1ptn4FeX8WH6ypGRH6Ql11TdVF6KZ
	GsWhfFshp8O6dgLdeNll53jzNSOsbw/Y1hMCh3HklhPS1nXvfAL0kgju9H1rxg6IhcFQ
	OBKg/UmeJmOYW92ZjMDjlvRVnQiH3R9OyjDVXhPl/pxLBflfhJJ4kiOxTK3X7fZCcw8c
	G7/ku6DSILAarmufWQuCoHdKw1yilmSWg6pAOt+c2uudR91oU6csRJSFOV33v7Zgczj6
	fHok7j+YBcxctFomnKSXDVZzFCwqr+KQ8o0aT3zJrNtgwEBcZbHpUUiVwkf3OJHGLB+l
	B6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=A16iYLHXDbtzPMIFiT9COReLOxsgkFNaM89OKmXCLgE=;
	b=mT3jCEdRU0P8VLga3wsV8OrtRChp5jztEwco4O91DoUQCRwNVHpowoqUkq29c0gmxs
	1G8oxqaoHDSbYpPriY1K7axSh2Xzcfbo6wzUum5yTnbAiD0EjG2O9hNrH//QLZKWBWa8
	+YvEoTfPGGwDk1E7Y0kmBwpZbPBQuqe+HAf2KfZ+1+1SflBsEGJAyOHTQkvinysMDN0H
	8aRWW/qlWniDYmcZEh8++RlFXKnhx0AIMT31bi7Z64TjjLOOFXA/MKv9bLXrrrQdKCGL
	/UyJsDYbURorRy4BPP0LrbCVAq8rvjnZldl7o/h+JcS+Ep1MKOINubwJD+falzl+QLCv
	4tXg==
X-Gm-Message-State: AIkVDXIgGkdJXRrQ4xc7pJX8G/8jUV+yuqHFUZiJst8Dy7FbORgoeti88HXcgL5iPOBExQ==
X-Received: by 10.25.202.10 with SMTP id a10mr8499472lfg.23.1485848792477;
	Mon, 30 Jan 2017 23:46:32 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 2sm4342614ljn.1.2017.01.30.23.46.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:46:31 -0800 (PST)
Date: Tue, 31 Jan 2017 08:46:29 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170131074629.qmofdkc6ktxtsc2a@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<20170131072324.4466.26983@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170131072324.4466.26983@do.openembedded.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFB5dGhvbjMgcGFja2FnaW5nIGZpeGVzIChyZXYyKQ==?=
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
X-List-Received-Date: Tue, 31 Jan 2017 07:46:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Patchwork <patchwork@patchwork.openembedded.org> [170131 08:23]:

> Series: Python3 packaging fixes (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/5024/
> State : failure


> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at d7d26488f2)

Again, the patch series was just rebased on master; but as there are a
single (non-modified) line in that >998 characters long, one pacht won't
apply from the e-mail. Please pull directly from my github repo.


-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

