Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C466D72DC4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 00:33:55 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z8so37846106ige.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 16:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Yf07FyDEwTMuMOk0X5CM1gFaZhxwy0VmI12/UIhuhT8=;
	b=fPkRvUlxWN2IMEQ6AqBu+dK9/ax5j69vMmscPkG1A5xuZx9K2yREZ/wF2xAu70h/y+
	fo+WQck8MIm8kIwA5ntyI9v1xJ/nYqE+/NhQq/1GFqqZWogRj3iG7mU4ReYrvlXX7l0Q
	t5KbCD0yOLUzOk36t3tCCrI+lFq+AU7zNWhS23S39GuZCHV6AD05Yc/9Sz/1RCPK15HN
	5mgMHbUi4YyRPTjrXbrrSgw2hhsWApYX2MT45AJIDaP5WCPIIulqRSwGpvvxerpCJEzk
	P2aKr6O4kw9BXZfea/W9jL6/vCRsaclfdNqeMy4cVni2zTBxmEJcH5fLPBinYP5HtMSe
	xYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Yf07FyDEwTMuMOk0X5CM1gFaZhxwy0VmI12/UIhuhT8=;
	b=ZxCRSDTYzfhidyx3AFzZ9CyfQMXILDtVzV7ENykUhH/hEW14Ol74JPLp3v1sl0FT5e
	txyuIB21x7FXUEsaLg9efET4k69Qc2hUwySIxCkUSJi/NoPNsN5birZDFahG9HUzqjgs
	A9sg0GdUf9bjBHrBCHHWSWH45xIvuTqujZn6Yy1f008xvh9/ifVbtMZb3Us4gCTtq6YH
	jjCp50hC5SLFWd2NJPdZ9O1gJajJuWFt1/FlHfvK2lLidI6caZZZfV/dMqF9CxA4u7e6
	ABs74ANHJVmAF8MuHuI9nIeOc2mZ65GEiBjuP5oiorZpeocfqFoqoLKVt/ROBXow+xPz
	6Yuw==
X-Gm-Message-State: AD7BkJIrpYZFbA5eIqjiaX/krtTVwUBa7vak0VKtaoeLsGvTjjprxxZYz85VsuAP0W5P8w==
X-Received: by 10.50.56.109 with SMTP id z13mr11444823igp.46.1457829236138;
	Sat, 12 Mar 2016 16:33:56 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	d136sm6564719ioe.3.2016.03.12.16.33.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2016 16:33:55 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E4B57B.1050405@gmail.com>
Date: Sat, 12 Mar 2016 19:34:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sun, 13 Mar 2016 00:34:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Here is how my latest incarnation looks with a "normal" build:

origin  git://git.openembedded.org/openembedded-core.git (fetch)
origin  git://git.openembedded.org/openembedded-core.git (push)
         layer:  openembedded-core/meta
         branch: 
contrib/twoerner/buildhistory-metatdata-revs-full-repository-remote
         remote: (HEAD does not point to a remote branch)
         HEAD:   9ad6e0cf8e1e7d0301ee98b55095294bd2b1c508

origin  git://git.openembedded.org/meta-openembedded (fetch)
origin  git://git.openembedded.org/meta-openembedded (push)
         layer:  meta-openembedded/meta-oe
         branch: master
         remote: origin/master
         HEAD:   a1e135a499998add7575682bf53db5e02e753580

origin  git://git.openembedded.org/meta-openembedded (fetch)
origin  git://git.openembedded.org/meta-openembedded (push)
         layer:  meta-openembedded/meta-gnome
         branch: master
         remote: origin/master
         HEAD:   a1e135a499998add7575682bf53db5e02e753580

origin  git://github.com/96boards/meta-rpb.git (fetch)
origin  git://github.com/96boards/meta-rpb.git (push)
         layer:  meta-rpb
         branch: master
         remote: origin/master
         HEAD:   203903ca6f4e8df09bef6ea3c6e899d07eca8df9

origin  https://github.com/96boards/meta-96boards.git (fetch)
origin  https://github.com/96boards/meta-96boards.git (push)
         layer:  meta-96boards
         branch: master
         remote: origin/master
         HEAD:   2be59f0d381b5ec173d7fc24f3ae14aaf47b8649

origin  https://github.com/ndechesne/meta-qcom.git (fetch)
origin  https://github.com/ndechesne/meta-qcom.git (push)
         layer:  meta-qcom
         branch: master
         remote: origin/master
         HEAD:   32fcda819acb8ec485d9ab05108d554f807bf75d

