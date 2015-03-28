Return-Path: <tom.rini@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE336AC33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 16:47:27 +0000 (UTC)
Received: by yhim52 with SMTP id m52so47267310yhi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 09:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GTBe5UYQBsj1/rDrtfXOpoSzmTpoVz2YRYCl+XpvdB4=;
	b=DaVjZZIpO6fbInwUu0KlqAVsnX2RohcLcp5S0BNBLoWBUMT651/L3a3Ww12jjzWmMi
	LoUifWteznRwPTYU3yCMRTGgvw/+UWeyGvbALDx2KL0S93My2IxerefZB2u90Xq3x3MI
	Wp9OGfyfMnA0y2cx3ak7ZmyDHGUBIFtsXA4uNnM0KpeH5wf2i+D6HUGykbu/vi9+rRjH
	bDFHdYMnhNS2z1Z0POJ97WiEPM9xY+cLd3at9nB/KC8uIZ0YYOiTJDcjH5hJu9dEi/vK
	o/txSiHAD6F0tvlXa8QUXR9tLtodbrSvdxAJzFtPhdCNCQjDx6UGzSI1kfkx2KDOLN2L
	u/zQ==
X-Received: by 10.170.98.133 with SMTP id p127mr28449722yka.115.1427561248430; 
	Sat, 28 Mar 2015 09:47:28 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-048-186.ec.res.rr.com.
	[174.106.48.186])
	by mx.google.com with ESMTPSA id h25sm5749539yhb.11.2015.03.28.09.47.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 28 Mar 2015 09:47:27 -0700 (PDT)
Date: Sat, 28 Mar 2015 12:47:27 -0400
From: Tom Rini <trini@konsulko.com>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20150328164727.GJ32541@bill-the-cat>
References: <1427277082-28117-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1427277082-28117-1-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] u-boot.inc: fix rename image error
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
X-List-Received-Date: Sat, 28 Mar 2015 16:47:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2015 at 05:51:22PM +0800, Chunrong Guo wrote:

>    Resolve mismatch between U-Boot configs and uboot image name.
>    The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>    and repeat compile or install so we need to check if ${type} match ${config}
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

Acked-by: Tom Rini <trini@konsulko.com>

-- 
Tom

