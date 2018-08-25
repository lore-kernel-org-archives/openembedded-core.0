Return-Path: <tomohiro.komagata.aj@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 29CE774623
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 08:49:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id w14-v6so2049787plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=4uW9XpHNYSCiUrIArAasRhxu+AEdfxnO4qnh9evC1RU=;
	b=SWIV83U07xv34RNjBLg64844XeodwL7KHYiiKmTdcMPYKORYv5ly/9BgNXdFXQbBUM
	s+LbD28pQz2oqaiobAaRGQmjgcZUXMmIO/2elCxm2fwknFeNUBcoc4VVpsQ41AM6/hbK
	dgWA5knT85eiPXyDbpmpe8T06EAZ+6Pq0CjgqGcxYstsJczDgTCe0HqUx1QbpUTO9yUs
	J8hDCj+ju9FBxW0pS3O1K70BPZLEKQtj5wKMjkyJoeMPabda7g21wArH70jQuHHAQVTn
	IV6kq6IJ5brURIOdanJjVIFWdVGes5qrcgesIIza+ufkuQ7ejbaBZYle4Qa9guUS76Oz
	Zpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=4uW9XpHNYSCiUrIArAasRhxu+AEdfxnO4qnh9evC1RU=;
	b=Iwq6I14A9m3kt6jsUkRAaocx2S3imBTluZrxMYbWudS1KYETk7ZN3ag9Bi4zjmS6xm
	DaglStuVlqnvoShwMZTDVmPgHkGbTObuVu7d2l0o0NpWair9+gu02NZNTNw5bGyNQrWI
	Dfhj1G6KWHF8RfLYoM75GonpJTHcHSAPPWXF1kOwBuKdFQUwsbe9s2JyWRBi2fYUW0Do
	svU0EGlnHrKdmsFmiLmiKNkUExQ6yuyOJUMlKF/FlvibxV6XjL+bM+pfyvoiT4P4RiOf
	rkiMSaaO3BoqNHrT7PgRFUn5kOC3jLUUjRe8hinx0Yk+ALio3TvU6w6JKrKvZNpYBEJ3
	+O1w==
X-Gm-Message-State: APzg51DUg+R4QNO+2v8yQ2B2JuFsOj6QYrz6/E0idn5xcbT295IHPrzx
	JvR/WtO+xnoKKG0hFARExhs=
X-Google-Smtp-Source: ANB0VdblRcJ87UDxSFieELuVpbidTcE8Jwp6K7TmD6ekqruQaXFhXVLrDWFXewjaH9eCvW+kWYLeyA==
X-Received: by 2002:a17:902:740a:: with SMTP id
	g10-v6mr5062872pll.22.1535186994246; 
	Sat, 25 Aug 2018 01:49:54 -0700 (PDT)
Received: from ?IPv6:240b:12:4260:6a00:350f:1421:8fe1:b168?
	([240b:12:4260:6a00:350f:1421:8fe1:b168])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm14142201pgh.57.2018.08.25.01.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Aug 2018 01:49:53 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Tomohiro Komagata <tomohiro.komagata.aj@gmail.com>
Message-ID: <6da833d1-a532-779e-8116-cb8b950bc8aa@gmail.com>
Date: Sat, 25 Aug 2018 17:49:51 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Subject: [Q&A] "http://sources.openembedded.org" is unavailable
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
X-List-Received-Date: Sat, 25 Aug 2018 08:49:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi all,

In this week, I have failed to bitbake,
because "http://sources.openembedded.org" is unavailable and it occurs the fetch error.

Does anyone have any information ?
When will its server be available ?

Best regards,
　T.Komagata


