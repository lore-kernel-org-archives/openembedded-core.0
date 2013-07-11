Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id B9D466AE90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:57:03 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id m1so7090604ves.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=nHexyMeOXJD37mcnx2s402KuaBdHsFokquX7ZDbyrr8=;
	b=CqXccUZpMF83jpVwYwLqHhYewgRuG1/gZdbx/w0UTjHpV3iwTeh70vYDsuACKa50rS
	moG6noOlWe0BPFWd2zy5v7y+l5F/rzyluhpy6lMW3G8v7PpHkQAExYlEOXvOvaUVwqWr
	l2iG4IfOBtHfjpa8vdHo4Fl3pZ2LhXO+1LEqmAbYRaZtOsIsuvSMdCPEyZZlnb7vW52A
	Ims8275Diq/3T0e/lP1YKeCX1Zm0X5bJOUhAmY1PUQQuKJoz+SZwba27Wl4cWYmungQC
	goNMYaabkQQ+KPVGP3hV8ZFc5n5bD4qx/ARdZ5IzFsmxKRZsZkjWK3IirE/oe4tcGju4
	jG1w==
X-Received: by 10.220.192.4 with SMTP id do4mr21181828vcb.91.1373533024269;
	Thu, 11 Jul 2013 01:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 01:56:44 -0700 (PDT)
In-Reply-To: <1373504197-9550-2-git-send-email-obi@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-2-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 09:56:44 +0100
Message-ID: <CAJTo0LZoTFBJ2LmbhxhNxPBd=FjhG6-BVYRw3L4mqNbemfz3og@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQlEx98itg4hy2BdATIQaxaOHddKXV8f07a75mYXgepirVGwm4BN+DjVPnBuChkALVR5QR8v
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] cogl-1.0: make building cogl-pango optional
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
X-List-Received-Date: Thu, 11 Jul 2013 08:57:04 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
> Add a 'cogl-pango' PACKAGECONFIG option and enable it by default.

Really picky, but can we call this just "pango"?

Ross

