Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id AD4B37888F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 06:36:30 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id y127so6713613vky.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=bQjWusUxHMKnTAbryRSEJiKBguEQAnVHU1szVca3c54=;
	b=CQub7o1e5vMxQJZSdlfb8QrSGY3KzJL2kdMh0Zo2urlX6qIwn25fTPblT67kRlA4Ld
	8FhQSdMSj55uEsnGn3Yi9kAcz8mWlZxtQm7l6aFttBT6g7PVnqU+BrnKVVughu89X+8c
	5FbHWtIdque9WlfgoHtkGHjnmWwqPlKalEQzflRJ1e966V69yIcZDs7ze3IygfN9aNXj
	ez3X3LHSlLJpPbxflhdVg4r/9W5ArWZpQWKUiEISt+P74HEKC6h8XpTPbBFkAHDAdlz7
	epxl8bohmMPMT0ApuZtnuqTjq8T8oSObi1QARrqcjgtv0Lrg01qf1rd6LK8ZUwJH+7cJ
	RfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=bQjWusUxHMKnTAbryRSEJiKBguEQAnVHU1szVca3c54=;
	b=Btjqd/nueZ2Sbkxcbj0pypezKl7ojbrVyfgEEZrONble1wqOcQxOyp/mUHJ12qv6CA
	vcW+AMdcBoMl+GYShBeyKseKLrMsCm+NxOfMWRx32Q6GAEM8UIapGwr54NdbjlGMIfYE
	WWQdUsljuC9Ai3AodhFuUEYUv44C4/yFge1RDYO7iSiINDilqgM69rdW4lA/GSIzl5zD
	y676mcNRVW59+MxyYtBJ9LBOLJL09ZfhVD3j2q+CLCqT8KwnliWOTXfX5X2wVvaKbeh4
	KxtiJco7JU4A5+zECoNEMLGAsTOb97Y7Znc7VG2rhqRGPmifj7bbRdBrs1yBbv0ySpgO
	tKiw==
X-Gm-Message-State: AElRT7GIf18LFKyuDO0nuHtAoh7SlxDvW7BGtdh1amsphDyJzjNg2Iit
	XwtQ2Vfv+s/KQsPHATVUbPofmehAyNkKlV6ahO3Z64OH
X-Google-Smtp-Source: AG47ELsZg1ge2rzzUMtwBcoyRA62Xg8xMUZl4O1cLXZtmRmD8zRmMLsQErazIeHx7IO2E7OBmU773jzHMFTYMaERsXg=
X-Received: by 10.31.7.132 with SMTP id 126mr7891337vkh.42.1521786991228; Thu,
	22 Mar 2018 23:36:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Thu, 22 Mar 2018 23:36:30 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Fri, 23 Mar 2018 12:06:30 +0530
Message-ID: <CAPGMVzEP9hJqngopC_AFsVLNPEJda+R5AZSecW4JPWhZTUcwmg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-ros] ros package import problem
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
X-List-Received-Date: Fri, 23 Mar 2018 06:36:30 -0000
Content-Type: multipart/alternative; boundary="001a11441a20093b7605680ea51f"

--001a11441a20093b7605680ea51f
Content-Type: text/plain; charset="UTF-8"

i have added rospy and roslib to CORE_IMAGE_EXTRA_INSTALL += in local.conf
but when i go to the python terminal in poky and import rospy and roslib it
is unable to do so

any solution would be of great help thanks

Rajath C S

--001a11441a20093b7605680ea51f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>i have added rospy and roslib to CORE_IMAGE_EXTR=
A_INSTALL +=3D in local.conf but when i go to the python terminal in poky a=
nd import rospy and roslib it is unable to do so<br><br></div>any solution =
would be of great help thanks<br><br></div>Rajath C S<br><div><br></div></d=
iv>

--001a11441a20093b7605680ea51f--
