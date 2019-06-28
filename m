Return-Path: <jpewhacker@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2340A7EB38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:58:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r1so3018918pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=LGIX90KEdLvnbTD+qsZyVlgK1yMcgKrTAE8KkUZD1B8=;
	b=lkMWFtt7+dbrpQuMJfgCs6BGMuHFf7AjVmrb21DOKthbODYm/bmWbUfQ5tyxhLvDLG
	L5Q61xSmn749EJaiSVqvswodIis6oU2d8lxxDUNFEGbbiZ/dcqnXiFSPff5+bZbT5E5y
	vX/l4Bjb262uJmZ3JybmwEbmFsYaUhY72Zq+XoaMwOX9Dn7q3b4YzwSn/q5u9xOvOpwL
	pNpgj4VBFix8cR213Vj8Wni+T8w1ctHp9FYk93HiOFrkZuzvH83v7x6bOhkUaz3eBYwR
	8+smULlvBn195db+sMVvAxok7W5EKuuNsGyuiycOqQH6AO6DqSWPTUp/qpzdiMQcKhLa
	LngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LGIX90KEdLvnbTD+qsZyVlgK1yMcgKrTAE8KkUZD1B8=;
	b=VXPAX66+kBTioJleZj/FD6/U4mEQ/DaNLiKbArdlRbRKFDBsO+4o6vhOFQaCIIlOAo
	i100niQDr04V31oFj0LRv7UeV5xMAQ7sM6ay3t2BxJpu+2U0ne+tOmKmTaSUo4FjOIAS
	mEXjbBkGPS5AA/STZb4qTyc6lVatlJ/NC3nLcjla1pgYHoWceMSAthoG9HYI40Qfp1b8
	qWg14PJxphhpv2BpPQhulqncoyX4vTCNRAlYnN/NqjIK1ZfN3JeNk8W4ZI8cUH722tgC
	FCt7zpXPeWJ6IjpFTGEoz55kqrgeR0IsZtGms4dIcL3iNrGoYs3KDU8/GGIBU+/Z2D9p
	AA1A==
X-Gm-Message-State: APjAAAXZVGF5VseclhBbcWZRnY1QWAcDzf0yhe2epgLViT8H/SeHvbNI
	7d0aoc0rk9047/PZWY4nfOKwdMUr
X-Google-Smtp-Source: APXvYqzFPqkYZI9vzp8X5HA9yJGuNXlva8+p0/LtDE1d9YvPBw9XbFvoyl0KMXF42+3QPoLqEOvXCQ==
X-Received: by 2002:a17:90a:80c4:: with SMTP id
	k4mr13581067pjw.74.1561730321671; 
	Fri, 28 Jun 2019 06:58:41 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w1sm2780513pjt.30.2019.06.28.06.58.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:58:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
	<CAJTo0LZkKvgOCmDiWaRCnRV4bvMdtZba8sDEMHdJxtGxTZkisQ@mail.gmail.com>
Message-ID: <d5286598-4205-0c22-ce08-98408ce2f341@gmail.com>
Date: Fri, 28 Jun 2019 08:58:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZkKvgOCmDiWaRCnRV4bvMdtZba8sDEMHdJxtGxTZkisQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Fri, 28 Jun 2019 13:58:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/27/19 11:19 AM, Burton, Ross wrote:
> On Thu, 27 Jun 2019 at 14:55, Joshua Watt <jpewhacker@gmail.com> wrote:
>> gettext is required to generate the glibc locales in do_compile. If not
>> present, glibc will skip the generation which isn't reproducible.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
>> index 073d1533e37..c400ee10b0f 100644
>> --- a/meta/recipes-core/glibc/glibc_2.29.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
>>         file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>>         file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>>
>> -DEPENDS += "gperf-native bison-native make-native"
>> +DEPENDS += "gperf-native bison-native make-native gettext-native"
> Dont we want this to respect the NLS flag or similar?

Sorry, I'm not quite sure I follow... I didn't find anything related to 
NLS in the glibc recipes? Would you mind clarifying?

>
> Ross

