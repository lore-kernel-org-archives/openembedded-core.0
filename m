Return-Path: <danismostlikely@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B037D74D15
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 14:18:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d17so13316978wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mcxN+IvoKdOIdTCE/SrgAOzNxx/Ljq+5GWbqmXryvj8=;
	b=YhTs9j/nmfg1a4CVketWPhKLUTIHi0exsuo0S7soJTD3BtI1cOAcA8BwNhrCmsBB/F
	hmKE93gO9s8duAynRNwPJviS42dDaB9b89PkEIYZzncZqfeG1EjaXzJ+7zaHax8Hrgrq
	8kRVC7MykDvqsuJJ94TY8y1+u5cYNuSfKX7EEtYhciO+QR4IXVBubln7HiBjq2lCJVGh
	uOJGwOYElEIcbI7iyyp6A1++PKt3ifIdqfsl3s5noa9BvU0WS+Hi+V3aYis0GCpn6ALd
	Rrek61wLJJfgbzVC7Y4WeqvJ9Z0X7Zf/vv7f5rfnsIEQ2fpLTjDT8RoIsgbexG4Fhj0j
	qEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mcxN+IvoKdOIdTCE/SrgAOzNxx/Ljq+5GWbqmXryvj8=;
	b=dZf9zFiGl5puG/nBpXJWyhp5Ch8S8zVWw7JsS0f9bDz0RHIsW0CtQTOGlz5ac9uOpb
	QPGnTxfBB+imJy3ZERzianGD/NEvxuaUf8pkW9ThFXcR2AivPbnnNSStFyqPeFHsfClv
	i13hDrusxiPubinrTw/SIkfvaOsGPp5hiHlEE0TE3YoI2QrzjSaXcPmoFTKTSvtAFdLV
	WMa+Zaq6WArlD7NN3g6gAmgEeFQRuq6bvVmSmL4vWVjKWmEBB+p5DKjYXAuGzToIlssf
	krmul5Z6l7Obkd0CawiN92nlPzFAL26BPcVpYD1iB4QiJiAf9lBXao2GGGivkLPi6fIC
	WOKQ==
X-Gm-Message-State: ALQs6tASpvfjirD1YUv56bH3KV9d930f829xGp+cvhecjDNSMYND990W
	EqFcoWHVifQRZcNC4vAhqcfnCkq4l8cEAEeyN6E=
X-Google-Smtp-Source: AIpwx4+GY5dBZ648UJUmlG1KsQGh6Lq93pOpM5nzSLFlBUXgEuCZSw7x0OWO7dtrufTA9ft1VDJwyYx7bwoWVCIS14M=
X-Received: by 2002:a19:d50e:: with SMTP id
	m14-v6mr13355849lfg.5.1522937907154; 
	Thu, 05 Apr 2018 07:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:5342:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 07:18:26 -0700 (PDT)
In-Reply-To: <82745bc4-8d16-8691-2d32-b89f16f9e214@gmail.com>
References: <20180404160849.21578-1-danismostlikely@gmail.com>
	<82745bc4-8d16-8691-2d32-b89f16f9e214@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 5 Apr 2018 08:18:26 -0600
Message-ID: <CACS+7ZRY__imO-7NacN901xsCShOM07kRfQLPLh_12=mgGFdcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: Update supported architectures
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
X-List-Received-Date: Thu, 05 Apr 2018 14:18:27 -0000
Content-Type: text/plain; charset="UTF-8"

On 4 April 2018 at 18:25, Khem Raj <raj.khem@gmail.com> wrote:
> On 4/4/18 9:08 AM, Dan McGregor wrote:
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> aarch64 has been supported since GCC 5.1, sparc has been supported
>> since 4.9, and S390 since 7.1.
>>
>> Also mark as broken entirely with musl.
>>
>
> this change is ok to apply.

I also think it's appropriate for rocko as-is, and for pyro without
the s390 bits.

>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> index 3183b29dec9..3b7e0028f2b 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -61,15 +61,19 @@ RDEPENDS_libubsan-dev += "${PN}"
>>  RDEPENDS_liblsan-dev += "${PN}"
>>  RDEPENDS_libtsan-dev += "${PN}"
>>  RRECOMMENDS_${PN} += "libasan libubsan"
>> -RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
>>  RRECOMMENDS_${PN}_append_x86 = " liblsan"
>> +RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
>> +RRECOMMENDS_${PN}_append_powerpc64 = " liblsan libtsan"
>> +RRECOMMENDS_${PN}_append_aarch64 = " liblsan libtsan"
>>
>>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>>  do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>>
>> -# MIPS, aarch64, and SPARC are broken.
>> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
>> +# Only x86, powerpc, sparc, s390, arm, and aarch64 are supported
>> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
>> +# musl is currently broken entirely
>> +COMPATIBLE_HOST_libc-musl = 'null'
>>
>>  FILES_libasan += "${libdir}/libasan.so.*"
>>  FILES_libasan-dev += "\
>>
>

