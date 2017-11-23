Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 918C8787E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:50:20 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id o17so3076241pli.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kHX+0BA9un4qeUpK1xj1MlyXH35ZTnhecKWqnFCdu54=;
	b=cvnd8rUwwm1GHG3U3hsiGgq2QSYD/YeA/jBKCHYHd5blv2BG/piAOFFYX5/5uksVHB
	PIgRdogPPnyk+Qc4Swbbbg2NC8GD9h/0OCKGfRUjle2bkPxsLG9LbOCM1CtajahLGlcQ
	LOzg+oqEjQ+PJGWsBtLwtblN0FbJ2ba+LeHBZEKaHAIcn0xTrAjQl3sr3qZn0PWUdcgv
	+fhzDOaFPvJBNmPmqixeURBs7W9ZLMb6xT9ufA9uhfvb0A4DVnWLg0gmhN7Y2hgAeCAy
	XCp3Wf34ykhAKXl0oeuVui1lbcpTflb/qWLd+TcBVQrtbt6QohroW3Bt4J0NMqAofMK8
	XTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kHX+0BA9un4qeUpK1xj1MlyXH35ZTnhecKWqnFCdu54=;
	b=XwKq+aQZVcs4AlpdO80lLnjD6oCZIw8GJAzs0Ove2rYYEFLca8TG807EsC/RLEL2et
	65nZ451HmS79mZwIMdmzaX+8FM+E1FMc2j9IXBUBkCcA/xZvMNYZl6izxPTmweuPDHYR
	gD3Kge6UnR/hmZnlJdrBpgePV6j5zzKSIHHhosLUMjGUiLq5HTLarJ6Mtd9EbUeh+26c
	cjvLZ5xJ0JElPlIIO1aGsI2E8GqadIJuQpuLuMVH4WytrR+tXN4J3U2QX9Tmvbtu5EJw
	zoVjmD8MMMLf1BEteindnkoWk0wGkn1JiwcAwHJLmv7/IXjR78PZw+w7bT+hl0MOrAyJ
	wxvQ==
X-Gm-Message-State: AJaThX60jsMslcohu6JlGSEEiOT2OrpvmJmHtNdqVX5unCLDRwVW3LtU
	mNSC5Ebpwt8JmQHnY/ZKj7unUw==
X-Google-Smtp-Source: AGs4zMZBGUGH0rPktKBt8SDuOVipJ6DdIthmBZ6M4SrAHOAVfg8hXJU8K2N0n0a7CQt1+FiJWRk6kw==
X-Received: by 10.84.160.197 with SMTP id v5mr3841958plg.206.1511463021620;
	Thu, 23 Nov 2017 10:50:21 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:844b:1cda:e660:cce8?
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	z78sm36599221pfk.115.2017.11.23.10.50.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Nov 2017 10:50:21 -0800 (PST)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Patchwork <patchwork@patchwork.openembedded.org>
References: <1511460550-27391-1-git-send-email-akuster808@gmail.com>
	<20171123183754.2786.15591@do.openembedded.org>
	<20171123125747.5903121f@lsandov1-mobl2.zpn.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0917f9ee-80ab-5e8c-65ed-3382fb892c2f@gmail.com>
Date: Thu, 23 Nov 2017 10:50:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171123125747.5903121f@lsandov1-mobl2.zpn.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN5c3RlbWQ6IGZpeHMgbWlwczY0IGxvZ2luIGlzc3Vl?=
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
X-List-Received-Date: Thu, 23 Nov 2017 18:50:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/23/2017 10:57 AM, Leonardo Sandoval wrote:
> On Thu, 23 Nov 2017 18:37:54 -0000
> Patchwork <patchwork@patchwork.openembedded.org> wrote:
>
>> == Series Details ==
>>
>> Series: systemd: fixs mips64 login issue
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/9939/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>>   Suggested fix    Rebase your series on top of targeted branch
>>   Targeted branch  master (currently at 33418ed064)
> clearly this was not the intended branch (master). Sorry for all this patchwork/patchtest noise on this area.
The benefits out way the any noise IMHO.
- armin
>
>>
>>
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>> Otherwise we would appreciate you correcting the issues and submitting a new
>> version of the patchset if applicable. Please ensure you add/increment the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


