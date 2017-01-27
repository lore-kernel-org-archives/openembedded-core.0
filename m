Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 923707736A
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:37:28 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id v186so161249653lfa.1
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 04:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=cZeNJvpo9jlqiv/3+jkuv41mhsYeyELkfg8Wx3sinfg=;
	b=PmiL6mSB99gN5D/EPbxdDffsRGJC0APsD2BshUuJs/MjoTO0xC2h98VyLcZAWbNj55
	wjfOF2jMdnh86ZmTyFiTwVWwJANh+H7f8eUMxJPpebPu3sYHztEERLAgmbmcuZXy+eRi
	7kDQxYWt4P7+sBX0f96RwUvzFQORl7sud9pzGw4duwYgYBoq5cei292pkcuVWcMvTQG4
	jHzk7I2JjwYk9S/ZdfJTexoaPc/lPSLv/IUtrVFmZihU/YokMhjq8wcM3AqfEUUJfXp4
	hSJA1EvBmruD8T0VdzRUswDVCTe2VlxEM/IkimbtSraiACsDG2L4+ONIEAc6K0yhPyC1
	isGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=cZeNJvpo9jlqiv/3+jkuv41mhsYeyELkfg8Wx3sinfg=;
	b=bhhXSp2r6iX966AoKDPJk3VM+nErqSwVSfog2Mii4Vg1Sjx7qr8VKxD9OjVgJiF2PC
	MYwp7e2rsDqRM1bIJHNk4TjGoif8b9SfySuwKT5c1W9797axtT+w19JsZT2lmvu4bh6g
	Slrc71ASkOFlTwtiGQ7anP2ln1KmyGiyVUva0tFFDr7+k4p/LQ1DszXwSnjZsBq51ml5
	Bkm9G+2xHTmyKXwN3aaRm4ovIkIKNut5YlF5cobCrHwE+d0a/kSMJytjN4ZtlFFsTa0H
	YzBgvEb0TyouJ/MJajcCDc4MELnwDR1Gpje5c1oULml0iKdgOMOCUnH0TliHDLu/cJWF
	ABTQ==
X-Gm-Message-State: AIkVDXKo7neHc160J17f9IyTzfvavOaan77qgnuIZLrTg+CDvf/3tpkhd99cMQycmP7u7g==
X-Received: by 10.25.26.201 with SMTP id a192mr2393943lfa.154.1485520648750;
	Fri, 27 Jan 2017 04:37:28 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	y9sm1249219ljd.41.2017.01.27.04.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 04:37:27 -0800 (PST)
To: Patrick Ohly <patrick.ohly@intel.com>
References: <4f3ba191-aa55-8cb6-6d4c-fbfd0c451ecf@mender.io>
	<1485518753.20333.105.camel@intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <720bffed-63cf-4b69-e09b-a18cfe00558e@mender.io>
Date: Fri, 27 Jan 2017 13:37:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1485518753.20333.105.camel@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: sysroots, wic-tools and rm_work
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
X-List-Received-Date: Fri, 27 Jan 2017 12:37:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 27/01/17 13:05, Patrick Ohly wrote:
> On Thu, 2017-01-26 at 16:39 +0100, Kristian Amlie wrote:
>> It seems like wic doesn't work together with rm_work, because of its
>> dependency on wic-tools. The reason is that building wic-tools will
>> result in rm_work removing the very sysroot that wic needs.
>>
>> It's easy to fix locally by adding
>>
>>   RM_WORK_EXCLUDE = "wic-tools"
>>
>> however, I think this deserves a more permanent fix, and I'm not sure
>> which approach is best.
> 
> wic-tools.bb can have:
> RM_WORK_EXCLUDE += "${PN}"

Ah yes, it can be local to the recipe, I didn't think about that. I'll
post a patch shortly.

-- 
Kristian

