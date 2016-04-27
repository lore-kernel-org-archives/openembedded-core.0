Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 47998601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 22:15:37 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id o66so103308932ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K5QSKdW49ZeeIK7DtympwJimmETTML8AUTDf+pTWPWs=;
	b=hoKwPO/B5xP1oAhum3Or2hP+BxKQ6aFeWDa9EhqhWgwnQKd1mfRN9MIevmyfspnsFN
	fFnl+rynkPv4Tn2LUU1fdmx7H53A9aQsPzWakjkoklkX1iIp+8O16nz6D26qJ3xRP1ig
	N+aWoLl1HrBgN++r3UjI9iFmSAJ/3FYjzGDh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K5QSKdW49ZeeIK7DtympwJimmETTML8AUTDf+pTWPWs=;
	b=dDoh7XVO9AmwVk7ulCgU3DwettsDkba8hZCgdkUOuZFv+uv6NFIOkpdVm8svxTWEkp
	suiu1piY+BkseXfjpFXpeAJbHvsyq9KOYG87bsNyPCizSfVVKgRnHfsc3wd/2F4SEkw/
	QcTapm3aAreahh3qDJIUtA2CBSHjNpwHuh9UQ48eB5F/dhSvZEG0mPv+OA0ESokBM8Qb
	YsfRY1HO9JDF0UyZwFebWfio1FxzvobQ0wT4XMvmhXaOvem3D3g8wFtBwz50KDif0oCW
	tuNzkNQLc01fk4oozLrY/92wBrmn9vNo72kIyd1FTHdzuUaVVWzfcW+poZSUhQJMgHVg
	GwfQ==
X-Gm-Message-State: AOPr4FU43zGioivJ5yC+3IGPd7lmYGATS34XgmPZRkXJ+m1e6WlPCoGTggOvzSW2H0YVvg==
X-Received: by 10.129.114.130 with SMTP id n124mr6097987ywc.84.1461795338119; 
	Wed, 27 Apr 2016 15:15:38 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id
	i133sm3114321ywe.4.2016.04.27.15.15.37
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 15:15:37 -0700 (PDT)
Date: Wed, 27 Apr 2016 18:15:35 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160427221535.GD19598@bill-the-cat>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461766856-27881-4-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461766856-27881-4-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Wed, 27 Apr 2016 22:15:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2016 at 04:20:55PM +0200, Yannick Gicquel wrote:

> This introduces a new variable to set the device tree compiler options while
> calling mkimage ('-D' option). By default, this variable is not set but it can
> be defined in a configuration file, as following example:
> 
> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

