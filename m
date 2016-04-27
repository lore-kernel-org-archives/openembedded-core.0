Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7558D6FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 22:15:33 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id j74so90884021ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 15:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2x3D735JlCclp7vipyi+BTMijH/+rSKi16e+dt4QAo8=;
	b=bm+yOFhZl8zjmUxcrBirf7f6X8SsQsT+ogMlyNL9DJMEzFARA7IKSAEOuDSpNW1wif
	DbbaDfR3UmJyuv/Q8dJP/6k0UXSmp6TaBROvyB6GKpptdJpvPzCAys8qrki7vIXhD2Yr
	xZ+PmBpqdXEYveaPtUWA2tYACFxDvMTvtp6ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2x3D735JlCclp7vipyi+BTMijH/+rSKi16e+dt4QAo8=;
	b=CdR33NPoE6bI07jfnF9RNBsx78tM3vgmyRzuRQGJ2NG2FjccuhXyFvGD5Dzjy2Vfva
	nT3TPn6L/g+1XucjQMfFEJZFjX8y+ZFFYgU9xOMjww70nH3IDUh2/CN2tIRsMy1S3B2a
	3E/NZ72vy1l3QcguYOWS71yc5j+iYc+CxCBqox+9/LPvCJjA9J/AHctrtoygmNNCh4X3
	KzTXto4v13SOJBNjpvd/sTDq3Xoa32pRps+KQ84Au0k5iqf5CeLtI/asi6WHLrp91jtK
	tfF7UZyVLeOzEFKlC3nj9Ca4Zl87nttnWGSLp2iwWosVWL9G00TndQJ0QesosiAj6sol
	nyqQ==
X-Gm-Message-State: AOPr4FX4NRr4qIi2y+W9U7oEUqJe/orqFOXRhWX+R7YhVYVmOgMNyaZK4IokXkrRIBV1Jw==
X-Received: by 10.37.204.85 with SMTP id l82mr5660150ybf.140.1461795333998;
	Wed, 27 Apr 2016 15:15:33 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id
	p66sm3070608ywc.40.2016.04.27.15.15.33
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 15:15:33 -0700 (PDT)
Date: Wed, 27 Apr 2016 18:15:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160427221531.GC19598@bill-the-cat>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461766856-27881-3-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461766856-27881-3-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 2/4] u-boot: deploy u-boot-nodtb and dtb files
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
X-List-Received-Date: Wed, 27 Apr 2016 22:15:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2016 at 04:20:54PM +0200, Yannick Gicquel wrote:

> This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

