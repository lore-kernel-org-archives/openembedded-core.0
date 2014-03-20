Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 98B5B60C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 20:10:45 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id z6so1429545yhz.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oi0RbMIIR/imQDsaqwYEjgs3dWyLfRY7D//cNUnqOsE=;
	b=V3gnn2C9RkqriBW0DVvHheYUbcmhjwQuHgIje633sxUzdM0kmWN/zMA4qhDVnZ2UAa
	tjc2BSTC5HCdCjvhSpBA5ArB9FaHrawMDbnmEK7805I+pmcUsk5nK7lDi0Uy/Hg1euRc
	wgtBcSFTrZT+ZXwO1G+iO5drX9lymZUp21HCY4OCc+n3ONfQcrD11IRaHFnQhij0uIuQ
	XGLlq4KH/ilYNKRmUhsWGvD/QPgahFbDg1cGNtU/zUrWRDMudJOcknaIUQs2en5gHACr
	W/5LXWWBLy6gFP70apEbSpOQR1rxn6xp5sLdjU6og9r+tbhQrVSVsUbZEE/NeXhwnMDO
	h7Zw==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr5557032yhq.14.1395346246009;
	Thu, 20 Mar 2014 13:10:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 13:10:45 -0700 (PDT)
In-Reply-To: <1395143773-26375-2-git-send-email-Chase.Maupin@ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<1395143773-26375-2-git-send-email-Chase.Maupin@ti.com>
Date: Thu, 20 Mar 2014 17:10:45 -0300
X-Google-Sender-Auth: ORme9uyelTWjmePxlZar64VbW9M
Message-ID: <CAP9ODKpUBPkQ1FeraQSxKPE5n1xCiqmMJ0C3FkBzAZGZv4r43Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chase Maupin <Chase.Maupin@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mmc-utils: Add user space mmc utilities for eMMC
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
X-List-Received-Date: Thu, 20 Mar 2014 20:10:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 18, 2014 at 8:56 AM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * The mmc-utils are useful userspace utilities for configuring and
>   working with MMC devices.  These are particularly useful when
>   working with eMMC devices to do the initial programming of the
>   device.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

I am fine with those to be included in core; I think eMMC are quite
common nowadays and having an utility which makes easier to work with
it is quite important for installed. As soon as it is merged, I will
use it in meta-fsl-arm MfgTool images...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

