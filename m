Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC67778C00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:19:05 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id q17-v6so24471448otg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=scfoKCxaB+8JQE9XBpKA89e0Wqqn7jVrCLnPJ9Bl41g=;
	b=OSHHGO7zK/wNBMAzbxjrdc4ZVTzIH8NUKg3L1aNdUACi7dylCgBeKiQ1ZEL8CgSwJi
	rQXGzGU3SRPXFMNTA8drNfQPi/PisAGtKeM5VQ73BEoZemW9cFW3n2hvYWmkZo8c3Pfj
	tYMpTcBbBmvy5TnsL6rZrrTtpIPwR97V7HIrVk1Am6erpJvKza9jdG5+B78N7NlC5xiY
	J8nEwiiZWCrOoijLDEAGXVMLmvBdNYXwipYd+Tq7Y4ddGXVfNppyk5pB1zJzkhv09kZb
	MKKhDUT21kh0JDXS8o98UbCAPwx30m5AyT0uvrX6YXvROM8NWULKj+6ld795zjMCj78S
	KJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=scfoKCxaB+8JQE9XBpKA89e0Wqqn7jVrCLnPJ9Bl41g=;
	b=IPeD4mMoXXtuCa7C5Xi0C485VTZ1LMZ4Mkf8+7wEPqaEHtkk92epP9W/WemPfC1Ami
	TZpdC8BoYKFHvDN/udmRS6uTo03cp8QR4I7fEhNvc+BQFz1P1KSwuw7KP0XlHvHUMgOX
	QSHhcmQAT5vR9pZ8QFZezP3k6DPeu1L7/rg568c1/SXCeimDNZKGCQMVcmVT769UR3Jj
	EHFBtl+BXwFyVaXTPcDpt6yrAmTjuDyrGcLCz22yJAQTEyNjfawv6qpTvG2BWcpyYOf+
	u2IGA2H+yp6AN5rSj3H5QYPqFCYg6WHB746MQt79ye8ldXukG9BfMA4/i01qnIeKDwty
	EHqg==
X-Gm-Message-State: APt69E1Exa2UjcdYqF8bm1i3lm3BYQGHkO4OhT6k024lgjG55zV1jpgk
	5xGdd5QNxHJBKHx44Jjz63Eeu41KZVY=
X-Google-Smtp-Source: ADUXVKI5p9hn07ctehr3ae5uOHsvvk6Q6GzGXziv5K9DnOcqedZaodZ2SUTdUw+QLYoTmnWNyBtKcQ==
X-Received: by 2002:a9d:62d3:: with SMTP id
	z19-v6mr9352610otk.159.1528733946252; 
	Mon, 11 Jun 2018 09:19:06 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	l17-v6sm11836900ote.76.2018.06.11.09.19.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 09:19:05 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
	<CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <b9a65b20-120d-e399-606f-3c348fc974a5@mvista.com>
Date: Mon, 11 Jun 2018 09:19:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorgproto: Install .pc files in ${libdir}/pkgconfig
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
X-List-Received-Date: Mon, 11 Jun 2018 16:19:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/11/2018 3:23 AM, Burton, Ross wrote:
> Upstream will (and do) argue that $datadir is the right location as
> these headers are architecture-independent.
>
> Would the package manager do the right thing if the files didn't have
> the libdir line in, so where bit-identical?

Yes, if the files are binary identical then the package manager would 
not call it a conflict.

>
> Ross
>
> On 10 June 2018 at 20:01, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> * --data dir config option is only used to install pkgconfig
>> * Installing into ${datadir} causes mutlilib conficts on install
>>
>>    file /usr/share/pkgconfig/applewmproto.pc conflicts between attempted
>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>> xorgproto-dev-2018.4-r0.corei7_64
>>    file /usr/share/pkgconfig/bigreqsproto.pc conflicts between attempted
>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>> xorgproto-dev-2018.4-r0.corei7_64
>>
>> and so on.
>>
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>> index 7a417c9..7377283 100644
>> --- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>> +++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>> @@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>>   DEPENDS = "util-macros"
>>
>>   inherit autotools pkgconfig
>> -EXTRA_OECONF = "--without-fop"
>> +EXTRA_OECONF = "--without-fop --datadir=${libdir}"
>>
>>   UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto --with-xmlto"
>>
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


