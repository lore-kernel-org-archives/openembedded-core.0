Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id A61AA601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:53:17 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id 3so51865598pgj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=WNYCKiigluNodRUkafpMTGIs9EXQ+obvrIrKb3bWjQA=;
	b=iFVcaWlnRwluIJRlfhL/FSZ527wSC5ruvkAWpsjsym71Tkwk+XlcJSdGPvhiZTDZ45
	jgbBJSFzZ0JFjqXQ4156EbtmcrB0ED9EbZKWMpMNtIEqQ2X3wLKAj/efUehKitDDg4g9
	qVwQkpJAF3UNVJLkxcYwqYeHpK50U1yvtcPqSVfVuARS8euMmcd4m2VO6ndnfYq/Cg0C
	Ym3YVMarg0NdiSN/CoYgiEgNL2x/vh9oL2DbjZtEY72xPLE9/bLX23ymMjCTTIixVLIi
	XodTjYDMucEhp4fD3xhDUt4AsiSiIWTPknV9MtO1td/tg2dosFNZpYikSLhO90xp1cF3
	vJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WNYCKiigluNodRUkafpMTGIs9EXQ+obvrIrKb3bWjQA=;
	b=VpAAvvdWMAva3EtSkYjvHqU24HR4cjieKL7hDRSmph6zsarceazAPyE2MVC10GjLcl
	CXUMFi19VfzZCTLGOx/BUQSNiKMTErB+WbY4ySdzzirhcyF83Qc1LZ1OdqapIfDF1Oz+
	RKP9004CV4h1xEfPwkUoCJRwzhwWphshe5CbKwbC+MkEJKC+pRh4VJ9AWuBJ/bU2Ra9v
	abGC0DnTvhKNjeA5fnZsIX3Lg0I1QlTqQEss655UoBxbDyOLAnT4TNUCQYPuB6uooKi7
	1TRvKdmSJmpGuZf3l5379QSaftgBuVBcMkQsWZ7oBUHOZ98fElLmJ5vzq78HFCvMskkA
	Zp0w==
X-Gm-Message-State: AIkVDXJJfbgbyJZRrv/ggvGf6uP6b9CoVfpUjUQsfQ1pED65YxLgIx7MOulP7l0a83+IKA==
X-Received: by 10.84.179.194 with SMTP id b60mr5837656plc.147.1485967997512;
	Wed, 01 Feb 2017 08:53:17 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8ce9:48a5:c3c4:adfc])
	by smtp.gmail.com with ESMTPSA id
	d68sm50970242pfj.92.2017.02.01.08.53.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 08:53:17 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<20170131072324.4466.26983@do.openembedded.org>
	<20170131074629.qmofdkc6ktxtsc2a@ad.chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d8de15e5-f412-29f0-b9bc-ad69f2bd42e5@gmail.com>
Date: Wed, 1 Feb 2017 08:53:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170131074629.qmofdkc6ktxtsc2a@ad.chargestorm.se>
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
X-List-Received-Date: Wed, 01 Feb 2017 16:53:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/30/17 11:46 PM, Anders Darander wrote:
> * Patchwork <patchwork@patchwork.openembedded.org> [170131 08:23]:
> 
>> Series: Python3 packaging fixes (rev2)
>> Revision: 2
>> URL   : https://patchwork.openembedded.org/series/5024/
>> State : failure
> 
> 
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>>   Suggested fix    Rebase your series on top of targeted branch
>>   Targeted branch  master (currently at d7d26488f2)
> 
> Again, the patch series was just rebased on master; but as there are a
> single (non-modified) line in that >998 characters long, one pacht won't
> apply from the e-mail. Please pull directly from my github repo.
> 
> 

I wonder if we should consider finer packaging and move stuff out of
misc, since its a junk bin for all unaccounted files

