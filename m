Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF9A175CF1;
	Wed, 27 Apr 2016 17:54:21 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f92so20367360qgf.0;
	Wed, 27 Apr 2016 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+jNA+LRoe0Nxx17goc6Ti6hHoiVf2VPBrMmA1bQdUFs=;
	b=lhaNm3FLlXXVYZqDSbIMffg6m/W7ScqmPZeZr+bo6FJOXhMw019DwJJMyeYZkrsU6U
	qYZ/TPjceietcJuMK83zOG+spAgiCpP2RpKGONnEuoVWNc4aWLtJCIQPFYvEgR58EGo0
	JCyGu1DouZ/ZDavJF422mA1KeQFQXIUXcyxTiHgT27DjOUFx7thTCDcK2tefptlUHg71
	mX+naP6nGZHloVz8kUhpzqlS2YoX54T+oE+RB1UMfCUXPXGjLrio/ZYforZI/b/Sbvye
	VLxe+kiY7RFm/79j5ioDNTy69kGA660gc+8D3P0qOcm2KBl8E+I9uxAcxSYvh35xEdcy
	oOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+jNA+LRoe0Nxx17goc6Ti6hHoiVf2VPBrMmA1bQdUFs=;
	b=hG5aHzaB6OAMTw0bBRbO5c5/ohXIOOdN45Veq93f5259FLBsEqAK+w3I8IYLUacOME
	dCu3Ep/KKPhjrJTi/qMdiAjAbknEp4R6PINfkhoHRWKUTD7hiMqH62upjz1GOpiDqJ1P
	ZufmnAZ5lFVybDEOj6IAUPJn1oR4FTJWHRmxW/+qp194M+jobxjCgXffDBHn7Z2MQs+O
	C3BUUhC2lY0cdMzfvoiZ00B+c4Hu05RIa9U88MuJehDgI3ck9SYmiTQ1zfshnbApZWIJ
	UKyk+PiQr1eqlzAeOyWObm48EE2ECvumwa8ggeSjisCqXTQ2oe6vE8o2HCHIGKeGpqSv
	D6iA==
X-Gm-Message-State: AOPr4FUSbn+HqJVGNhLTBq0s/N048bTzd59hj6krvLKBqKZAT8t/H6anfaPNLxfXNSXXMIUCU2H7Tx3YHPx32A==
X-Received: by 10.140.19.174 with SMTP id 43mr9749124qgh.44.1461779661721;
	Wed, 27 Apr 2016 10:54:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 27 Apr 2016 10:53:52 -0700 (PDT)
In-Reply-To: <CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2016 10:53:52 -0700
Message-ID: <CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Wed, 27 Apr 2016 17:54:22 -0000
Content-Type: text/plain; charset=UTF-8

thanks I think most of them come to these categories. So any help in
fixing them is welcome.

1. kernel older than 4.4, backport needed fixed into these branches or
move to newer kernels.
2. uboot dont have gcc6 compiler header files, backport the needed fixes
2. meta-qt4 needs to use gnu++98
3. gcc6 providing its own stdlib.h in libstdc++
4. gcc6 swtiching to gnu++14 for C++ as default.
5. GPLv2-only versions of recipes are simply old will need fixing

I will take a stab at fixing the nativesdk recipes which is mostly due
to stdlib.h issue.


On Wed, Apr 27, 2016 at 1:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Finally made errors.yp do the right thing:
> http://errors.yoctoproject.org/Errors/Latest/?filter=91ef7bf5ad13304827e2ef06738f7fc28ed650f6&type=commit
> is a list of all the failures.
>
> Ross
>
> On 27 April 2016 at 09:02, Burton, Ross <ross.burton@intel.com> wrote:
>>
>>
>> On 21 April 2016 at 04:06, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> I have updated
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>>>
>>> With few more patches added now. Most of packages in OE-Core are
>>> building fine except linux-yocto on mips and ppc
>>
>>
>> I threw this at the autobuilder.  Lots of c++ failures on various
>> architectures.
>>
>> https://autobuilder.yoctoproject.org/main/tgrid, the row for SHA 91ef.
>>
>> Ross
>
>

