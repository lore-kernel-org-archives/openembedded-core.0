Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C91397E2BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:43:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so1808897wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=O/WVr2WsLXKL7Y88caXtQbaw9Im/Zz7bBePQjbmrta8=;
	b=HYavsZxo8Qf1DelSuAtYA2ZoShCEFUivYtXnebv1Am65DgF+O34q70tBQb10Tm51VB
	yEB+N3oYxQUM9LViCNkHJyxJMGHtGtrnSDUodIaxEZql3zxbaV4yuzfDyXgfuluDeHvu
	gsgGzQRhijaFv/aMqjkz6JZIxFr6vhJadmd0mLaBYubpGUy4zKMfxkeFr8qslGz1otTW
	EHg3gxDllNLijdRc/8tPKspwtX9ld1pDaklF4te2tjOisFWJZ7OHVlwq4HhZJr5i9/NO
	9ga2mkM58iGU4ojqdEXgGh/9BG9lZeGWdp+UbqZano/i/ybjAE7dEOUy9muySXKSqrtX
	KNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=O/WVr2WsLXKL7Y88caXtQbaw9Im/Zz7bBePQjbmrta8=;
	b=nV1Zo6CIE7iLE1PwkfiJOs0KzbVlJI0Bxc/yv2qz401HbQK3l5jKv2U/EaCihiWB53
	IkthPE/HcvK5PR/OWZ0npWTWq17dc/O8ByciSAMKeKigUvmSAjWgs4de1u1e42LpRYel
	o6QRnmTRcmpC4RffM4B8DZ+na8edm5+fvDasT+IJhksfveT9B7FOKr+bI6h/rQvNbNA6
	Xp4l3cuZo51q8mvSsWxP0qIVPOcUWeWsNKmM87TdB1gWm+rhXlP/ZbdxoKFiM0gTo5dr
	H2wfc7CHN9TCVvkIYL8GeQokB/B86WC7tOlJ9RnVrM9QgWJ7I0AV9KpnQMAWuVk7johG
	qrSw==
X-Gm-Message-State: APjAAAVD1jJdE0NDSx4p3ZIMKtyTjqyZGDlCl7xMBTKBIjciSUaMuNlR
	cflN6ZFlY3IvomgHTwFfSiI2cR0HFQs=
X-Google-Smtp-Source: APXvYqz4WnPuKzIAWEyzoGe9McBDMB13ATd87+x/DbQOpYuCe6LQh2m5nAFVfC/AEFR4+C1xlC995Q==
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr7306551wmh.86.1559141008003; 
	Wed, 29 May 2019 07:43:28 -0700 (PDT)
Received: from [10.100.100.101] (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101])
	by smtp.gmail.com with ESMTPSA id e15sm4536840wme.0.2019.05.29.07.43.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 07:43:27 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190528143030.2205-1-andrei@gherzan.ro>
	<efd8fab5c30823179cc418a855c6e660c0a534d3.camel@linuxfoundation.org>
	<03829522174840a6938a7dda8fe921fb@XBOX04.axis.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <fd65f18f-60e0-e86d-ee8c-eb3468922c52@gherzan.ro>
Date: Wed, 29 May 2019 15:43:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <03829522174840a6938a7dda8fe921fb@XBOX04.axis.com>
Subject: Re: [PATCH] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 14:43:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29/05/2019 15.29, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
>> Sent: den 29 maj 2019 01:24
>> To: Andrei Gherzan <andrei@gherzan.ro>; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime dependency
>>
>> On Tue, 2019-05-28 at 15:30 +0100, Andrei Gherzan wrote:
>>> Since yocto thud, and more specifically since poky switched to
>>> openssl 1.1 line, the openssl binary is provided by 'openssl-bin'.
>>>
>>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>>> ---
>>>  .../recipes-support/ca-certificates/ca-certificates_20190110.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
>>> index 4c0425302f..bc69c55daa 100644
>>> --- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
>>> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
>>> @@ -82,6 +82,6 @@ do_install_append_class-native () {
>>>      SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
>>>  }
>>>
>>> -RDEPENDS_${PN} += "openssl"
>>> +RDEPENDS_${PN} += "openssl-bin"
>> Doesn't work for ca-certificates-native:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/638
>> [amongst many other failures]
Fixed native and nativesdk in a V2 that I just pushed. Made them
explicit RDEPENDS .
> I assume the above can be fixed by instead using:
>
> RDEPENDS_${PN}_append_class-target = " openssl-bin"
>
> However, has there been any attempts at rectifying the situation where 
> runtime dependencies on packages are turned into recipe dependencies 
> for the native version of a recipe, which obviously does not work when 
> the package name does not match a recipe name?
-- 

Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640 | t: @agherzan


