Return-Path: <tom.rini@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5922D605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 23:22:33 +0000 (UTC)
Received: by yhw29 with SMTP id 29so985987yhw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 16:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=joPrT3utwoS5Dr5bmfAqjolr3d8ljwutyUuVI16LgTs=;
	b=BlLJCQj+8VP0QtiEW0pYwKTMTyXWlBBgj5PT0PTZtYJIGOSAkwQrOHUIeKJ3e2FrOt
	tM4VxNFyCFDhFrsvtFH6mcPv8IDq/ttIVm6TkJ0OCLzu8a9Q1UEiX9PpLF9Rjlf27Op8
	Z8+C6ORT8Ihq0jqbahBDLRrASfcuwxQXNN3yE97GYn4HNUJYrfl3p031NUIm9eA9f9D6
	n//vfLmZbtxTfFO1vcXfFqKQsVthKffjlInxwZ03aPwweqOXkPrDqquk2UnyAo8gs2tX
	8Ns2lzWQxdXahr2O+sA39A2YOYX4yrL6MbSE7LpHweRc6pRMk/qI7epuhTNK4ejOcap8
	GbWw==
X-Received: by 10.170.118.13 with SMTP id k13mr21924543ykb.80.1429658553984;
	Tue, 21 Apr 2015 16:22:33 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-48-186.ec.res.rr.com.
	[174.106.48.186])
	by mx.google.com with ESMTPSA id 62sm2523940yhq.22.2015.04.21.16.22.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 16:22:33 -0700 (PDT)
Date: Tue, 21 Apr 2015 19:22:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20150421232231.GP16702@bill-the-cat>
References: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: make sure all counter variables are properly unset
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
X-List-Received-Date: Tue, 21 Apr 2015 23:22:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 09:17:08PM +0200, Carlos Rafael Giani wrote:

> The script does "i == j" checks to retrieve the config <-> type pairs from
> the UBOOT_MACHINE and UBOOT_CONFIG lists. This check however requires both
> j and i to be initially unset. Ensure this by explicitely unsetting i.
> 
> This fixes broken u-boot SPL installations with SolidRun machines
> (the SPL wasn't being installed and deployed.)
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

