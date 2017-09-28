Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9758260603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 12:15:58 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id l4so832364ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=g/YZhPpl1v3c6ArwvguLOZPs4Q65w9kkjY4C65s/92E=;
	b=J2GOZZ1n8lOHFb+d9YWvmYYyJQLb8ZVAJ/8nJdxCNGu5mDEas3tBIcKVKkiez7Qb0P
	R7tVwraR2VFwr378UXNk3uQGLl2mJWs/uPi8Tt2ogmru9lmNZa+cIM9/Wfh1vohDh63q
	f7GtBs6tvWpIfmeUzpDuWMgIPtiIHf+A7gzAJJFIE/iQr6HZeaULfkGzpho9t2wZrpRj
	KjVxrndh2w9ykIGu8oQlZpvMklZAoxYuwHAeReU7sv543X71FBXolq30cTeUEYkJP5vv
	GjuZUJv7fdleLoN6zKZ8FdWiIAU4RWDidXbtOSBDBlc5nRSqRs00DXTNh2wHSixbP1R4
	Lhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=g/YZhPpl1v3c6ArwvguLOZPs4Q65w9kkjY4C65s/92E=;
	b=PJv/FUlrdv/+BsRKKlIjXZwLjICIljNocj0b3xx6Hd3FEeSa05g0enXEZ/Hhl7taxa
	4qnmBN4qhSsVrxq3vdtV+c6dB+92locQsrgc43jzPXGOj/rk3yVLGVmvmnx04Cgugo3G
	8Qyqtt9r5B9OlFTQoMeEXKREZbk8LHHyXCcqL61XCDIu1jksOt0uH0taPgds2SKZ8fSh
	+R8ctzobFriqjl50sbidSGQ34ngA0VffWrrixWg0kK+CTSzRXh5Ok87lrBzK7N0sg4rV
	r7xs69sDPUg5pWVkmJYOM3aiDPuAK0M7FCMoEmV/3E9tNeEbLhBPtbi7v1BaJmoJfyIz
	KMqw==
X-Gm-Message-State: AHPjjUg0PQM4aafnTgvenfHV4ygiUd5xca6pOHxLgwf7eTURQ+X70maw
	Fqqj0vffDbbYyqpV3PUOzTjLcVFO
X-Received: by 10.37.106.86 with SMTP id f83mr3369361ybc.111.1506600959198;
	Thu, 28 Sep 2017 05:15:59 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54])
	by smtp.gmail.com with ESMTPSA id h3sm499689ywk.96.2017.09.28.05.15.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 05:15:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id j126so1877668oia.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 05:15:57 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDW642Z4u1lYbPsltMaBIQJ0zTjUtT6/y+01g9lLPutVXnfbKjwP/Pp2K8Sif1HN1trHZHtUJo5uH3cpMxLFgA=
X-Received: by 10.202.178.66 with SMTP id b63mr198956oif.140.1506600957008;
	Thu, 28 Sep 2017 05:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 28 Sep 2017 05:15:56 -0700 (PDT)
In-Reply-To: <CAJTo0LaXfJCZ5hw+sLcm4yWe_K9ck_H+7kTgva1+i9NSLdB6RA@mail.gmail.com>
References: <20170831055458.9197-1-jackie.huang@windriver.com>
	<CAJTo0LaXfJCZ5hw+sLcm4yWe_K9ck_H+7kTgva1+i9NSLdB6RA@mail.gmail.com>
Date: Thu, 28 Sep 2017 09:15:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpU+4idrdhG3i3zDVyVQ=KqdF8sYMHBjrDxq1MmMRW6bg@mail.gmail.com>
Message-ID: <CAP9ODKpU+4idrdhG3i3zDVyVQ=KqdF8sYMHBjrDxq1MmMRW6bg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs-postcommands.bbclass: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Thu, 28 Sep 2017 12:15:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 28, 2017 at 8:27 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Why implement this as a rootfs postinstall command?  glibc writes this file,
> so we can alter it when that recipe is written.

Also this is a problem for reproducible builds.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

