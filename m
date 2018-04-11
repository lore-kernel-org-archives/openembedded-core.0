Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA347320B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 13:36:46 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id u141-v6so1717303oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+lE3S0sJgmVC7zd7De7NPW5bz9wi/n3ane7uxd0jyQ=;
	b=BRIfqLwEgkazye/g5GPJaw3VtPpMJ+WevAZinnf6kmL2ytG8jrZA18LTegLUD4zXZ9
	Od7SmCk7dYKJUla9FGB80DXVxt2aEZSDy6+b2c6cF1/OrRKGzBiagmnZNStYTKF4uKWC
	VMBL4XX8C3AF+FAvkR0PaieBhI7Xgn5okm3Vw/7QBuHd55LxJbAO3shDjqRvIsy6PtxC
	F8fKprjJ0HmOh38lUD/P7uOmNUeGDzR4wE1R3EVYbDtqMMj96LmjcV2wM9Wifu5q8NWl
	chjXeA+yKrHx79OZ8prgsz4ha3Q4Dck+aKoSbJL97OsuzUid7ilPiqkFWnhvRoXMivU+
	jI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+lE3S0sJgmVC7zd7De7NPW5bz9wi/n3ane7uxd0jyQ=;
	b=lnqz9IR53X6iw8hJxADm7S/Cegpd6iDdE4shkU8Y6quChJyQ8Sdm+kc5Al5I2k8EFJ
	IgtMqzCLXA5Srv0yhuADd8MNj+ymq3UvLpjsi/fJYmuIBCe9E92GxyuU29XHPC5Ov94T
	FixgMr/2q+UtwWQ/ZG0Nv9VFi7jV9g+rkriRY/Gb18w3GfAuBQZ+2i/sHIH0U0J6nWTK
	wCrraHsKf7eUGCm86/exO5tg1yWYQw6dz83n33n7IblcnxJDi9M5e2k2AxcXrxYnIw9M
	ESkTsV+FzLifMuPhVzdTiHN8VHy/s5qKYhF/nsXIIK3bkp/QCYPh7yri9iSltmyK8yBq
	t1YQ==
X-Gm-Message-State: ALQs6tAtgHgo9yV0UR9EkK2LelqAT4I79/i7woq1lORbGR0NwrtxsCWq
	zbR42NLdxASjcyzHBnXTWcOYHdNPIoyUagq/Wmtufg==
X-Google-Smtp-Source: AIpwx482EWCl2AYdPSa1KrKGsyLTDH0ZhxSaDYPUhH3ClTRu3scXEvk2KIppJr9bzY++9fm9z0aFqh+ao27Qi4RDwrI=
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr3150238oig.102.1523453807978; 
	Wed, 11 Apr 2018 06:36:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 11 Apr 2018 06:36:27 -0700 (PDT)
In-Reply-To: <CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 14:36:27 +0100
Message-ID: <CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Wed, 11 Apr 2018 13:36:47 -0000
Content-Type: text/plain; charset="UTF-8"

Wouldn't that introduce a fun circular dependency if pigz-native needs
to be built?

Ross

On 11 April 2018 at 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> What about using pigz for sstate-cache archives?
>
> On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:
>>
>> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
>> the
>> image creation has been using gzip instead of pigz, despite still
>> depending on
>> pigz-native.  Fix this by invoking pigz explicitly.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/image_types.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass
>> index e872ae20982..00a00d318f4 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
>>
>>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>> ${COMPRESSIONTYPES}"
>>  CONVERSION_CMD_lzma = "lzma -k -f -7
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> -CONVERSION_CMD_gz = "gzip -f -9 -n -c
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>> +CONVERSION_CMD_gz = "pigz -f -9 -n -c
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
>> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

