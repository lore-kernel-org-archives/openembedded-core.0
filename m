Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2CD78FD9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 02:51:36 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id e18-v6so2814991ybq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=fvqDmvMEnnvfa+qvgogPyyX8y9wHW2ybKLjUvvn8jq4=;
	b=GBoZ72afPKvn+13lVMKFrIBUPNjn4TgaqWQssOkPtTGHG4RNU7Utvskcb1HuOCXYu7
	MpVyT0xiU3n/2C3l9oURpRrPwuCtjAHuQROO5ccJjtgZmikii6MO7efkcpZURwJgGmYk
	IwJ+Inue1dO8wZYi+ODgVOgJswp4cb3CxVYUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=fvqDmvMEnnvfa+qvgogPyyX8y9wHW2ybKLjUvvn8jq4=;
	b=rykSaElTMMhEGM/RBo9jGaeAb2Z1UsWWFnxfrd67UMGEI9PynD2oc5MdUTp9AGNn6A
	A+pOcuqUf4dU4GmpvSP9eW+CUxnnz8sfetVJuXN9zqvXFbIWrJKsF6adV6aoyiAs4n05
	7mFWDnZzgxlfFLLB0vplNFaRFwceaQvrpzNU1UD1onWSqk+Ns4dgquaA6e8/uqtbSsoj
	dbanIWwqjj313vjUylt3sX2SVGtyAxR5aGrO/zpYXGIwshewo/z0+nPREGbgBZ3VhchT
	gEQyWMlPn0JVeg0r5pjTgJO63mEQM6syGlTWizT1MXs1zrOAmVl+qmnxEvn97IGl/VJb
	+LRw==
X-Gm-Message-State: APzg51D3QVXNWtNo6JPcaueF/k21EL8ZivSJvu+MsUqR7Noooi/vjiNH
	9daLGNyN0yRTP1VK+3wDHF+ksQ==
X-Google-Smtp-Source: ANB0VdapOnvYpWVXCtawzjaVuu6EUIF5SGpDOrBZlErHzN31vKKrTrREbh66rGBmDl48VwZEJ9Wu5g==
X-Received: by 2002:a25:20c1:: with SMTP id
	g184-v6mr14797097ybg.402.1535943097677; 
	Sun, 02 Sep 2018 19:51:37 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	o62-v6sm6204220ywf.109.2018.09.02.19.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Sep 2018 19:51:36 -0700 (PDT)
Date: Sun, 2 Sep 2018 22:51:35 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180903025135.GF26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-6-git-send-email-lu.jiang@windriver.com>
	<20180831135434.GP26633@bill-the-cat>
	<ba749679-939a-8060-42e3-2aa2718f8a80@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ba749679-939a-8060-42e3-2aa2718f8a80@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] wic:direct:remove same entry when updating fstab
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
X-List-Received-Date: Mon, 03 Sep 2018 02:51:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 03, 2018 at 10:00:45AM +0800, Lu.Jiang wrote:
> 在 2018年08月31日 21:54, Tom Rini 写道:
> >On Fri, Aug 31, 2018 at 10:15:08AM +0800, Jiang Lu wrote:
> >
> >>Remove same mountpoint entry when updating fstab.
> >>
> >>Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> >>---
> >>  meta/recipes-support/wic/files/wic/plugins/imager/direct.py | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >>diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> >>index f648db4..d3ebc9c 100644
> >>--- a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> >>+++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> >>@@ -163,6 +163,9 @@ class DirectPlugin(ImagerPlugin):
> >>              opts = part.fsopts if part.fsopts else "defaults"
> >>              line = "\t".join([device_name, part.mountpoint, part.fstype,
> >>                                opts, "0", "0"]) + "\n"
> >>+            for tmpline in fstab_lines:
> >>+                if part.mountpoint in tmpline:
> >>+                    fstab_lines.remove(tmpline)
> >>              fstab_lines.append(line)
> >>              updated = True
> >Can you explain how this happens?
> >
> The patch intend to fix a issue when running wic on target.
> 
> On target, I'd like wic create a new image based on current running rootfs.
> Then the fstab from running system need remove duplicated entry.

Please put something about this in the commit message, thanks.

-- 
Tom

