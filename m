Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3E0616EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 23:21:21 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id y1so112658plp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 15:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=dXEzRI667u4bWwPH2tdCxBka/7XXjDw0tymROHtcs2A=;
	b=lIt92O9SWHdz2gZenrD4DTnJWN3E0gRF9V++dBGRtZsEDPlFO02Np77U+CRs21ZRgL
	zWk+G2lT0qYidpvhZgJ/R3TYu/IUIIE7TyS1wtvx+b/APTOsmMnTYwRirw0ZF4SIKBEM
	6/lgag4y0KHzfguaZ+e+MwaZ5P44gPZIpBr6datCrhO8UQXW34orYKpuofmi0hggOlCW
	z3hlDF1Yn6rRQduuD7r7tI8jCH0eAwssTkYfFmEqvOXTO95VFE5joRsRGVnTnerDLlo7
	B88SrnUbSFnGTp1OOQSUYbEJFXKj28cEJN5EKRp000yG2h+yO8FsVaQQuxr0vTV8+Gn5
	M+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=dXEzRI667u4bWwPH2tdCxBka/7XXjDw0tymROHtcs2A=;
	b=V8MthPC5g7sVfemiILTLD647d5VU9FL9Kvu44UJePE9QHpR8ZNILElPRsTD4LohrpQ
	HA00xZk08IlB4RQKmmV9ijSVxHuul7ubkYeKq0EskYdkcUzRRaYB2OyIjnxaeMwZOLmh
	OZrTNZFDXKgbCZzhRG7QHPof0cbbys4Rx3CUFqe5nQNVuYYF5LApt8EZxli+8BA67dHg
	CbG2ibSigsI9RgWI9bMSTU+qKg+RQK3uCKnUldr8t13zDC7pYRExmIrmBXoiDDmBLcIS
	zy1FdormJ8cLrnQsSuexZ+ypzx9Au/LUJ0EahftsfK1LvVJfOokfFWpqkEMpvP7Tubip
	UMyg==
X-Gm-Message-State: ANhLgQ2iW8F01osW0QRmi8xvmesrskgPQ332TaWM21q89Olr4OWlgb0R
	Q7F8KUdfxGFi3iBqV/5J5jBMOvN5n1M=
X-Google-Smtp-Source: ADFU+vsyKE4CpWhIdfE0RQz6JmcwNKs0Nwc7Y5YyiwHuDX0mbJPpAHm73EZujCJm1YRcAbjQNFMPiQ==
X-Received: by 2002:a17:902:b7c2:: with SMTP id v2mr283579plz.54.1583277682067;
	Tue, 03 Mar 2020 15:21:22 -0800 (PST)
Received: from [10.20.245.7] ([45.19.219.178])
	by smtp.googlemail.com with ESMTPSA id
	mr7sm255880pjb.12.2020.03.03.15.21.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 15:21:20 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Jeremy Puhlman <jpuhlman@mvista.com>
Message-ID: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
Date: Tue, 3 Mar 2020 15:22:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
Subject: Multilib conflicts in man pages.
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
X-List-Received-Date: Tue, 03 Mar 2020 23:21:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Is there a preferred method in oe-core for dealing with man pages that 
conflict due to differences
in multilib pathing.

For example an application lives in /usr/lib/foo/bar for one abi but 
/usr/lib64/foo/bar in another, and
that kind of information is encoded in to the man pages.

Some things i have seen done in the past, is move the man pages under 
/user/share/man/${PN} or
use something like mutlilib script to deal with it.

I am just curious if there is a canned, preferred way the project 
handles those or wants to handle them?

xinit, xserver-org, and groff each exhibit  these issues.

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


