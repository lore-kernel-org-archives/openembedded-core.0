Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 273C071A07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 20:25:51 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id q130so278299373qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+7uZ0KgbHv0L3E/j7uP46i0YoUB98Z2X5/f0E/VhvCU=;
	b=aPytZqsIEBN9T7oOL8k9xWDVsL2H4RXM+JBPScZZXZolgd3Ds03slo2aokseFppOOr
	8dAZRkB2KMo+vBRXs45Hqf4kNZf4GqJBvVayH09c1NUmCzoKYff4pz62yocDspYUAzIf
	iHaaj+EaKAnc5prsMObJPS9ZHu8KVneUiL5NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+7uZ0KgbHv0L3E/j7uP46i0YoUB98Z2X5/f0E/VhvCU=;
	b=OqEuhin8IDXMFWat5wLxZ2v+IB/5XYnhGogG1gO+oSgH9WKgEVN63j/MXRA8g5YHFm
	kg4JszrA6TOadwt0epbLr5fz+2OdjqpLNG96Sv6toDZ7E5rz/XqD28hvPAe0rfCd96iL
	i3kNpBGCX7BoAotkM5ioRZLHN+u+BstzKd0PhC6E8qsZ23CsbuRzErVfkiDYS78EbjWJ
	Cuz6713mFWNWWPjx4/nDSV10u2u4Oa9kyTxOev7eAnVHhA1J8dsy0E74NxEC1E7ShfwO
	UurAyz5I9IeDRk2IxF1OiHPIa64Jw8pp64aWxr+ln0gPgg76SS/L3NgsSjBmneGsBpKW
	9Tog==
X-Gm-Message-State: AKaTC02YCtDKioWeyGLNWuNoqBCtrfPmWOl1dZOOVsEa4P0PcDiGDeAxeZmWNpB3WNG2pw==
X-Received: by 10.55.24.7 with SMTP id j7mr2016187qkh.206.1479500750898;
	Fri, 18 Nov 2016 12:25:50 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id 96sm4840206qkz.40.2016.11.18.12.25.20
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 18 Nov 2016 12:25:20 -0800 (PST)
Date: Fri, 18 Nov 2016 15:24:49 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161118202449.GQ2546@bill-the-cat>
References: <20161118192955.17284-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161118192955.17284-1-marex@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Fri, 18 Nov 2016 20:25:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2016 at 08:29:55PM +0100, Marek Vasut wrote:

> Upgrade U-Boot to the latest version.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>
> Cc: Ross Burton <ross.burton@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

