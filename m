Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1051A771A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 19:59:27 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fy10so37336019pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:content-type;
	bh=evfFsqQqScWKO5Gdant9d2D9p/RNNFSZX4R3MLBUTeo=;
	b=f+ZssU1Ka1Y2jZqFuJ+HTUp9r+rZbfcKavgqvyVqsw+Z3bR52VGbjBlw1b4CCWnpJb
	ZbBqnxls6vxogaFzj955cqNQhP4nwq3GUa8JG30CuIBjY+IJD4cltqyqay1k7a5eTzoR
	htQTQRXL2SrEG5EVDdfvQhLX/YwcRCUtebm2w/zRE0I6K/bYayetwj916ll9yyd0QZwf
	H4uvladXkQaWmFGLZgMU/LQc6IDf/L5JxxvHyoF0SyGsojD0XZvNLI12kqjvFueCalRD
	ZjHKnAEwlbqwt36rZMTsIXnkkWNVW6fb/Qqo59q7yRU9nm+PQH29OdetXY1hSsuIgqSE
	mfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=evfFsqQqScWKO5Gdant9d2D9p/RNNFSZX4R3MLBUTeo=;
	b=k568mMmHVNq3Esg5+wVl7ZoeqyFBHPjXp45Nf6SGKh+UKa24cvJrGy5wnoolyMunIl
	69YfEzPv3dQKANzLIllnx+NINv+cOemNhd7V3Y/fe7HAKYkNuk6fD6Pnqa1UNEvYUe40
	P0Z4j+7aCYygc2z7JmStIGVRuV1VtwM9cg0eLdiDsSuB9puF9K/9HD9a8QAftDSZEyoy
	F5keQKwURbJd7GrNrs9ToPi1XsLpQNdMfGdk520THAzdXwz5lud01O3rtbPnAaPVNIyr
	SRah9W1iYJFPUauleWDDErf+ko6XDkOGwTb5gvsEpHi2iTQZFkZIAYO4JRtkHxKTJ7qH
	nJSg==
X-Gm-Message-State: AG10YOQLeJU3zm1trbo7ivr0gS0KbJ3gQJS/C757BHVTCHIe12mWKO2Jn39w9WlXfBzwgw==
X-Received: by 10.66.55.6 with SMTP id n6mr66401345pap.35.1456430368767;
	Thu, 25 Feb 2016 11:59:28 -0800 (PST)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	o73sm14073125pfa.37.2016.02.25.11.59.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 11:59:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id ho8so38459586pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:59:27 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.151.177 with SMTP id ur17mr64955631pab.68.1456430366733; 
	Thu, 25 Feb 2016 11:59:26 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Thu, 25 Feb 2016 11:59:26 -0800 (PST)
Date: Thu, 25 Feb 2016 16:59:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
Message-ID: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: busybox not buildable when using armv7ahfb-neon tune
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
X-List-Received-Date: Thu, 25 Feb 2016 19:59:28 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

When building a target, with Big Endian enabled, busybox is failing to build.

I reproduced the error with Jethro and master.

Here goes a simplified log:

http://termbin.com/1c8p

Could someone shed a light on this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

