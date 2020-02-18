Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF885614FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 22:43:20 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id fa20so1676715pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=IFeX1dKTx/347HAnlpbZuHXXzmHe0dn1pQQBbwib0Ys=;
	b=QUq9pDqsVvOJSAEtHnQp8i2u/pXpQkTfZJij8S+4aiCGsd9cxYDaBsRyRRtsnOpL8K
	jD1iHn6BBSBnzgCo0uftAUcBGjkVhYDcFhlYM1IMs1xE2ine0ZyL3PNbGLF6ljHu/PIQ
	V8anGytemrZt8rOh2TKBpAKmhTnoCcPrUToAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IFeX1dKTx/347HAnlpbZuHXXzmHe0dn1pQQBbwib0Ys=;
	b=LX/judFq5Vp4sgSRGnBMEMxixQsXqNbglcY9jxeyqMQu4DaBMDLaPklKg3QourTsgF
	QgT2F0stZo91j3RUotbz5j/uo+hh0hTMOs+s3vV0nkmJY9evmUs/cAndlunYRD3dQuX0
	wE+WMQULXdaBjSRtERu6JgiiBvFseUrsu4kQ+sSxNOM70vUZpGASfbozsHItX58ICGBn
	JCJmHBaP/Dr4AdlD2G0LUxTwOurbH7XailkWITp3/HCL0UjeSIQXIY9O2p5jaAP3mdIl
	QQ/xMwrjhBpuSMKvZjkdU8b5Y1ov2B/DesXfP1FB4U5ZBJIK3JoiqPR4H9oGE7kfM1b/
	mV/g==
X-Gm-Message-State: APjAAAXOz/veWOGnjxyzqTfyMRPjxda/sm9Tjfi02pzoZ7FQlhsvPEal
	W0ZV78MaGlzD/+kASybPUN/HEbmSgiXWEACFTj0a+4BZW19/mRdIZ22ahTF5zwksKuz5Q+JdUUe
	DBq8jKJPg4TGRLOPuosHYFK6xXw4pvfWooT2lM75zEBLkK+Gqydh9pQOo9rrw7FithtgKUXcECq
	YNuCK78ADy0l7Fq0+Y5JPBAX1BcNg=
X-Google-Smtp-Source: APXvYqyqNK/0KYm29jgCYGHsu95WjWJJYEn/fBkZGO/50z40cJZqCxrSPsiHZmXuLemUs1HZDtYahA==
X-Received: by 2002:a17:90a:e509:: with SMTP id
	t9mr5114223pjy.110.1582065801389; 
	Tue, 18 Feb 2020 14:43:21 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	fz21sm4464031pjb.15.2020.02.18.14.43.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 14:43:20 -0800 (PST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200209202600.2918-1-scott.branden@broadcom.com>
	<3472c876f40a18fac2974f91c92e87166f0ceb34.camel@intel.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <1a65a089-91e3-7110-1f79-49d196ea269c@broadcom.com>
Date: Tue, 18 Feb 2020 14:43:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3472c876f40a18fac2974f91c92e87166f0ceb34.camel@intel.com>
Subject: Re: [PATCH] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Tue, 18 Feb 2020 22:43:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2020-02-18 2:32 p.m., Mittal, Anuj wrote:
> On Sun, 2020-02-09 at 12:26 -0800, Scott Branden via Openembedded-core
> wrote:
>> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR}
>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR}
>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib devlink tc ip bridge misc genl
>> \
>> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink',
>> 'devlink', '', d)}                                               \
>>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc',
>> 'tipc', '', d)}'
> Looks like you added devlink twice in SUBDIRS. The one being added
> unconditionally should be removed.
Yes, thanks for pointing that out.  Will send v2 patch.
>
> Thanks,
>
> Anuj


