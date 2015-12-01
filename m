Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id DFCEF601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:27:07 +0000 (UTC)
Received: by lffu14 with SMTP id u14so187253lff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=zVjaot8zZGcxbbLdbdUK5hcyW0A8aauW74sAyu5Z8WM=;
	b=fxdCwVTwjPNmjhRkpAaVHe8jjAgsEtPUghqx40Vu906Y9M0ULAYb1haX6M48+tVBzj
	bUGfW1YLCgkav75qssl3qbKM6Jm9sYxbAPMNLgJFNR7uFHvf3eQMT8YuryQvpjR8a/pR
	R8BbFlOxjI9zZ/cZ1Ge+m/eRFhb8aoP5lhpUF0igYRyfavN81q4ctcZJSX345+Kp1kAl
	4eCikuCvtNJ0D69DY2ma8wjSN2Abg17tMl7nQoqbzZBN5I5nUw5jftJ3kM6GQ+a8P+Bw
	EbFvJPwTaD9886/oECj7p5SxSyY13Vkyr6s3Uwj9xLbGSh4vBZiNe0xvMGQKXEUCOn8n
	tBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=zVjaot8zZGcxbbLdbdUK5hcyW0A8aauW74sAyu5Z8WM=;
	b=UTXQsFsx5HELPlc0FQY6u/8FLmLbU4jg7wpJCtL59cr62NGWZCSDoJFwSQmaRc5Qjl
	fMsRlB3bPdOLWgGIexTf07fBPI6HMyqGZF1UijdFHLSUIFjrfbfGc2ijAXcWlWTBAUq0
	Sssn5GgXkXkr1fOH4s4tDUFSYgymgeBT0KG08ofIbBhDIvyoWRFplcxsn3QnZk/SeYEf
	hSJ5d/XNryOS+EzbXV3zxZlmvMLjX+xJJHzd/SAbX67cdvqVisaYav1k7X2Wr9IT0vU4
	hjidd9ALJ4o/xbqtFbO919x77qzAjWVLhSwLuFY2KEyqowcGDoxkhYSrbDC4S3b5t52b
	Ep4w==
X-Gm-Message-State: ALoCoQmx/PKmJfkvP3+savykRg4l8ioeIEYi3SOSfshuLaQrWn/k6dVQl59IJ1LlWrWzos2I7z3n
X-Received: by 10.25.88.208 with SMTP id m199mr26907873lfb.157.1448962028101; 
	Tue, 01 Dec 2015 01:27:08 -0800 (PST)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	ki2sm7783171lbc.15.2015.12.01.01.27.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 01:27:07 -0800 (PST)
Date: Tue, 1 Dec 2015 10:27:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151201092706.GA15462@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1448885472-24350-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1448885472-24350-1-git-send-email-maxin.john@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] iproute2: enable previously unselected utilities
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
X-List-Received-Date: Tue, 01 Dec 2015 09:27:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Just a couple of questions.

* Maxin B. John <maxin.john@intel.com> [151130 17:59]:
> Include below listed utilities that are not yet enabled/packaged
> in the iproute2 recipe:

> lnstat
> ifstat
> genl
> rtacct
> nstat
> ss

When you enable those, how much does the size ofthe iproute2 package
increase?

Perhaps those extra tools should be placed in e.g. ${PN}-tools, or
some package like that?

Cheers,
Anders

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 29f9062..abaff3f 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"

>  inherit update-alternatives

> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"

>  do_configure_append () {
>      sh configure ${STAGING_INCDIR}
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

