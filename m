Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 044EC719E2;
	Sun, 16 Apr 2017 15:50:31 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u2so20322360wmu.0;
	Sun, 16 Apr 2017 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=QEZ38AeGrYkkudOXGnXcvl7HKGC8rGUq2bApDEreXCI=;
	b=qhoZLEbDgbdvSiLMxmXKe8EcWVth8sXQxENtpftpzIkG9m7V86WdUvL0K1n+ipy75W
	HoZyi7gFuDkJ9R4mjN3XYsTL/8MQZ0b0otyilvNBpKC9ne5a2wEG2xGBUh21aL+7Jg1g
	502mEHjGma8vm4eeIDhS8evyCbdT4/HfuRlw7jaP1u/JnOwukytkZZN81RiNXcwD3qz0
	2nle6fXvTOrWS9YpIB78TMm2ZOLsIezAULwWwiQMb2hAmOeDGiUkZ4FANZdqO59acoQz
	cc6KXjgTyDl/7kCM2BEmJfH2NVlW6U9kuEl1HTSqYqIMWhXarTZwCpwOFM8MtBzs0Ahx
	JevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QEZ38AeGrYkkudOXGnXcvl7HKGC8rGUq2bApDEreXCI=;
	b=hjoCIuOzfklRCHNkFWQPC3ouO3f+JItphicHNzEH3Z4NxBuRMKyCsUJ/0Pwb0564At
	VfL/T25X+NORkGTr4CJHbZ+jzADzdmA7i76bXEg7X/kGdc14LwTb5cRZL/A4Xo/Cm8iM
	NeIN+/QJ0UAahu/NBBxTUkuj3NmtFGQnsrj6hdQ3U0ZCavvWvJOvi8HeoT4nHzx5wPVy
	K2+Y2N1CCm+nzPO3Pcd6OIqNwGDRKkS9OCuKZkFDBTNLdp3PgrLwNmJBKyumLp6z97Y8
	1tQSw74+EqwBAFc0YjYja2snZjcebc4j3alIjf3Bhb94nILUV3xwswtUDrqwV+h6X3ja
	iTlg==
X-Gm-Message-State: AN3rC/7XMDEkzP6iHKo78fTrz22P04ATLOolkSqRz9/YM5GtuZkMhbFu
	//Pe50iLHaLZo1z4/MXxh9j6X0CB9A==
X-Received: by 10.28.153.194 with SMTP id b185mr5804592wme.101.1492357832446; 
	Sun, 16 Apr 2017 08:50:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Sun, 16 Apr 2017 08:50:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Apr 2017 08:50:01 -0700
Message-ID: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Sun, 16 Apr 2017 15:50:32 -0000
Content-Type: text/plain; charset=UTF-8

Hello All

I have put together recipes for upcoming gcc-7 major release as well
as glibc 2.26 release, which we would target for next release ( 2.4 )

There are several changes in gcc-7 which will need fixing packages. If you have
time to spare feel free to give it a shot and send fixes for the packages or bug
reports. Below are commits you can cherry-pick independently.

gcc7 -  http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc7&id=9562231d6a37ea9c59086927bf0c854fd40b29cd

glib-2.26 - http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/glibc-2.26&id=6e91059d3f6ca0f4468ff59a2c7449be301ee100

Refer to

https://gcc.gnu.org/gcc-7/porting_to.html

For porting issues with gcc7

Cheers
-Khem

