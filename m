Return-Path: <dpfrey@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5015E7E44B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:45:36 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n27so3430067pgm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=osBVzN6ZnVRk+myZs56HYZjXPIBXlbc+MkDRkQd0CuE=;
	b=ukMYrxEGLyoZlzuW5dUYmR7QjX6DKKGG4dzX8Cxm9JPZ0hoY4qaqjW5JJ/4Fp9QPG0
	9vIF+Nykqx7B+kll3KwPmtZ64Rsm4HAAblGAmnnCemzR0NU8JtL0rurA50XmlIihFNxv
	IXy9Poh3RLcICWtfs8dvQBPlnIUfEemYvMW+S8XnJXnqVxWkQVb4oHI6THLTT2GD//Vl
	wTAGjLgGqLUwHKCMk50Mq/9qMBHWhfNmaHXsLw33cNniPuOeP+RtP7RSW04EDYxK7PGP
	F60AcRn8lTTIAakq4rSA0y/Lsu5XGtbAI6HYRx+HYW1rp6+OzDG7DiFsqfvoG9LD8Uoc
	Whyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=osBVzN6ZnVRk+myZs56HYZjXPIBXlbc+MkDRkQd0CuE=;
	b=mDBn0eb/hvcpdEy/JwBiL9WWXb8oiB8Aj5mbWqPE9c6ZfOQZkEmrmIlrzK+4oNwbCa
	BCzXFqq4wTqBtRYuwBKf0ajPRbNxT0pQOyP32zzNbucRJqtaobbfEYQL/ZdL4OWAdtsu
	q0fATmoaQ1RaMZSs5g7yojcjAnxKpRgrsQVC+PgJBErq7dg0QmdmskxUuHOyEKy+O1Jy
	i03FYxLUqqPRfDrqGTnxHHCbsGiEDScWhHpol8VVJuFllh6fOgZru8/ZxzGus9PEanHl
	Zwx70TLuE6VjK3/RDxQfnhkb+iJupPXWaO//GIzMN0t2JsshMqZt/4zoYzIg/QVUa78+
	LVqg==
X-Gm-Message-State: APjAAAXwgd9OWel9oUSD4XHvL8XMUEt6H3+bI0e5TGpg0svlOia/65vm
	aHN1GdaPvOO9uFdLdEzIGV3GB1Tm9v0=
X-Google-Smtp-Source: APXvYqxqzORqBtOHjH1aSaQab6GK7E4FgWxEYxXilHj+N4oqlkfdOWDx+v7GyABlAqknmQMu5t9kNQ==
X-Received: by 2002:a17:90a:25ca:: with SMTP id
	k68mr2633703pje.14.1558629936495; 
	Thu, 23 May 2019 09:45:36 -0700 (PDT)
Received: from [192.168.1.13] ([172.103.152.101])
	by smtp.gmail.com with ESMTPSA id v93sm1221229pjb.6.2019.05.23.09.45.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 09:45:35 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <20190522215541.9689-1-dpfrey@gmail.com>
	<20190522220331.GA4681@localhost>
	<8a1d53dd-926e-5576-3655-089583d0da4a@gmail.com>
	<6d5130a1-a52c-0e1f-3ff8-ed5c9234fe9f@gmail.com>
From: David Frey <dpfrey@gmail.com>
Message-ID: <0923abf9-b86d-b391-ce3e-30adc2f1ba8d@gmail.com>
Date: Thu, 23 May 2019 09:45:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6d5130a1-a52c-0e1f-3ff8-ed5c9234fe9f@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez5: remove udev dependency
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
X-List-Received-Date: Thu, 23 May 2019 16:45:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/23/2019 9:30 AM, Joshua Watt wrote:
> 
> On 5/23/19 11:12 AM, David Frey wrote:
>> On 5/22/2019 3:03 PM, Adrian Bunk wrote:
>>> On Wed, May 22, 2019 at 02:55:41PM -0700, David Frey wrote:
>>>> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
>>>> users to decide if they want udev support.
>>>>
>>>> Signed-off-by: David Frey <dpfrey@gmail.com>
>>>> ---
>>>>   meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> index aaf2af975d..568de86d6d 100644
>>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>>>>   LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>>                      
>>>> file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>>>                      
>>>> file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>>>>
>>>> -DEPENDS = "udev dbus-glib glib-2.0"
>>>> +DEPENDS = "dbus-glib glib-2.0"
>>>>   PROVIDES += "bluez-hcidump"
>>>>   RPROVIDES_${PN} += "bluez-hcidump"
>>>>   @@ -43,6 +43,7 @@ PACKAGECONFIG[threads] =
>>>> "--enable-threads,--disable-threads"
>>>>   PACKAGECONFIG[deprecated] =
>>>> "--enable-deprecated,--disable-deprecated"
>>>>   PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>>>>   PACKAGECONFIG[btpclient] =
>>>> "--enable-btpclient,--disable-btpclient, ell"
>>>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>>>> ...
>>> Unless there is a good reason to do otherwise, this should be added to
>>> the default PACKAGECONFIG so that the set of features enabled by default
>>> stays the same.
>> I think bluez5 should be built with udev support if udev is going to be
>> part of the system, but I don't think udev should be brought in as a
>> dependency of bluez5 by default.  How can I express this?  I *think*
>> this is what is done for systemd in the PACKAGECONFIG with this fragment:
>>    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}
> 
> I think it already is a dependency by default (before your patch). We
> would like this to remain the default for current consumers of bluez
> after your patch. I think the easiest way to do this is to have your
> patch add "udev" to the default PACKAGECONFIG for the recipe. Then, in
> your local.conf/distro.conf/whatever you can override the PACKAGECONFIG
> for the recipe to remove udev for your use case.
> 
> This way, your patch allow you to have bluez without udev, but you won't
> break everyone else by suddenly removing it.

I have submitted v2 based on your feedback.

Thanks,
David


