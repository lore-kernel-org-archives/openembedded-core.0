Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id B30FE7E1F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:30:41 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id t184so10782119itf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=jv59bbZzVYSAztlKb8x/rgmAmxvZD28QeomUW++jCU0=;
	b=QRBz/FBspmryXZBi44eZWgufR3dvMmL8vrljdosQ/oLEzRJsFVzenatPsSZQ8zt0dT
	unvqC0Y7aYi/nViyVT4LYdlq2rPBbPLnY1wc9zYnbCYT9qqZQCZKNiJTJOQU5tdpWw2U
	OV+AneTtYhAEiRzz7HQbq0UKYvtzBYytn3eUm1HUVe4h/vWR4i0zRioR2hGwAJxuSfg0
	FVcHvimizCcIH2NTNd+CHgUCs/Sq/9dmw6eStxBEke78REL4WpqKxOSRlD+x3xowF1TZ
	qTa1lz6GPOomGm61o77wq9zHfAz1uX2R6+YK3wlDTMz4hIVGFJMFvFUCc2pdgdLH5OTM
	c2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jv59bbZzVYSAztlKb8x/rgmAmxvZD28QeomUW++jCU0=;
	b=JwJ3vZpBnc+a+FnL5m9/9V7D85MNm7tlou8Ja9XVJyztQqhOpoo7TKNgQZH9xIUKXE
	Epa7H5ENnbwg16Jdr6P451K7STDVUrFZIpfXT1nDTKb14zXXQAi1g820QsJNn9fS5/rZ
	IjeTVYvEiRJ3Y/UxyqPwMA/xHd15rja4LUzSAuToLGL+sKUrC+c+VX9pE3Fdf2OtC99I
	DmzxjoAimfiL+68eyAxicXQ6FsAnWmJJZvtm77cmw0ThZZhJjYo1ZGny2dw0OIjeNqz4
	Cbovl054+CzXC6Ed43Acwa41XguGFqEz0dVaOA4Md6PG+tt4Zqwdz0NmhLzMmSlEZ5XG
	DNqg==
X-Gm-Message-State: APjAAAUD/8bzxWZhJl0orlDm34AUUQ2ypIonruO+p+ja4Rll8tIkR1Js
	xPaRlbjDHzLYrZkpP7xyNoRLhnwn
X-Google-Smtp-Source: APXvYqxHUnoM7mSNqsaU8+k4k2ceGZCJTzOKi2u/LjgQcL7aNUyuIXDiMfclOLUKQ8atUhgjJFFs8A==
X-Received: by 2002:a24:c503:: with SMTP id f3mr13503490itg.135.1558629042357; 
	Thu, 23 May 2019 09:30:42 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	c22sm9210834ioa.41.2019.05.23.09.30.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 09:30:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: David Frey <dpfrey@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <20190522215541.9689-1-dpfrey@gmail.com>
	<20190522220331.GA4681@localhost>
	<8a1d53dd-926e-5576-3655-089583d0da4a@gmail.com>
Message-ID: <6d5130a1-a52c-0e1f-3ff8-ed5c9234fe9f@gmail.com>
Date: Thu, 23 May 2019 11:30:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8a1d53dd-926e-5576-3655-089583d0da4a@gmail.com>
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
X-List-Received-Date: Thu, 23 May 2019 16:30:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/23/19 11:12 AM, David Frey wrote:
> On 5/22/2019 3:03 PM, Adrian Bunk wrote:
>> On Wed, May 22, 2019 at 02:55:41PM -0700, David Frey wrote:
>>> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
>>> users to decide if they want udev support.
>>>
>>> Signed-off-by: David Frey <dpfrey@gmail.com>
>>> ---
>>>   meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>>> index aaf2af975d..568de86d6d 100644
>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>>> -DEPENDS = "udev dbus-glib glib-2.0"
>>> +DEPENDS = "dbus-glib glib-2.0"
>>>   PROVIDES += "bluez-hcidump"
>>>   RPROVIDES_${PN} += "bluez-hcidump"
>>>   
>>> @@ -43,6 +43,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>>>   PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>>>   PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>>>   PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
>>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>>> ...
>> Unless there is a good reason to do otherwise, this should be added to
>> the default PACKAGECONFIG so that the set of features enabled by default
>> stays the same.
> I think bluez5 should be built with udev support if udev is going to be
> part of the system, but I don't think udev should be brought in as a
> dependency of bluez5 by default.  How can I express this?  I *think*
> this is what is done for systemd in the PACKAGECONFIG with this fragment:
>    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}

I think it already is a dependency by default (before your patch). We 
would like this to remain the default for current consumers of bluez 
after your patch. I think the easiest way to do this is to have your 
patch add "udev" to the default PACKAGECONFIG for the recipe. Then, in 
your local.conf/distro.conf/whatever you can override the PACKAGECONFIG 
for the recipe to remove udev for your use case.

This way, your patch allow you to have bluez without udev, but you won't 
break everyone else by suddenly removing it.

>
> This uses DISTRO_FEATURES and based on this
> (https://www.yoctoproject.org/docs/2.7/mega-manual/mega-manual.html#ref-features-distro),
> it seems that there is no "udev" distro feature, so I'm not sure how to
> proceed.
>
> Thanks,
> David

