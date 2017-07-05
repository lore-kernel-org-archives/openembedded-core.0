Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2275B77804
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 13:54:00 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id t72so25283101lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=qGxomZmSDwRxtgzFdehvmVHEQN+87Fio/JW6V+njlI8=;
	b=rdhVSUxOpzsv5iKDRPmKS5FW9b5lswF3GC7sNm+AsxffaHIVzJCUVFv9BllKAW8Y0e
	ZT1PjiMObqnjqm2ryjJnnHgjWKwn5TO1+ud+Wlyu6lCS64L0mdynREq4JO8LIDOlZUNm
	hqbnBZgAlOE9z+ns13t15cuXi0CeFOYwnIKkOR90A5ZYndFN4BZ8hwxWP/qRSVlXMGI1
	i2XQ+cStSNbaSrxlTSeyuZb2LMjOAelv1rOEvP6OyS/TJkIgdLFvg+oj98EpZXY5AXUq
	LCeZAGDO9/dzo5M0Uk9SkynBZO/IyBceJJq3+D++5xdJ0UhRyupwqPTtqGquHS1KqA6F
	I51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=qGxomZmSDwRxtgzFdehvmVHEQN+87Fio/JW6V+njlI8=;
	b=c+fl7461/D/UrdL7b5Iqi70gnLRgM6jPTcbB2/E7NNdmJ1bADDdtQDke9cQvBUW+JX
	Po/+QpsHVshxreOrE1MJboTAx1u4veuScmNTLU6h4tlXyTaoHOkQCsOuE6zmxPLKxLIv
	tIe4EwKaiYH+IqpekGtnoKBz375YRv/VGzqT4NntbEb/qFqjkxkJUEm1Yu/YNW20vmPp
	8colD/Ni5svbRCsYeIbyxjhEGDhI7NzKrd1n9hZxy14vehGGY/ioydh405y+bc8pzxtA
	q+Pb2yLBttC07uxkBDMsLW4sJkEfHuHSvGd6kXw+XFzN72+1/4i1lYnlMIGaSRfr88C4
	5wXw==
X-Gm-Message-State: AKS2vOx4qecPkgIYl8Qr3Q7kfuMU75AhfRBfXJQfIHfvKAddZPy7PvIP
	znMfYNWfhBRDfKuv6HBjwQ==
X-Received: by 10.25.157.78 with SMTP id g75mr15236937lfe.33.1499262841179;
	Wed, 05 Jul 2017 06:54:01 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	s134sm5750106lfe.27.2017.07.05.06.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jul 2017 06:54:00 -0700 (PDT)
Date: Wed, 5 Jul 2017 15:53:58 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170705135358.ask4pvpiaxwqusi3@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
References: <cover.1498459830.git.anders@chargestorm.se>
	<25c15eb7fc3af2ec38a63ed73ae710e1e2172dad.1498459830.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <25c15eb7fc3af2ec38a63ed73ae710e1e2172dad.1498459830.git.anders@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170609 (1.8.3)
Subject: Re: [pyro][PATCH 1/1] package_manager: flush installed_pkgs file before oe-pkgdata-util uses it
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
X-List-Received-Date: Wed, 05 Jul 2017 13:54:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Anders Darander <anders@chargestorm.se> [170626 08:53]:

> From: Martin Jansa <martin.jansa@gmail.com>

> * since this commit:
>   commit f5a1013ffa9815f22e13989e2bcb83f966e7ce2c
>   Author: Ross Burton <ross.burton@intel.com>
>   Date:   Tue Apr 18 16:19:12 2017 +0100

>     package_manager: don't race on a file when installing complementary
>     packages

>   the file isn't closed before oe-pkgdata-util uses it and this
>   temporary file might look empty to oe-pkgdata-util, because it
>   wasn't flushed yet. Which resulted in almost empty debugfs tarballs
>   and no locale packages in regular rootfs.
> * without this change:
>   124K May 30 07:41 core-image-full-cmdline-raspberrypi3-64-20170530054003-dbg.rootfs.tar.gz
> * with this change:

Ping. 

Cheers,
Anders

