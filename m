Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2185B7D8EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:49:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id v14so10731641wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yZbP0xyPIWtNX3Pd1M5gmAwdzUz1J210tht1rSGhZoI=;
	b=ZeKBTfkg4X8eECZ6400fu7tzDkMbhHTOwfI/n4lXhbWpKbNkmoANNh5lKSIOYpDnWW
	a5CkfN0kZ609mPlSmyUj8XMPoimwNSfhgyNqLBSnmdzlqwRtMcBMBDWkrrbKHCljMP7z
	wN6pBDsmJ9lvgDGXXagYuZRyAuUlLfJ5KMLsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yZbP0xyPIWtNX3Pd1M5gmAwdzUz1J210tht1rSGhZoI=;
	b=i+NPQJGZDy0EaiSh2iRjX5UI7n82pc5a2qZPHYD1Gxt6XRSLvCIj63haLQhhrH5phZ
	6gfUQ/sAMRmE8AnBMbok5/cVYq3UAmB2LzI2uyU5yUNyXzzPUTQb49sFd0gXUnLVgj9h
	rk2iTYbN0wYqMaspvtBTqizFtgi2+45rZANPzoSvdv9f0+OjtbRBrrNrtMZoQa89WzKr
	7rguQSVBic2dTk2p55a84EiYbUZVUHOxBR3joimPmGNoNWekgcVwmbUO+NfZo67rwxMM
	/kuQJh/RT6QqZVshK2Y9pEiX7cyC65KUV64taN/5Slhs4q76PBgVOqYE0KAUPYrhtyz6
	kI7w==
X-Gm-Message-State: APjAAAVnOJrf7BXg4nyd4UPZnycdtwhPEGmXDMmRggq/6cfwy6xOnkAI
	0HZ58tpHMxnb/QfzE/8LVxu+Og==
X-Google-Smtp-Source: APXvYqxrlY4/V7L+YwyRnUpLmoVa27fS1RN0S29METUSLMWNG5zXbTnPanb83ha3eCyz0eSLeXJlag==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr3539116wmh.81.1556200192840; 
	Thu, 25 Apr 2019 06:49:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p9sm1264378wma.31.2019.04.25.06.49.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 06:49:51 -0700 (PDT)
Message-ID: <a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2019 14:49:51 +0100
In-Reply-To: <20190424001333.14948-1-alistair.francis@wdc.com>
References: <20190424001333.14948-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Thu, 25 Apr 2019 13:49:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-24 at 00:15 +0000, Alistair Francis wrote:
> This commit upgrade QEMU to the latest 4.0.0 release.
> 
>  - The COPYING.LIB file has changed SHA to:
>     "Synchronize the LGPL 2.1 with the version from gnu.org"
>  - SDL 1.2 has been removed, along with the --with-sdlabi command
> line
>     arg
>  - The backported patches have been removed
>  - Al the other patches have been refreshed and the numbering has
> been
>     updated

I put this in for testing but it failed as nativesdk-qemu doesn't build
due to unpackaged files:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/535/steps/7/logs/step1b

Cheers,

Richard


