Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6F97E1E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:09:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so5361634wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ntfvXDiOb3bG4C0kvjsD/FgUWp8bFsMETPMMXy3s0c0=;
	b=eExsoVpxeqjTDmPAtTBQwyS9R6uGI2n9gjXC811IuvIb4gccZA6nId9+IcmZpgmi6k
	CIyBeRKU8qWhoxlKWiFsXtBEpt2cXQXEPu2CEyq2Iy0d/1dBE6OwMMLIGoh1PAngSry9
	O6LUxRv3CcgsgaqSXgMHOAGhrMjblCxdhHwag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ntfvXDiOb3bG4C0kvjsD/FgUWp8bFsMETPMMXy3s0c0=;
	b=XXmjPB/GCDqlBVm/ptJ23D9wB7YGfw2saLs3HYky+PQvRFeyffzjEQLfcLbXzaJbVt
	9/VOHeJtVjRWL86AlLf1ffB1r6e1MBdsoH9CTkXY4xnHfrRiGFzLxBXsEUR0BsZMZMFn
	wnL4aQpuIXusucsXoaq5edXWfHuBdYKrrctkOTWDvhtOxEYZhbMgd6DHlh+HkaixWg53
	FwIzV32qBDRmn2R2DA5AcAtE8TD32S7GfM2YBrufR63kwKlHuEEjHwt+C7l3HrzhoL1y
	vcKMDZEG8JV0T6tZ88xIx4i9e2xQ/t10Zx5XJ5snZ4/QJJoqXoiCT952BqskV/be26sQ
	bUGg==
X-Gm-Message-State: APjAAAWohl+P4c1/bxw8bsVnEi1ujAPSZsx6nJzgW1u2v5ulQtB1Cd3H
	125x6bZ3G1HvtydyUmSbTxxYTw==
X-Google-Smtp-Source: APXvYqyJlYtIC0a1neZo3ZSeA/YEDZgHV7j4VrT2MqxbNWHVLSVpWtbhFWAtwggAtTl3eaX6DiqElw==
X-Received: by 2002:adf:f38a:: with SMTP id m10mr3013422wro.81.1558440592737; 
	Tue, 21 May 2019 05:09:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o4sm3251561wmo.20.2019.05.21.05.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 05:09:49 -0700 (PDT)
Message-ID: <e82f3bf27fdc19d7fc434d4be43661dc166dd8aa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, alex.kiernan@gmail.com, raj.khem@gmail.com
Date: Tue, 21 May 2019 13:09:43 +0100
In-Reply-To: <20190521092249.175461-2-kai.kang@windriver.com>
References: <20190521092249.175461-1-kai.kang@windriver.com>
	<20190521092249.175461-2-kai.kang@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 12:09:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 05:22 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Add a configure file for systemd.networkd to configure wired network
> interfaces with dhcp. It works with common network interfaces such
> eth0
> and eno1.
> 
> Refer to
> https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
> 
> [YOCTO #13057]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
>  meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-
> conf/dhcp.network

This seems to result in the failures in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/617

Cheers,

Richard


