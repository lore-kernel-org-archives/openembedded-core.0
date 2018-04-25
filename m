Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 468496003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 12:11:27 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o20-v6so19656131itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=MY10kbmv84KPtwTbeZumXEzW00QAbvOP5sNgfqaxugA=;
	b=0tsG0q5d9ijxmMdba1k+qUWJKKf8yr6TvHzGWEPrVBLfU1JCHKrpW/wRbhpgl6nmzV
	1EKAT8HDsLRAU3oHVd0XUC0t/uzePYppKIIeScF8L8C97ezP9yFjDqmsyEOX+1QRd5jL
	nu/QdiZ1mj4h7lN8Luoilr7hF+7sATNaq3YelP9Ua9RA6rS9vTieArzfMIORYXe1Qj5e
	Nl1suL1Je5dC87bml2x2kIFiMC2P8GpOsVUUEIQkUTJPESG0D3u0TQfJlbH997M6YkuP
	KsGRmIOZTf3bpZf88GY+NA8joOhoH0CieqNGrn44MAAk98bjKxQx2zxLQnu6NNriqVk2
	PSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MY10kbmv84KPtwTbeZumXEzW00QAbvOP5sNgfqaxugA=;
	b=axr6ugNcc1wLwGj/GJr9ThsD9hOKIYMQp/XXkLcxYFdgY7+p4K9Ijp7+W6TtVTbwRu
	jYZ23va5rIckotkwfzx+0bB6anzvP/CrR8CrTbJZd32D/lEt/cqM72EmoWF7g8EWERPr
	yEmIhAm4EGXR/KTqc6J1yY2FcR5c9AR3+rK8XeAVNOrb7ln+uXoUoS/ZbS4KUa6s5EFC
	8ExZ+gCgjHQmqichkRB2q3ej/i9wM6hq5ig1YIphnPAFt866fHxZo1rz5NFM3HYkIvoh
	rmYrvyLDpCyeSViQKjQBfEEt1QEfWHDo6WtSzYUEaqKxDjk0axXbg0aBl+oLg8lWZmXi
	fuaQ==
X-Gm-Message-State: ALQs6tBK68puWhW9aDKh6kPCmlGZheeSOuZQRpVqGhRivbCkrUfK1wMb
	Wgl9nJn7irTn1/GaNmeyZXhXniiJLd9O8QiitLGSQA==
X-Google-Smtp-Source: AB8JxZpiH5kIbHsWiz3Lulfui14VNzmP/m8wR3eZsaUanA4QERAJMYPPVskKaG7jNKj4M4k8au4NuPNrex7Q4i6hBmk=
X-Received: by 2002:a24:9493:: with SMTP id
	j141-v6mr5377778ite.60.1524658288755; 
	Wed, 25 Apr 2018 05:11:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Wed, 25 Apr 2018 05:11:08 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Apr 2018 13:11:08 +0100
Message-ID: <CAJTo0LbOsiLq=0Zz=4fPE-A7Q7Ez_XVgqm8CBkSeAu6Bz=myLg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@yoctoproject.org>
Subject: GCC 8 hosts
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
X-List-Received-Date: Wed, 25 Apr 2018 12:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Just thought I'd say that GCC 8 is going to start appearing in the
wild, I believe the first distro to ship with it will be Fedora 28.
As usual there are changes in behaviour so there are several problems.
So far I've identified the following issues:

* Python 2 crashes on startup
* Kernel tools fail to build
* grub fails to build
* ovmf fails to build

I've patches locally for all but the ovmf failure (which is a pain
because the source uses CRLF) so if anyone switches to a GCC 8 host
before they're merged and wants to help, you know where to find me.

Ross

