Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 47FBE65CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:23:19 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id r184so15415489qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gvovq6u+Yd1GBLd6gJgsPyVCrMdk4ftlYmXHC7EhL7A=;
	b=EOuJ4p++4d+DvDy00uPmQbezr3M4Fr80vqVZLouZo92nJDOHjwkKAYAmK8EmenHAba
	te21ecqMDAQRxKwU43bZ7n9lSlkXQdCgU6LO3WQakZebzMoWRhCnfLy7GPyOSyMobQVZ
	oBvTq5yjT6i4m2YuB6XfI8v0VEwFGszBDJNLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gvovq6u+Yd1GBLd6gJgsPyVCrMdk4ftlYmXHC7EhL7A=;
	b=T0nyEfXhHGRUSVQ3yfQXsa4t71fmuUzLE9w8VfrGy/rd8A6KQysHK17EsOPXaKEme/
	kt4HbJGCd3q/mYVEeboTzx8JMxdxS1zg4KjUDBQbIGm1lYL17tfjLJ1cj9dHYUl9cnyT
	vqSCwLRLkDus+p5MgJse8LVRUhyTfSWwu1pgiRsXS/GNknZ8EZlxovVRkCNjaRsQ0qQ1
	F5tnC21kVNYq30Ed6fXyoowyk4xwcyTIex1tf32zddYc30nZzX0VGcfWMcwB2PYpGOdR
	t1zxq+CVwvPNSCg6E522hLz8SstW5aRfjlsPCf3/Hj4ojeeUM4UIj26BztWxWR0IgC9e
	l/JQ==
X-Gm-Message-State: AOPr4FVXc4Mh+xDqzpN0UBATsMl68U6QINezkzHM7xQLsH7xJF51C9okg6Zb//WZmWruyw==
X-Received: by 10.55.81.87 with SMTP id f84mr12225938qkb.10.1461165799650;
	Wed, 20 Apr 2016 08:23:19 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	126sm9582279qkh.19.2016.04.20.08.23.16
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 08:23:16 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:23:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420152318.GB1924@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 0/4] U-Boot verified boot basic support
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
X-List-Received-Date: Wed, 20 Apr 2016 15:23:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:35PM +0200, Yannick Gicquel wrote:

> Changes since v1:
>   * Uses a class uboot-sign.bbclass file instead of include file.
>   * 'assemble_dtb' task removed and replace by do_install_prepend function
>     for u-boot recipe.
> 
> Yannick Gicquel (4):
>   u-boot: basic support of dtb append for verified boot
>   u-boot: deploy u-boot-nodtb and dtb files
>   kernel: fitimage: support device tree compiler options
>   kernel: fitimage: basic support for fitimage signature
> 
>  meta/classes/kernel-fitimage.bbclass | 52 +++++++++++++++++++++++--
>  meta/classes/uboot-sign.bbclass      | 75 ++++++++++++++++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
>  3 files changed, 125 insertions(+), 4 deletions(-)
>  create mode 100644 meta/classes/uboot-sign.bbclass

Thanks for doing this.  It will hopefully make this knowledge more wide
spread and thus more widely used.

-- 
Tom

