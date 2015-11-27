Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5D416012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 10:03:36 +0000 (UTC)
Received: by iouu10 with SMTP id u10so111597140iou.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RV992ZE4OvZO1GJE3PxCYa7SDHS/wDL1lgPGEKmWnF8=;
	b=1xZyNLDG6feh0o/4HbhzaKcUmxfDV7/T6EpmO1Lstx7rRTHVS2W8XFdRc1e9Y2YUEU
	/zD0DRr3Wi39NHvLdg9HET7sufHe7fjPHQmQ5SeRJAGQllfwfWjNiadiZ1x3jX9oObWZ
	RNuVtS5YgSARP549omLSgz5pdj8Qtc5QDsQqZA2OoCsmwAHd9vsU0x0qO/vumOkKUaV2
	u+zwHaa56BVbBEe9/MBcuZULcszRm0OWxJ9jn98zF4Apvt049IJE3gZq8aiReGp+XE14
	FQEWymVjOw+KCdrD1iwIURE4InbP81ntMr8XplOCz2ot9kzD0VbHdxEimbeuKIjZgjtG
	G0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RV992ZE4OvZO1GJE3PxCYa7SDHS/wDL1lgPGEKmWnF8=;
	b=W+jnBpJApkA/J4O1Zu+76wy5RnNjN6VwBub12OQ4PPPcyANoQMTcm3QfrVjXPiTpiV
	OZ8BMXxkmcPGXCV+kLb6stQ8MggR8q6sb5Gh7VPD8aitIXqJOnR22hYg3OfPEdyd4XV5
	0VmAINta7/C8HiIrRCCTKI0xvHD9KAaFlOLzg5SojzyLBwQ8qAjVoyWyxCv0CmV0KQru
	ZgXohJShXK4tW4xO9Xv11YZxAFtGW6KXBOCvjVPBG6v94TKZIhyIYRl9NzSUNcUT6qcW
	ld8Ix1idCkmxfu/UJnx9ViKedRoJBoLNsTjUfISiBM2wzvIyYx06iXRoks0bMHcH1fIw
	P37w==
X-Gm-Message-State: ALoCoQkkUdgX+UEWYZsVSIWlWm9kSUo4bb9Qn5/Jjctg3EqxmjIiqJez/GWGnR94c6jh3GMOZhHe
X-Received: by 10.107.3.144 with SMTP id e16mr41843164ioi.99.1448618616805;
	Fri, 27 Nov 2015 02:03:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 27 Nov 2015 02:03:17 -0800 (PST)
In-Reply-To: <1448618616-30204-1-git-send-email-wu.zheng@intel.com>
References: <1448618616-30204-1-git-send-email-wu.zheng@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Nov 2015 10:03:17 +0000
Message-ID: <CAJTo0LYJCYcDtG1AR3WL-kd8T0=E2nWnhMyucGoZxt-r3JX_0w@mail.gmail.com>
To: Wu Zheng <wu.zheng@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5:upgrade bluez5 to 5.36
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
X-List-Received-Date: Fri, 27 Nov 2015 10:03:42 -0000
Content-Type: multipart/alternative; boundary=001a113ecf4011ec04052582ce26

--001a113ecf4011ec04052582ce26
Content-Type: text/plain; charset=UTF-8

On 27 November 2015 at 10:03, Wu Zheng <wu.zheng@intel.com> wrote:

> Bluez5-5.36 fixes the most part of bug.
> The target areas of bug are such as PBAP, AVRCP, HoG and GATT.
> It fixes a fairly important bug for the GATT D-Bus interfaces too.
> At the same time, Bluez will cache more information of remote GATT
> databases and thereby avoid unnecessary rediscovery of remote services.
>

Cristian submitted this upgrade a while back, and it segfaults on startup
quite often:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/538/steps/Running%20Sanity%20Tests/logs/stdio

When it doesn't do that, we can merge it.

Ross

--001a113ecf4011ec04052582ce26
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 November 2015 at 10:03, Wu Zheng <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:wu.zheng@intel.com" target=3D"_blank">wu.zheng@intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":1vg" class=3D"" style=3D"overflow:h=
idden">Bluez5-5.36 fixes the most part of bug.<br>
The target areas of bug are such as PBAP, AVRCP, HoG and GATT.<br>
It fixes a fairly important bug for the GATT D-Bus interfaces too.<br>
At the same time, Bluez will cache more information of remote GATT<br>
databases and thereby avoid unnecessary rediscovery of remote services.</di=
v></blockquote></div><br>Cristian submitted this upgrade a while back, and =
it segfaults on startup quite often:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><a href=3D"https://autobuilder.yoctoproject.=
org/main/builders/nightly-qa-logrotate/builds/538/steps/Running%20Sanity%20=
Tests/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightl=
y-qa-logrotate/builds/538/steps/Running%20Sanity%20Tests/logs/stdio</a><br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">When =
it doesn&#39;t do that, we can merge it.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf4011ec04052582ce26--
