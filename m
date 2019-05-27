Return-Path: <dpfrey@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C61987E253
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 18:57:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d126so7802431pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7+E1CwxrERY+XFU/LEZ6atEYtZT1viXCUdhoHQrQmr0=;
	b=JDRNnRsck83aGOmvXQ0mHGGgrJ1LQ78AY41bvw1gVCAG1hsLb+JtJyhH7LtU7HrkIF
	f5Z9UyHvZ2tPQHjv8dniYdqzljkdnnEwsyQ8UOaTlei5Cqc88nD56JqKXd8KCnnWaREA
	0qAU/bXxLWvEOoHRpdNx8zDy/jlFta3ZltpC94mPq2JkQ/r4W5NcoYgLKH9WyKj4E0l9
	yVf55FTuOqxjnIzOH5KRGBEq9djjzUCHYutSCT/UrzQG7FAc/l0oYBHoOoDiNCVF/Y5g
	64hnVtLBmSwKJQ2KVrnO5KUDCv4GOrIRZK7fqLUnp2zruuRSvpPtry3Q1fREN5dFjknA
	VmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7+E1CwxrERY+XFU/LEZ6atEYtZT1viXCUdhoHQrQmr0=;
	b=hzzMKTvgHBxspsanVVwrt0Ea425FYgWoWCwdLjg/5upSXpZxqXqPdO1MUWif2YASJG
	JF1z27y8lOZhU7rD6FZ1JeN7JC0TYtWGbHWVr+f2s/U/KsaNgOALCmmE9322oA5r/blG
	oFabAW0KK8HNOGXUtPOMQhZhmnDmQ25jl/y+L+syEyqSoYUN8FsTtvEkhNOAovtXlGfv
	WEi+umGYNx4LrsGM84hR4dSqF7+7PXUuO94FvS0TmNZLnxKxa/7YKCcg2DYjqZHBHLNs
	6BWxU51g1pLS5VFPFIelDS/dz61F4ZP7f9IpKkAE63hJgO/pV18zl1Gk9GbAJ81XoH0O
	0wFA==
X-Gm-Message-State: APjAAAVPTn+BWWSTyNr10FAc4y9lLthxEi7gq6zh5kMHeXaTELtHXM7F
	Q3csHeSTKVGXHe7nA96HHZzrmYrEdeo=
X-Google-Smtp-Source: APXvYqyZBzTHjjYzvm6ToS5kVoXdmqWGbrbOMOMU8idMF/4f0XKZInT7Ktp39ygruTF4YXKbywXKFg==
X-Received: by 2002:a17:90a:1a84:: with SMTP id p4mr458637pjp.15.1558983438125;
	Mon, 27 May 2019 11:57:18 -0700 (PDT)
Received: from [10.1.70.19] (carmd-fwm01.sierrawireless.com. [208.81.120.1])
	by smtp.gmail.com with ESMTPSA id
	g17sm14906541pfb.56.2019.05.27.11.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 11:57:16 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190523164121.20983-1-dpfrey@gmail.com>
	<CAJTo0LZr5s=SFSLYBVaWWi=9u1UtjVV2UoNP1U5rNv4zE=Q1_g@mail.gmail.com>
From: David Frey <dpfrey@gmail.com>
Message-ID: <ae610a90-3fe3-43c1-74b2-020a79592ad7@gmail.com>
Date: Mon, 27 May 2019 11:57:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZr5s=SFSLYBVaWWi=9u1UtjVV2UoNP1U5rNv4zE=Q1_g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bluez5: remove udev dependency
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
X-List-Received-Date: Mon, 27 May 2019 18:57:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/25/2019 8:51 AM, Burton, Ross wrote:
> The commit message and the patch disagree: you're not removing the
> udev dependency but allowing the user to remove it.
> 
> A better message would be 'bluez5: allow udev dependency to be
> disabled with PACKAGECONFIG'

Thanks for your feedback.  I will send v3 with a clearer commit message.

David

> 
> Ross
> 
> On Thu, 23 May 2019 at 17:42, David Frey <dpfrey@gmail.com> wrote:
>>
>> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
>> users to decide if they want udev support.
>>
>> Signed-off-by: David Frey <dpfrey@gmail.com>
>> ---
>>  meta/recipes-connectivity/bluez5/bluez5.inc | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index aaf2af975d..93d1b4d8b0 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>                      file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>> -DEPENDS = "udev dbus-glib glib-2.0"
>> +DEPENDS = "dbus-glib glib-2.0"
>>  PROVIDES += "bluez-hcidump"
>>  RPROVIDES_${PN} += "bluez-hcidump"
>>
>> @@ -22,6 +22,7 @@ PACKAGECONFIG ??= "obex-profiles \
>>      hog-profiles \
>>      tools \
>>      deprecated \
>> +    udev \
>>  "
>>  PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
>>  PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
>> @@ -43,6 +44,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>>  PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>>  PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>>
>>  SRC_URI = "\
>>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


