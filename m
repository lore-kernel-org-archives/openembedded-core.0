Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D71279014
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:23:14 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b15-v6so21679159qtp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oofhY/VvbDZZ4RSU+9zx23kDq16yCARFBnA262XwXcs=;
	b=OokJDKGRzWmtVOqPI4jkhOYT7rI0QeRRNVScfo7aQsh7NwFy6nUQe8RhlYzyBeYU9m
	kBjV3L8TPCjKb3Ji/hst5Nqgw3l51RJc3SOBnjlOvAiolsWNuh5GfIxMyE/xaSmKFECY
	j2d5E44+9dbklkjwoEsJ76j2Zf4mG/NFRcPRCH42ayRac+12QoEobeEa9Eoxn9aV4Xxh
	eo2S2k5QVFYDB2PHEXV6aJVdbBT4hkvolmM22UuDuC1nXGKMwZ7VN8Fy6DrBUTG020w5
	qFjZjmIBqRt43ooD1DQL3Sub82ZkF20/aiyvMnptS1qJcmVwwCo1YIwunmmUNtCEfr0y
	JT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oofhY/VvbDZZ4RSU+9zx23kDq16yCARFBnA262XwXcs=;
	b=OTW5trzY/eqlxe6E1lqyjG+FdLaWM2HsohefR+S2WHxTckuqHKEFYSzX8p0FaedEqe
	mvquVmyNP0NW77UZtbwe/GpO2sdbX0W+QobwMAzL2S40FwDb4i1ItW/gRDOHeYxBhTK/
	ykUUd6uUSPUPFn0t9rjCt7+fTIkuxmLWDRcXWoS2V3lrldjFI0yo5zEVBFJkq67BUb1G
	/AxnfvvrJgjo67y0Lu+aE1vn8jtuHib7tmVG4lwvOUdAir68OvlK68xA74h5W449cJJi
	2963uZYDS4ZVL9p2J/DspCJ5wIG29ae+joRSZnuYrjXGkH9MOSNWXTqG9M8NJfB7i5Hx
	vEwA==
X-Gm-Message-State: AOUpUlE6ouP2KzsqqvheWzb88+97vqMTWr0lfkUNvGvsPTv5JoUzVSrS
	DOFJQu9P964jclP3PvzFe/2otJHU2UxH1VqwlQc=
X-Google-Smtp-Source: AA+uWPxobFqh5YgmqST5pQQ/G+uFGBTk2/NOke6k7IYDvQBNfopyGL0nG5nSvEbSHLB237POrklOiKvSobWp7jpPPOo=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr19771069qvd.221.1534263795246; 
	Tue, 14 Aug 2018 09:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNS0Tze1bLt41fNbOSB-Bs2D80XO369ri8AvRpQhBg+rdg@mail.gmail.com>
In-Reply-To: <CAGCTLNS0Tze1bLt41fNbOSB-Bs2D80XO369ri8AvRpQhBg+rdg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 09:22:48 -0700
Message-ID: <CAMKF1soq9VU_8n-knW-_H1Z2-EAb+Jop_YuJjV_nrEyi1m5k5w@mail.gmail.com>
To: mhm.dawod@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][meta-qt5]: required packages to run qt5 qml applications
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
X-List-Received-Date: Tue, 14 Aug 2018 16:23:14 -0000
Content-Type: text/plain; charset="UTF-8"

you need to add meta-qt5 to your bblayers.conf and then
something like below might be helpful. You have to check for
renames or removals though.

IMAGE_INSTALL_append = "\
   qtbase-fonts \
   qtbase-plugins \
   qtbase-tools \
   qtbase-examples \
   qtdeclarative \
   qtdeclarative-plugins \
   qtdeclarative-tools \
   qtdeclarative-examples \
   qtdeclarative-qmlplugins \
   qtmultimedia \
   qtmultimedia-plugins \
   qtmultimedia-examples \
   qtmultimedia-qmlplugins \
   qtsvg \
   qtsvg-plugins \
   qtsensors \
   qtimageformats-plugins \
   qtsystems \
   qtsystems-tools \
   qtsystems-examples \
   qtsystems-qmlplugins \
   qtscript \
   qt3d \
   qt3d-examples \
   qt3d-qmlplugins \
   qt3d-tools \
   qtwebkit \
   qtwebkit-examples \
   qtwebkit-qmlplugins \
   qtgraphicaleffects-qmlplugins \
   qtconnectivity-qmlplugins \
   qtlocation-plugins \
   qtlocation-qmlplugins \
   cinematicexperience \
"
On Tue, Aug 14, 2018 at 7:41 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
>
> Hi,
> I need to know what is the minimum packages which I need to add to
> IMAGE_INSTALL_append variable in local.conf file
> to be able to run qt5 qml applications in custom image on Minnowboard Turbot that support wayland without x11. ?
>
> Thank you,
>
>
> --
>
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

