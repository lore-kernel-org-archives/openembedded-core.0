Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 31F4C736B6;
	Wed,  3 Feb 2016 09:00:06 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id mw1so30810465igb.1;
	Wed, 03 Feb 2016 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=2OO4qosAwfh6RmnNXPnWgI4b1tTXDbUKRm8fJh1k6So=;
	b=LHWxvGkpKvMgKirWgE+DzFYxab1jia0KfdKEt+Jd0R8WSv4giAzw4tOlypWumStntq
	jVb6rRGQa5s6f063Spt5M0fZZqAR/adN/FjOMQpxsxTiVlTLENtv/nAFctcGxYQQ/FX0
	3VnF8dtBkpzJxEE1/gOOJ+gM11RwIaucEOsT61TtuO1kVWRLPMAEEshmolzGn4bp3bZD
	cYS81T8Ml2DoKFyqZWWtC5RjykWCbIOp5Cdhl6+6gvdXCNxoEULnbWPnDzt9Hyrgvv7R
	+zE9wVhgNNL87cwD93oNtgZ+AIhLjHI2rOwwYLiNsy1cKSgZMCTVARYwh7WOzapL0tb3
	QV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=2OO4qosAwfh6RmnNXPnWgI4b1tTXDbUKRm8fJh1k6So=;
	b=LVQTon+RRoVe93LCEQyHZuPcjS817ZvvTCT8DolJ6L8XUIkbmiRRPduJWPFKpHNY13
	n/GTJd/G3NDN8ijc8Ps0lQpj5tTXjM3vxmI3HsiRkZtRDNuJGNxVfPXLr3K6uJ7aPpKo
	ID10phJKR4I67YkZlIysNeVMU8UZDdL4oS855JWpnoWNylieVKOdlLkqZNJE2jDyg/kW
	72JwQYTeY5MhlR2ejFu/PKkmfc0lzspR8dp5D4UJGDgRYZIo+1pjd6cD34hasHERysG4
	PHt4VaAVJ/RMkdVE1cU17OuZDp/3A5an8Dsdo3epfvyDhLOEXgxjdsFTWJIB4h+YAoPB
	vd1g==
X-Gm-Message-State: AG10YOTS4qh7gyR61CoNENA607Av0qeinZg/t5yjLgFFLEHi71jZvhB+sVuYRPGYIUelnlERkUAC6y3iLNEVlA==
MIME-Version: 1.0
X-Received: by 10.50.20.73 with SMTP id l9mr2546760ige.58.1454490006961; Wed,
	03 Feb 2016 01:00:06 -0800 (PST)
Received: by 10.107.142.207 with HTTP; Wed, 3 Feb 2016 01:00:06 -0800 (PST)
Date: Wed, 3 Feb 2016 09:00:06 +0000
Message-ID: <CADwFkYd87h6DoOw=Ffybdz76UvPDAZ-JdqxcaJjaQc6kCidy5Q@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: qi.chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: software implementation opengl
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
X-List-Received-Date: Wed, 03 Feb 2016 09:00:07 -0000
Content-Type: text/plain; charset=UTF-8

Hello.
    I'm using qt5 with poky, but there is not gpu/drm on my arm.
    I found the mesa has sw implementation of opengl, but I can't make it work.
    do you have any experience on it ?

   the qt5 quick 2.0 need opengl, I want use sw opengl implementation
on framebuffer directly.
   and the mesa in poky dropped fbdev.


Yi Qingliang

