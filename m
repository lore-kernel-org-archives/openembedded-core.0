Return-Path: <dpfrey@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B48C17E141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:12:06 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a23so3507352pff.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=v9Y3WtmYARPCY6qhBb5ETh8N/fsNtyKD9Q/sV1cWRMQ=;
	b=sJsQ+Wt8N8RUZS10zZM7kxUvj/PB3AXPNJPI4X2uqSF5ZgxFytX4sCRxNiov1BnR+H
	WrOWyjlMxutWt4lInGM4blc+0L7e8PnQcs/Ooj+Izy6U30morZkhgMQQcBqznj9VIupo
	eV4CCdiCDyx6xU+NlYAtXcObm64qeDORmzz8EaG/EBQM81cgUlFHy7wXrXAywAO3LGqa
	hwoh1OTOI1SVs8+16h+02meuKIAD+ZaEhoxO7bTBmsM9bnKRDJ/CIy6yZerfmohNL7Dq
	CGH7QZLrKg2pt9pts2XQ91ZJsedpSIPILv3dDZO3d7vyUotmqBLq0Ma4gILeXzNOt7Gl
	yOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=v9Y3WtmYARPCY6qhBb5ETh8N/fsNtyKD9Q/sV1cWRMQ=;
	b=AmrerM15pLdRlcnTL0ce4wtwCQdWXiF65TJKmQyVmLnAlyln6/zKEhetXTXapHHwb6
	5rfJtaxxX7XhyWF3TGYOa5e7LvlGZyUbMIn3B9dEQn7vVohpElFo5GDPbmUH+ek1LpbV
	feFqUrM1cgi5H8z1LI1mqWby/Y7JDuJbfOLt9OzNgcl/OP85UN5yRad25BbW9EZWZvbe
	dNj1MFShamGBzDphQtlbCxvqCooSDhN11FaI60az+waM5iSPW4HSqX119iGBqXjk/NGS
	CuMdm8QmhQ+fjg+7dtQNlfVDfJMVgtj7UW8cD80U/AYPbKAcK/mKnh+9sqK1FbfzWlKu
	cYHQ==
X-Gm-Message-State: APjAAAVMdaXqlY0QunJ6WFK2XEBs1Q/3let5HFmqjoXmy63ZalecDVDw
	8Pkv+qNR2tQ68zY93FWuMuTrZCJtxn8=
X-Google-Smtp-Source: APXvYqwmvA0yUxSMscjoWi7c+S2j6i0xDJ0392woXzNrox0/WzCXfclos75hiF80EpLn8mXZbnP2+Q==
X-Received: by 2002:a62:38cc:: with SMTP id
	f195mr104582033pfa.15.1558627927809; 
	Thu, 23 May 2019 09:12:07 -0700 (PDT)
Received: from [192.168.1.13] ([172.103.152.101])
	by smtp.gmail.com with ESMTPSA id
	q125sm46373226pfq.62.2019.05.23.09.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 09:12:07 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190522215541.9689-1-dpfrey@gmail.com>
	<20190522220331.GA4681@localhost>
From: David Frey <dpfrey@gmail.com>
Message-ID: <8a1d53dd-926e-5576-3655-089583d0da4a@gmail.com>
Date: Thu, 23 May 2019 09:12:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190522220331.GA4681@localhost>
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
X-List-Received-Date: Thu, 23 May 2019 16:12:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/22/2019 3:03 PM, Adrian Bunk wrote:
> On Wed, May 22, 2019 at 02:55:41PM -0700, David Frey wrote:
>> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
>> users to decide if they want udev support.
>>
>> Signed-off-by: David Frey <dpfrey@gmail.com>
>> ---
>>  meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index aaf2af975d..568de86d6d 100644
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
>> @@ -43,6 +43,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>>  PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>>  PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>> ...
> 
> Unless there is a good reason to do otherwise, this should be added to 
> the default PACKAGECONFIG so that the set of features enabled by default 
> stays the same.

I think bluez5 should be built with udev support if udev is going to be
part of the system, but I don't think udev should be brought in as a
dependency of bluez5 by default.  How can I express this?  I *think*
this is what is done for systemd in the PACKAGECONFIG with this fragment:
  ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}

This uses DISTRO_FEATURES and based on this
(https://www.yoctoproject.org/docs/2.7/mega-manual/mega-manual.html#ref-features-distro),
it seems that there is no "udev" distro feature, so I'm not sure how to
proceed.

Thanks,
David

