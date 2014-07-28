Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id B4FAF65D5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:51:38 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q107so8228053qgd.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 04:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=shl2bCDcn6bK3BatqWn9eqWLvOuZ4K7ctODz5CQjEps=;
	b=JtYV2hQ4x8P6kRsJNW34FziG4J6SPTBJHQnvNuMTD3FwcsyBwMBC+e0bOx9tD7pmGT
	sbKdpWlOENxTvRxpCH91RSYx1SvDWGACfvsM3RftrZdESHIjbVr4QFrgzGTG3XOsfOQS
	1LPPoztxgZIJT7h/5NaAul+zWQsNwEWC2+kxAWzyCsP11B0KWfBV46NArQORezL6liLu
	s3/tFVopKcSbhJcD0mFCdeFT/IiksX5/OtufaYbfs2Y0TOi/UqAdqQqGf93jLdfJRs96
	1MF0D0adtmw7/M7Nj9S9y/NvGzR0Oglm1p5fJGZAFC6fg6CD/1EqZt1KYa9z3enkTWPt
	2+Ag==
X-Gm-Message-State: ALoCoQl9qQWnoVOjj8Xmej+XMKRxE18IYa/v3XM99bACsmmqtuufjhjnjBdWyjQwQefuXVI5MXS4
X-Received: by 10.224.43.77 with SMTP id v13mr3040319qae.34.1406548299881;
	Mon, 28 Jul 2014 04:51:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 28 Jul 2014 04:51:19 -0700 (PDT)
In-Reply-To: <1406502357-17590-1-git-send-email-drew_moseley@mentor.com>
References: <1406502357-17590-1-git-send-email-drew_moseley@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jul 2014 12:51:19 +0100
Message-ID: <CAJTo0LZMnnoU62S5Xsc6kvH4-Yu8v+mqN2wJK9udGfW1eO=sbg@mail.gmail.com>
To: Drew Moseley <drew_moseley@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libx11: Add missing NULL check
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
X-List-Received-Date: Mon, 28 Jul 2014 11:51:44 -0000
Content-Type: text/plain; charset=UTF-8

On 28 July 2014 00:05, Drew Moseley <drew_moseley@mentor.com> wrote:
> +Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=81822]

FWIW you generally get better responses from Xorg if you mail the list
with patches.  If the patch goes nowhere then I suggest mailing the
patch to the list directly instead.

Also XOpenIM documentation says "XOpenIM returns NULL if no input
method could be opened" so arguably this should be fixed in mplayer
(and guarded in libX11).

Ross

