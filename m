Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 91F857197E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 22:34:44 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id x49so35227780qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 14:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hfXB3ZVv5BcemMml/YklllXbj3yOLCC6e2CaJt24/bw=;
	b=ocVe3LyFWugBihJYeCKnAAZrIBPn7zII5XquXaelVbJErNVf1Fvfba58cBI3GqqTDt
	j4hXn/MnIEKRPZORYsZEulJ8+vz4hxqsIpe2rw5XrNgLnaTwXXMTeaHAaeDZowjAM/Gg
	fr2tLanDDdvBgFOkehfembKn4xjPN+RxjJNPI0ENmxp+zSssati3mW5U3RRQ+sSvaWs+
	k7q6rTxUh/4WvkLwcGRZteLjVBCjQpINruLTlKAV1BUu+GsZfeJMYg4N3DS0eNqSvfgc
	ZFOiDdVetkcGo7ZS2NRCp2PiL4/nJuJI6bOzrFLOHdAqNPG92EskFIzd0D8zMr6YiLb2
	Z8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hfXB3ZVv5BcemMml/YklllXbj3yOLCC6e2CaJt24/bw=;
	b=JPsy+gmyie0J6OI+WSXnLQJEIO/jNSDhUReXxoIYzUtnKCuS1K08tU87pqS+rBm3wy
	zt/+OjCFUpAcbEiH0yEBYzuHPsxXiz5CZCkSf9cmkauRSb9ffELDWyD8ovq9WN6dP+OG
	5P8anZ/W1UnE+kQ41DqCzqrKfAC4riNq0zLrc56b6tNenEbE7h9FA+Jue4tDlNeRXJh/
	H0iXRXYxtgZvolWeul5DHMsaeS8UO5uN5gb7+Kg7QzT2opb7A8ek25XarJiJ9VfBlZqZ
	tlvwzFV+aeF7caOkqk2Bbqal9QKQk1SS4l+sVsNX1NKe1fABB3lRLFzwx//msH5zOL4G
	muDw==
X-Gm-Message-State: AIkVDXIix+rKAlEdcWnUI6zgCihEtA647lE+BO+6VrG+pLF6s6CDr8hus0wcWJhtjwCi3A==
X-Received: by 10.200.36.43 with SMTP id c40mr5575657qtc.161.1484778884395;
	Wed, 18 Jan 2017 14:34:44 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	g32sm1406266qtd.28.2017.01.18.14.34.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 14:34:44 -0800 (PST)
To: Sona Sarmadi <sona.sarmadi@enea.com>
References: <1484046665-61406-1-git-send-email-sona.sarmadi@enea.com>
	<3230301C09DEF9499B442BBE162C5E48AC10DDA2@SESTOEX04.enea.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b6ee487a-7968-ce0b-25aa-99e24127aa8c@gmail.com>
Date: Wed, 18 Jan 2017 14:34:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC10DDA2@SESTOEX04.enea.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: FW: [PATCH][krogoth] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Wed, 18 Jan 2017 22:34:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/10/2017 10:45 PM, Sona Sarmadi wrote:
> Hi Armin,
>
> I hope it is ok to upgrade libXtst, please let me know if you want to keep the same version and apply the patch instead of upgrade.
this is reasonable request. once its in Morty, I will pull it into krogoth.
thanks for sending the request.

- armin
>
>   The upgrade have only following changes:
>
> https://cgit.freedesktop.org/xorg/lib/libXtst/
> Age	Commit message	Author	Files	Lines
> 2016-10-04	libXtst 1.2.3HEADlibXtst-1.2.3master	Matthieu Herrb	1	-1/+1
> 2016-09-25	Out of boundary access and endless loop in libXtst	Tobias Stoeckmann	1	-4/+39
> 2013-11-23	Remove fallback for _XEatDataWords, require libX11 1.6 for it	Michael Joost	2	-18/+1
> 2013-05-31	libXtst 1.2.2libXtst-1.2.2
>
> This does not affect master. According to Mitre this affects libXtst before 1.2.3:
>
> Multiple integer overflows in X.org libXtst before 1.2.3 allow remote X servers to trigger out-of-bounds memory access operations by leveraging the lack of range checks.
>
> Cheers
> //Sona
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf Of Sona Sarmadi
>> Sent: den 10 januari 2017 12:11
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH][krogoth] libxtst: 1.2.2 -> 1.2.3
>>
>> Upgrade libxtst from 1.2.2 to 1.2.3 to address:
>> Out of Bounds Write Denial of Service Vulnerability, CVE-2016-7951
>>
>> References:
>> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7951
>> https://cgit.freedesktop.org/xorg/lib/libXtst/commit/?id=9556ad67af312
>> 9ec4a7a4f4b54a0d59701beeae3
>>
>> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
>> ---
>>   meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} | 4
>> ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-
>> graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} (78%)
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
>> b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
>> similarity index 78%
>> rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
>> rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
>> index 1b0bcf3..31ea439 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
>> @@ -16,5 +16,5 @@ PE = "1"
>>
>>   XORG_PN = "libXtst"
>>
>> -SRC_URI[md5sum] = "25c6b366ac3dc7a12c5d79816ce96a59"
>> -SRC_URI[sha256sum] =
>> "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c83
>> 09f6d9"
>> +SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
>> +SRC_URI[sha256sum] =
>> "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4b
>> f5204"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