origin  git://github.com/OSSystems/meta-browser.git (fetch)
origin  git://github.com/OSSystems/meta-browser.git (push)
         layer:  meta-browser
         branch: master
         remote: origin/master
         HEAD:   a3789a4168fcd42f1cdf5b5febe2c779a9467919

origin  git://git.linaro.org/openembedded/meta-linaro.git (fetch)
origin  git://git.linaro.org/openembedded/meta-linaro.git (push)
         layer:  meta-linaro/meta-linaro-toolchain
         branch: master
         remote: origin/master
         HEAD:   367f784b831938dc508b7d472342d2d0d6ed9769

origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)
         layer:  meta-poky/meta
         branch: master
         remote: origin/master
         HEAD:   37b61b059031e3c272a929b834e12fd83f46598c

origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)
         layer:  meta-poky/meta-poky
         branch: master
         remote: origin/master
         HEAD:   37b61b059031e3c272a929b834e12fd83f46598c


------------------------------------------------------------------------------
here is how it looks with a build where the repositories are managed by 
the 'repo' tool:

github  https://github.com/openembedded/openembedded-core (fetch)
github  https://github.com/openembedded/openembedded-core (push)
         layer:  meta
         branch: contrib/twoerner/buildhistory-patches
         remote: (HEAD does not point to a remote branch)
         HEAD:   a77ff8f9b203fdfbd04fabc94613face86e52af5

github  https://github.com/openembedded/meta-openembedded (fetch)
github  https://github.com/openembedded/meta-openembedded (push)
         layer:  ../meta-openembedded/meta-oe
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   dc5634968b270dde250690609f0015f881db81f2

github  https://github.com/openembedded/meta-openembedded (fetch)
github  https://github.com/openembedded/meta-openembedded (push)
         layer:  ../meta-openembedded/meta-gnome
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   dc5634968b270dde250690609f0015f881db81f2

github  https://github.com/96boards/meta-rpb (fetch)
github  https://github.com/96boards/meta-rpb (push)
         layer:  ../meta-rpb
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   203903ca6f4e8df09bef6ea3c6e899d07eca8df9

github  https://github.com/96boards/meta-96boards (fetch)
github  https://github.com/96boards/meta-96boards (push)
         layer:  ../meta-96boards
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   2be59f0d381b5ec173d7fc24f3ae14aaf47b8649

linaro  http://git.linaro.org/openembedded/meta-linaro (fetch)
linaro  http://git.linaro.org/openembedded/meta-linaro (push)
         layer:  ../meta-linaro/meta-linaro-toolchain
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   395ca11e22c26bd0c26ea1078722628ba6aa2332

github  https://github.com/ndechesne/meta-qcom (fetch)
github  https://github.com/ndechesne/meta-qcom (push)
         layer:  ../meta-qcom
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   32fcda819acb8ec485d9ab05108d554f807bf75d

github  https://github.com/linaro-home/meta-browser (fetch)
github  https://github.com/linaro-home/meta-browser (push)
         layer:  ../meta-browser
         branch: HEAD
         remote: (HEAD does not point to a remote branch)
         HEAD:   5c00d0114c5963a178cb33f6d06181c588c03ae0


------------------------------------------------------------------------------
and here is how a different build looks when a repository has multiple 
remotes:

contrib git://git.yoctoproject.org/poky-contrib.git (fetch)
contrib git://git.yoctoproject.org/poky-contrib.git (push)
origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)
         layer:  meta
         branch: YOCTO7850
         remote: contrib/YOCTO7850
         HEAD:   dc1410f720b6b2e8087a484b56cb7df299c31774

contrib git://git.yoctoproject.org/poky-contrib.git (fetch)
contrib git://git.yoctoproject.org/poky-contrib.git (push)
origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)
         layer:  meta-yocto
         branch: YOCTO7850
         remote: contrib/YOCTO7850
         HEAD:   dc1410f720b6b2e8087a484b56cb7df299c31774

contrib git://git.yoctoproject.org/poky-contrib.git (fetch)
contrib git://git.yoctoproject.org/poky-contrib.git (push)
origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)
         layer:  meta-yocto-bsp
         branch: YOCTO7850
         remote: contrib/YOCTO7850
         HEAD:   dc1410f720b6b2e8087a484b56cb7df299c31774

