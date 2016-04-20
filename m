Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id ADF0973163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:23:25 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id r184so15416599qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B10aBfmVD6EA/V7Wegbpc39l/IERSPBD+dFVPirSt4I=;
	b=mHo2b8GoTmkaE3ZvGkFvqK8xZSpbtRVA02gW0ZZSsXfQlZSVNy0sWVSp2CuSPV1HDo
	jd9T/KtVWJ/MIEVFe0hSpFpEpkkCnR1bWG+cBZd1mwgCOxf4UFACZMG+iNFpxWX5lDH8
	Bpkq8FfqCQ54Z6tKXx/AZZpNbaZto95KIkBf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B10aBfmVD6EA/V7Wegbpc39l/IERSPBD+dFVPirSt4I=;
	b=Js9UdnnwFg7zu8Jt8VePO9lBP90IcGsfI6JsHm2KDDHz1TXmTTtdlZBu2WfyI0us72
	ehjrS+F9is9p7Y1y+uv1IO1MGpEMVolxRUXLkddGgh0KJ7o4IwivqwV7R6boqkPJA4xK
	AfxVdyLA+u2XxZNpwfEAB7ukPwYal70je+sGkJWAqBJ+GHjhZbJVkk2xf8ibFltySRD+
	h9NxprutKsGrmiZhJWGw0gilWPKr9o9i/BRtVLVOj/gd/nyQPrbHHXJrkrU9F1LOwEtM
	XY4GB3e3+ZwtB5fw4tbC769jL5ImzPuv78Ial2mQrFqHvlAcCfhWZOgBGCCkrrRbWhYJ
	pJFw==
X-Gm-Message-State: AOPr4FW7+T8X4EPKI2OXgs5hCF3492KK0mQIvhY3wI9nS5g1qE+/l4/EvIdGh/K4sYJclA==
X-Received: by 10.55.23.196 with SMTP id 65mr2502986qkx.101.1461165806103;
	Wed, 20 Apr 2016 08:23:26 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	b2sm10185320qgb.37.2016.04.20.08.23.25
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 08:23:25 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:23:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420152328.GC1924@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Wed, 20 Apr 2016 15:23:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:36PM +0200, Yannick Gicquel wrote:

> This introduces a new uboot-sign.class to support U-Boot verified boot.
> 
> This part delivers the new class file, with related environment variables, and
> a basic prepend to do_install task which performs the concatenation of the
> u-boot-nodtb.bin and the device tree blob. The 'cat' command used
> overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
> changes in later tasks (do_install, do_package, etc.)
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

