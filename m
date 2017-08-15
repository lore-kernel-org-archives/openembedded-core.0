Return-Path: <dvorkin@tibbo.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 551637849F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:37:46 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id o85so2192268lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tibbo-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=6ay+tWbrXPOqnBNk0yOj8I4pTRtx849vA6XMkMDCUn8=;
	b=uinu5w3qgozztmOKLjhyKKFf32fsKwIissL5Xg/yp5/HYUmzpe228roi4p+YWJsr7a
	PeQEigPJjSWQYrWldJWI7fnAvNc7aF7s1BWqsPq8wRSQQMg+hHaQ+uihq13egiHJUDie
	hZMEtQEAY3WHQqBQUAYT6QWb+ye0JgysMmMIc/sRweqgktCR91HyAQfFoiecBph5zNXL
	ms4X+NWQf2Xh9doyO7qEhuvgB9tsSn0Asn6U78nlYiTW48BRT9XVsf4HyO3zlmkbeXbN
	a+dLY3LVflhXDQCLbztw70aIGBzNlv5bZPDF9D51ZHzdbI/nbXo5U78/qlpyQU19zfXa
	7DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=6ay+tWbrXPOqnBNk0yOj8I4pTRtx849vA6XMkMDCUn8=;
	b=ekyZRsBXhrC221AxiotJ0ZbVCpkiJABWJd8QQmo0u323xKmgKOV6UnKvagwL8zd7Zr
	H45YSmG48ZO6xmXhL8ucTdw6zcuBCOHpn3MGAAWg/5JOCrUlWKVjnLE2ryQGjiQ/JQsG
	438qcsDmSpqfgz7umkDesKqF79KiIcv6i5828cgKm7HEtkcZIaVnKaxU7RlS5mHoYouW
	mOOmFh9NmiMe0CD3ft34b7hWthil+9sqxpDnv8JOqQ5h1ygUsop0U6Rb/Cj4xDmQAffo
	UWzAkcTQWvdb7v9XdqiKAOk+c3bxUFWjD3DW043TBm6KnVb0F0phAcLIhpr1eLKm8BEK
	pKhA==
X-Gm-Message-State: AHYfb5jA4uBdqWqMrL/81hiDsO/WutqZFDIoqI1ZxXVb0HJjduBhKyzU
	OWqMADVIPYvb13fMEIXCDQ==
X-Received: by 10.46.21.93 with SMTP id 29mr8931665ljv.98.1502793467471;
	Tue, 15 Aug 2017 03:37:47 -0700 (PDT)
Received: from [192.168.75.150] ([176.114.204.12])
	by smtp.gmail.com with ESMTPSA id b9sm1533317lje.20.2017.08.15.03.37.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 03:37:46 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1503655141-1302-1-git-send-email-stefan@agner.ch>
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
Date: Tue, 15 Aug 2017 13:37:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503655141-1302-1-git-send-email-stefan@agner.ch>
Subject: two recipes, one replaces files of another
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
X-List-Received-Date: Tue, 15 Aug 2017 10:37:47 -0000
X-Groupsio-MsgNum: 101402
Content-Type: multipart/mixed; boundary="------------6760FCE4D50A51D723D2FBA8"
Content-Language: en-US

--------------6760FCE4D50A51D723D2FBA8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Good time of day, people!

I have two recipes for two cases:
recipe-brdRevA.bb
recipe-brdRevB.bb

both of them has one file:
/etc/myprog/c.conf

and two image definition files:
imgA.bb
imgB.bb

, that requires recipe-brdRevA.bb or recipe-brdRevB.bb indirectly by 
IMAGE_INSTALL += "myprog"

myprog.bb requires files from recipe-brdRevA or recipe-brdRevB, 
depending on image.

It's not a correct idea to add IMAGE_INSTALL += "recipe-brdRev<N>" into 
img<N>.bb explicitely.

How to create dependencies correctly?
I try to add
RPROVIDES_${PN} += "recipe-brd" in both recipe-brdRevA/B  and use 
PREFERRED_PROVIDER_recipe-brd = "..."
into imgA/B.bb without success.

Please, advice me.



--------------6760FCE4D50A51D723D2FBA8
Content-Type: text/x-vcard; charset=utf-8;
 name="dvorkin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvorkin.vcf"

begin:vcard
fn:Dmitry Dvorkin
n:Dvorkin;Dmitry
org:Tibbo Technology Inc.;Tibbo Engeneering
adr:;;9F-3, No.31, Lane 169, Kang-Ning St., Hsi-Chih, New Taipei City;Taipei;Taipei;22180;Taiwan
email;internet:dvorkin@tibbo.com
title:Embedded Linux System Architect
url:http://tibbo.com/
version:2.1
end:vcard


--------------6760FCE4D50A51D723D2FBA8--
