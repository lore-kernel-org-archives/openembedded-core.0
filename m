Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF25B77CF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 18:51:34 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id c11so150804765wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 11:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=XlrMXKvW0+F8LFBNYYAZiddCJgNSOVNqmOvSoS6xGNo=;
	b=q+Efo5ThdqXFkxu97X/nygIUOEufnFh7Szt1p7E7sswEmCSDd3TByctn8VGjE16qt9
	/AFhBk8WlHFmFG5R/tfUHF5QrbSoAfQ+tOCxL1pLlkK+NLKJCxKI1JdOQZgy3DhA0thl
	aea5+NJiJ6VpLrhrJzb14ldbCx/hLe0fadxBNsZj4yAIAo5cD4AjwTJkr1NbqNsGAIlX
	BsNwVceKIZN7XP2Dhun2T1Ll2570MJqoK8IUhzl4goP0RiYH3o4r+Hrub3rKNXGwVmsQ
	OC1licqMGpGVpp43cPgD+yLEA3Xo36oJIeIxsMpq4d0bEZ2Ub6E5VX164k0DyR1dCuIn
	Hl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=XlrMXKvW0+F8LFBNYYAZiddCJgNSOVNqmOvSoS6xGNo=;
	b=OtpYzvnLQ8Z5wS4mBIcoH6kQLXna0quOe9AdGOvPF/Zt6KppY/NwxvdFOKmKQks5Qb
	yEvjhsYmVZMSHvfdXbapwz4ukRwlA6/P7Y5WUF2tELJJFRaVpOVnhEFJEi/d2vrWMykl
	609b8kdff5IFtKIeTyXUKNxgCjRvVfdg7t13SG9FR3ctRMslpL1MRBSW8JBOD/H0on/2
	BY/ZPwbOBZJRBUA67cEd8mD7wfTj2HnUOx4z37h+hr6SdMD4LlYCTtAiF7H0NvhNuhOr
	nudLdxmG42NwijO+ITm7I3psrYmVcX/7dmqzza2f3y+8zCNKNfN59Zej3aHfv/cX5gXQ
	w8oQ==
X-Gm-Message-State: AIVw111fHOPTzO2C3VNSBTYlDJmm39HDG4yN9JcuAATuYXNxgdYmP4gO
	PbaIEB/seidFf/Q+v58=
X-Received: by 10.28.222.214 with SMTP id v205mr1589537wmg.68.1499712694986;
	Mon, 10 Jul 2017 11:51:34 -0700 (PDT)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com.
	[209.85.128.173]) by smtp.gmail.com with ESMTPSA id
	w30sm15419952wrb.49.2017.07.10.11.51.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 11:51:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f173.google.com with SMTP id k67so150206382wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 11:51:33 -0700 (PDT)
X-Received: by 10.28.132.13 with SMTP id g13mr8901561wmd.58.1499712693714;
	Mon, 10 Jul 2017 11:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Mon, 10 Jul 2017 11:51:32 -0700 (PDT)
In-Reply-To: <1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
Date: Mon, 10 Jul 2017 15:51:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
Message-ID: <CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 18:51:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
>> This patch upgrades the U-Boot to the 2017.07 release.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> similarity index 88%
>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> index 0e52f27df8..f27989daa1 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> @@ -7,7 +7,7 @@ PE = "1"
>>
>>  # We use the revision in order to avoid having to fetch it from the
>>  # repo during parse
>> -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
>> +SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
>
> Where did you get this hash from, it's not in the U-Boot repo ...

From the tag used by Tom. You can check it on his github repository.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

