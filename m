Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C288260938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:29:04 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n24so5105365pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=DApbKcdE/DkeFev1NdTTysfwnTWp5AcLDcUlDsEu1C4=;
	b=g9cPAUgECUc0cD3VW1VXqJrCM741Tyq6mXdYseg9bdEdM/N9CtjbHckTcybkE7SZG6
	vyReaIP9h5LaFolKQYcSI7Lv6RCyHLOApZiy38GKvWvEF/cjakk2put7mfdPqsPLnf9M
	gaSXCdM9Gzy9/1FeRywbsvtLsbA65vhv2M9i/I0BX80KJepvhBEf3A9LwHmtubx5N/8L
	zAt741gtXDTeI81CkdDTpAc10nTj+WvD5A5Of+roiMOBPZAZYptHy6Wrot9/lsrqp3dW
	FppUkmYvCBbPjBu6VM0FpG9LehJ5MYH70wbZPu9TXe7+wS5+krf5zmei/Yz3FjiWdMBK
	wQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DApbKcdE/DkeFev1NdTTysfwnTWp5AcLDcUlDsEu1C4=;
	b=ZzmOGzbcybu35maAciAFxJbE+GJ67YQxjiLR1AOXnpEfcK7QQbEJiBDY81Plv8+KS4
	qHW3AC2NmZYlBszSfIwIAIlCAJBe1Yh5pCP8GeSurlFGCwIoK2kY7J15CIPQ3VYlwafU
	Rf3OtSTebVbMeIZkc14jINvZ3HF6LPj1DQI3rTMxBu9ejgdKvQtwLycNAVQzwixiQoHm
	nBm9QJO/8WD7HKuolLVdo2NZbTcABsXNnOt9tnTQI+HHPVWo5291OhhOHAVTuTY40ipN
	jUQhFTCdJXVZcx2BDeD/nDQT05bxMUlKwehZtdNEycV1p4t9+M9ocokYfZvw+MBpuLd5
	VncA==
X-Gm-Message-State: AA6/9Rlqp/z4GXD9AjevSZSUwRfZJsYdAdtcF8yfEr3xWlSJst9Ii5fa22yxV/KqmQ4FEQ==
X-Received: by 10.98.157.199 with SMTP id a68mr12593950pfk.75.1475249346050;
	Fri, 30 Sep 2016 08:29:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78a7:4535:8444:722c?
	([2601:202:4001:9ea0:78a7:4535:8444:722c])
	by smtp.gmail.com with ESMTPSA id
	28sm28815790pfp.33.2016.09.30.08.29.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 08:29:05 -0700 (PDT)
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1475226567-7151-1-git-send-email-joshua.g.lock@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <353ba145-4e04-d586-8bf9-d9058339efbd@gmail.com>
Date: Fri, 30 Sep 2016 08:29:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475226567-7151-1-git-send-email-joshua.g.lock@intel.com>
Subject: Re: [PATCH] multilib_header: avoid sstate checksum issues for -nativesdk recipes
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
X-List-Received-Date: Fri, 30 Sep 2016 15:29:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/30/2016 02:09 AM, Joshua Lock wrote:
> Much as with -native recipes, as addressed in commit
> b15730caf0d4c40271796887505507f2501958bb, arch specific variables
> like MIPSPKGSFX_ABI were affecting -nativesdk sstate checksums for
> recipes like nativesdk-glibc-initial.
Since commit

b15730caf0d4c40271796887505507f2501958bb is in Jethro and Krogoth, do both of those branch need this fix?

- armin

>
> Disable multilib_header for nativesdk as we don't use multilibs in
> this scenario.
>
> [YOCTO #10320]
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>   meta/classes/multilib_header.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
> index 5ee0a2d..304c28e 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -52,3 +52,8 @@ oe_multilib_header() {
>   oe_multilib_header_class-native () {
>   	return
>   }
> +
> +# Nor do we need multilib headers for nativesdk builds.
> +oe_multilib_header_class-nativesdk () {
> +	return
> +}


